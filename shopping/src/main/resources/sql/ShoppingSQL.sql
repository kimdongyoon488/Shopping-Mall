create table product (
pnum number primary key,
pname varchar2(50) not null,
pcode varchar2(20) not null,
pcompany varchar2(50) not null,
price number default 0,
pspec varchar2(20) not null,
pcontent varchar2(4000) not null,
pimage varchar2(100) not null,
pqty number default 0,
point number default 0);

create sequence prod_seq;


create table category(
    cnum number not null,
    code  varchar2(10) not null,
    cname varchar2(50) not null
);

create sequence cate_seq


create table board(
	num number primary key,
    writer varchar(20),
    email varchar(50),
    subject varchar(50),
    readcount number,
    content varchar(200),
    re_step number,
    re_level number
);

alter table board add id varchar(50);
create sequence board_seq;

create table member(
    id varchar(20) primary key,
    password varchar(100) not null,
    age number default 0,
    tel number default 0,
    name VARCHAR(20) not null
);

alter table member add permission varchar(20) not null;


create table myOrder
(num number primary key,
member_id varchar(20) not null,
product_pnum number not null,
qty number not null,
foreign key(member_id) references member(id),
foreign key(product_pnum) references product(pnum));

create sequence myOrder_seq;



