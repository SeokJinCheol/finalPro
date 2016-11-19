//대여하기 게시판
create table registerBoard(
codeNum number(10) PRIMARY KEY,
category varchar2(15) not null,
title varchar2(100) not null,
startDate varchar2(30) not null,
endDate varchar2(30) not null,
userstartDate varchar2(30),
userendDate varchar2(30),
contents varchar2(2000) not null,
bill number(15),
deposit number(15),
packageStatus varchar2(20) default '대여가능',
img varchar2(2000),
reaquestId varchar2(25) not null,
registerId varchar2(25),
company varchar2(20)
);

drop table registerBoard

INSERT INTO registerBoard(codeNum, title, category, company, startDate, endDate, bill, deposit, contents, reaquestId) 
VALUES(1, 'ㅎ', 'ㅎ', 'ㅎ', '2016-11-11', '2016-11-11', 200, 20000, 'ㅎ', 'user1')

select * from registerboard;


delete from requestBoard where codenum=22;

