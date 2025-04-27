package com.spring.springProject4.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StatDataVo {
	private int dailyVisitCnt;				//오늘 방문수
	private int dailyVisitDelta;			//변동된 방문수
}
