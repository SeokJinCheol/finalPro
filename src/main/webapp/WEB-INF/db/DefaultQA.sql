create table DefaultQA( 
	bnum number(5) primary key,
	Question varchar2(1000),
	Answer varchar2(1000),
	writer varchar2(20)
);

create sequence Default_seq;
select * from DEFAULTQA;

drop table DefaultQA;
drop sequence Default_seq;


insert into DEFAULTQA values(default_seq.nextVal,'로그인이 안됩니다. 어떻게 해야하나요?','관리자에게 문의하세요','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'물건등록 후 현황을 어디서 볼 수 있나요? ','로그인 후 물품등록 --> 나의 등록현황으로 가면 보실 수 있습니다.','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'등록된 물건이 안보이는데 어떻게 해야하나요?','관리자가 심사 후 대여게시판으로 옮겨 드리니 대기 부탁드립니다.','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'질문은 어디에서 하면되죠?','화면 상단에 Q&A을 누르시고 질문을 등록해주시면 최대한 빠른 시일 내에 해결해드리겠습니다.','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'대여한 물건은 어떻게 받죠?','대여 시,  회원님의 주소로 택배발송되며 빠른 시일 내에 수령하실 수 있습니다.','관리자');
insert into DEFAULTQA values(default_seq.nextVal,'사이트 이용방법이 어떻게 되나요?','상단메뉴에 쉽게 안내되어있으니 참고하시기 바랍니다.','관리자');