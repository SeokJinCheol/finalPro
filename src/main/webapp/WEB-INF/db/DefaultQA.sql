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

insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','관리자에게 문의 하세요','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'물건등록후 현황을 어디서 볼 수 있나요? ','로그인후 물품등록->나의 등록현황으로 가면 보실수 있습니다.','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'등록된 물건이 안보이는데 어떻게 된거죠?','관리자가 심사 후 최대 3일 내에 대여게시판으로 옮겨 드리니 대기부탁드립니다.','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'질문은 어디에서 하면되죠?','화면 상단에 Q&A을 누르시면 질문게시판으로 이동됩니다.','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'대여한 물건은 어떻게 받죠?','대여를 하면 회원님의 주소로 발송되며 수령하실수 있습니다.','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','저한테 문의 하세요','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','저한테 문의 하세요','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','저한테 문의 하세요','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','저한테 문의 하세요','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','저한테 문의 하세요','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','저한테 문의 하세요','관리자');
