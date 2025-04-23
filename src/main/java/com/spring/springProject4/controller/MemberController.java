package com.spring.springProject4.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 소셜 로그인 처리
	
	// 회원가입 화면 보기
	
	// 회원가입처리(DB에 회원 저장)
	
	// 아이디 중복체크
	
	// 닉네임 중복체크
	
	// 이메일 인증처리
		
	// 회원가입 화면 보기
		@RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
		public String memberJoinGet() {
			return "member/memberJoin";
		}
	// 회원가입 처리하기(DB에 회원 저장)
		@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
		public String memberJoinPost(MemberVo vo, MultipartFile fName, HttpSession session) {
			// 아이디/닉네임 중복체크
			if(memberService.getMemberIdCheck(vo.getMemberId()) != null) return "redirect:/message/idCheckNo";
			
			//비밀번호 암호화
			vo.setPassword(passwordEncoder.encode(vo.getPassword()));
			
			//회원 사진 처리
			if(!fName.getOriginalFilename().equals("")) vo.setIcon(memberService.fileUpload(fName, vo.getMemberId(),""));
			else vo.setIcon("noicon.jpg");
			
			//회원 ip받기
			String clientIp = (String) session.getAttribute("clientIp");
	    vo.setIp(clientIp);
			
			//모든 처리가 완료되면 DB에 회원 정보 저장
			int res = memberService.setMemberJoinOk(vo);
			
			if(res != 0) return "redirect:/message/memberJoinOK";
			else return "redirect:/message/memberJoinNO";
		}
		
	//아이디 중복체크	
		@ResponseBody
		@RequestMapping(value = "/memberIdCheck", method = RequestMethod.GET)
		public String memberIdCheckGet(String mid) {
			MemberVo vo = memberService.getMemberIdCheck(mid);
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
		public String memberLogoutGet(HttpSession session) {
			session.invalidate();
			return "redirect:/message/memberLogoutOk";
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
