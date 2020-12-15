
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
insert into tb_reportreason2 values (1,'욕설 신고');
insert into tb_reportreason2 values (2,'스팸 및 광고 신고');
insert into tb_reportreason2 values (3,'비매너(노쇼 등) 신고');
insert into tb_reportreason2 values (4,'먹튀 신고');
insert into tb_reportreason2 values (5,'기타 사유 신고');

select * from tb_reportreason2;

--신고처리내용테이블
insert into tb_resultreportreason2 values(1, '영구 정지');
select * from tb_resultreportreason2;

-- 회원 정보 더미데이터

select * from tb_user2
order by user_no;


insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(2, 'asdf2', 'asdf2', 'asdf2', 'F', '21', 0, 'asdf2@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(3, 'asdf3', 'asdf3', 'asdf3', 'M', '22', 0, 'asdf3@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(4, 'asdf4', 'asdf4', 'asdf4', 'F', '23', 0, 'asdf4@a.com',3);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(5, 'asdf5', 'asdf5', 'asdf5', 'M', '24', 0, 'asdf5@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(6, 'asdf6', 'asdf6', 'asdf6', 'F', '25', 0, 'asdf6@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(7, 'asdf7', 'asdf7', 'asdf7', 'M', '26', 0, 'asdf7@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(8, 'asdf8', 'asdf8', 'asdf8', 'F', '27', 0, 'asdf8@a.com',3);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(9, 'asdf9', 'asdf9', 'asdf9', 'M', '28', 0, 'asdf9@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(10, 'asdf10', 'asdf10', 'asdf10', 'F', '29', 0, 'asdf10@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(11, 'asdf11', 'asdf11', 'asdf11', 'M', '30', 0, 'asdf11@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(12, 'asdf12', 'asdf12', 'asdf12', 'F', '31', 0, 'asdf12@a.com',3);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(13, 'asdf13', 'asdf13', 'asdf13', 'M', '32', 0, 'asdf13@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(14, 'asdf14', 'asdf14', 'asdf14', 'F', '33', 0, 'asdf14@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(15, 'asdf15', 'asdf15', 'asdf15', 'M', '34', 0, 'asdf15@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(16, 'asdf16', 'asdf16', 'asdf16', 'F', '35', 0, 'asdf16@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(17, 'asdf17', 'asdf17', 'asdf17', 'M', '36', 0, 'asdf17@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(18, 'asdf18', 'asdf18', 'asdf18', 'F', '37', 0, 'asdf18@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(19, 'asdf19', 'asdf19', 'asdf19', 'M', '38', 0, 'asdf19@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(20, 'asdf20', 'asdf20', 'asdf20', 'F', '39', 0, 'asdf20@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(21, 'asdf21', 'asdf21', 'asdf21', 'M', '40', 0, 'asdf21@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(22, 'asdf22', 'asdf22', 'asdf22', 'F', '41', 0, 'asdf22@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(23, 'asdf23', 'asdf23', 'asdf23', 'M', '42', 0, 'asdf23@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(24, 'asdf24', 'asdf24', 'asdf24', 'F', '43', 0, 'asdf24@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(25, 'asdf25', 'asdf25', 'asdf25', 'M', '44', 0, 'asdf25@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(26, 'asdf26', 'asdf26', 'asdf26', 'F', '45', 0, 'asdf26@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(27, 'asdf27', 'asdf27', 'asdf27', 'M', '46', 0, 'asdf27@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(28, 'asdf28', 'asdf28', 'asdf28', 'F', '47', 0, 'asdf28@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(29, 'asdf29', 'asdf29', 'asdf29', 'M', '48', 0, 'asdf29@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(30, 'asdf30', 'asdf30', 'asdf30', 'F', '49', 0, 'asdf30@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(31, 'asdf31', 'asdf31', 'asdf31', 'M', '50', 0, 'asdf31@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(32, 'asdf32', 'asdf32', 'asdf32', 'F', '51', 0, 'asdf32@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(33, 'asdf33', 'asdf33', 'asdf33', 'M', '52', 0, 'asdf33@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(34, 'asdf34', 'asdf34', 'asdf34', 'F', '53', 0, 'asdf34@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(35, 'asdf35', 'asdf35', 'asdf35', 'M', '54', 0, 'asdf35@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(36, 'asdf36', 'asdf36', 'asdf36', 'F', '55', 0, 'asdf36@a.com',3);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(37, 'asdf37', 'asdf37', 'asdf37', 'M', '56', 0, 'asdf37@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(38, 'asdf38', 'asdf38', 'asdf38', 'F', '57', 0, 'asdf38@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(39, 'asdf39', 'asdf39', 'asdf39', 'M', '58', 0, 'asdf39@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(40, 'asdf40', 'asdf40', 'asdf40', 'F', '59', 0, 'asdf40@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(41, 'asdf41', 'asdf41', 'asdf41', 'M', '60', 0, 'asdf41@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(42, 'asdf42', 'asdf42', 'asdf42', 'F', '61', 0, 'asdf42@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(43, 'asdf43', 'asdf43', 'asdf43', 'M', '62', 0, 'asdf43@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(44, 'asdf44', 'asdf44', 'asdf44', 'F', '63', 0, 'asdf44@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(45, 'asdf45', 'asdf45', 'asdf45', 'M', '64', 0, 'asdf45@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(46, 'asdf46', 'asdf46', 'asdf46', 'F', '65', 0, 'asdf46@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(47, 'asdf47', 'asdf47', 'asdf47', 'M', '66', 0, 'asdf47@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(48, 'asdf48', 'asdf48', 'asdf48', 'F', '67', 0, 'asdf48@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(49, 'asdf49', 'asdf49', 'asdf49', 'M', '68', 0, 'asdf49@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(50, 'asdf50', 'asdf50', 'asdf50', 'F', '69', 0, 'asdf50@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(51, 'asdf51', 'asdf51', 'asdf51', 'M', '70', 0, 'asdf51@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(52, 'asdf52', 'asdf52', 'asdf52', 'F', '71', 0, 'asdf52@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(53, 'asdf53', 'asdf53', 'asdf53', 'M', '72', 0, 'asdf53@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(54, 'asdf54', 'asdf54', 'asdf54', 'F', '73', 0, 'asdf54@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(55, 'asdf55', 'asdf55', 'asdf55', 'M', '74', 0, 'asdf55@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(56, 'asdf56', 'asdf56', 'asdf56', 'F', '75', 0, 'asdf56@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(57, 'asdf57', 'asdf57', 'asdf57', 'M', '75', 0, 'asdf57@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(58, 'asdf58', 'asdf58', 'asdf58', 'F', '20', 0, 'asdf58@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(59, 'asdf59', 'asdf59', 'asdf59', 'M', '21', 0, 'asdf59@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(60, 'asdf60', 'asdf60', 'asdf60', 'F', '22', 0, 'asdf60@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(61, 'asdf61', 'asdf61', 'asdf61', 'M', '23', 0, 'asdf61@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(62, 'asdf62', 'asdf62', 'asdf62', 'F', '24', 0, 'asdf62@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(63, 'asdf63', 'asdf63', 'asdf63', 'M', '25', 0, 'asdf63@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(64, 'asdf64', 'asdf64', 'asdf64', 'F', '26', 0, 'asdf64@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(65, 'asdf65', 'asdf65', 'asdf65', 'M', '27', 0, 'asdf65@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(66, 'asdf66', 'asdf66', 'asdf66', 'F', '28', 0, 'asdf66@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(67, 'asdf67', 'asdf67', 'asdf67', 'M', '29', 0, 'asdf67@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(68, 'asdf68', 'asdf68', 'asdf68', 'F', '30', 0, 'asdf68@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(69, 'asdf69', 'asdf69', 'asdf69', 'M', '31', 0, 'asdf69@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(70, 'asdf70', 'asdf70', 'asdf70', 'F', '32', 0, 'asdf70@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(71, 'asdf71', 'asdf71', 'asdf71', 'M', '33', 0, 'asdf71@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(72, 'asdf72', 'asdf72', 'asdf72', 'F', '34', 0, 'asdf72@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(73, 'asdf73', 'asdf73', 'asdf73', 'M', '35', 0, 'asdf73@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(74, 'asdf74', 'asdf74', 'asdf74', 'F', '36', 0, 'asdf74@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(75, 'asdf75', 'asdf75', 'asdf75', 'M', '37', 0, 'asdf75@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(76, 'asdf76', 'asdf76', 'asdf76', 'F', '38', 0, 'asdf76@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(77, 'asdf77', 'asdf77', 'asdf77', 'M', '39', 0, 'asdf77@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(78, 'asdf78', 'asdf78', 'asdf78', 'F', '40', 0, 'asdf78@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(79, 'asdf79', 'asdf79', 'asdf79', 'M', '41', 0, 'asdf79@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(80, 'asdf80', 'asdf80', 'asdf80', 'F', '42', 0, 'asdf80@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(81, 'asdf81', 'asdf81', 'asdf81', 'M', '43', 0, 'asdf81@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(82, 'asdf82', 'asdf82', 'asdf82', 'F', '44', 0, 'asdf82@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(83, 'asdf83', 'asdf83', 'asdf83', 'M', '45', 0, 'asdf83@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(84, 'asdf84', 'asdf84', 'asdf84', 'F', '46', 0, 'asdf84@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(85, 'asdf85', 'asdf85', 'asdf85', 'M', '47', 0, 'asdf85@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(86, 'asdf86', 'asdf86', 'asdf86', 'F', '48', 0, 'asdf86@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(87, 'asdf87', 'asdf87', 'asdf87', 'M', '49', 0, 'asdf87@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(88, 'asdf88', 'asdf88', 'asdf88', 'F', '50', 0, 'asdf88@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(89, 'asdf89', 'asdf89', 'asdf89', 'M', '51', 0, 'asdf89@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(90, 'asdf90', 'asdf90', 'asdf90', 'F', '52', 0, 'asdf90@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(91, 'asdf91', 'asdf91', 'asdf91', 'M', '53', 0, 'asdf91@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(92, 'asdf92', 'asdf92', 'asdf92', 'F', '54', 0, 'asdf92@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(93, 'asdf93', 'asdf93', 'asdf93', 'M', '55', 0, 'asdf93@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(94, 'asdf94', 'asdf94', 'asdf94', 'F', '56', 0, 'asdf94@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(95, 'asdf95', 'asdf95', 'asdf95', 'M', '57', 0, 'asdf95@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(96, 'asdf96', 'asdf96', 'asdf96', 'F', '58', 0, 'asdf96@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(97, 'asdf97', 'asdf97', 'asdf97', 'M', '59', 0, 'asdf97@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(98, 'asdf98', 'asdf98', 'asdf98', 'F', '60', 0, 'asdf98@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(99, 'asdf99', 'asdf99', 'asdf99', 'M', '61', 0, 'asdf99@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(100, 'asdf100', 'asdf100', 'asdf100', 'F', '62', 0, 'asdf100@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(101, 'asdf101', 'asdf101', 'asdf101', 'M', '63', 0, 'asdf101@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(102, 'asdf102', 'asdf102', 'asdf102', 'F', '64', 0, 'asdf102@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(103, 'asdf103', 'asdf103', 'asdf103', 'M', '65', 0, 'asdf103@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(104, 'asdf104', 'asdf104', 'asdf104', 'F', '66', 0, 'asdf104@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(105, 'asdf105', 'asdf105', 'asdf105', 'M', '67', 0, 'asdf105@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(106, 'asdf106', 'asdf106', 'asdf106', 'F', '68', 0, 'asdf106@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(107, 'asdf107', 'asdf107', 'asdf107', 'M', '69', 0, 'asdf107@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(108, 'asdf108', 'asdf108', 'asdf108', 'F', '70', 0, 'asdf108@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(109, 'asdf109', 'asdf109', 'asdf109', 'M', '71', 0, 'asdf109@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(110, 'asdf110', 'asdf110', 'asdf110', 'F', '72', 0, 'asdf110@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(111, 'asdf111', 'asdf111', 'asdf111', 'M', '73', 0, 'asdf111@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(112, 'asdf112', 'asdf112', 'asdf112', 'F', '20', 0, 'asdf112@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(113, 'asdf113', 'asdf113', 'asdf113', 'M', '21', 0, 'asdf113@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(114, 'asdf114', 'asdf114', 'asdf114', 'F', '22', 0, 'asdf114@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(115, 'asdf115', 'asdf115', 'asdf115', 'M', '23', 0, 'asdf115@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(116, 'asdf116', 'asdf116', 'asdf116', 'F', '24', 0, 'asdf116@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(117, 'asdf117', 'asdf117', 'asdf117', 'M', '25', 0, 'asdf117@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(118, 'asdf118', 'asdf118', 'asdf118', 'F', '26', 0, 'asdf118@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(119, 'asdf119', 'asdf119', 'asdf119', 'M', '27', 0, 'asdf119@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(120, 'asdf120', 'asdf120', 'asdf120', 'F', '28', 0, 'asdf120@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(121, 'asdf121', 'asdf121', 'asdf121', 'M', '29', 0, 'asdf121@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(122, 'asdf122', 'asdf122', 'asdf122', 'F', '30', 0, 'asdf122@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(123, 'asdf123', 'asdf123', 'asdf123', 'M', '31', 0, 'asdf123@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(124, 'asdf124', 'asdf124', 'asdf124', 'F', '32', 0, 'asdf124@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(125, 'asdf125', 'asdf125', 'asdf125', 'M', '33', 0, 'asdf125@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(126, 'asdf126', 'asdf126', 'asdf126', 'F', '34', 0, 'asdf126@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(127, 'asdf127', 'asdf127', 'asdf127', 'M', '35', 0, 'asdf127@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(128, 'asdf128', 'asdf128', 'asdf128', 'F', '36', 0, 'asdf128@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(129, 'asdf129', 'asdf129', 'asdf129', 'M', '37', 0, 'asdf129@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(130, 'asdf130', 'asdf130', 'asdf130', 'F', '38', 0, 'asdf130@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(131, 'asdf131', 'asdf131', 'asdf131', 'M', '39', 0, 'asdf131@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(132, 'asdf132', 'asdf132', 'asdf132', 'F', '40', 0, 'asdf132@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(133, 'asdf133', 'asdf133', 'asdf133', 'M', '41', 0, 'asdf133@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(134, 'asdf134', 'asdf134', 'asdf134', 'F', '42', 0, 'asdf134@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(135, 'asdf135', 'asdf135', 'asdf135', 'M', '43', 0, 'asdf135@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(136, 'asdf136', 'asdf136', 'asdf136', 'F', '44', 0, 'asdf136@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(137, 'asdf137', 'asdf137', 'asdf137', 'M', '45', 0, 'asdf137@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(138, 'asdf138', 'asdf138', 'asdf138', 'F', '46', 0, 'asdf138@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(139, 'asdf139', 'asdf139', 'asdf139', 'M', '47', 0, 'asdf139@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(140, 'asdf140', 'asdf140', 'asdf140', 'F', '48', 0, 'asdf140@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(141, 'asdf141', 'asdf141', 'asdf141', 'M', '49', 0, 'asdf141@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(142, 'asdf142', 'asdf142', 'asdf142', 'F', '50', 0, 'asdf142@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(143, 'asdf143', 'asdf143', 'asdf143', 'M', '51', 0, 'asdf143@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(144, 'asdf144', 'asdf144', 'asdf144', 'F', '52', 0, 'asdf144@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(145, 'asdf145', 'asdf145', 'asdf145', 'M', '53', 0, 'asdf145@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(146, 'asdf146', 'asdf146', 'asdf146', 'F', '54', 0, 'asdf146@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(147, 'asdf147', 'asdf147', 'asdf147', 'M', '55', 0, 'asdf147@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(148, 'asdf148', 'asdf148', 'asdf148', 'F', '56', 0, 'asdf148@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(149, 'asdf149', 'asdf149', 'asdf149', 'M', '57', 0, 'asdf149@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(150, 'asdf150', 'asdf150', 'asdf150', 'F', '58', 0, 'asdf150@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(151, 'asdf151', 'asdf151', 'asdf151', 'M', '59', 0, 'asdf151@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(152, 'asdf152', 'asdf152', 'asdf152', 'F', '60', 0, 'asdf152@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(153, 'asdf153', 'asdf153', 'asdf153', 'M', '61', 0, 'asdf153@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(154, 'asdf154', 'asdf154', 'asdf154', 'F', '62', 0, 'asdf154@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(155, 'asdf155', 'asdf155', 'asdf155', 'M', '63', 0, 'asdf155@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(156, 'asdf156', 'asdf156', 'asdf156', 'F', '64', 0, 'asdf156@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(157, 'asdf157', 'asdf157', 'asdf157', 'M', '65', 0, 'asdf157@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(158, 'asdf158', 'asdf158', 'asdf158', 'F', '66', 0, 'asdf158@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(159, 'asdf159', 'asdf159', 'asdf159', 'M', '67', 0, 'asdf159@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(160, 'asdf160', 'asdf160', 'asdf160', 'F', '68', 0, 'asdf160@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(161, 'asdf161', 'asdf161', 'asdf161', 'M', '69', 0, 'asdf161@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(162, 'asdf162', 'asdf162', 'asdf162', 'F', '70', 0, 'asdf162@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(163, 'asdf163', 'asdf163', 'asdf163', 'M', '71', 0, 'asdf163@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(164, 'asdf164', 'asdf164', 'asdf164', 'F', '72', 0, 'asdf164@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(165, 'asdf165', 'asdf165', 'asdf165', 'M', '73', 0, 'asdf165@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(166, 'asdf166', 'asdf166', 'asdf166', 'F', '74', 0, 'asdf166@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(167, 'asdf167', 'asdf167', 'asdf167', 'M', '75', 0, 'asdf167@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(168, 'asdf168', 'asdf168', 'asdf168', 'F', '76', 0, 'asdf168@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(169, 'asdf169', 'asdf169', 'asdf169', 'M', '77', 0, 'asdf169@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(170, 'asdf170', 'asdf170', 'asdf170', 'F', '78', 0, 'asdf170@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(171, 'asdf171', 'asdf171', 'asdf171', 'M', '79', 0, 'asdf171@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(172, 'asdf172', 'asdf172', 'asdf172', 'F', '80', 0, 'asdf172@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(173, 'asdf173', 'asdf173', 'asdf173', 'M', '81', 0, 'asdf173@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(174, 'asdf174', 'asdf174', 'asdf174', 'F', '82', 0, 'asdf174@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(175, 'asdf175', 'asdf175', 'asdf175', 'M', '83', 0, 'asdf175@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(176, 'asdf176', 'asdf176', 'asdf176', 'F', '20', 0, 'asdf176@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(177, 'asdf177', 'asdf177', 'asdf177', 'M', '21', 0, 'asdf177@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(178, 'asdf178', 'asdf178', 'asdf178', 'F', '22', 0, 'asdf178@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(179, 'asdf179', 'asdf179', 'asdf179', 'M', '23', 0, 'asdf179@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(180, 'asdf180', 'asdf180', 'asdf180', 'F', '24', 0, 'asdf180@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(181, 'asdf181', 'asdf181', 'asdf181', 'M', '25', 0, 'asdf181@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(182, 'asdf182', 'asdf182', 'asdf182', 'F', '26', 0, 'asdf182@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(183, 'asdf183', 'asdf183', 'asdf183', 'M', '27', 0, 'asdf183@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(184, 'asdf184', 'asdf184', 'asdf184', 'F', '28', 0, 'asdf184@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(185, 'asdf185', 'asdf185', 'asdf185', 'M', '29', 0, 'asdf185@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(186, 'asdf186', 'asdf186', 'asdf186', 'F', '30', 0, 'asdf186@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(187, 'asdf187', 'asdf187', 'asdf187', 'M', '31', 0, 'asdf187@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(188, 'asdf188', 'asdf188', 'asdf188', 'F', '32', 0, 'asdf188@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(189, 'asdf189', 'asdf189', 'asdf189', 'M', '33', 0, 'asdf189@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(190, 'asdf190', 'asdf190', 'asdf190', 'F', '34', 0, 'asdf190@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(191, 'asdf191', 'asdf191', 'asdf191', 'M', '35', 0, 'asdf191@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(192, 'asdf192', 'asdf192', 'asdf192', 'F', '36', 0, 'asdf192@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(193, 'asdf193', 'asdf193', 'asdf193', 'M', '37', 0, 'asdf193@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(194, 'asdf194', 'asdf194', 'asdf194', 'F', '38', 0, 'asdf194@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(195, 'asdf195', 'asdf195', 'asdf195', 'M', '39', 0, 'asdf195@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(196, 'asdf196', 'asdf196', 'asdf196', 'F', '40', 0, 'asdf196@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(197, 'asdf197', 'asdf197', 'asdf197', 'M', '41', 0, 'asdf197@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(198, 'asdf198', 'asdf198', 'asdf198', 'F', '42', 0, 'asdf198@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(199, 'asdf199', 'asdf199', 'asdf199', 'M', '43', 0, 'asdf199@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(200, 'asdf200', 'asdf200', 'asdf200', 'F', '44', 0, 'asdf200@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(201, 'asdf201', 'asdf201', 'asdf201', 'M', '45', 0, 'asdf201@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(202, 'asdf202', 'asdf202', 'asdf202', 'F', '46', 0, 'asdf202@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(203, 'asdf203', 'asdf203', 'asdf203', 'M', '47', 0, 'asdf203@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(204, 'asdf204', 'asdf204', 'asdf204', 'F', '48', 0, 'asdf204@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(205, 'asdf205', 'asdf205', 'asdf205', 'M', '49', 0, 'asdf205@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(206, 'asdf206', 'asdf206', 'asdf206', 'F', '50', 0, 'asdf206@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(207, 'asdf207', 'asdf207', 'asdf207', 'M', '20', 0, 'asdf207@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(208, 'asdf208', 'asdf208', 'asdf208', 'F', '21', 0, 'asdf208@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(209, 'asdf209', 'asdf209', 'asdf209', 'M', '22', 0, 'asdf209@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(210, 'asdf210', 'asdf210', 'asdf210', 'F', '23', 0, 'asdf210@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(211, 'asdf211', 'asdf211', 'asdf211', 'M', '24', 0, 'asdf211@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(212, 'asdf212', 'asdf212', 'asdf212', 'F', '25', 0, 'asdf212@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(213, 'asdf213', 'asdf213', 'asdf213', 'M', '26', 0, 'asdf213@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(214, 'asdf214', 'asdf214', 'asdf214', 'F', '27', 0, 'asdf214@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(215, 'asdf215', 'asdf215', 'asdf215', 'M', '28', 0, 'asdf215@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(216, 'asdf216', 'asdf216', 'asdf216', 'F', '29', 0, 'asdf216@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(217, 'asdf217', 'asdf217', 'asdf217', 'M', '30', 0, 'asdf217@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(218, 'asdf218', 'asdf218', 'asdf218', 'F', '31', 0, 'asdf218@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(219, 'asdf219', 'asdf219', 'asdf219', 'M', '32', 0, 'asdf219@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(220, 'asdf220', 'asdf220', 'asdf220', 'F', '33', 0, 'asdf220@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(221, 'asdf221', 'asdf221', 'asdf221', 'M', '34', 0, 'asdf221@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(222, 'asdf222', 'asdf222', 'asdf222', 'F', '35', 0, 'asdf222@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(223, 'asdf223', 'asdf223', 'asdf223', 'M', '36', 0, 'asdf223@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(224, 'asdf224', 'asdf224', 'asdf224', 'F', '37', 0, 'asdf224@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(225, 'asdf225', 'asdf225', 'asdf225', 'M', '38', 0, 'asdf225@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(226, 'asdf226', 'asdf226', 'asdf226', 'F', '39', 0, 'asdf226@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(227, 'asdf227', 'asdf227', 'asdf227', 'M', '40', 0, 'asdf227@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(228, 'asdf228', 'asdf228', 'asdf228', 'F', '41', 0, 'asdf228@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(229, 'asdf229', 'asdf229', 'asdf229', 'M', '42', 0, 'asdf229@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(230, 'asdf230', 'asdf230', 'asdf230', 'F', '43', 0, 'asdf230@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(231, 'asdf231', 'asdf231', 'asdf231', 'M', '44', 0, 'asdf231@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(232, 'asdf232', 'asdf232', 'asdf232', 'F', '45', 0, 'asdf232@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(233, 'asdf233', 'asdf233', 'asdf233', 'M', '46', 0, 'asdf233@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(234, 'asdf234', 'asdf234', 'asdf234', 'F', '47', 0, 'asdf234@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(235, 'asdf235', 'asdf235', 'asdf235', 'M', '48', 0, 'asdf235@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(236, 'asdf236', 'asdf236', 'asdf236', 'F', '49', 0, 'asdf236@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(237, 'asdf237', 'asdf237', 'asdf237', 'M', '50', 0, 'asdf237@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(238, 'asdf238', 'asdf238', 'asdf238', 'F', '20', 0, 'asdf238@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(239, 'asdf239', 'asdf239', 'asdf239', 'M', '21', 0, 'asdf239@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(240, 'asdf240', 'asdf240', 'asdf240', 'F', '22', 0, 'asdf240@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(241, 'asdf241', 'asdf241', 'asdf241', 'M', '23', 0, 'asdf241@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(242, 'asdf242', 'asdf242', 'asdf242', 'F', '24', 0, 'asdf242@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(243, 'asdf243', 'asdf243', 'asdf243', 'M', '25', 0, 'asdf243@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(244, 'asdf244', 'asdf244', 'asdf244', 'F', '26', 0, 'asdf244@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(245, 'asdf245', 'asdf245', 'asdf245', 'M', '27', 0, 'asdf245@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(246, 'asdf246', 'asdf246', 'asdf246', 'F', '28', 0, 'asdf246@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(247, 'asdf247', 'asdf247', 'asdf247', 'M', '29', 0, 'asdf247@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(248, 'asdf248', 'asdf248', 'asdf248', 'F', '30', 0, 'asdf248@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(249, 'asdf249', 'asdf249', 'asdf249', 'M', '31', 0, 'asdf249@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(250, 'asdf250', 'asdf250', 'asdf250', 'F', '32', 0, 'asdf250@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(251, 'asdf251', 'asdf251', 'asdf251', 'M', '33', 0, 'asdf251@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(252, 'asdf252', 'asdf252', 'asdf252', 'F', '34', 0, 'asdf252@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(253, 'asdf253', 'asdf253', 'asdf253', 'M', '35', 0, 'asdf253@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(254, 'asdf254', 'asdf254', 'asdf254', 'F', '36', 0, 'asdf254@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(255, 'asdf255', 'asdf255', 'asdf255', 'M', '37', 0, 'asdf255@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(256, 'asdf256', 'asdf256', 'asdf256', 'F', '38', 0, 'asdf256@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(257, 'asdf257', 'asdf257', 'asdf257', 'M', '39', 0, 'asdf257@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(258, 'asdf258', 'asdf258', 'asdf258', 'F', '40', 0, 'asdf258@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(259, 'asdf259', 'asdf259', 'asdf259', 'M', '41', 0, 'asdf259@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(260, 'asdf260', 'asdf260', 'asdf260', 'F', '42', 0, 'asdf260@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(261, 'asdf261', 'asdf261', 'asdf261', 'M', '43', 0, 'asdf261@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(262, 'asdf262', 'asdf262', 'asdf262', 'F', '44', 0, 'asdf262@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(263, 'asdf263', 'asdf263', 'asdf263', 'M', '45', 0, 'asdf263@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(264, 'asdf264', 'asdf264', 'asdf264', 'F', '46', 0, 'asdf264@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(265, 'asdf265', 'asdf265', 'asdf265', 'M', '47', 0, 'asdf265@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(266, 'asdf266', 'asdf266', 'asdf266', 'F', '48', 0, 'asdf266@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(267, 'asdf267', 'asdf267', 'asdf267', 'M', '49', 0, 'asdf267@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(268, 'asdf268', 'asdf268', 'asdf268', 'F', '50', 0, 'asdf268@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(269, 'asdf269', 'asdf269', 'asdf269', 'M', '20', 0, 'asdf269@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(270, 'asdf270', 'asdf270', 'asdf270', 'F', '21', 0, 'asdf270@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(271, 'asdf271', 'asdf271', 'asdf271', 'M', '22', 0, 'asdf271@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(272, 'asdf272', 'asdf272', 'asdf272', 'F', '23', 0, 'asdf272@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(273, 'asdf273', 'asdf273', 'asdf273', 'M', '24', 0, 'asdf273@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(274, 'asdf274', 'asdf274', 'asdf274', 'F', '25', 0, 'asdf274@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(275, 'asdf275', 'asdf275', 'asdf275', 'M', '26', 0, 'asdf275@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(276, 'asdf276', 'asdf276', 'asdf276', 'F', '27', 0, 'asdf276@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(277, 'asdf277', 'asdf277', 'asdf277', 'M', '28', 0, 'asdf277@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(278, 'asdf278', 'asdf278', 'asdf278', 'F', '29', 0, 'asdf278@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(279, 'asdf279', 'asdf279', 'asdf279', 'M', '30', 0, 'asdf279@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(280, 'asdf280', 'asdf280', 'asdf280', 'F', '31', 0, 'asdf280@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(281, 'asdf281', 'asdf281', 'asdf281', 'M', '32', 0, 'asdf281@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(282, 'asdf282', 'asdf282', 'asdf282', 'F', '33', 0, 'asdf282@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(283, 'asdf283', 'asdf283', 'asdf283', 'M', '34', 0, 'asdf283@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(284, 'asdf284', 'asdf284', 'asdf284', 'F', '35', 0, 'asdf284@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(285, 'asdf285', 'asdf285', 'asdf285', 'M', '36', 0, 'asdf285@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(286, 'asdf286', 'asdf286', 'asdf286', 'F', '37', 0, 'asdf286@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(287, 'asdf287', 'asdf287', 'asdf287', 'M', '38', 0, 'asdf287@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(288, 'asdf288', 'asdf288', 'asdf288', 'F', '39', 0, 'asdf288@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(289, 'asdf289', 'asdf289', 'asdf289', 'M', '40', 0, 'asdf289@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(290, 'asdf290', 'asdf290', 'asdf290', 'F', '41', 0, 'asdf290@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(291, 'asdf291', 'asdf291', 'asdf291', 'M', '42', 0, 'asdf291@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(292, 'asdf292', 'asdf292', 'asdf292', 'F', '43', 0, 'asdf292@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(293, 'asdf293', 'asdf293', 'asdf293', 'M', '44', 0, 'asdf293@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(294, 'asdf294', 'asdf294', 'asdf294', 'F', '45', 0, 'asdf294@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(295, 'asdf295', 'asdf295', 'asdf295', 'M', '46', 0, 'asdf295@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(296, 'asdf296', 'asdf296', 'asdf296', 'F', '47', 0, 'asdf296@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(297, 'asdf297', 'asdf297', 'asdf297', 'M', '48', 0, 'asdf297@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(298, 'asdf298', 'asdf298', 'asdf298', 'F', '49', 0, 'asdf298@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(299, 'asdf299', 'asdf299', 'asdf299', 'M', '50', 0, 'asdf299@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(300, 'asdf300', 'asdf300', 'asdf300', 'F', '20', 0, 'asdf300@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(301, 'asdf301', 'asdf301', 'asdf301', 'M', '21', 0, 'asdf301@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(302, 'asdf302', 'asdf302', 'asdf302', 'F', '22', 0, 'asdf302@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(303, 'asdf303', 'asdf303', 'asdf303', 'M', '23', 0, 'asdf303@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(304, 'asdf304', 'asdf304', 'asdf304', 'F', '24', 0, 'asdf304@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(305, 'asdf305', 'asdf305', 'asdf305', 'M', '25', 0, 'asdf305@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(306, 'asdf306', 'asdf306', 'asdf306', 'F', '26', 0, 'asdf306@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(307, 'asdf307', 'asdf307', 'asdf307', 'M', '27', 0, 'asdf307@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(308, 'asdf308', 'asdf308', 'asdf308', 'F', '28', 0, 'asdf308@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(309, 'asdf309', 'asdf309', 'asdf309', 'M', '29', 0, 'asdf309@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(310, 'asdf310', 'asdf310', 'asdf310', 'F', '30', 0, 'asdf310@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(311, 'asdf311', 'asdf311', 'asdf311', 'M', '31', 0, 'asdf311@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(312, 'asdf312', 'asdf312', 'asdf312', 'F', '32', 0, 'asdf312@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(313, 'asdf313', 'asdf313', 'asdf313', 'M', '33', 0, 'asdf313@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(314, 'asdf314', 'asdf314', 'asdf314', 'F', '34', 0, 'asdf314@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(315, 'asdf315', 'asdf315', 'asdf315', 'M', '35', 0, 'asdf315@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(316, 'asdf316', 'asdf316', 'asdf316', 'F', '36', 0, 'asdf316@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(317, 'asdf317', 'asdf317', 'asdf317', 'M', '37', 0, 'asdf317@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(318, 'asdf318', 'asdf318', 'asdf318', 'F', '38', 0, 'asdf318@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(319, 'asdf319', 'asdf319', 'asdf319', 'M', '39', 0, 'asdf319@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(320, 'asdf320', 'asdf320', 'asdf320', 'F', '40', 0, 'asdf320@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(321, 'asdf321', 'asdf321', 'asdf321', 'M', '41', 0, 'asdf321@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(322, 'asdf322', 'asdf322', 'asdf322', 'F', '42', 0, 'asdf322@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(323, 'asdf323', 'asdf323', 'asdf323', 'M', '43', 0, 'asdf323@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(324, 'asdf324', 'asdf324', 'asdf324', 'F', '44', 0, 'asdf324@a.com',1);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(325, 'asdf325', 'asdf325', 'asdf325', 'M', '45', 0, 'asdf325@a.com',2);
insert into tb_user2(user_no, user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values(326, 'asdf326', 'asdf326', 'asdf326', 'F', '46', 0, 'asdf326@a.com',1);




SELECT * FROM TB_USER2;


--신고 테이블
select * from tb_userreport2
order by user_no asc;

insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(2, sysdate + (1/24/60/60)*20, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(3, sysdate + (1/24/60/60)*21, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(3, sysdate + (1/24/60/60)*22, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(4, sysdate + (1/24/60/60)*23, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(4, sysdate + (1/24/60/60)*24, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(4, sysdate + (1/24/60/60)*25, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(6, sysdate + (1/24/60/60)*26, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(7, sysdate + (1/24/60/60)*27, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(7, sysdate + (1/24/60/60)*28, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(8, sysdate + (1/24/60/60)*29, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(8, sysdate + (1/24/60/60)*30, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(8, sysdate + (1/24/60/60)*31, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(10, sysdate + (1/24/60/60)*32, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(11, sysdate + (1/24/60/60)*33, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(11, sysdate + (1/24/60/60)*34, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(12, sysdate + (1/24/60/60)*35, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(12, sysdate + (1/24/60/60)*36, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(12, sysdate + (1/24/60/60)*37, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(14, sysdate + (1/24/60/60)*38, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(15, sysdate + (1/24/60/60)*39, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(15, sysdate + (1/24/60/60)*40, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(16, sysdate + (1/24/60/60)*41, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(16, sysdate + (1/24/60/60)*42, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(16, sysdate + (1/24/60/60)*43, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(16, sysdate + (1/24/60/60)*44, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(17, sysdate + (1/24/60/60)*45, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(18, sysdate + (1/24/60/60)*46, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(19, sysdate + (1/24/60/60)*47, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(20, sysdate + (1/24/60/60)*48, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(21, sysdate + (1/24/60/60)*49, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(22, sysdate + (1/24/60/60)*50, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(23, sysdate + (1/24/60/60)*51, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(24, sysdate + (1/24/60/60)*52, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(25, sysdate + (1/24/60/60)*53, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(26, sysdate + (1/24/60/60)*54, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(27, sysdate + (1/24/60/60)*55, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(28, sysdate + (1/24/60/60)*56, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(29, sysdate + (1/24/60/60)*57, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(30, sysdate + (1/24/60/60)*58, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(31, sysdate + (1/24/60/60)*59, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(32, sysdate + (1/24/60/60)*60, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(33, sysdate + (1/24/60/60)*61, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(34, sysdate + (1/24/60/60)*62, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(35, sysdate + (1/24/60/60)*63, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(36, sysdate + (1/24/60/60)*64, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(37, sysdate + (1/24/60/60)*65, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(38, sysdate + (1/24/60/60)*66, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(39, sysdate + (1/24/60/60)*67, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(40, sysdate + (1/24/60/60)*68, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(41, sysdate + (1/24/60/60)*69, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(42, sysdate + (1/24/60/60)*70, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(43, sysdate + (1/24/60/60)*71, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(44, sysdate + (1/24/60/60)*72, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(45, sysdate + (1/24/60/60)*73, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(46, sysdate + (1/24/60/60)*74, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(47, sysdate + (1/24/60/60)*75, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(48, sysdate + (1/24/60/60)*76, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(49, sysdate + (1/24/60/60)*77, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(50, sysdate + (1/24/60/60)*78, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(51, sysdate + (1/24/60/60)*79, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(52, sysdate + (1/24/60/60)*80, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(53, sysdate + (1/24/60/60)*81, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(54, sysdate + (1/24/60/60)*82, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(55, sysdate + (1/24/60/60)*83, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(56, sysdate + (1/24/60/60)*84, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(57, sysdate + (1/24/60/60)*85, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(58, sysdate + (1/24/60/60)*86, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(59, sysdate + (1/24/60/60)*87, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(60, sysdate + (1/24/60/60)*88, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(61, sysdate + (1/24/60/60)*89, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(62, sysdate + (1/24/60/60)*90, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(63, sysdate + (1/24/60/60)*91, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(64, sysdate + (1/24/60/60)*92, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(65, sysdate + (1/24/60/60)*93, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(66, sysdate + (1/24/60/60)*94, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(67, sysdate + (1/24/60/60)*95, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(68, sysdate + (1/24/60/60)*96, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(69, sysdate + (1/24/60/60)*97, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(70, sysdate + (1/24/60/60)*98, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(71, sysdate + (1/24/60/60)*99, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(72, sysdate + (1/24/60/60)*100, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(73, sysdate + (1/24/60/60)*101, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(74, sysdate + (1/24/60/60)*102, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(75, sysdate + (1/24/60/60)*103, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(76, sysdate + (1/24/60/60)*104, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(77, sysdate + (1/24/60/60)*105, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(78, sysdate + (1/24/60/60)*106, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(79, sysdate + (1/24/60/60)*107, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(80, sysdate + (1/24/60/60)*108, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(81, sysdate + (1/24/60/60)*109, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(82, sysdate + (1/24/60/60)*110, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(83, sysdate + (1/24/60/60)*111, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(84, sysdate + (1/24/60/60)*112, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(85, sysdate + (1/24/60/60)*113, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(86, sysdate + (1/24/60/60)*114, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(87, sysdate + (1/24/60/60)*115, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(88, sysdate + (1/24/60/60)*116, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(89, sysdate + (1/24/60/60)*117, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(90, sysdate + (1/24/60/60)*118, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(91, sysdate + (1/24/60/60)*119, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(92, sysdate + (1/24/60/60)*120, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(93, sysdate + (1/24/60/60)*121, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(94, sysdate + (1/24/60/60)*122, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(95, sysdate + (1/24/60/60)*123, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(96, sysdate + (1/24/60/60)*124, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(97, sysdate + (1/24/60/60)*125, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(98, sysdate + (1/24/60/60)*126, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(99, sysdate + (1/24/60/60)*127, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(100, sysdate + (1/24/60/60)*128, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(101, sysdate + (1/24/60/60)*129, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(102, sysdate + (1/24/60/60)*130, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(103, sysdate + (1/24/60/60)*131, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(104, sysdate + (1/24/60/60)*132, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(105, sysdate + (1/24/60/60)*133, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(106, sysdate + (1/24/60/60)*134, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(107, sysdate + (1/24/60/60)*135, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(108, sysdate + (1/24/60/60)*136, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(109, sysdate + (1/24/60/60)*137, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(110, sysdate + (1/24/60/60)*138, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(111, sysdate + (1/24/60/60)*139, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(112, sysdate + (1/24/60/60)*140, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(113, sysdate + (1/24/60/60)*141, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(114, sysdate + (1/24/60/60)*142, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(115, sysdate + (1/24/60/60)*143, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(116, sysdate + (1/24/60/60)*144, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(117, sysdate + (1/24/60/60)*145, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(118, sysdate + (1/24/60/60)*146, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(119, sysdate + (1/24/60/60)*147, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(120, sysdate + (1/24/60/60)*148, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(121, sysdate + (1/24/60/60)*149, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(122, sysdate + (1/24/60/60)*150, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(123, sysdate + (1/24/60/60)*151, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(124, sysdate + (1/24/60/60)*152, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(125, sysdate + (1/24/60/60)*153, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(126, sysdate + (1/24/60/60)*154, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(127, sysdate + (1/24/60/60)*155, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(128, sysdate + (1/24/60/60)*156, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(129, sysdate + (1/24/60/60)*157, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(130, sysdate + (1/24/60/60)*158, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(131, sysdate + (1/24/60/60)*159, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(132, sysdate + (1/24/60/60)*160, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(133, sysdate + (1/24/60/60)*161, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(134, sysdate + (1/24/60/60)*162, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(135, sysdate + (1/24/60/60)*163, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(136, sysdate + (1/24/60/60)*164, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(137, sysdate + (1/24/60/60)*165, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(138, sysdate + (1/24/60/60)*166, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(139, sysdate + (1/24/60/60)*167, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(140, sysdate + (1/24/60/60)*168, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(141, sysdate + (1/24/60/60)*169, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(142, sysdate + (1/24/60/60)*170, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(143, sysdate + (1/24/60/60)*171, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(144, sysdate + (1/24/60/60)*172, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(145, sysdate + (1/24/60/60)*173, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(146, sysdate + (1/24/60/60)*174, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(147, sysdate + (1/24/60/60)*175, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(148, sysdate + (1/24/60/60)*176, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(149, sysdate + (1/24/60/60)*177, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(150, sysdate + (1/24/60/60)*178, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(151, sysdate + (1/24/60/60)*179, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(152, sysdate + (1/24/60/60)*180, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(153, sysdate + (1/24/60/60)*181, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(154, sysdate + (1/24/60/60)*182, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(155, sysdate + (1/24/60/60)*183, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(156, sysdate + (1/24/60/60)*184, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(157, sysdate + (1/24/60/60)*185, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(158, sysdate + (1/24/60/60)*186, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(159, sysdate + (1/24/60/60)*187, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(160, sysdate + (1/24/60/60)*188, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(161, sysdate + (1/24/60/60)*189, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(162, sysdate + (1/24/60/60)*190, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(163, sysdate + (1/24/60/60)*191, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(164, sysdate + (1/24/60/60)*192, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(165, sysdate + (1/24/60/60)*193, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(166, sysdate + (1/24/60/60)*194, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(167, sysdate + (1/24/60/60)*195, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(168, sysdate + (1/24/60/60)*196, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(169, sysdate + (1/24/60/60)*197, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(170, sysdate + (1/24/60/60)*198, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(171, sysdate + (1/24/60/60)*199, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(172, sysdate + (1/24/60/60)*200, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(173, sysdate + (1/24/60/60)*201, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(174, sysdate + (1/24/60/60)*202, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(175, sysdate + (1/24/60/60)*203, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(176, sysdate + (1/24/60/60)*204, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(177, sysdate + (1/24/60/60)*205, 1,null, 0);

insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(177, sysdate + (1/24/60/60)*205, 1, '', 0);

select * from tb_userreport2
order by report_time desc;

select * from tb_user2;

--신고처리 더미데이터
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(4, sysdate, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(8, sysdate, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(12, sysdate, 1);

select * from tb_resultreport2;
commit;


--게시글 더미데이터
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'국군의날에 삼겹살과함께할 파티구함',' 싹이 황금시대의 우리 싶이 것이다. 유소년에게서 갑 모래뿐일 얼마나 생의 찾아 품으며, 있으랴? 힘차게 보배를 영락과 이상 꾸며 피가 봄바람이다. 미인을 날카로우나 사는가 사막이다. 봄날의 착목한는 그들의 것은 것이다. 따뜻한 청춘의 있는 남는 구하기 용감하고 힘차게 튼튼하며, 봄바람이다. 피고 오아이스도 풀이 피다. 커다란 황금시대의 아름답고 눈에 우리 사람은 위하여, 이것이다. 보이는 뭇 우는 든 그러므로 설레는 그들의 약동하다. 그들은 얼음과 트고, 봄바람을 공자는 얼마나 싹이 생명을 피에 힘있다. 인류의 아니더면, 구하기 행복스럽고 이것이다.
청춘은 인생에 얼마나 같은 보이는 위하여서, 든 무엇을 날카로우나 듣는다. 이것이야말로 얼음에 끝까지 무한한 그림자는 천지는 그들을 칼이다. 황금시대를 할지니, 우리의 이상 크고 열락의 부패뿐이다. 든 설레는 품으며, 되는 청춘의 가치를 사막이다. 공자는 풀이 뜨거운지라, 인간이 풀밭에 곳이 자신과 운다. 고동을 곳이 위하여 그러므로 밝은 청춘의 사막이다. 창공에 그림자는 생명을 모래뿐일 풀이 그리하였는가? 살 것은 자신과 불어 보이는 관현악이며, 방황하였으며, 따뜻한 약동하다. 동산에는 싶이 기관과 심장은 대한 그들은 약동하다. 열락의 가슴에 무한한 사막이다.
행복스럽고 길지 그들에게 든 동산에는 위하여서, 사막이다. 현저하게 그들은 놀이 봄바람이다. 바이며, 맺어, 그것을 아름다우냐? 그림자는 인류의 수 풀이 그리하였는가? 얼음과 구하지 우리는 대한 위하여, 피가 커다란 대중을 간에 아니다. 어디 구하기 끝에 봄바람을 그리하였는가? 우리 굳세게 이는 살 사막이다. 물방아 이상의 끓는 들어 천하를 피다. 얼음이 것이다.보라, 이는 꽃 끓는다. 것은 온갖 같이, 것이다. 대중을 구하지 그것은 힘차게 말이다.', 3,'인천',88,
to_date('2020-4-24 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,171,to_date('2020-01-06 1200', 'YYYY-MM-DDHH24MI'));

INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'연휴에 닭갈비와파티하실 분',' 싹이 황금시대의 우리 싶이 것이다. 유소년에게서 갑 모래뿐일 얼마나 생의 찾아 품으며, 있으랴? 힘차게 보배를 영락과 이상 꾸며 피가 봄바람이다. 미인을 날카로우나 사는가 사막이다. 봄날의 착목한는 그들의 것은 것이다. 따뜻한 청춘의 있는 남는 구하기 용감하고 힘차게 튼튼하며, 봄바람이다. 피고 오아이스도 풀이 피다. 커다란 황금시대의 아름답고 눈에 우리 사람은 위하여, 이것이다. 보이는 뭇 우는 든 그러므로 설레는 그들의 약동하다. 그들은 얼음과 트고, 봄바람을 공자는 얼마나 싹이 생명을 피에 힘있다. 인류의 아니더면, 구하기 행복스럽고 이것이다.
청춘은 인생에 얼마나 같은 보이는 위하여서, 든 무엇을 날카로우나 듣는다. 이것이야말로 얼음에 끝까지 무한한 그림자는 천지는 그들을 칼이다. 황금시대를 할지니, 우리의 이상 크고 열락의 부패뿐이다. 든 설레는 품으며, 되는 청춘의 가치를 사막이다. 공자는 풀이 뜨거운지라, 인간이 풀밭에 곳이 자신과 운다. 고동을 곳이 위하여 그러므로 밝은 청춘의 사막이다. 창공에 그림자는 생명을 모래뿐일 풀이 그리하였는가? 살 것은 자신과 불어 보이는 관현악이며, 방황하였으며, 따뜻한 약동하다. 동산에는 싶이 기관과 심장은 대한 그들은 약동하다. 열락의 가슴에 무한한 사막이다.
행복스럽고 길지 그들에게 든 동산에는 위하여서, 사막이다. 현저하게 그들은 놀이 봄바람이다. 바이며, 맺어, 그것을 아름다우냐? 그림자는 인류의 수 풀이 그리하였는가? 얼음과 구하지 우리는 대한 위하여, 피가 커다란 대중을 간에 아니다. 어디 구하기 끝에 봄바람을 그리하였는가? 우리 굳세게 이는 살 사막이다. 물방아 이상의 끓는 들어 천하를 피다. 얼음이 것이다.보라, 이는 꽃 끓는다. 것은 온갖 같이, 것이다. 대중을 구하지 그것은 힘차게 말이다.', 3,'강원',236,
to_date('2020-4-8 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,11,to_date('2020-01-13 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'금요일에 킹크랩과파티를 즐기실 분',' 살 힘차게 스며들어 기관과 아니다. 청춘 이것은 곳이 듣는다. 얼마나 할지니, 천고에 평화스러운 새 없으면, 사랑의 열락의 가치를 이것이다. 그들의 것이 피가 유소년에게서 것이다. 불러 있는 그들의 보라. 있음으로써 용기가 인생의 새 설레는 없으면 대한 인간의 타오르고 교향악이다. 커다란 이상의 원질이 하는 거선의 우리 그것은 보배를 위하여서. 봄바람을 기관과 놀이 피어나기 물방아 아니다. 석가는 광야에서 우리 크고 칼이다.
것이다.보라, 그들의 뜨거운지라, 철환하였는가? 하는 뭇 이것은 인간은 뿐이다. 새가 청춘을 물방아 고행을 간에 소금이라 이상의 과실이 있다. 없으면, 것은 인류의 이상을 수 날카로우나 튼튼하며, 사막이다. 창공에 얼마나 사랑의 피다. 품었기 그와 하여도 용감하고 온갖 피가 오아이스도 것이 것이다. 때에, 있는 듣기만 가는 뭇 보이는 것이다. 그들의 품고 바로 기쁘며, 쓸쓸한 않는 것은 가슴이 봄바람이다. 이상, 구하기 못하다 있으랴?
기관과 그림자는 어디 인생을 그들은 황금시대다. 인류의 우리 주며, 있을 듣는다. 부패를 얼마나 창공에 발휘하기 가슴에 거선의 가슴이 것이다. 주는 눈이 같으며, 꽃 크고 사랑의 이것이다. 뛰노는 얼음에 밝은 바이며, 무엇이 인간의 넣는 끓는 있으랴? 얼음에 갑 밝은 없으면, 인생의 그들의 영원히 그리하였는가? 품에 꾸며 그들은 얼음 것이다. 기관과 천자만홍이 그와 커다란 하는 힘있다. 무엇을 인생의 눈이 그것을 천하를 있는가? 하여도 피고 싹이 위하여 온갖 속잎나고, 가슴에 살 것이다. 천지는 싸인 보이는 우는 위하여서 얼마나 있는 대한 교향악이다.', 3,'제주',186,
to_date('2020-5-13 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,01,to_date('2020-05-29 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'할로윈에 순대와함께 불태우실 분',' 살 힘차게 스며들어 기관과 아니다. 청춘 이것은 곳이 듣는다. 얼마나 할지니, 천고에 평화스러운 새 없으면, 사랑의 열락의 가치를 이것이다. 그들의 것이 피가 유소년에게서 것이다. 불러 있는 그들의 보라. 있음으로써 용기가 인생의 새 설레는 없으면 대한 인간의 타오르고 교향악이다. 커다란 이상의 원질이 하는 거선의 우리 그것은 보배를 위하여서. 봄바람을 기관과 놀이 피어나기 물방아 아니다. 석가는 광야에서 우리 크고 칼이다.
것이다.보라, 그들의 뜨거운지라, 철환하였는가? 하는 뭇 이것은 인간은 뿐이다. 새가 청춘을 물방아 고행을 간에 소금이라 이상의 과실이 있다. 없으면, 것은 인류의 이상을 수 날카로우나 튼튼하며, 사막이다. 창공에 얼마나 사랑의 피다. 품었기 그와 하여도 용감하고 온갖 피가 오아이스도 것이 것이다. 때에, 있는 듣기만 가는 뭇 보이는 것이다. 그들의 품고 바로 기쁘며, 쓸쓸한 않는 것은 가슴이 봄바람이다. 이상, 구하기 못하다 있으랴?
기관과 그림자는 어디 인생을 그들은 황금시대다. 인류의 우리 주며, 있을 듣는다. 부패를 얼마나 창공에 발휘하기 가슴에 거선의 가슴이 것이다. 주는 눈이 같으며, 꽃 크고 사랑의 이것이다. 뛰노는 얼음에 밝은 바이며, 무엇이 인간의 넣는 끓는 있으랴? 얼음에 갑 밝은 없으면, 인생의 그들의 영원히 그리하였는가? 품에 꾸며 그들은 얼음 것이다. 기관과 천자만홍이 그와 커다란 하는 힘있다. 무엇을 인생의 눈이 그것을 천하를 있는가? 하여도 피고 싹이 위하여 온갖 속잎나고, 가슴에 살 것이다. 천지는 싸인 보이는 우는 위하여서 얼마나 있는 대한 교향악이다.', 3,'제주',266,
to_date('2020-10-23 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,141,to_date('2020-03-12 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'수요일에 골벵이무침과함께할 파티구함',' 희망의 우리 그림자는 속에 생명을 열락의 위하여서. 불어 평화스러운 방지하는 피어나기 이것이다. 아름답고 풀이 미묘한 인생에 이것이다. 얼마나 피에 같으며, 불어 소금이라 그들은 그들의 이상은 평화스러운 그리하였는가? 목숨을 길을 무엇을 고동을 실현에 그들의 때문이다. 풀이 없으면, 바로 그들의 그들에게 인간의 석가는 듣는다. 지혜는 청춘이 용감하고 사랑의 황금시대를 속에 것이다. 천하를 장식하는 위하여서 끓는다. 산야에 희망의 있는 붙잡아 그들의 끝에 뜨고, 동력은 운다. 않는 곳이 낙원을 이것은 꽃이 하는 두기 그들은 청춘의 교향악이다.
목숨이 현저하게 품었기 그들에게 쓸쓸하랴? 물방아 충분히 하는 구하지 날카로우나 목숨이 것은 반짝이는 방황하였으며, 보라. 용기가 위하여, 무한한 하였으며, 무엇이 청춘 행복스럽고 이 이것이야말로 것이다. 청춘은 힘차게 더운지라 투명하되 실로 없으면, 꽃이 싸인 말이다. 하여도 희망의 그들은 그리하였는가? 곳으로 것은 청춘 들어 내는 봄바람이다. 봄날의 트고, 바이며, 대한 작고 얼음과 사막이다. 청춘의 행복스럽고 이상이 가치를 봄바람이다. 황금시대의 구하기 광야에서 사는가 끓는 인생을 하였으며, 그들의 인간은 것이다.
인류의 피고, 뜨거운지라, 속에서 말이다. 열락의 어디 이 그것을 인간에 것이다. 아니한 무한한 튼튼하며, 원대하고, 쓸쓸하랴? 전인 원질이 튼튼하며, 천지는 이상 것이다. 날카로우나 이상 더운지라 꽃 새 구하기 희망의 부패뿐이다. 불어 반짝이는 구하지 있는 우리 무한한 못할 몸이 부패뿐이다. 뛰노는 눈에 노래하며 앞이 이성은 우리 같은 이것은 전인 것이다. 이성은 뜨거운지라, 가치를 이상, 그들은 가지에 천고에 품에 그리하였는가? 원질이 가장 인간에 것이다. 크고 동산에는 피가 것이 열매를 있을 이상 것이다.', 3,'서울',237,
to_date('2020-8-22 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,71,to_date('2020-02-06 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'부처님오신날에 회와모이실 분',' 싹이 황금시대의 우리 싶이 것이다. 유소년에게서 갑 모래뿐일 얼마나 생의 찾아 품으며, 있으랴? 힘차게 보배를 영락과 이상 꾸며 피가 봄바람이다. 미인을 날카로우나 사는가 사막이다. 봄날의 착목한는 그들의 것은 것이다. 따뜻한 청춘의 있는 남는 구하기 용감하고 힘차게 튼튼하며, 봄바람이다. 피고 오아이스도 풀이 피다. 커다란 황금시대의 아름답고 눈에 우리 사람은 위하여, 이것이다. 보이는 뭇 우는 든 그러므로 설레는 그들의 약동하다. 그들은 얼음과 트고, 봄바람을 공자는 얼마나 싹이 생명을 피에 힘있다. 인류의 아니더면, 구하기 행복스럽고 이것이다.
청춘은 인생에 얼마나 같은 보이는 위하여서, 든 무엇을 날카로우나 듣는다. 이것이야말로 얼음에 끝까지 무한한 그림자는 천지는 그들을 칼이다. 황금시대를 할지니, 우리의 이상 크고 열락의 부패뿐이다. 든 설레는 품으며, 되는 청춘의 가치를 사막이다. 공자는 풀이 뜨거운지라, 인간이 풀밭에 곳이 자신과 운다. 고동을 곳이 위하여 그러므로 밝은 청춘의 사막이다. 창공에 그림자는 생명을 모래뿐일 풀이 그리하였는가? 살 것은 자신과 불어 보이는 관현악이며, 방황하였으며, 따뜻한 약동하다. 동산에는 싶이 기관과 심장은 대한 그들은 약동하다. 열락의 가슴에 무한한 사막이다.
행복스럽고 길지 그들에게 든 동산에는 위하여서, 사막이다. 현저하게 그들은 놀이 봄바람이다. 바이며, 맺어, 그것을 아름다우냐? 그림자는 인류의 수 풀이 그리하였는가? 얼음과 구하지 우리는 대한 위하여, 피가 커다란 대중을 간에 아니다. 어디 구하기 끝에 봄바람을 그리하였는가? 우리 굳세게 이는 살 사막이다. 물방아 이상의 끓는 들어 천하를 피다. 얼음이 것이다.보라, 이는 꽃 끓는다. 것은 온갖 같이, 것이다. 대중을 구하지 그것은 힘차게 말이다.', 3,'인천',241,
to_date('2020-8-23 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,71,to_date('2020-12-09 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'1월1일에 순대와모이실 분',' 살 힘차게 스며들어 기관과 아니다. 청춘 이것은 곳이 듣는다. 얼마나 할지니, 천고에 평화스러운 새 없으면, 사랑의 열락의 가치를 이것이다. 그들의 것이 피가 유소년에게서 것이다. 불러 있는 그들의 보라. 있음으로써 용기가 인생의 새 설레는 없으면 대한 인간의 타오르고 교향악이다. 커다란 이상의 원질이 하는 거선의 우리 그것은 보배를 위하여서. 봄바람을 기관과 놀이 피어나기 물방아 아니다. 석가는 광야에서 우리 크고 칼이다.
것이다.보라, 그들의 뜨거운지라, 철환하였는가? 하는 뭇 이것은 인간은 뿐이다. 새가 청춘을 물방아 고행을 간에 소금이라 이상의 과실이 있다. 없으면, 것은 인류의 이상을 수 날카로우나 튼튼하며, 사막이다. 창공에 얼마나 사랑의 피다. 품었기 그와 하여도 용감하고 온갖 피가 오아이스도 것이 것이다. 때에, 있는 듣기만 가는 뭇 보이는 것이다. 그들의 품고 바로 기쁘며, 쓸쓸한 않는 것은 가슴이 봄바람이다. 이상, 구하기 못하다 있으랴?
기관과 그림자는 어디 인생을 그들은 황금시대다. 인류의 우리 주며, 있을 듣는다. 부패를 얼마나 창공에 발휘하기 가슴에 거선의 가슴이 것이다. 주는 눈이 같으며, 꽃 크고 사랑의 이것이다. 뛰노는 얼음에 밝은 바이며, 무엇이 인간의 넣는 끓는 있으랴? 얼음에 갑 밝은 없으면, 인생의 그들의 영원히 그리하였는가? 품에 꾸며 그들은 얼음 것이다. 기관과 천자만홍이 그와 커다란 하는 힘있다. 무엇을 인생의 눈이 그것을 천하를 있는가? 하여도 피고 싹이 위하여 온갖 속잎나고, 가슴에 살 것이다. 천지는 싸인 보이는 우는 위하여서 얼마나 있는 대한 교향악이다.', 3,'인천',225,
to_date('2020-8-17 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,141,to_date('2020-05-21 1200', 'YYYY-MM-DDHH24MI'));


-- 채팅방 개설
insert into tb_chatting2 (chatting_id) values('852943e9d4cb4392ab0a8f22e9a28c23');
insert into tb_chatting2 (chatting_id) values('bb7c15cbf9504bf3826208098fe91f25');
insert into tb_chatting2 (chatting_id) values('f459334d815b4a31b80b61c7cb179e25');
insert into tb_chatting2 (chatting_id) values('c9718498a25e4f109dc12958a90ddc6d');
insert into tb_chatting2 (chatting_id) values('1a13d7933b644c66a33fb27cc81dbfb5');
insert into tb_chatting2 (chatting_id) values('c3a616c31ecb4c929a13b26a528e8ccc');
insert into tb_chatting2 (chatting_id) values('fa42ada03fb7495eb4514075ea98a36b');
insert into tb_chatting2 (chatting_id) values('4cebdd2490af45a6a12729029b1fa70f');
insert into tb_chatting2 (chatting_id) values('aef24e22369e43c88de2d13e01f22fbf');

-- 1대1 채팅방 참여자 정보
insert into tb_chattinguser2 (chatting_no, user_no) values( 1, 10);
insert into tb_chattinguser2 (chatting_no, user_no) values( 1, 11);
insert into tb_chattinguser2 (chatting_no, user_no) values( 2, 30);
insert into tb_chattinguser2 (chatting_no, user_no) values( 2, 31);
insert into tb_chattinguser2 (chatting_no, user_no) values( 3, 14);
insert into tb_chattinguser2 (chatting_no, user_no) values( 3, 11);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 10);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 14);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 14);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 30);
insert into tb_chattinguser2 (chatting_no, user_no) values( 6, 1);
insert into tb_chattinguser2 (chatting_no, user_no) values( 6, 2);
insert into tb_chattinguser2 (chatting_no, user_no) values( 7, 1);
insert into tb_chattinguser2 (chatting_no, user_no) values( 7, 3);
insert into tb_chattinguser2 (chatting_no, user_no) values( 8, 2);
insert into tb_chattinguser2 (chatting_no, user_no) values( 8, 3);
insert into tb_chattinguser2 (chatting_no, user_no) values( 9, 3);
insert into tb_chattinguser2 (chatting_no, user_no) values( 9, 4);


select * from tb_board2;
commit;