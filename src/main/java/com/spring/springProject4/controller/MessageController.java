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
			model.addAttribute("message","아이디가 중복되었습니다.\\n 확인하시고 다시 가입해주세요.");
			model.addAttribute("url","member/memberJoin");
		}
		else if(msgFlag.equals("memberJoinOK")) {
			model.addAttribute("message","회원가입에 성공하셨습니다.");
			model.addAttribute("url","member/memberWelcome");
		}
		else if(msgFlag.equals("memberJoinNO")) {
			model.addAttribute("message","회원가입에 실패하였습니다.");
			model.addAttribute("url","member/memberJoinRetry");
		}
		else if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("message", nickName + "회원님 로그인 되었습니다.");
			model.addAttribute("url","/");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("message","로그인 실패! 다시 로그인 해주세요.");
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
		
		
		return "include/message";
		
	}

}
