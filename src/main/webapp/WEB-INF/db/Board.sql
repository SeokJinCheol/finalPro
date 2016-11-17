#자유 게시판
create table freeBoard(bnum number(10) primary key, bgnum number(10), title varchar2(100) not null, bDate date not null,
contents varchar2(3000) Not null, groupnum number(10), ranknum number(10), id varchar(25), img varchar2(1000),count number(10),category varchar2(15)
);


#Q&A 게시판
create table QABoard(bNum number(10) primary key, bgnum number(10), title varchar2(100) not null, bDate date not null,
contents varchar2(2000) Not null, groupnum number(10), ranknum number(10), id varchar2(25), img varchar2(1000)
,category varchar2(10)
);


CREATE SEQUENCE fb_seq
start with 1
increment BY 1;

CREATE SEQUENCE qb_seq
start with 1
increment BY 1;

select * from freeBoard

drop table freeboard
drop sequence fb_seq