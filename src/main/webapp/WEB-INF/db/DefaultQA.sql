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

insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','�����ڿ��� ���� �ϼ���','������');
insert into DEFAULTQA values(default_seq.nextVal,'���ǵ���� ��Ȳ�� ��� �� �� �ֳ���? ','�α����� ��ǰ���->���� �����Ȳ���� ���� ���Ǽ� �ֽ��ϴ�.','������');
insert into DEFAULTQA values(default_seq.nextVal,'��ϵ� ������ �Ⱥ��̴µ� ��� �Ȱ���?','�����ڰ� �ɻ� �� �ִ� 3�� ���� �뿩�Խ������� �Ű� �帮�� ����Ź�帳�ϴ�.','������');
insert into DEFAULTQA values(default_seq.nextVal,'������ ��𿡼� �ϸ����?','ȭ�� ��ܿ� Q&A�� �����ø� �����Խ������� �̵��˴ϴ�.','������');
insert into DEFAULTQA values(default_seq.nextVal,'�뿩�� ������ ��� ����?','�뿩�� �ϸ� ȸ������ �ּҷ� �߼۵Ǹ� �����ϽǼ� �ֽ��ϴ�.','������');
insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','������ ���� �ϼ���','������');
insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','������ ���� �ϼ���','������');
insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','������ ���� �ϼ���','������');
insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','������ ���� �ϼ���','������');
insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','������ ���� �ϼ���','������');
insert into DEFAULTQA values(default_seq.nextVal,'�α����� �ȵ˴ϴ�. ��� �ؾ��ϳ���?','������ ���� �ϼ���','������');
