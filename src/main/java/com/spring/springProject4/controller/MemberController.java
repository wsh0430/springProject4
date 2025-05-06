package com.spring.springProject4.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.SecureRandom;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.springProject4.common.ARIAUtil;
import com.spring.springProject4.service.LoginTokenService;
import com.spring.springProject4.service.MemberService;
import com.spring.springProject4.service.MessageService;
import com.spring.springProject4.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	LoginTokenService loginTokenService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	// 로그인 화면 보기
		@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
		public String memberLoginGet(HttpServletRequest request) {
			
			return "member/memberLogin";
		}
	// 일반 로그인 처리
		@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
		public String memberLoginPost(HttpSession session ,HttpServletRequest request, HttpServletResponse response,
				String memberId, String password, String idSave, String nickName) {
			// 로그인 인증처리 (스프링 시쿠리트의 BCrytPasswordEncoder객체를 이용한 암호화 되어 있는 비밀번호 비교하기)
			MemberVo vo = memberService.getMemberIdCheck(memberId);
			
				System.out.println("▶ [디버깅] memberId: " + memberId);
				System.out.println("▶ [디버깅] vo.getPassword(): " + vo.getPassword());
				
				// 1. 먼저 vo null 체크
				if (vo == null) {
					return "redirect:/message/memberLoginNo"; // 아이디 없음
				}
	
				// 2. 탈퇴 회원 체크
				if ("YES".equals(vo.getDeleteCheck())) {
					return "redirect:/message/memberDeleted"; // 탈퇴한 회원
				}
				// 3. 비밀번호 일치 확인
				if (!passwordEncoder.matches(password, vo.getPassword())) {
					return "redirect:/message/memberLoginNo"; // 비밀번호 불일치
				}

				
				//1. 세션
				String strLevel = "";
				if(vo.getLevel() == 0) strLevel = "관리자"; 
				else if(vo.getLevel()== 1) strLevel = "일반회원"; 
				else if(vo.getLevel()== 10) strLevel = "비회원"; 
				else if(vo.getLevel()== 100) strLevel = "차단된 회원"; 
				
				session.setAttribute("sMemberId", memberId);
				session.setAttribute("sNickName", vo.getNickName());
				session.setAttribute("sLevel", vo.getLevel());
				System.out.println("현재 sLevel 값: " + session.getAttribute("sLevel"));
				session.setAttribute("strLevel", strLevel);
				session.setAttribute("sLogin", "일반로그인");
				
				//2.쿠키
				if(idSave != null && idSave.equals("on")) { //쿠키 저장 처리
					Cookie cookieMid = new Cookie("cMemberId", vo.getMemberId());
					cookieMid.setPath("/");
					cookieMid.setMaxAge(60*60*24*30); // 단위:초.. 쿠키 만료시간을 30일로 지정
					response.addCookie(cookieMid);
					
				// 로그인 상태 유지용 토큰 생성 및 저장
			    String loginToken = UUID.randomUUID().toString();
			    LocalDateTime expiry = LocalDateTime.now().plusDays(30);

			    loginTokenService.saveLoginToken(memberId, loginToken, expiry); // DB에 저장

			    Cookie tokenCookie = new Cookie("loginToken", loginToken);
			    tokenCookie.setPath("/");
			    tokenCookie.setMaxAge(60 * 60 * 24 * 30);
			    response.addCookie(tokenCookie);
				}
				
				LocalDate today    = LocalDate.now();
				LocalDate joinDay  = LocalDate.parse(vo.getStartDate().substring(0,10));
				LocalDate lastLoginDay= LocalDate.parse(vo.getLastDate().substring(0,10));
				
				//3-1. 기타처리 : 최초가입시 1000포인트 지급
				if (joinDay.equals(today) && vo.getPoint() == 0) {
	        memberService.setMemberPoint(memberId, 1000);
				}
				// 3-2. 오늘 첫 방문이면 방문 포인트로 100포인트 증정(단, 1일 1회 지급)
				else if (lastLoginDay.isBefore(today)) {
					memberService.setMemberVisitCount(memberId);
	        memberService.setMemberPoint(memberId, 100);
		    }
	
		    // 3) 항상 마지막 로그인 시각 갱신
		    memberService.updateLastDate(memberId);

				// **임시 비밀번호 확인 및 비밀번호 변경 강제**
				String tempPwd = (String) session.getAttribute("tempPassword");

				if (tempPwd != null && passwordEncoder.matches(tempPwd, vo.getPassword())) {
				    session.setAttribute("forceChangePassword", true);
				    session.removeAttribute("tempPassword");
				    return "redirect:/message/memberTempLogin";
				}

			// URL 인코딩하여 리디렉션 처리
		    try {
		        String encodedNickName = URLEncoder.encode(vo.getNickName(), "UTF-8");
		        return "redirect:/message/memberLoginOk?memberId=" + memberId + "&nickName=" + encodedNickName;
		    } catch (UnsupportedEncodingException e) {
		        e.printStackTrace();
		        return "redirect:/message/memberSystemError";  // 인코딩 실패 시 처리
		    }
		}
	// 소셜 로그인 처리
	

	
		
	// 회원가입 화면 보기
		@RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
		public String memberJoinGet() {
			return "member/memberJoin";
		}
	// 휴대폰번호 중복검사
	@RequestMapping(value = "/checkTelDuplicate", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkTelDuplicate(@RequestBody Map<String, String> param) {
	    String tel = param.get("tel");
	    MemberVo vo = memberService.getMemberTelCheck(tel);
	    return vo != null; // 이미 있으면 true
	}
	// 인증번호 전송 시
		@RequestMapping(value = "/sendVerificationCode", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> sendVerificationCode(@RequestBody Map<String, String> payload, HttpServletRequest request) {
			 String type = payload.get("type"); // 'id', 'pw', 'signup' 등
			 String tel = payload.get("tel");

	    Map<String, Object> result = new HashMap<>();

	    if ("signup".equals(type)) {
        // 전화번호 유효성 검사
        if (tel != null && !tel.matches("^(010|011|016|017|018|019|043)-\\d{3,4}-\\d{4}$")) {
            result.put("success", false);
            result.put("message", "회원가입 전화번호 형식이 올바르지 않습니다.");
            return result;
        }

        // 랜덤 인증번호 생성
        int randomNumberForSignup = (int)(Math.random() * 899999) + 100000;  // 회원가입 인증번호
        request.getSession().setAttribute("authNumberForSignup", randomNumberForSignup);  // signupTel에 대한 인증번호
        request.getSession().setMaxInactiveInterval(180);  // 3분간 유효

        // 메시지 발송
        MessageService ms = new MessageService();
        boolean isSignupTelSent = ms.sendMessage(tel, Integer.toString(randomNumberForSignup));  // signupTel로 인증번호 발송

        result.put("success", isSignupTelSent);
        if (!isSignupTelSent) {
            result.put("message", "회원가입 인증번호 발송 실패");
        }
        
        // type이 'id'인 경우 아이디 찾기
	    } else if ("id".equals(type)) {
	        // 아이디 찾기 전화번호 유효성 검사
	        if (tel != null && !tel.matches("^(010|011|016|017|018|019|043)-\\d{3,4}-\\d{4}$")) {
	            result.put("success", false);
	            result.put("message", "아이디 찾기 전화번호 형식이 올바르지 않습니다.");
	            return result;
	        }

	        // 랜덤 인증번호 생성
	        int randomNumberForId = (int)(Math.random() * 899999) + 100000;  // 아이디 찾기 인증번호
	        request.getSession().setAttribute("authNumberForId", randomNumberForId);  // idTel에 대한 인증번호
	        request.getSession().setMaxInactiveInterval(180);  // 3분간 유효

	        // 메시지 발송
	        MessageService ms = new MessageService();
	        boolean isIdTelSent = ms.sendMessage(tel, Integer.toString(randomNumberForId));  // idTel로 인증번호 발송

	        result.put("success", isIdTelSent);
	        if (!isIdTelSent) {
	            result.put("message", "아이디 찾기 인증번호 발송 실패");
	        }

	    } else if ("pw".equals(type)) {
	        // 비밀번호 찾기 전화번호 유효성 검사
	        if (tel != null && !tel.matches("^(010|011|016|017|018|019|043)-\\d{3,4}-\\d{4}$")) {
	            result.put("success", false);
	            result.put("message", "비밀번호 찾기 전화번호 형식이 올바르지 않습니다.");
	            return result;
	        }

	        // 랜덤 인증번호 생성
	        int randomNumberForPwd = (int)(Math.random() * 899999) + 100000;  // 비밀번호 찾기 인증번호
	        request.getSession().setAttribute("authNumberForPwd", randomNumberForPwd);  // pwdTel에 대한 인증번호
	        request.getSession().setMaxInactiveInterval(180);  // 3분간 유효

	        // 메시지 발송
	        MessageService ms = new MessageService();
	        boolean isPwdTelSent = ms.sendMessage(tel, Integer.toString(randomNumberForPwd));  // pwdTel로 인증번호 발송

	        result.put("success", isPwdTelSent);
	        if (!isPwdTelSent) {
	            result.put("message", "비밀번호 찾기 인증번호 발송 실패");
	           
	        }
	    } else {
	        result.put("success", false);
	        result.put("message", "잘못된 요청입니다.");
	    }

	    return result;
	}
		
	// 인증번호 검증
		@RequestMapping(value = "verifyCode", method = RequestMethod.POST)
		@ResponseBody
		public String verifyCode(@RequestBody Map<String, String> data, HttpSession session, HttpServletRequest request) {
	    String inputCode = data.get("code");
	    String type = data.get("type");  // 아이디 찾기("id") 또는 비밀번호 찾기("pw")

	    Object authObj = null;
	    if("signup".equals(type)){
	    		authObj = session.getAttribute("authNumberForSignup");  //
	    		System.out.println("세션에 저장된 인증번호: " + request.getSession().getAttribute("authNumberForSignup"));
	    		System.out.println("세션 생성 시간: " + request.getSession().getCreationTime());
			}else if ("id".equals(type)) {
	        authObj = session.getAttribute("authNumberForId");  // 아이디 찾기 인증번호
	    } else if ("pw".equals(type)) {
	        authObj = session.getAttribute("authNumberForPwd");  // 비밀번호 찾기 인증번호
	    }

	    if (authObj == null) {
	        return "expired"; // 인증번호 만료
	    }

	    int authNumber = (int) authObj;

	    if(inputCode != null && inputCode.equals(String.valueOf(authNumber))) {
        // 인증번호가 맞으면 세션에서 인증번호를 제거하고, 인증 성공 상태를 설정
        if ("signup".equals(type)) {
            session.removeAttribute("authNumberForSignup"); // 회원가입 인증번호 제거
        } else if ("id".equals(type)) {
            session.removeAttribute("authNumberForId"); // 아이디 찾기 인증번호 제거
        } else if ("pw".equals(type)) {
            session.removeAttribute("authNumberForPwd"); // 비밀번호 찾기 인증번호 제거
        }

        	session.setAttribute("phoneVerified", true); // 인증 성공 상태 설정
	        return "success";
	    } else {
	        return "fail";  // 인증번호가 일치하지 않음
	    }
	}
	
	// 회원가입 처리하기(DB에 회원 저장)
		@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
		public String memberJoinPost(MemberVo vo, MultipartFile fName, HttpSession session, HttpServletRequest request) throws InvalidKeyException, UnsupportedEncodingException {
			// 아이디/닉네임 중복체크
			
			if(memberService.getMemberIdCheck(vo.getMemberId()) != null) {
				return "redirect:/message/idCheckNo";
			}
			
			// 휴대폰 인증 여부 확인
	    Boolean phoneVerified = (Boolean) session.getAttribute("phoneVerified");
	    if (phoneVerified == null || !phoneVerified) {
	        return "redirect:/message/phoneNotVerified"; // 인증 안 된 상태
	    }
			
			// 이메일 조합 및 중복 체크
	    String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	    vo.setEmail(email);
	    if (memberService.getMemberEmailCheck(vo.getEmail()) != null) {
	       return "redirect:/message/emailDuplicate";  // 이메일 중복 시 메시지 리디렉션
	    }
			
			//비밀번호 암호화
			vo.setPassword(passwordEncoder.encode(vo.getPassword()));
			
			//회원 사진 처리
			if(!fName.getOriginalFilename().equals("")) vo.setIcon(memberService.fileUpload(fName, vo.getMemberId(),""));
			else vo.setIcon("noicon.jpg");
			
			//회원 ip받기
			String clientIp = (String) session.getAttribute("clientIp");
				if (clientIp != null && !clientIp.isEmpty()) {
	        // IP를 ARIA로 암호화
	        String encryptedIp = ARIAUtil.ariaEncrypt(clientIp);
	        vo.setIp(encryptedIp);
				}else {
					// 클라이언트 IP가 없으면 기본값 설정 (예: "no_ip" 또는 "0.0.0.0")
			    vo.setIp("0.0.0.0");
				}
				System.out.println("email1: " + request.getParameter("email1"));
				System.out.println("email2: " + request.getParameter("email2"));
				System.out.println("Full email: " + email);
				System.out.println("가입 이메일: " + email);
				System.out.println("중복검사 결과: " + memberService.getMemberEmailCheck(vo.getEmail()));
			// DB 저장 및 예외 처리
		    try {
		        int res = memberService.setMemberJoinOk(vo);
		        if (res != 0) {
		            // 회원가입 후 세션에 닉네임 저장
		            session.setAttribute("sNickName", vo.getNickName());
		            session.removeAttribute("phoneVerified"); // 회원가입 완료시 인증기록 제거
		            return "redirect:/message/memberJoinOK";  // 회원가입 성공
		        } else {
		            return "redirect:/message/memberJoinNO";  // 회원가입 실패
		        }
		    } catch (DuplicateKeyException e) {
		        // 이메일 중복 등 제약 조건 위반 시
		        return "redirect:/message/emailDuplicate";  // 이메일 중복 메시지 리디렉션
		    } catch (Exception e) {
		        // 그 외 예외 처리
		        e.printStackTrace();  // 예외 발생시 로그 출력
		        return "redirect:/message/memberSystemError";  // 시스템 에러 메시지 리디렉션
		    }
		}
		
	//아이디 중복체크	
		@ResponseBody
		@RequestMapping(value = "/memberIdCheck", method = RequestMethod.GET)
		public String memberIdCheckGet(String memberId) {
			MemberVo vo = memberService.getMemberIdCheck(memberId);
			if(vo != null) return "1";
			else return "0";
		}
	
	//닉네임 중복체크
		@ResponseBody
		@RequestMapping(value = "/memberNickCheck", method = RequestMethod.GET)
		public String memberNickCheckGet(String nickName) {
			MemberVo vo = memberService.getMemberNickCheck(nickName);
			if(vo != null) return "1";
			else return "0";
		}
		
	//회원가입 완료 후 보이는 페이지
		@RequestMapping(value = "/memberWelcome", method = RequestMethod.GET)
		public String memberWelcomeGet(HttpSession session, Model model) {
			 String nickName = (String) session.getAttribute("sNickName");

		    model.addAttribute("nickName", nickName);
		    return "member/memberWelcome";
		}
		
	//로그아웃 처리
		@RequestMapping(value = "/memberLogout", method = RequestMethod.GET)
		public String memberLogoutGet(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		// 세션에서 회원 정보 삭제
	    String memberId = (String) session.getAttribute("sMemberId");
	    
	 // 자동 로그인 토큰 삭제 (DB에서 토큰 삭제)
	    if (memberId != null) {
	        loginTokenService.deleteLoginToken(memberId); // DB에서 토큰 삭제
	    }

	    // 세션 무효화
	    session.invalidate(); // 세션 종료 (모든 정보 삭제)

	    // 자동 로그인 쿠키 삭제
	    Cookie loginCookie = new Cookie("loginToken", null);
	    loginCookie.setPath("/");
	    loginCookie.setMaxAge(0); // 쿠키 만료
	    response.addCookie(loginCookie);

	    // 아이디 저장 쿠키 삭제
	    Cookie cookieMid = new Cookie("cMemberId", null);
	    cookieMid.setPath("/");
	    cookieMid.setMaxAge(0); // 쿠키 만료
	    response.addCookie(cookieMid);


	    return "redirect:/message/memberLogoutOk";
	}
		
	//마이페이지 화면 보기
		@RequestMapping(value = "/memberMypage", method = RequestMethod.GET)
			public String memberMypageGet(HttpSession session, Model model) {
					String memberId = (String) session.getAttribute("sMemberId");
					
					MemberVo vo = memberService.getMemberIdCheck(memberId);
					// 디버깅 로그 추가
			    System.out.println("좋아하는 팀: " + vo.getLikeTeam());
			    System.out.println("닉네임: " + vo.getNickName());
			    System.out.println("자기소개: " + vo.getContent());
			    // memberVO 자체도 넘겨주기
			    model.addAttribute("vo", vo);

			    return "member/memberMypage";
			}
		
	//마이페이지 정보 수정처리
		@RequestMapping(value = "/memberMypage", method = RequestMethod.POST)
		public String memberMypagePost(HttpSession session, MemberVo vo, MultipartFile fName) {
			String memberId = (String) session.getAttribute("sMemberId");
		  vo.setMemberId(memberId);
			
			// 회원 사진 처리
			if(fName.getOriginalFilename() != null && !fName.getOriginalFilename().equals("")) {
				vo.setIcon(memberService.fileUpload(fName, vo.getMemberId(), vo.getIcon()));
			}
			
			int res = memberService.setMemberUpdateOk(vo);
			System.out.println("회원 정보 업데이트 결과: " + res);
			System.out.println("수정 대상 memberId: " + vo.getMemberId());
			
			if(res != 0) {
				System.out.println("vo 정보: " + vo);  // vo 객체 상태 확인
				session.setAttribute("sNickName", vo.getNickName());
				return "redirect:/message/memberUpdateOk";
			}
			else return "redirect:/message/memberUpdateNo";
		}
		
	//비밀번호 변경 화면 보기
	@RequestMapping(value = "/memberPassChange", method = RequestMethod.GET)
	public String memberPassChangeGet(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("sMemberId");
    MemberVo vo = memberService.getMemberIdCheck(memberId);
		model.addAttribute("vo", vo);
		return "member/memberPassChange";
	}
	//비밀번호 변경 처리하기
	@RequestMapping(value = "/memberPassChange", method = RequestMethod.POST)
	 public String pwdChangePost(HttpSession session, @RequestParam("nowPwd") String nowPwd,
     @RequestParam("newPwd") String newPwd) {
			
			String memberId = (String) session.getAttribute("sMemberId"); // 세션에서 회원 ID 가져오기
			
			// 1. 현재 비밀번호 확인 (암호화된 비밀번호와 비교)
			MemberVo member = memberService.getMemberById(memberId);
			
			if (member == null) {
        return "redirect:/message/memberNotFound"; 
			}
		  // 현재 비밀번호 확인
      if (!passwordEncoder.matches(nowPwd, member.getPassword())) {
          return "redirect:/message/pwdChangeFail";  // 비밀번호가 일치하지 않으면 실패 페이지로 리디렉션
      }
			
			// 2. 새 비밀번호 암호화 후 저장
			String encodedNewPwd = passwordEncoder.encode(newPwd);
			int res = memberService.setMemberPwdChange(memberId, encodedNewPwd);
			
			// 결과에 따라 처리
			if (res != 0) {
				return "redirect:/message/pwdChangeOk"; // 비밀번호 변경 성공
			} else {
				return "redirect:/message/pwdChangeNo"; // 비밀번호 변경 실패
			}
		}
	//회원 탈퇴 부분
	@RequestMapping(value = "/memberPassCheck", method = RequestMethod.POST)
	public String memberPassCheckPost(HttpSession session, @RequestParam("nowPwd") String nowPwd) {
		String memberId = (String) session.getAttribute("sMemberId");
		MemberVo vo = memberService.getMemberIdCheck(memberId);

		// 비밀번호 비교
		if(vo != null && passwordEncoder.matches(nowPwd, vo.getPassword())) {
		
			memberService.deleteMemberById(memberId);

			// 자동 로그인 토큰 삭제
			loginTokenService.deleteLoginToken(memberId);
			
			// 세션 무효화
			session.invalidate();

			return "redirect:/message/memberDelete";
		}
		else {
			// 비밀번호 틀림
			return "redirect:/message/pwdChangeFail";
		}
	}
  // 비밀번호 확인 페이지
  @RequestMapping(value = "/memberPassCheck", method = RequestMethod.GET)
  public String pwdCheckGet(HttpSession session) {
      // 비밀번호 확인 페이지로 이동
      return "member/memberPassCheck";  // 비밀번호 확인 JSP 페이지
  }

	// 닉네임 변경 페이지
	@RequestMapping(value = "/memberNickChange", method = RequestMethod.GET)
	public String memberNickChangeGet(HttpSession session) {

		return "member/memberNickChange";  // 비밀번호 확인 JSP 페이지
	}
	// 닉네임 변경 처리하기
	@RequestMapping(value = "/memberNickChange", method = RequestMethod.POST)
	public String memberNickChangePost(HttpSession session, MemberVo vo) {
		// 닉네임 체크(수정시에는 새로 세션에 저장처리한다.)
		String nickName = (String) session.getAttribute("sNickName");//세션에 저장된 닉네임 가져오기
		// 새로운 닉네임이 기존 닉네임과 다를 때만 중복 체크
		 // 1. 닉네임이 변경되지 않았다면, /message/memberNickChangeSame으로 리디렉션
    if (nickName.equals(vo.getNickName())) {
        return "redirect:/message/memberNickChangeSame";
    }

    // 3. 닉네임이 변경되었고 중복되지 않으면 세션에 새 닉네임 저장 후 /message/memberNickChangeOk로 리디렉션
    session.setAttribute("sNickName", vo.getNickName());

    return "redirect:/message/memberNickChangeOk";
	
	}
	//아이디/비밀번호 찾기 페이지
	@RequestMapping(value = "/memberFind", method = RequestMethod.GET)
	public String memberFindIdGet(HttpSession session) {
	
		return "member/memberFind";  // 
	}

	//아이디 찾기
	@RequestMapping(value = "/idSearch", method = RequestMethod.POST)
	@ResponseBody
	public String idSearch(@RequestParam("name") String name, @RequestParam("tel") String tel) {
	   MemberVo vo = memberService.getMemberIdByNameAndTel(name, tel);
	   System.out.println("Received name: " + name);
	   System.out.println("Received tel: " + tel);
	   return (vo != null) ? vo.getMemberId() : "";
	}
	//비밀번호 찾기
	@RequestMapping(value = "/pwdSearch", method = RequestMethod.POST)
	@ResponseBody
	public String pwdSearch(@RequestParam("memberId") String memberId, @RequestParam("tel") String tel, HttpSession session) throws MessagingException {
	   MemberVo vo = memberService.getMemberByIdAndTel(memberId, tel);
	   if (vo != null) {
	       // 임시 비밀번호 생성
	       String tempPwd = UUID.randomUUID().toString().substring(0, 10);
	       String encodedPwd = passwordEncoder.encode(tempPwd);
	
	       // 비밀번호 업데이트
	        memberService.updateMemberPassword(memberId, encodedPwd);
	        
	        session.setAttribute("tempPassword", tempPwd);
	        
	        // 이메일 전송
	        mailSend(vo.getEmail(), "HITBox 임시 비밀번호 안내", "HITBox 비밀번호 찾기", tempPwd);
	        System.out.println("vo.getEmail() = " + vo.getEmail());
	        return "ok";
	    } else {
	        return "fail";
	    }
	}


	// 메일 전송하기 (임시 비밀번호 보이기)
	public void mailSend(String toMail, String title, String mailFlag, String tempPwd) throws MessagingException {
	    HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	    
	    String content = "";
	    
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	    
	    // 이메일 제목/수신자 설정
	    messageHelper.setTo(toMail);
	    messageHelper.setSubject(title);
	    messageHelper.setText(content);

	    
	    // 이메일 본문 구성
	    content = "<div style='font-family: Arial, sans-serif;'>";
	    content += "<h3>" + mailFlag + "</h3>";
	    
	    if (tempPwd != null && !tempPwd.isEmpty()) {
	        content += "<p>임시 비밀번호: <strong style='color:#FF5E57; font-size: 18px;'>" + tempPwd + "</strong></p>";
	        content += "<p>로그인 후 반드시 비밀번호를 변경해주세요.</p>";
	    }

	    content += "<br><hr>";
	    content += "<p><img src=\"cid:HITBox.png\" width='550px'></p>";
	    content += "<p>방문하기 : <a href='http://localhost:9090/springProject4'>HITBox</a></p>";
	    content += "<hr></div>";

	    // 본문에 기재된 그림파일의 경로
			//FileSystemResource file = new FileSystemResource("D:\\springProject\\springframework\\works\\JspringProject\\src\\main\\webapp\\resources\\images\\main.jpg");
			FileSystemResource file = new FileSystemResource(request.getSession().getServletContext().getRealPath("/resources/images/HITBox.png"));
			messageHelper.addInline("HITBox.png", file);
			
	    messageHelper.setText(content, true);
	    
	    System.out.println(file.exists());  // true가 나와야 함
	    System.out.println("이미지 경로: " + file.getPath());

	    // 메일 전송
	    mailSender.send(message);
	}
}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

