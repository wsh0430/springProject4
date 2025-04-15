package com.spring.springProject4.vo;

import org.joda.time.DateTime;

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
	private DateTime createdAt;
	private DateTime updateAt;
	private int isDelete;
}
