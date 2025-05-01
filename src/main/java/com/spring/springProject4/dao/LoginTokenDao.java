package com.spring.springProject4.dao;

import java.time.LocalDateTime;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.vo.MemberVo;

public interface LoginTokenDao {

	void saveLoginToken(@Param("memberId") String memberId, @Param("loginToken") String loginToken, @Param("expiry") LocalDateTime expiry);

	MemberVo getMemberByLoginToken(@Param("loginToken") String loginToken);

	void deleteExpiredLoginTokens(@Param("now") LocalDateTime now);

	void deleteLoginToken(@Param("memberId") String memberId);

}
