create table QABoard(
bnum number(10) primary key, 
	bgnum number(10), 
	title varchar2(100) not null, 
	bDate date not null,
	contents varchar2(3000) Not null, 
	id varchar(25), 
	img varchar2(1000),
	count number(10),
	category varchar2(15)
);

CREATE SEQUENCE QABOARD_BNUM; 

select * from QABoard;
SELECT COUNT(*) FROM QABoard where bgnum= 0



drop table QABOARD;
drop sequence QABOARD_BNUM;