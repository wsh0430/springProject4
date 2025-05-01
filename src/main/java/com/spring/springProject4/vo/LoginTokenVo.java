package com.spring.springProject4.vo;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LoginTokenVo {
	private int id;
	 private String memberId;     
   private String loginToken;    
   private LocalDateTime expiry;
}
