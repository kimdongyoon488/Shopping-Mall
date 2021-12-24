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
