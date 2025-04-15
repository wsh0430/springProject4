package com.spring.springProject4.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CategoryVo {
	private int idx;
	private String name;
	private int isActive;
	private String parentName;
	private int admin;
}
