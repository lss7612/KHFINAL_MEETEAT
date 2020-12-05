
-- grade 생성
select * from tb2_grade;

insert into tb2_grade values(0, '관리자');
insert into tb2_grade values(1, '결제 유저');
insert into tb2_grade values(2, '비결제 유저');
insert into tb2_grade values(3, '영구정지 유저');
select * from tb2_grade;

-- 회원 정보 더미데이터
select * from tb2_user
order by user_no;

insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf1', 'asdf1', 'asdf1', '남', '20', 0, 'asdf1@a.com',0);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf2', 'asdf2', 'asdf2', '여', '21', 1, 'asdf2@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf3', 'asdf3', 'asdf3', '남', '22', 2, 'asdf3@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf4', 'asdf4', 'asdf4', '여', '23', 3, 'asdf4@a.com',3);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf5', 'asdf5', 'asdf5', '남', '24', 0, 'asdf5@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf6', 'asdf6', 'asdf6', '여', '25', 1, 'asdf6@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf7', 'asdf7', 'asdf7', '남', '26', 2, 'asdf7@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf8', 'asdf8', 'asdf8', '여', '27', 3, 'asdf8@a.com',3);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf9', 'asdf9', 'asdf9', '남', '28', 0, 'asdf9@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf10', 'asdf10', 'asdf10', '여', '29', 1, 'asdf10@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf11', 'asdf11', 'asdf11', '남', '30', 2, 'asdf11@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf12', 'asdf12', 'asdf12', '여', '31', 3, 'asdf12@a.com',3);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf13', 'asdf13', 'asdf13', '남', '32', 0, 'asdf13@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf14', 'asdf14', 'asdf14', '여', '33', 1, 'asdf14@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf15', 'asdf15', 'asdf15', '남', '34', 2, 'asdf15@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf16', 'asdf16', 'asdf16', '여', '35', 3, 'asdf16@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf17', 'asdf17', 'asdf17', '남', '36', 0, 'asdf17@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf18', 'asdf18', 'asdf18', '여', '37', 0, 'asdf18@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf19', 'asdf19', 'asdf19', '남', '38', 0, 'asdf19@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf20', 'asdf20', 'asdf20', '여', '39', 0, 'asdf20@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf21', 'asdf21', 'asdf21', '남', '40', 0, 'asdf21@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf22', 'asdf22', 'asdf22', '여', '41', 0, 'asdf22@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf23', 'asdf23', 'asdf23', '남', '42', 0, 'asdf23@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf24', 'asdf24', 'asdf24', '여', '43', 0, 'asdf24@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf25', 'asdf25', 'asdf25', '남', '44', 0, 'asdf25@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf26', 'asdf26', 'asdf26', '여', '45', 0, 'asdf26@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf27', 'asdf27', 'asdf27', '남', '46', 0, 'asdf27@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf28', 'asdf28', 'asdf28', '여', '47', 0, 'asdf28@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf29', 'asdf29', 'asdf29', '남', '48', 0, 'asdf29@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf30', 'asdf30', 'asdf30', '여', '49', 0, 'asdf30@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf31', 'asdf31', 'asdf31', '남', '50', 0, 'asdf31@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf32', 'asdf32', 'asdf32', '여', '51', 0, 'asdf32@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf33', 'asdf33', 'asdf33', '남', '52', 0, 'asdf33@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf34', 'asdf34', 'asdf34', '여', '53', 0, 'asdf34@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf35', 'asdf35', 'asdf35', '남', '54', 0, 'asdf35@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf36', 'asdf36', 'asdf36', '여', '55', 0, 'asdf36@a.com',3);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf37', 'asdf37', 'asdf37', '남', '56', 0, 'asdf37@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf38', 'asdf38', 'asdf38', '여', '57', 0, 'asdf38@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf39', 'asdf39', 'asdf39', '남', '58', 0, 'asdf39@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf40', 'asdf40', 'asdf40', '여', '59', 0, 'asdf40@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf41', 'asdf41', 'asdf41', '남', '60', 0, 'asdf41@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf42', 'asdf42', 'asdf42', '여', '61', 0, 'asdf42@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf43', 'asdf43', 'asdf43', '남', '62', 0, 'asdf43@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf44', 'asdf44', 'asdf44', '여', '63', 0, 'asdf44@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf45', 'asdf45', 'asdf45', '남', '64', 0, 'asdf45@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf46', 'asdf46', 'asdf46', '여', '65', 0, 'asdf46@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf47', 'asdf47', 'asdf47', '남', '66', 0, 'asdf47@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf48', 'asdf48', 'asdf48', '여', '67', 0, 'asdf48@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf49', 'asdf49', 'asdf49', '남', '68', 0, 'asdf49@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf50', 'asdf50', 'asdf50', '여', '69', 0, 'asdf50@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf51', 'asdf51', 'asdf51', '남', '70', 0, 'asdf51@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf52', 'asdf52', 'asdf52', '여', '71', 0, 'asdf52@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf53', 'asdf53', 'asdf53', '남', '72', 0, 'asdf53@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf54', 'asdf54', 'asdf54', '여', '73', 0, 'asdf54@a.com',1);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf55', 'asdf55', 'asdf55', '남', '74', 0, 'asdf55@a.com',2);
insert into tb2_user(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('asdf56', 'asdf56', 'asdf56', '여', '75', 0, 'asdf56@a.com',1);


-- 게시글 분류
delete tb2_boardclass
where board_no =6;
insert into tb2_boardclass values(1, '공지사항');
insert into tb2_boardclass values(2, '메이트찾기게시판');
insert into tb2_boardclass values(3, '모집 게시판');
insert into tb2_boardclass values(4, '후기 게시판');
insert into tb2_boardclass values(5, '문의 게시판');
insert into tb2_boardclass values(6, '이벤트 등록 게시판');

select * from tb2_boardclass;

--신고사유테이블
insert into tb2_reportreason (reason_content) values ('욕설 신고');
insert into tb2_reportreason (reason_content) values ('스팸 및 광고 신고');
insert into tb2_reportreason (reason_content) values ('비매너(노쇼 등) 신고');
insert into tb2_reportreason (reason_content) values ('먹튀 신고');
insert into tb2_reportreason (reason_content) values ('기타 사유 신고');

select * from tb2_reportreason;

--신고처리내용테이블
insert into tb2_resultreportreason (report_result_content) values( '영구 정지');
select * from tb2_resultreportreason;

--신고 테이블
select * from tb2_userreport;

insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(2, sysdate, 1, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(3, sysdate, 2, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(3, sysdate, 3, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(4, sysdate, 4, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(4, sysdate, 5, 'test');
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(4, sysdate, 1, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(6, sysdate, 2, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(7, sysdate, 3, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(7, sysdate, 4, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(8, sysdate, 5, 'test');
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(8, sysdate, 1, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(8, sysdate, 2, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(10, sysdate, 3, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(11, sysdate, 4, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(11, sysdate, 5, 'test');
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(12, sysdate, 1, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(12, sysdate, 2, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(12, sysdate, 3, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(14, sysdate, 4, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(15, sysdate, 5, 'test');
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(15, sysdate, 1, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(16, sysdate, 2, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(16, sysdate, 3, null);
insert into tb2_userreport (user_no, report_time, reason_no, report_content) values(16, sysdate, 4, null);



--신고처리 더미데이터
insert into tb2_resultreport (user_no, report_result_date, report_result_detail_no) values(4, sysdate, 1);
insert into tb2_resultreport (user_no, report_result_date, report_result_detail_no) values(8, sysdate, 1);
insert into tb2_resultreport (user_no, report_result_date, report_result_detail_no) values(12, sysdate, 1);

select * from tb2_resultreport;

