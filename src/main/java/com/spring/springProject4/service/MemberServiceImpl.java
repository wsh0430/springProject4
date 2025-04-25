package com.spring.springProject4.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.springProject4.common.ProjectProvide;
import com.spring.springProject4.dao.MemberDao;
import com.spring.springProject4.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	@Override
  public void memberJoin(MemberVo vo) {
     // 여기에서 생일 기본값 처리
     if (vo.getBirthday() == null || vo.getBirthday().isEmpty()) {
         vo.setBirthday(LocalDate.now().toString()); // "2025-04-17"
     }

     memberDao.memberJoin(vo);
  }
	
	@Override
	public MemberVo getMemberIdCheck(String memberId) {
		
		return memberDao.getMemberIdCheck(memberId);
	}

	@Override
	public String fileUpload(MultipartFile fName, String memberId, String Icon) {
		//파일이름 중복방지를 위한 처리
		String oFileName = fName.getOriginalFilename();
		String sFileName = memberId + "_" + UUID.randomUUID().toString().substring(0,8) + "_" + oFileName;
		
		try {
			ProjectProvide.writeFile(fName, sFileName, "member");//서버에 파일 올리기
			
			//기존 사진파일을 삭제처리한다.(단, 기존사진이 noIcon.jpg라면 삭제하면 안됨)
			if(!Icon.equals("noIcon.jpg")) ProjectProvide.deleteFile(Icon, "member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sFileName;
	}

	@Override
	public int setMemberJoinOk(MemberVo vo) {
		
		return memberDao.setMemberJoinOk(vo);
	}

	@Override
	public MemberVo getMemberNickCheck(String nickName) {
	
		return memberDao.getMemberNickCheck(nickName);
	}

	@Override
	public MemberVo getMemberById(String memberId) {
		
		return memberDao.getMemberById(memberId);
	}

	@Override
	public void setMemberVisitCount(String memberId) {
		memberDao.setMemberVisitCount(memberId);
		
	}

	@Override
	public void setMemberPoint(String memberId, int point) {
		memberDao.setMemberPoint(memberId, point);
		
	}
	

}
