package com.spring.springProject4.dao;


import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.vo.MemberVo;

public interface MemberDao {

	MemberVo getMemberIdCheck(@Param("memberId") String memberId);

	int setMemberJoinOk(@Param("vo") MemberVo vo);

	MemberVo getMemberNickCheck(@Param("nickName") String nickName);

	MemberVo getMemberById(@Param("memberId")String memberId);

	void setMemberVisitCount(@Param("memberId") String memberId);

	void setMemberPoint(@Param("memberId") String memberId, @Param("point") int point);

	int setMemberUpdateOk(@Param("vo") MemberVo vo);

	int setMemberPwdChange(@Param("memberId") String memberId, @Param("pwd") String pwd);

	void deleteMemberById(@Param("memberId") String memberId);

	MemberVo getMemberEmailCheck(@Param("email") String email);

	MemberVo getMemberTelCheck(@Param("tel") String tel);

	



}
