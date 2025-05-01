package com.spring.springProject4.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.LoginTokenDao;
import com.spring.springProject4.vo.MemberVo;
@Service
public class LoginTokenServiceImpl implements LoginTokenService {

	@Autowired
	LoginTokenDao loginTokenDao;
	
	@Override
	public void saveLoginToken(String memberId, String loginToken, LocalDateTime expiry) {
		loginTokenDao.saveLoginToken(memberId, loginToken, expiry);

	}
	@Override
	public MemberVo getMemberByLoginToken(String loginToken) {

		return loginTokenDao.getMemberByLoginToken(loginToken);
	}
	@Override
	public void deleteExpiredLoginTokens(LocalDateTime now) {
		loginTokenDao.deleteExpiredLoginTokens(now);
		
	}
	@Override
	public void deleteLoginToken(String memberId) {
		loginTokenDao.deleteLoginToken(memberId);
		
	}

}
