#자유 게시판
create table freeBoard(
   bNum number(10) primary key, bgnum number(10), title varchar2(100), bDate date not null,
contents varchar2(2000) Not null, READCOUNT NUMBER(3) DEFAULT 0, groupnum number(10), ranknum number(10), id varchar2(25), img varchar2(1000)
,category varchar2(20)
);


CREATE SEQUENCE fb_seq
start with 1
increment BY 1;


select * from freeBoard

drop table freeboard;
drop sequence fb_seq;

delete freeBoard where bnum=12;