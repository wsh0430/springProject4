package com.spring.springProject4.service;


import org.springframework.web.multipart.MultipartFile;

import com.spring.springProject4.vo.MemberVo;

public interface MemberService {

	MemberVo getMemberIdCheck(String memberId);
	
	MemberVo getMemberNickCheck(String nickName);

	void memberJoin(MemberVo vo);

	String fileUpload(MultipartFile fName, String memberId, String Icon);

	int setMemberJoinOk(MemberVo vo);

	MemberVo getMemberById(String memberId);

	void setMemberVisitCount(String memberId);

	void setMemberPoint(String memberId, int point);






}
