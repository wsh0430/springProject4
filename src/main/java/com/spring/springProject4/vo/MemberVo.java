package com.spring.springProject4.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVo {
    private int idx;
    private String memberId;
    private String password;
    private String nickName;
    private String name;
    private String gender;
    private String tel;
    private String address;
    private String email;
    private String likeTeam;
    private String icon;
    private String content;
    private String birthday;    
    private String memberInfo;
    private String deleteCheck;
    private int point;
    private int level;
    private int visit_count;
    private int boardCount;
    private int commentCount;
    private int reportCount;
    private int warningCount;
    private String ip;
    private String startDate;
    private String lastDate;
}
