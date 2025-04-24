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
			@RequestParam(name="memberId", defaultValue = "", required = false) String memberId
			) {
		if(msgFlag.equals("idCheckNo")) {
			model.addAttribute("message","아이디가 중복되었습니다.\\n 확인하시고 다시 가입해주세요.");
			model.addAttribute("url","member/memberJoin");
		}
		else if(msgFlag.equals("memberJoinOK")) {
			return "redirect:/member/memberWelcome";
		}
		else if(msgFlag.equals("memberJoinNO")) {
			model.addAttribute("message","아이디가 중복되었습니다.\\n 확인하시고 다시 가입해주세요.");
			model.addAttribute("url","member/memberJoinRetry");
		}
		else if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("message", memberId + "회원님 로그인 성공!");
			model.addAttribute("url","/");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("message","로그인 실패! 다시 로그인 해주세요.");
			model.addAttribute("url","member/memberLogin");
		}
		
		
		return "include/message";
		
	}

}
