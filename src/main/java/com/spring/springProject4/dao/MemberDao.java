package com.spring.springProject4.dao;

import java.time.LocalDateTime;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.vo.MemberVo;

public interface MemberDao {

	MemberVo getMemberIdCheck(@Param("memberId") String memberId);

	void memberJoin(MemberVo vo);

	int setMemberJoinOk(@Param("vo") MemberVo vo);

	MemberVo getMemberNickCheck(@Param("nickName") String nickName);

	MemberVo getMemberById(@Param("memberId")String memberId);

	void setMemberVisitCount(@Param("memberId") String memberId);

	void setMemberPoint(@Param("memberId") String memberId, @Param("point") int point);

	void saveLoginToken(@Param("memberId") String memberId, @Param("loginToken") String loginToken, @Param("expiry") LocalDateTime expiry);

	void deleteLoginToken(@Param("loginToken") String loginToken);

	MemberVo getMemberByLoginToken(@Param("loginToken") String loginToken);

}
