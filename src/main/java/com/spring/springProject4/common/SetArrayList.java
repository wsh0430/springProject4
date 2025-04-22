package com.spring.springProject4.common;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.spring.springProject4.vo.LikesVo;

public class SetArrayList {
	public static <T> void initArrayList(List<T> list, int size) {
		for(int i = 0; i < size; i++) {
			list.add(null);
		}
	}
	
	public static List<LikesVo> setArrayListToPartIdx(List<LikesVo> list, int size) {
		List<Integer> idxList = new ArrayList<Integer>(list.size());
		for(int i = 0; i < list.size(); i++) {
			idxList.add(list.get(i).getPartIdx());
		}
		
		List<LikesVo> listClone = new ArrayList<LikesVo>();
		initArrayList(listClone, size);
		for(int i = 0; i < list.size(); i++) {
			listClone.set(idxList.get(i)-1, list.get(i));
		}
		
		return listClone;
	}
}
