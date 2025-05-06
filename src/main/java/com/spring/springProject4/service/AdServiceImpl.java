package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.AdDao;
import com.spring.springProject4.vo.AdvertisementVo;

@Service
public class AdServiceImpl implements AdService {
	@Autowired
	AdDao adDao;

	@Override
	public AdvertisementVo getAdVo(String title) {
		return adDao.getAdVo(title);
	}

	@Override
	public int setCreateAdReport(String sMemberId, int idx, String reason) {
		return adDao.setCreateAdReport(sMemberId, idx, reason);
	}

	@Override
	public int setUpdateAdReportCnt(int idx) {
		return adDao.setUpdateAdReportCnt(idx);
	}

	@Override
	public List<AdvertisementVo> getAdVos() {
		return adDao.getAdVos();
	}

	@Override
	public int setAdClick(int idx) {
		return adDao.setAdClick(idx);
	}

	@Override
	public String getAdUrl(int idx) {
		return adDao.getAdUrl(idx);
	}

}
