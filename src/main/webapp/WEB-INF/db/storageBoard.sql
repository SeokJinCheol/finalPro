#����
create table storageBoard(
	sNum number(10),
	codeNum number(10) not null, 
	startDate varchar2(30) not null, 
	endDate varchar2(30), 
	rentter varchar(25),
	bill number(15), 
	deposit number(15), 
	packageStatus varchar(20) not null
);

--code ����
--�۹�ȣ
--�뿩������
--�뿩�ݳ���
--�뿩��
--�뿩��
--������
--����

drop table storageBoard;

select * from storageBoard;

--sequence ����
CREATE SEQUENCE storage_increment
start with 1
increment BY 1
maxvalue 10000;


SELECT count(*)+1 FROM storageBoard WHERE codeNum = 1

