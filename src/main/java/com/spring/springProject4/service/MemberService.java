package com.spring.springProject4.service;


import org.springframework.web.multipart.MultipartFile;

import com.spring.springProject4.vo.MemberVo;

public interface MemberService {

	MemberVo getMemberIdCheck(String memberId);
	
	MemberVo getMemberNickCheck(String nickName);

	String fileUpload(MultipartFile fName, String memberId, String Icon);

	int setMemberJoinOk(MemberVo vo);

	MemberVo getMemberById(String memberId);

	void setMemberVisitCount(String memberId);

	void setMemberPoint(String memberId, int point);

	int setMemberUpdateOk(MemberVo vo);

	int setMemberPwdChange(String memberId, String pwd);

	void deleteMemberById(String memberId);

	MemberVo getMemberEmailCheck(String email);

	MemberVo getMemberTelCheck(String tel);

	MemberVo getMemberIdByNameAndTel(String name, String tel);

	MemberVo getMemberByIdAndTel(String memberId, String tel);

	void updateMemberPassword(String memberId, String encodedPwd);

	void updateMemberFirstLogin(MemberVo vo);

	void updateLastDate(String memberId);

	void setMemberNickChange(String memberId, String newNickName);

	





}
