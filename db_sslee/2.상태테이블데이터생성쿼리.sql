--������޻���
INSERT INTO tb_grade2 (user_grade,grade_name)
VALUES (0,'������');
INSERT INTO tb_grade2 (user_grade,grade_name)
VALUES (1,'��������');
INSERT INTO tb_grade2 (user_grade,grade_name)
VALUES (2,'�Ϲ�����');
INSERT INTO tb_grade2 (user_grade,grade_name)
VALUES (3,'�������� ����');

SELECT * FROM tb_grade2;

--�Խ��Ǻз���ȣ����
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (1,'��������');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (2,'����Ʈã��Խ���');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (3,'�����Խ���');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (4,'�ı�');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (5,'���ǰԽ���');
INSERT INTO tb_boardclass2 (board_no,board_name)
VALUES (6,'�̺�Ʈ��ϰԽ���');
SELECT * FROM  tb_boardclass2 ;


--�Ű������ȣ
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (1,'�弳�Ű�');
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (2,'����(����)');
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (3,'���(��ų�)');
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (4,'��Ƣ(���ȳ�)');
INSERT INTO tb_reportreason2 (reason_no,reason_content)
VALUES (5,'��Ÿ����(�ۼ��ؾ���)');

--�Ű�ó���������̺�
insert into tb_resultreportreason2 values(1, '���� ����');
SELECT * FROM tb_resultreportreason2;

commit;