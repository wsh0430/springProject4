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
	private int hideCheck;
	
	private String dateDiff;
	private String hourDiff;
}


