package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.vo.AdvertisementVo;

public interface AdService {

	AdvertisementVo getAdVo(String title);

	int setCreateAdReport(String sMemberId, int idx, String reason);
	
	int setUpdateAdReportCnt(int idx);

	List<AdvertisementVo> getAdVos();

	int setAdClick(int idx);

	String getAdUrl(int idx);

	
}
