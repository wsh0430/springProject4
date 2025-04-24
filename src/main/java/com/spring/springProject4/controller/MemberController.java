package com.spring.springProject4.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.springProject4.common.ARIAUtil;
import com.spring.springProject4.service.MemberService;
import com.spring.springProject4.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 화면 보기
		@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
		public String memberLoginGet(HttpServletRequest request) {
			
			return "member/memberLogin";
		}
	// 일반 로그인 처리
		@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
		public String memberLoginPost(HttpSession session ,HttpServletRequest request, HttpServletResponse response,
				String memberId, String password, String idSave) {
			// 로그인 인증처리 (스프링 시ㅠ리트의 BCrytPasswordEncoder객체를 이용한 암호화 되어 있는 비밀번호 비교하기)
			MemberVo vo = memberService.getMemberIdCheck(memberId);
			System.out.println("회원 정보 조회 결과: " + vo);  // vo가 null일 경우 체크
			if (vo == null) {
			    System.out.println("아이디가 존재하지 않습니다.");
			}
			System.out.println("로그인 시 입력된 memberId: " + memberId);  // 입력된 memberId 값 확인
			if(vo != null && vo.getUserDelete().equals("NO") && passwordEncoder.matches(password,vo.getPassword())) {
				// 로그인 완료시 처리할 로직(1.세션 2.쿠키 3.기타 설정값 (방문포인트등..)
				
				//1. 세션
				String strLevel = "";
				if(vo.getLevel() == 0) strLevel = "관리자"; 
				else if(vo.getLevel()== 1) strLevel = "우수회원"; 
				else if(vo.getLevel()== 2) strLevel = "정회원"; 
				else if(vo.getLevel()== 3) strLevel = "준회원"; 
				
				session.setAttribute("sMemberId", memberId);
				session.setAttribute("sNickName", vo.getNickName());
				session.setAttribute("sLevel", vo.getLevel());
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

			    memberService.saveLoginToken(memberId, loginToken, expiry); // DB에 저장

			    Cookie tokenCookie = new Cookie("loginToken", loginToken);
			    tokenCookie.setPath("/");
			    tokenCookie.setMaxAge(60 * 60 * 24 * 30);
			    response.addCookie(tokenCookie);
				}
				else { //쿠키 삭제처리
					Cookie[] cookies = request.getCookies();
					if(cookies != null) {
						for(int i=0; i<cookies.length; i++) {
							if(cookies[i].getName().equals("cMemberId")) {
								cookies[i].setPath("/");
								cookies[i].setMaxAge(0);
								response.addCookie(cookies[i]);
								break;
							}
						}
					}
				}
				//3-1. 기타처리 : 최초가입시 1000포인트 지급
				if (vo.getStartDate() != null && vo.getStartDate().substring(0, 10).equals(LocalDateTime.now().toString().substring(0, 10))) {
			    memberService.setMemberPoint(memberId, 1000);  // 최초 가입 시 1000포인트 지급
				}
				//3-2. 기타처리 : 오늘 첫 방문이면 방문 포인트로 100포인트 증정(단, 1일 한번 100포인트 지급)
				else if(vo.getLastDate() != null && !LocalDateTime.now().toString().substring(0, 10).equals(vo.getLastDate().substring(0, 10))) {
					memberService.setMemberVisitCount(memberId);
					memberService.setMemberPoint(memberId, 100);
					vo = memberService.getMemberById(memberId); // 최신 방문수/포인트 반영
				}		
				return "redirect:/message/memberLoginOk?memberId="+memberId;			
			}
			else {
				return "redirect:/message/memberLoginNo";			
			}
		}
	// 로그인 완료후 웰컴 페이지 보기
		@RequestMapping(value = "/memberWelcome", method = RequestMethod.GET)
		public String memberWelcomeGet() {
			return "member/memberWelcome";
		}
	// 소셜 로그인 처리
	

	
	// 이메일 인증처리 또는 휴대폰 인증처리 (고민중)
		
	// 회원가입 화면 보기
		@RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
		public String memberJoinGet() {
			return "member/memberJoin";
		}
	// 회원가입 처리하기(DB에 회원 저장)
		@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
		public String memberJoinPost(MemberVo vo, MultipartFile fName, HttpSession session) throws InvalidKeyException, UnsupportedEncodingException {
			// 아이디/닉네임 중복체크
			
			if(memberService.getMemberIdCheck(vo.getMemberId()) != null) {
				return "redirect:/message/idCheckNo";
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
			
			//모든 처리가 완료되면 DB에 회원 정보 저장
			int res = memberService.setMemberJoinOk(vo);
			
			if(res != 0) return "redirect:/message/memberJoinOK";
			else return "redirect:/message/memberJoinNO";
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
		
	//로그아웃 처리
		@RequestMapping(value = "/memberLogout", method = RequestMethod.GET)
		public String memberLogoutGet(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		// 2. 로그인 쿠키 삭제
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("loginToken")) {
	                cookie.setPath("/");
	                cookie.setMaxAge(0); // 즉시 만료
	                response.addCookie(cookie);
	                
	                // 3. DB에서 로그인 토큰 삭제
	                String loginToken = cookie.getValue();
	                if (loginToken != null && !loginToken.isEmpty()) {
	                    memberService.deleteLoginToken(loginToken); // DB에서 토큰 삭제
	                }
	                break;
	            }
	        }
	    }

	    return "redirect:/message/memberLogoutOk";
	}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
