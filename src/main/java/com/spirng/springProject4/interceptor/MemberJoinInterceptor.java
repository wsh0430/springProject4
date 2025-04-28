package com.spirng.springProject4.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.springProject4.common.ARIAUtil;
import com.spring.springProject4.service.MemberService;
import com.spring.springProject4.vo.MemberVo;

public class MemberJoinInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private MemberService memberService;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
  	// 클라이언트 IP 주소를 얻어오기
    String clientIp = request.getRemoteAddr();
    
    // IP 주소를 세션에 저장 (암호화된 IP 주소를 저장)
    HttpSession session = request.getSession();
    
    // IP를 암호화하여 세션에 저장
    String encryptedIp = ARIAUtil.ariaEncrypt(clientIp); // ARIA 암호화
    session.setAttribute("encryptedIp", encryptedIp);

    // 복호화된 IP를 세션에 추가 (복호화된 IP는 이후에 사용 가능)
    String decryptedIp = ARIAUtil.ariaDecrypt(encryptedIp); // 복호화
    session.setAttribute("decryptedIp", decryptedIp);

	  // 3. 자동 로그인 처리: 로그인 토큰이 있으면 세션에 자동으로 사용자 정보 설정
    String loginToken = null;
    if (request.getCookies() != null) {
        for (javax.servlet.http.Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("loginToken")) {
                loginToken = cookie.getValue();
                break;
            }
        }
    }

    if (loginToken != null) {
        // DB에서 로그인 토큰 정보 조회
        MemberVo member = memberService.getMemberByLoginToken(loginToken);
        if (member != null) {
            // 세션에 자동 로그인 정보 설정
            session.setAttribute("sMemberId", member.getMemberId());
            session.setAttribute("sNickName", member.getNickName());
            session.setAttribute("sLevel", member.getLevel());
            session.setAttribute("strLevel", getLevelString(member.getLevel()));
            session.setAttribute("sLogin", "자동로그인");
        }
    }
	    return true; // 계속 진행
	}
	
		// 회원 레벨에 대한 문자열 반환 (관리자, 우수회원 등)
		private String getLevelString(int level) {
		    switch (level) {
		        case 0: return "관리자";
		        case 1: return "우수회원";
		        case 2: return "정회원";
		        default: return "일반회원";
		    }
		}
}