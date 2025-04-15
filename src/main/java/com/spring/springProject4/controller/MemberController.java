package com.spring.springProject4.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {
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
}
