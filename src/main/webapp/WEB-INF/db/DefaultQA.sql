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

insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','������ ���� �ϼ���','������');