CREATE TABLE board (
    board_num INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content TEXT NULL,
    writer VARCHAR(100) NOT NULL,
    wr_date TIMESTAMP DEFAULT NOW(),
    view_cnt INT DEFAULT 0
);

CREATE TABLE board_comment(
                              cno INT PRIMARY KEY,
                              bno INT,
                              writer VARCHAR(100) NOT NULL,
                              content varchar(200),
                              foreign key(bno) references board(num)
);

create sequence comment_seq;
