create table mail(
	mailNum number(100),
	sid varchar2(25),
	rid varchar2(25),
	text varchar2(1000)
);

CREATE SEQUENCE mailcequence
start with 1
increment BY 1
maxvalue 10000;

drop sequence mailcequence;

drop table mail;