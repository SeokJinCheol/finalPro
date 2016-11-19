--대여 등록 게시판
create table requestBoard(
codeNum number(10) PRIMARY KEY,
category varchar2(15) Not null,
title varchar2(100) Not null, 
startDate varchar2(30) not null,
endDate varchar2(30) not null,
contents varchar2(2000) Not null,
bill number(15),
deposit number(15),
img varchar2(2000),
packageStatus varchar2(20) default '심사중',
reaquestId varchar2(25) not null,
company varchar2(20)
);

drop table requestBoard;

select * from requestBoard;

--sequence 생성
CREATE SEQUENCE auto_increment
start with 1
increment BY 1
maxvalue 10000;

drop SEQUENCE auto_increment;


