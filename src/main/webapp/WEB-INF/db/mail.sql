create table mail(
	mailNum number(25),
	sid varchar2(25),
	rid varchar2(25),
	text varchar2(1000),
	senddate varchar2(30)
);

CREATE SEQUENCE mailcequence
start with 1
increment BY 1
maxvalue 10000;

drop sequence mailcequence;

drop table mail;