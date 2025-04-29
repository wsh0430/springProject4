package com.spring.springProject4.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVo {
	private int idx;
	private String memberId;
	private String memberNickname;
	private String categoryName;
	private String title;
	private String content;
	private int viewCount;
	private int likeCount;
	private int commentCount;
	private int reportCount;
	private String createdAt;
	private String updateAt;
	private int deleteCheck;
	
	private int dateDiff;		// 게시글 일자 경과 체크 
	private int hourDiff;		// 게시글 24시간 경과 체크
}
