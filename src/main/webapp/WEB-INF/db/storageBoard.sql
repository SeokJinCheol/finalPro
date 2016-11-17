#정산
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

--code 정보
--글번호
--대여시작일
--대여반납일
--대여자
--대여비
--보증금
--상태

drop table storageBoard;

select * from storageBoard;

--sequence 생성
CREATE SEQUENCE storage_increment
start with 1
increment BY 1
maxvalue 10000;


SELECT count(*)+1 FROM storageBoard WHERE codeNum = 1

