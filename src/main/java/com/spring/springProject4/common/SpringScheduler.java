package com.spring.springProject4.common;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.RequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.springProject4.service.LoginTokenService;


@Component
public class SpringScheduler {
	
	@Autowired
	LoginTokenService loginTokenService;
	
	@Autowired
	private JavaMailSender mailSender;

	@Scheduled(cron = "0 0 0 * * *")  // 매일 자정에 실행
  public void deleteExpiredTokens() {
      // 현재 시간을 기준으로 만료된 토큰을 삭제
      LocalDateTime now = LocalDateTime.now();
      
      // 만료된 로그인 토큰 삭제
      loginTokenService.deleteExpiredLoginTokens(now);

      System.out.println("만료된 로그인 토큰을 삭제했습니다: " + now);
  }
	
	
}
