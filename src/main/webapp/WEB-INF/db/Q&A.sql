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

SELECT COUNT(*) FROM QABoard where bgnum= 0
CREATE SEQUENCE QABOARD_BNUM
start with 1
increment BY 1;


select * from QABoard;
SELECT COUNT(*) FROM QABoard where bgnum= 0


select * from (select * from (select rownum rnum ,bDate,bnum,category,title,id,img,count,
(SELECT COUNT(*) FROM QABoard B WHERE B.bgnum=a.bnum)
replyCount from QABoard a where bgnum = 0 ) where rnum <=3 ) where rnum >= 4 order by rnum desc


drop table QABOARD;
drop sequence QABOARD_BNUM;