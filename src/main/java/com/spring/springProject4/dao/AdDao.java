package com.spring.springProject4.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.springProject4.vo.AdvertisementVo;

@Mapper
@Repository
public interface AdDao {

	AdvertisementVo getAdVo(@Param("title") String title);

}
