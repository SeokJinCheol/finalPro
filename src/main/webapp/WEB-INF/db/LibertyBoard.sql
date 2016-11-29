create table freeBoard4(
bNum number(10) primary key, 
bgnum number(10), 
title varchar2(100) not null,
bDate date not null,
contents varchar2(2000) Not null, 
groupnum number(10),
ranknum number(10), 
id varchar2(25), 
img varchar2(1000),
count number(38)
);



CREATE SEQUENCE fb4_seq
start with 1
increment BY 1;

select * from FREEBOARD4;

drop sequence fb4_seq;
drop table freeboard4

