//대여하기 게시판
create table RRBoard(
codeNum number(10) PRIMARY KEY,
category varchar2(15) not null,
title varchar2(100) not null,
startDate varchar2(30) not null,
endDate varchar2(30) not null,
userstartDate varchar2(30),
userendDate varchar2(30),
contents varchar2(2000) not null,
bill number(15),
adress varchar2(200),
spotNum varchar2(150),
packageStatus varchar2(20) default '대여가능',
img varchar2(2000) default '이미지없음',
reaquestId varchar2(25) ,
registerId varchar2(25) not null,
company varchar2(20)
);

drop table RRBoard

select * from rrboard where codenum = 10


select * from rrBoard

insert into RRBoard(codeNum, title, category, company, startDate,endDate, bill, contents, reaquestId, img, adress, spotNum)
		values(rrb_seq.nextval, 'love', 'love', 'love', sysdate,
		'Wed Nov 02 00:00:00 KST 2016', 1000, 'love', 'love', 'love',
		'love','love')
delete from rrboard where title = 'love';

select * from RRBoard;

CREATE SEQUENCE rrb_seq
start with 1
increment BY 1
nocache;
select * from rrb_seq.nextval

drop sequence rrb_seq;

delete from requestBoard where codenum=22;

