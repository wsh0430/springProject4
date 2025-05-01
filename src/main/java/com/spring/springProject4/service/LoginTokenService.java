package com.spring.springProject4.service;

import java.time.LocalDateTime;

import com.spring.springProject4.vo.MemberVo;

public interface LoginTokenService {

	void saveLoginToken(String memberId, String loginToken, LocalDateTime expiry);

	MemberVo getMemberByLoginToken(String loginToken);

	void deleteExpiredLoginTokens(LocalDateTime now);

	void deleteLoginToken(String memberId);

}
