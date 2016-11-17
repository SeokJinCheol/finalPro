#물건 확인 하기
create table checkBoard(
codeNum number(10) PRIMARY KEY,  
startDate varchar2(30) not null, 
endDate varchar2(30) not null,
userstartDate varchar2(30),
userendDate varchar2(30),
resister varchar2(25) Not null, 
rentter varchar2(25),
bill number(15), 
deposit number(15), 
packageStatus varchar2(20)  default '대여가능'
);

drop table checkBoard

select * from checkboard