create table DefaultQA( 
	bnum number(5) primary key,
	Question varchar2(1000),
	Answer varchar2(1000),
	writer varchar2(20)
);

create sequence Default_seq;
select * from DEFAULTQA;

drop table DefaultQA;
drop sequence Default_seq;


insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','�����ڿ��� �����ϼ���','������');
insert into DEFAULTQA values(default_seq.nextVal,'���ǵ�� �� ��Ȳ�� ��� �� �� �ֳ���? ','�α��� �� ��ǰ��� --> ���� �����Ȳ���� ���� ���� �� �ֽ��ϴ�.','������');
insert into DEFAULTQA values(default_seq.nextVal,'��ϵ� ������ �Ⱥ��̴µ� ��� �ؾ��ϳ���?','�����ڰ� �ɻ� �� �뿩�Խ������� �Ű� �帮�� ��� ��Ź�帳�ϴ�.','������');
insert into DEFAULTQA values(default_seq.nextVal,'������ ��𿡼� �ϸ����?','ȭ�� ��ܿ� Q&A�� �����ð� ������ ������ֽø� �ִ��� ���� ���� ���� �ذ��ص帮�ڽ��ϴ�.','������');
insert into DEFAULTQA values(default_seq.nextVal,'�뿩�� ������ ��� ����?','�뿩 ��,  ȸ������ �ּҷ� �ù�߼۵Ǹ� ���� ���� ���� �����Ͻ� �� �ֽ��ϴ�.','������');
insert into DEFAULTQA values(default_seq.nextVal,'����Ʈ �̿����� ��� �ǳ���?','��ܸ޴��� ���� �ȳ��Ǿ������� �����Ͻñ� �ٶ��ϴ�.','������');