package com.spirng.springProject4.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberJoinInterceptor extends HandlerInterceptorAdapter {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
     
     // 클라이언트 IP 주소를 얻어오기
     String clientIp = request.getRemoteAddr();
     
     // IP 주소를 세션에 저장
     HttpSession session = request.getSession();
     session.setAttribute("clientIp", clientIp);

     return true; // 계속 진행
  }
}