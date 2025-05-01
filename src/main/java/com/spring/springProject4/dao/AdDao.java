package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.springProject4.vo.AdvertisementVo;

@Mapper
@Repository
public interface AdDao {

	AdvertisementVo getAdVo(@Param("title") String title);	

	int setCreateAdReport(@Param("sMemberId") String sMemberId, @Param("idx") int idx, @Param("reason") String reason);

	int setUpdateAdReportCnt(@Param("idx") int idx);

	List<AdvertisementVo> getAdVos();

}
