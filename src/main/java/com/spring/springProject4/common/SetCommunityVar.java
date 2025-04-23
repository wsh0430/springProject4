package com.spring.springProject4.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.springProject4.vo.LikesVo;

public class SetCommunityVar {
	public static <T> void initArrayList(List<T> list, int size) {
		for(int i = 0; i < size; i++) {
			list.add(null);
		}
	}
	
	public static Map<Integer,LikesVo> getLikesMap(List<LikesVo> list) {
		Map<Integer, LikesVo> map = new HashMap<Integer, LikesVo>();
		for(int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getPartIdx(), list.get(i));
		}
		
		return map;
	}
}
