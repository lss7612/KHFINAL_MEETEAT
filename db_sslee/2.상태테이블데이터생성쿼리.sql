--유저등급생성
INSERT INTO tb_grade2 (user_grade,grade_name)
VALUES (0,'관리자');
INSERT INTO tb_grade2 (user_grade,grade_name)
VALUES (1,'결제유저');
INSERT INTO tb_grade2 (user_grade,grade_name)
VALUES (2,'일반유저');
INSERT INTO tb_grade2 (user_grade,grade_name)
VALUES (3,'영구정지 유저');

SELECT * FROM tb_grade2;

--게시판분류번호생성
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (1,'공지사항');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (2,'메이트찾기게시판');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (3,'모집게시판');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (4,'후기');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (5,'문의게시판');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (6,'이벤트등록게시판');
SELECT * FROM  tb_boardclass2 ;


--신고사유번호
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (1,'욕설신고');
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (2,'스팸(광고성)');
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (3,'노쇼(비매너)');
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (4,'먹튀(돈안냄)');
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (5,'기타사항(작성해야함)');

--신고처리내용테이블
insert into tb_resultreportreason2 values(1, '영구 정지');
SELECT * FROM tb_resultreportreason2;

commit;