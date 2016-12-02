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
packageStatus varchar2(20) default '대여대기',
img varchar2(2000) DEFAULT '이미지없음',
reaquestId varchar2(25) ,
registerId varchar2(25) not null,
company varchar2(20)
);

drop table RRBoard

select * from rrboard

 select * from RPBoard WHERE packageStatus='정산완료' and codeNum = 14 and registerDate between TO_DATE('2016-11-01 00:00:01','YYYY-MM-DD HH24:MI:SS') and TO_DATE('2016-11-31 23:59:59','YYYY-MM-DD HH24:MI:SS') ORDER BY registerDate DESC;00

 alter table RRBoard MODIFY (img varchar2(2000) DEFAULT '이미지없음');
            
 
select * from rrBoard

insert into RRBoard(codeNum, title, category, company, startDate,endDate, bill, contents, reaquestId, img, adress, spotNum)
		values(rrb_seq.nextval, 'love', 'love', 'love', sysdate,
		'Wed Nov 02 00:00:00 KST 2016', 1000, 'love', 'love', 'love',
		'love','love')
delete from rrboard where title = 'love';

select * from RRBoard;

update RRboard set img='이미지없음.jpg' where codeNum= 24;

CREATE SEQUENCE rrb_seq
start with 1
increment BY 1
nocache;
select * from rrb_seq.nextval

drop table RRBoard;
drop sequence rrb_seq;

delete from requestBoard where codenum=22;

