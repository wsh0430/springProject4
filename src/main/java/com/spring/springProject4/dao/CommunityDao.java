package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.springProject4.vo.CategoryVo;

@Mapper
@Repository
public interface CommunityDao {

	List<CategoryVo> getCategoryList(@Param("parentName") String parentName);

}
