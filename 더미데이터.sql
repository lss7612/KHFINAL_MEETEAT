
-- grade 생성
select * from tb_grade2;

insert into tb_grade2 values(0, '관리자');
insert into tb_grade2 values(1, '결제 유저');
insert into tb_grade2 values(2, '비결제 유저');
insert into tb_grade2 values(3, '영구정지 유저');
select * from tb_grade2;

-- 게시글 분류
insert into tb_boardclass2 values(1, '공지사항');
insert into tb_boardclass2 values(2, '메이트찾기게시판');
insert into tb_boardclass2 values(3, '모집 게시판');
insert into tb_boardclass2 values(4, '후기 게시판');
insert into tb_boardclass2 values(5, '문의 게시판');
insert into tb_boardclass2 values(6, '이벤트 등록 게시판');

select * from tb_boardclass2;

--신고사유테이블
insert into tb_reportreason2 (reason_content) values ('욕설 신고');
insert into tb_reportreason2 (reason_content) values ('스팸 및 광고 신고');
insert into tb_reportreason2 (reason_content) values ('비매너(노쇼 등) 신고');
insert into tb_reportreason2 (reason_content) values ('먹튀 신고');
insert into tb_reportreason2 (reason_content) values ('기타 사유 신고');

select * from tb_reportreason2;

--신고처리내용테이블
insert into tb_resultreportreason2 (report_result_content) values( '영구 정지');
select * from tb_resultreportreason2;

-- 회원 정보 더미데이터
drop table tb_user2;
select * from tb_user2
order by user_no;

insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf1', 'asdf1', 'asdf1', 'M', '20', 0, 'asdf1@a.com',0);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf2', 'asdf2', 'asdf2', 'F', '21', 1, 'asdf2@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf3', 'asdf3', 'asdf3', 'M', '22', 2, 'asdf3@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf4', 'asdf4', 'asdf4', 'F', '23', 3, 'asdf4@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf5', 'asdf5', 'asdf5', 'M', '24', 0, 'asdf5@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf6', 'asdf6', 'asdf6', 'F', '25', 1, 'asdf6@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf7', 'asdf7', 'asdf7', 'M', '26', 2, 'asdf7@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf8', 'asdf8', 'asdf8', 'F', '27', 3, 'asdf8@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf9', 'asdf9', 'asdf9', 'M', '28', 0, 'asdf9@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf10', 'asdf10', 'asdf10', 'F', '29', 1, 'asdf10@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf11', 'asdf11', 'asdf11', 'M', '30', 2, 'asdf11@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf12', 'asdf12', 'asdf12', 'F', '31', 3, 'asdf12@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf13', 'asdf13', 'asdf13', 'M', '32', 0, 'asdf13@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf14', 'asdf14', 'asdf14', 'F', '33', 1, 'asdf14@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf15', 'asdf15', 'asdf15', 'M', '34', 2, 'asdf15@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf16', 'asdf16', 'asdf16', 'F', '35', 3, 'asdf16@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf17', 'asdf17', 'asdf17', 'M', '36', 0, 'asdf17@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf18', 'asdf18', 'asdf18', 'F', '37', 0, 'asdf18@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf19', 'asdf19', 'asdf19', 'M', '38', 0, 'asdf19@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf20', 'asdf20', 'asdf20', 'F', '39', 0, 'asdf20@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf21', 'asdf21', 'asdf21', 'M', '40', 0, 'asdf21@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf22', 'asdf22', 'asdf22', 'F', '41', 0, 'asdf22@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf23', 'asdf23', 'asdf23', 'M', '42', 0, 'asdf23@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf24', 'asdf24', 'asdf24', 'F', '43', 0, 'asdf24@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf25', 'asdf25', 'asdf25', 'M', '44', 0, 'asdf25@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf26', 'asdf26', 'asdf26', 'F', '45', 0, 'asdf26@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf27', 'asdf27', 'asdf27', 'M', '46', 0, 'asdf27@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf28', 'asdf28', 'asdf28', 'F', '47', 0, 'asdf28@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf29', 'asdf29', 'asdf29', 'M', '48', 0, 'asdf29@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf30', 'asdf30', 'asdf30', 'F', '49', 0, 'asdf30@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf31', 'asdf31', 'asdf31', 'M', '50', 0, 'asdf31@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf32', 'asdf32', 'asdf32', 'F', '51', 0, 'asdf32@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf33', 'asdf33', 'asdf33', 'M', '52', 0, 'asdf33@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf34', 'asdf34', 'asdf34', 'F', '53', 0, 'asdf34@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf35', 'asdf35', 'asdf35', 'M', '54', 0, 'asdf35@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf36', 'asdf36', 'asdf36', 'F', '55', 0, 'asdf36@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf37', 'asdf37', 'asdf37', 'M', '56', 0, 'asdf37@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf38', 'asdf38', 'asdf38', 'F', '57', 0, 'asdf38@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf39', 'asdf39', 'asdf39', 'M', '58', 0, 'asdf39@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf40', 'asdf40', 'asdf40', 'F', '59', 0, 'asdf40@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf41', 'asdf41', 'asdf41', 'M', '60', 0, 'asdf41@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf42', 'asdf42', 'asdf42', 'F', '61', 0, 'asdf42@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf43', 'asdf43', 'asdf43', 'M', '62', 0, 'asdf43@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf44', 'asdf44', 'asdf44', 'F', '63', 0, 'asdf44@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf45', 'asdf45', 'asdf45', 'M', '64', 0, 'asdf45@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf46', 'asdf46', 'asdf46', 'F', '65', 0, 'asdf46@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf47', 'asdf47', 'asdf47', 'M', '66', 0, 'asdf47@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf48', 'asdf48', 'asdf48', 'F', '67', 0, 'asdf48@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf49', 'asdf49', 'asdf49', 'M', '68', 0, 'asdf49@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf50', 'asdf50', 'asdf50', 'F', '69', 0, 'asdf50@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf51', 'asdf51', 'asdf51', 'M', '70', 0, 'asdf51@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf52', 'asdf52', 'asdf52', 'F', '71', 0, 'asdf52@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf53', 'asdf53', 'asdf53', 'M', '72', 0, 'asdf53@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf54', 'asdf54', 'asdf54', 'F', '73', 0, 'asdf54@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf55', 'asdf55', 'asdf55', 'M', '74', 0, 'asdf55@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf56', 'asdf56', 'asdf56', 'F', '75', 0, 'asdf56@a.com',1);


--신고 테이블
select * from tb_userreport2
order by user_no asc;

insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(2, sysdate, 1, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(3, sysdate, 2, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(3, sysdate, 3, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(4, sysdate, 4, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(4, sysdate, 5, 'test');
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(4, sysdate, 1, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(6, sysdate, 2, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(7, sysdate, 3, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(7, sysdate, 4, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(8, sysdate, 5, 'test');
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(8, sysdate, 1, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(8, sysdate, 2, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(10, sysdate, 3, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(11, sysdate, 4, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(11, sysdate, 5, 'test');
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(12, sysdate, 1, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(12, sysdate, 2, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(12, sysdate, 3, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(14, sysdate, 4, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(15, sysdate, 5, 'test');
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(15, sysdate, 1, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(16, sysdate, 2, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(16, sysdate, 3, null);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content) values(16, sysdate, 4, null);




--신고처리 더미데이터
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(4, sysdate, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(8, sysdate, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(12, sysdate, 1);

select * from tb_resultreport2;
commit;
