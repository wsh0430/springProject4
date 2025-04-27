package com.spring.springProject4.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AdminDao {

	int getDailyVisitCnt();

	int yesterdayVisitCnt();

}
