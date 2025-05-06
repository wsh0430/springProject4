package com.spring.springProject4.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
	@RequestMapping(value = "/message/{msgFlag}", method = RequestMethod.GET)
	public String getMessage(Model model, @PathVariable String msgFlag,
			HttpSession session,
			@RequestParam(name="memberId", defaultValue = "", required = false) String memberId,
			@RequestParam(name="nickName", defaultValue = "", required = false) String nickName
			
			) {
		if(msgFlag.equals("idCheckNo")) {
			model.addAttribute("message","아이디가 중복되었습니다.<br> 확인하시고 다시 가입해주세요.");
			model.addAttribute("url","member/memberJoin");
		}
		else if(msgFlag.equals("memberJoinOK")) {
			model.addAttribute("message","회원가입에 성공하셨습니다.");
			model.addAttribute("url","member/memberWelcome");
		}
		else if(msgFlag.equals("emailDuplicate")) {
			model.addAttribute("message","이메일이 중복되었습니다.");
			model.addAttribute("url","member/memberJoin");
		}
		else if(msgFlag.equals("memberJoinNO")) {
			model.addAttribute("message","회원가입에 실패하였습니다.");
			model.addAttribute("url","member/memberJoinRetry");
		}
		else if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("message", nickName + "회원님 로그인 되었습니다.");
			model.addAttribute("url","/");
		}
		else if(msgFlag.equals("memberSystemError")) {
			model.addAttribute("message", "시스템에 일시적으로 문제가 생겼습니다. <br> 잠시후 다시 시도해주세요");
			model.addAttribute("url","member/memberLogin");
		}
		else if(msgFlag.equals("memberDeleted")) {
			model.addAttribute("message", "탈퇴한 회원입니다. <br> 다시 회원가입해주세요.");
			model.addAttribute("url","member/memberJoin");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("message","로그인 실패 <br> 아이디 또는 비밀번호가 잘못되었습니다.");
			model.addAttribute("url","member/memberLogin");
		}
		else if(msgFlag.equals("memberLogoutOk")) {
			model.addAttribute("message", "로그아웃 되었습니다");
			model.addAttribute("url","member/memberLogin");
		}
		else if(msgFlag.equals("memberUpdateOk")) {
			model.addAttribute("message", "회원 정보 수정이 완료되었습니다.");
			model.addAttribute("url","member/memberMypage");
		}
		else if(msgFlag.equals("memberUpdateNo")) {
			model.addAttribute("message", "회원 정보 수정이 실패되었습니다.");
			model.addAttribute("url","member/memberMypage");
		}
		else if(msgFlag.equals("pwdChangeOk")) {
       // 비밀번호 변경 후 로그아웃 처리
       session.invalidate(); // 세션 무효화 (로그아웃 처리)

       model.addAttribute("message", "비밀번호가 변경되었습니다. 다시 로그인해주세요!");
       model.addAttribute("url", "member/memberLogin"); // 로그인 페이지로 이동
   }
		else if(msgFlag.equals("pwdChangeNo")) {
			model.addAttribute("message", "비밀번호 변경이 실패되었습니다.");
			model.addAttribute("url","member/memberMypage");
		}
		else if(msgFlag.equals("pwdChangeFail")) {
			model.addAttribute("message", "현재 비밀번호가 일치하지않습니다.");
			model.addAttribute("url","member/memberMypage");
		}
		else if(msgFlag.equals("memberNotFound")) {
			session.invalidate();
			model.addAttribute("message", "회원을 찾을수가 없습니다 다시 로그인해 주세요.");
			model.addAttribute("url","member/memberLogin");
		}
		else if(msgFlag.equals("memberDelete")) {
			session.invalidate();
			model.addAttribute("message", "회원이 탈퇴 되었습니다.");
			model.addAttribute("url","/");
		}
		else if(msgFlag.equals("memberNickChangeOk")) {
			model.addAttribute("message", "닉네임이 변경 되었습니다.");
			model.addAttribute("url","member/memberMypage");
		}
		else if(msgFlag.equals("memberNickChangeSame")) {
			model.addAttribute("message", "현재 닉네임을 그대로 사용합니다.");
			model.addAttribute("url","member/memberMypage");
		}
		
		
		return "include/message";
		
	}

}
