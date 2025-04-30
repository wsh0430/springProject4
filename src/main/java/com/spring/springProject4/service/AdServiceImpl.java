package com.spring.springProject4.service;

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

}
