create table DefaultQA( 
	bnum number(5) primary key,
	Question varchar2(100),
	Answer varchar2(100),
	writer varchar2(20)

);
create sequence Default_seq;
select * from DEFAULTQA;

drop table DefaultQA;
drop sequence Default_seq;

insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','저한테 문의 하세요','관리자');