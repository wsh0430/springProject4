CREATE TABLE login_tokens (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '토큰 고유번호', 
    memberId VARCHAR(255) NOT NULL COMMENT '회원 ID',
    loginToken VARCHAR(255) NOT NULL COMMENT '토큰',
    expiry DATETIME NOT NULL COMMENT '토큰 만료 시간',
    UNIQUE (loginToken),
    FOREIGN KEY (memberId) REFERENCES member(memberId)
);