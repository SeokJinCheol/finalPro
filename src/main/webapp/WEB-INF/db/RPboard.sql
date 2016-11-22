//허가하기 게시판
create table RPBoard(
seqNum number(10) PRIMARY KEY,
codeNum number(10),
startDate varchar2(30),
endDate varchar2(30),
userstartDate varchar2(30) not null,
userendDate varchar2(30) not null,
contents varchar2(2000) not null,
bill number(15),
adress varchar2(200),
spotNum varchar2(150),
packageStatus varchar2(20) default '허가대기',
reaquestId varchar2(25) not null,
registerId varchar2(25) not null,
company varchar2(20)
);

CREATE SEQUENCE rpb_seq
start with 1
increment BY 1
nocache;
select * from rrb_seq.nextval

select * from rpBoard;

delete from rpboard;

drop table RpBoard

drop sequence rrb_seq;
