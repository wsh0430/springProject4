package com.spring.springProject4.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReportVo {
	private int idx;
	private String memberId;
	private String part;
	private int partIdx;
	private String reason;
	private String createdAt;
}
