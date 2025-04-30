package com.spring.springProject4.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdvertisementVo {
	private int idx;
	private String title;
	private String imageUrl;
	private String linkUrl;
	private String position;
	private String startAt;
	private String endAt;
	private int clickCount;
	private int reportCount;
}
