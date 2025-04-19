package com.spring.springProject4.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LikesVo {
	private int idx;
	private String memberId;
	private String part;
	private int partIdx;
	private String createdAt;
	
	//여유 index
	private int itemInit1;
	private int itemInit2;
	private int itemInit3;
	private String itemVarchar;
	private String itemVarchar2;
	private String itemVarchar3;
	private String itemText;
	private String itemDatetime1;
	private String itemDatetime2;
	private String itemTinyint;
}
