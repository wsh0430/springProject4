package com.spring.springProject4.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CommentVo {
	private int idx;
	private int boardId;
	private String memberId;
	private String memberNickname;
	private String content;
	private int reportCount;
	private int likeCount;
	private int replyCount;	
	private String createdAt;
	private String updateAt;
	private int parentId;
}
