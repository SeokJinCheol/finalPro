create table QABoard(bNum number(10) primary key, bgnum number(10), title varchar2(100), bDate date not null,
contents varchar2(2000) Not null, READCOUNT NUMBER(3) DEFAULT 0, groupnum number(10), ranknum number(10), id varchar2(25), img varchar2(1000)
,category varchar2(10)
);

CREATE SEQUENCE QABOARD_BNUM; 

select * from QABoard;




drop table QABOARD;
drop sequence QABOARD_BNUM;