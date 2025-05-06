CREATE TABLE login_tokens (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '토큰 고유번호', 
    member_Id VARCHAR(255) NOT NULL COMMENT '회원 ID',
    login_Token VARCHAR(255) NOT NULL COMMENT '토큰',
    expiry DATETIME NOT NULL COMMENT '토큰 만료 시간',
    UNIQUE (login_Token),
    FOREIGN KEY (member_Id) REFERENCES member(member_Id)
);

select * from login_tokens;

drop table login_tokens;