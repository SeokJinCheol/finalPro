create table users(
id varchar(15) PRIMARY KEY, 
name varchar(25) Not null,
pwd varchar(50) not null, 
birthday varchar(50) null,
phoneNum1 varchar(15), 
phoneNum2 varchar(15), 
email varchar(50),
adress varchar(100), 
memberRank varchar(15),
company varchar(15)
);

insert into users(id,name,pwd,birthday,phoneNum1,phoneNum2,email,adress,memberRank,company)
values('admin','이상선','as123789456','1989-07-13',01066270713,null,'skydrower@gmail.com','우리별 지구','조장','빌리버리');
insert into users values('user1','형윤','user1','2005-02-12',0106123456,null,'user1@gmail.com','서울','유저',null);
insert into users values('user2','차지','user2','1982-01-13',0106224552,null,'user2r@gmail.com','경기','열심유저',null);

insert into users values('tt1','tt1','tt1','1982-01-13',0106224552,null,'user2r@gmail.com','경기','열심유저',null);
insert into users values('tt2','tt2','tt2','1982-01-13',0106224552,null,'user2r@gmail.com','경기','열심유저',null);
insert into users values('tt3','tt3','tt3','1982-01-13',0106224552,null,'user2r@gmail.com','경기','열심유저',null);

select * from users;

drop table users;

create table userRank(
id varchar(15), 
rightrank varchar(15)
);

insert into userRank values('admin','role_master');insert into userRank values('admin','role_user');
insert into userRank values('user1','role_user');insert into userRank values('user2','role_user');
insert into userRank values('company1','role_com');insert into userRank values('company2','role_com');

insert into userRank values('tt1','role_com');
insert into userRank values('tt2','role_com');
insert into userRank values('tt3','role_com');

DELETE from userRank WHERE ID = 'admin' and rightrank = 'role_user';

select * from USERRANK;