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
	private int dailyWriteBoardCnt;			//오늘 작성된 게시글 수
	private int dailyWriteBoardDelta;		//변동된 게시글 수
	private int dailyJoinCnt;				//오늘 회원가입 수
	private int dailyJoinDelta;				//변동된 회원가입 수
	private int dailyAdClickCnt;				//오늘 회원가입 수
	private int dailyAdClickDelta;				//변동된 회원가입 수
}
