-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- ��� ���̺� ����
drop table tb_chattingcontent2;
drop table tb_chatting2;
drop table tb_file2;
drop table tb_payment2;
drop table tb_resultreport2;
drop table tb_resultreportreason2;
drop table tb_userreport2;
drop table tb_recommend2;
drop table tb_comment2;
drop table tb_reportreason2;
drop table tb_board2;
drop table tb_boardclass2;
drop table tb_user2;
drop table tb_grade2;

-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_GRADE2
(
    user_grade    NUMBER          NOT NULL, 
    grade_name    VARCHAR2(20)    NULL, 
    CONSTRAINT TB_GRADE2_PK PRIMARY KEY (user_grade)
)
/

CREATE SEQUENCE TB_GRADE2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_GRADE2_AI_TRG
BEFORE INSERT ON TB_GRADE2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_GRADE2_SEQ.NEXTVAL
    INTO :NEW.user_grade
    FROM DUAL;
END;
/

--DROP TRIGGER TB_GRADE2_AI_TRG;
/

--DROP SEQUENCE TB_GRADE2_SEQ;
/

COMMENT ON COLUMN TB_GRADE2.user_grade IS 'ȸ����޺з���ȣ'
/

COMMENT ON COLUMN TB_GRADE2.grade_name IS 'ȸ������̸�'
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_USER2
(
    user_no                NUMBER           NOT NULL, 
    user_id                VARCHAR2(20)     NOT NULL, 
    user_pw                VARCHAR2(20)     NOT NULL, 
    user_nick              VARCHAR2(20)     NOT NULL, 
    user_gender            VARCHAR2(1)      NOT NULL, 
    user_age               VARCHAR2(100)    NOT NULL, 
    user_blockcnt          NUMBER           NOT NULL, 
    user_email             VARCHAR2(100)    NOT NULL, 
    user_profileorigin     VARCHAR2(500)    NULL, 
    user_grade             NUMBER           NOT NULL, 
    user_profilestorerd    VARCHAR2(500)    NULL, 
    CONSTRAINT TB_USER2_PK PRIMARY KEY (user_no)
)
/

CREATE SEQUENCE TB_USER2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_USER2_AI_TRG
BEFORE INSERT ON TB_USER2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_USER2_SEQ.NEXTVAL
    INTO :NEW.user_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_USER2_AI_TRG;
/

--DROP SEQUENCE TB_USER2_SEQ;
/

COMMENT ON COLUMN TB_USER2.user_no IS '������ȣ'
/

COMMENT ON COLUMN TB_USER2.user_id IS '���̵�'
/

COMMENT ON COLUMN TB_USER2.user_pw IS '��й�ȣ'
/

COMMENT ON COLUMN TB_USER2.user_nick IS '�г���'
/

COMMENT ON COLUMN TB_USER2.user_gender IS '����'
/

COMMENT ON COLUMN TB_USER2.user_age IS '����'
/

COMMENT ON COLUMN TB_USER2.user_blockcnt IS '�����Ű�Ƚ��'
/

COMMENT ON COLUMN TB_USER2.user_email IS '����'
/

COMMENT ON COLUMN TB_USER2.user_profileorigin IS '�����ʻ��� ������'
/

COMMENT ON COLUMN TB_USER2.user_grade IS '�������'
/

COMMENT ON COLUMN TB_USER2.user_profilestorerd IS '�����ʻ��� ������'
/

ALTER TABLE TB_USER2
    ADD CONSTRAINT FK_TB_USER2_user_grade_TB_GRAD FOREIGN KEY (user_grade)
        REFERENCES TB_GRADE2 (user_grade)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_BOARDCLASS2
(
    board_no      NUMBER          NOT NULL, 
    board_name    VARCHAR2(50)    NOT NULL, 
    CONSTRAINT TB_BOARDCLASS2_PK PRIMARY KEY (board_no)
)
/

COMMENT ON TABLE TB_BOARDCLASS2 IS '�Խ��Ǻз�'
/

COMMENT ON COLUMN TB_BOARDCLASS2.board_no IS '�Խ��ǹ�ȣ'
/

COMMENT ON COLUMN TB_BOARDCLASS2.board_name IS '�Խ����̸�'
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_BOARD2
(
    article_no         NUMBER            NOT NULL, 
    article_title      VARCHAR2(120)     NOT NULL, 
    article_content    VARCHAR2(3000)    NOT NULL, 
    board_no           NUMBER            NOT NULL, 
    party_location     VARCHAR2(20)      NULL, 
    user_no            NUMBER            NOT NULL, 
    create_date        DATE              NOT NULL, 
    revision_date      DATE              NULL, 
    is_delete          NUMBER            NOT NULL, 
    category           VARCHAR2(20)      NULL, 
    article_hit        NUMBER            NOT NULL, 
    post_group         NUMBER            NULL, 
    post_step          NUMBER            NULL, 
    post_indent        NUMBER            NULL, 
    meet_time          DATE              NULL, 
    article_pw         VARCHAR2(100)     NULL,
    start_date         DATE              NULL,
    terminate_date     DATE              NULL, 
    mate_list          VARCHAR2(100)     NULL, 
    CONSTRAINT TB_BOARD2_PK PRIMARY KEY (article_no, board_no)
)
/

CREATE SEQUENCE TB_BOARD2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_BOARD2_AI_TRG
BEFORE INSERT ON TB_BOARD2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_BOARD2_SEQ.NEXTVAL
    INTO :NEW.article_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_BOARD2_AI_TRG;
/

--DROP SEQUENCE TB_BOARD2_SEQ;
/

COMMENT ON TABLE TB_BOARD2 IS '�����Խ���'
/

COMMENT ON COLUMN TB_BOARD2.article_no IS '�۹�ȣ'
/

COMMENT ON COLUMN TB_BOARD2.article_title IS '������'
/

COMMENT ON COLUMN TB_BOARD2.article_content IS '�۳���'
/

COMMENT ON COLUMN TB_BOARD2.board_no IS '�Խ��ǹ�ȣ'
/

COMMENT ON COLUMN TB_BOARD2.party_location IS '����'
/

COMMENT ON COLUMN TB_BOARD2.user_no IS '�۾���(ȸ�����̺�����'
/

COMMENT ON COLUMN TB_BOARD2.create_date IS '�����ۼ��ð�'
/

COMMENT ON COLUMN TB_BOARD2.revision_date IS '���������ð�'
/

COMMENT ON COLUMN TB_BOARD2.is_delete IS '��������'
/

COMMENT ON COLUMN TB_BOARD2.category IS 'ī�װ�'
/

COMMENT ON COLUMN TB_BOARD2.article_hit IS '��ȸ��'
/

COMMENT ON COLUMN TB_BOARD2.post_group IS '�Խñ� �׷��ȣ'
/

COMMENT ON COLUMN TB_BOARD2.post_step IS '������ȣ'
/

COMMENT ON COLUMN TB_BOARD2.post_indent IS '�鿩���� ��ȣ'
/

COMMENT ON COLUMN TB_BOARD2.meet_time IS '�����½ð�'
/

COMMENT ON COLUMN TB_BOARD2.article_pw IS '�Խñ� ��й�ȣ'
/

COMMENT ON COLUMN TB_BOARD2.start_date IS '���۳�¥'
/

COMMENT ON COLUMN TB_BOARD2.terminate_date IS '�Ϸᳯ¥'
/

COMMENT ON COLUMN TB_BOARD2.mate_list IS '�����ڸ���Ʈ'
/

ALTER TABLE TB_BOARD2
    ADD CONSTRAINT FK_TB_BOARD2_board_no_TB_BOARD FOREIGN KEY (board_no)
        REFERENCES TB_BOARDCLASS2 (board_no)
/

ALTER TABLE TB_BOARD2
    ADD CONSTRAINT FK_TB_BOARD2_user_no_TB_USER2_ FOREIGN KEY (user_no)
        REFERENCES TB_USER2 (user_no)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_CHATTING2
(
    chatting_no    NUMBER    NOT NULL,
    chatting_name  VARCHAR2(120),
    chatting_id    VARCHAR2(40) NOT NULL,
    user_total     NUMBER    DEFAULT 0 NOT NULL , 
    CONSTRAINT TB_CHATTING2_PK PRIMARY KEY (chatting_no)
)
/

CREATE SEQUENCE TB_CHATTING2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_CHATTING2_AI_TRG
BEFORE INSERT ON TB_CHATTING2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_CHATTING2_SEQ.NEXTVAL
    INTO :NEW.chatting_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_CHATTING2_AI_TRG;
/

--DROP SEQUENCE TB_CHATTING2_SEQ;
/

COMMENT ON TABLE TB_CHATTING2 IS 'ä��'
/

COMMENT ON COLUMN TB_CHATTING2.chatting_no IS 'ä�ù��ȣ'
/

COMMENT ON COLUMN TB_CHATTING2.user_total IS '�ο�'
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_REPORTREASON2
(
    reason_no         NUMBER           NOT NULL, 
    reason_content    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT TB_REPORTREASON2_PK PRIMARY KEY (reason_no)
)
/

CREATE SEQUENCE TB_REPORTREASON2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_REPORTREASON2_AI_TRG
BEFORE INSERT ON TB_REPORTREASON2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_REPORTREASON2_SEQ.NEXTVAL
    INTO :NEW.reason_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_REPORTREASON2_AI_TRG;
/

--DROP SEQUENCE TB_REPORTREASON2_SEQ;
/

COMMENT ON TABLE TB_REPORTREASON2 IS 'ȸ���Ű����'
/

COMMENT ON COLUMN TB_REPORTREASON2.reason_no IS '������ȣ'
/

COMMENT ON COLUMN TB_REPORTREASON2.reason_content IS '�Ű� ����'
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_RESULTREPORTREASON2
(
    report_result            NUMBER           NOT NULL, 
    report_result_content    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT TB_RESULTREPORTREASON2_PK PRIMARY KEY (report_result)
)
/

CREATE SEQUENCE TB_RESULTREPORTREASON2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_RESULTREPORTREASON2_AI_TRG
BEFORE INSERT ON TB_RESULTREPORTREASON2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_RESULTREPORTREASON2_SEQ.NEXTVAL
    INTO :NEW.report_result
    FROM DUAL;
END;
/

--DROP TRIGGER TB_RESULTREPORTREASON2_AI_TRG;
/

--DROP SEQUENCE TB_RESULTREPORTREASON2_SEQ;
/

COMMENT ON COLUMN TB_RESULTREPORTREASON2.report_result IS '�Ű� ó�� ��ȣ'
/

COMMENT ON COLUMN TB_RESULTREPORTREASON2.report_result_content IS '�Ű� ó�� ����'
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_PAYMENT2
(
    pay_no        NUMBER         NOT NULL, 
    user_no       NUMBER         NOT NULL, 
    pay_date      DATE           NULL, 
    price         NUMBER         NULL, 
    pay_status    VARCHAR(20)    NULL, 
    CONSTRAINT TB_PAYMENT2_PK PRIMARY KEY (pay_no)
)
/

CREATE SEQUENCE TB_PAYMENT2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_PAYMENT2_AI_TRG
BEFORE INSERT ON TB_PAYMENT2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_PAYMENT2_SEQ.NEXTVAL
    INTO :NEW.pay_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_PAYMENT2_AI_TRG;
/

--DROP SEQUENCE TB_PAYMENT2_SEQ;
/

COMMENT ON COLUMN TB_PAYMENT2.pay_no IS '���� ��ȣ'
/

COMMENT ON COLUMN TB_PAYMENT2.user_no IS 'ȸ�� �ѹ�'
/

COMMENT ON COLUMN TB_PAYMENT2.pay_date IS '������'
/

COMMENT ON COLUMN TB_PAYMENT2.price IS '���� ����'
/

COMMENT ON COLUMN TB_PAYMENT2.pay_status IS '���� ����'
/

ALTER TABLE TB_PAYMENT2
    ADD CONSTRAINT FK_TB_PAYMENT2_user_no_TB_USER FOREIGN KEY (user_no)
        REFERENCES TB_USER2 (user_no)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_CHATTINGUSER2
(
    idx            NUMBER    NOT NULL, 
    chatting_no    NUMBER    NOT NULL, 
    user_no        NUMBER    NOT NULL, 
    CONSTRAINT TB_CHATTINGUSER2_PK PRIMARY KEY (idx)
)
/

CREATE SEQUENCE TB_CHATTINGUSER2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_CHATTINGUSER2_AI_TRG
BEFORE INSERT ON TB_CHATTINGUSER2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_CHATTINGUSER2_SEQ.NEXTVAL
    INTO :NEW.idx
    FROM DUAL;
END;
/

--DROP TRIGGER TB_CHATTINGUSER2_AI_TRG;
/

--DROP SEQUENCE TB_CHATTINGUSER2_SEQ;
/

COMMENT .ON TABLE TB_CHATTINGUSER2 IS 'ä��������'
/

COMMENT ON COLUMN TB_CHATTINGUSER2.idx IS '�����ڸ��'
/

COMMENT ON COLUMN TB_CHATTINGUSER2.chatting_no IS 'ä�ù��ȣ'
/

COMMENT ON COLUMN TB_CHATTINGUSER2.user_no IS 'ȸ����ȣ'
/

ALTER TABLE TB_CHATTINGUSER2
    ADD CONSTRAINT FK_TB_CHATTINGUSER2_chatting_n FOREIGN KEY (chatting_no)
        REFERENCES TB_CHATTING2 (chatting_no)
/

ALTER TABLE TB_CHATTINGUSER2
    ADD CONSTRAINT FK_TB_CHATTINGUSER2_user_no_TB FOREIGN KEY (user_no)
        REFERENCES TB_USER2 (user_no)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_CHATTINGCONTENT2
(
    chatting_no    NUMBER           NOT NULL, 
    msg_no         VARCHAR2(20)     NOT NULL, 
    user_no        NUMBER           NOT NULL, 
    msg_content    VARCHAR2(500)    NOT NULL, 
    msg_date       DATE             NOT NULL, 
    CONSTRAINT TB_CHATTINGCONTENT2_PK PRIMARY KEY (chatting_no)
)
/

CREATE SEQUENCE TB_CHATTINGCONTENT2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_CHATTINGCONTENT2_AI_TRG
BEFORE INSERT ON TB_CHATTINGCONTENT2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_CHATTINGCONTENT2_SEQ.NEXTVAL
    INTO :NEW.chatting_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_CHATTINGCONTENT2_AI_TRG;
/

--DROP SEQUENCE TB_CHATTINGCONTENT2_SEQ;
/

COMMENT ON TABLE TB_CHATTINGCONTENT2 IS 'ä�ó���'
/

COMMENT ON COLUMN TB_CHATTINGCONTENT2.chatting_no IS 'ä�ù�ȣ'
/

COMMENT ON COLUMN TB_CHATTINGCONTENT2.msg_no IS '�޽�����ȣ'
/

COMMENT ON COLUMN TB_CHATTINGCONTENT2.user_no IS '�ۼ���'
/

COMMENT ON COLUMN TB_CHATTINGCONTENT2.msg_content IS '�ۼ�����'
/

COMMENT ON COLUMN TB_CHATTINGCONTENT2.msg_date IS '�ۼ��ð�'
/

ALTER TABLE TB_CHATTINGCONTENT2
    ADD CONSTRAINT FK_TB_CHATTINGCONTENT2_chattin FOREIGN KEY (chatting_no)
        REFERENCES TB_CHATTING2 (chatting_no)
/

ALTER TABLE TB_CHATTINGCONTENT2
    ADD CONSTRAINT FK_TB_CHATTINGCONTENT2_user_no FOREIGN KEY (user_no)
        REFERENCES TB_USER2 (user_no)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_USERREPORT2
(
    report_no         NUMBER           NOT NULL, 
    user_no           NUMBER           NOT NULL, 
    report_time       DATE             NOT NULL, 
    reason_no         NUMBER           NOT NULL, 
    report_content    VARCHAR2(300)    NULL, 
    board_url         VARCHAR2(200)    NULL, 
    is_processed      NUMBER           NOT NULL, 
    CONSTRAINT TB_USERREPORT2_PK PRIMARY KEY (report_no)
)
/

CREATE SEQUENCE TB_USERREPORT2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_USERREPORT2_AI_TRG
BEFORE INSERT ON TB_USERREPORT2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_USERREPORT2_SEQ.NEXTVAL
    INTO :NEW.report_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_USERREPORT2_AI_TRG;
/

--DROP SEQUENCE TB_USERREPORT2_SEQ;
/

COMMENT ON TABLE TB_USERREPORT2 IS '�Ű���'
/

COMMENT ON COLUMN TB_USERREPORT2.report_no IS '�Ű��ȣ'
/

COMMENT ON COLUMN TB_USERREPORT2.user_no IS 'ȸ����ȣ'
/

COMMENT ON COLUMN TB_USERREPORT2.report_time IS '�Ű�ð�'
/

COMMENT ON COLUMN TB_USERREPORT2.reason_no IS '�Ű� ����'
/

COMMENT ON COLUMN TB_USERREPORT2.report_content IS '�Ű� ����'
/

COMMENT ON COLUMN TB_USERREPORT2.board_url IS '�Խñ�URL'
/

COMMENT ON COLUMN TB_USERREPORT2.is_processed IS 'ó������'
/

ALTER TABLE TB_USERREPORT2
    ADD CONSTRAINT FK_TB_USERREPORT2_reason_no_TB FOREIGN KEY (reason_no)
        REFERENCES TB_REPORTREASON2 (reason_no)
/

ALTER TABLE TB_USERREPORT2
    ADD CONSTRAINT FK_TB_USERREPORT2_user_no_TB_U FOREIGN KEY (user_no)
        REFERENCES TB_USER2 (user_no)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_RESULTREPORT2
(
    report_result_no           NUMBER    NOT NULL, 
    user_no                    NUMBER    NOT NULL, 
    report_result_date         DATE      NOT NULL, 
    report_result_detail_no    NUMBER    NOT NULL, 
    CONSTRAINT TB_RESULTREPORT2_PK PRIMARY KEY (report_result_no)
)
/

CREATE SEQUENCE TB_RESULTREPORT2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_RESULTREPORT2_AI_TRG
BEFORE INSERT ON TB_RESULTREPORT2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_RESULTREPORT2_SEQ.NEXTVAL
    INTO :NEW.report_result_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_RESULTREPORT2_AI_TRG;
/

--DROP SEQUENCE TB_RESULTREPORT2_SEQ;
/

COMMENT ON TABLE TB_RESULTREPORT2 IS 'ȸ�� �Ű� ó��'
/

COMMENT ON COLUMN TB_RESULTREPORT2.report_result_no IS 'ó����ȣ'
/

COMMENT ON COLUMN TB_RESULTREPORT2.user_no IS 'ȸ����ȣ'
/

COMMENT ON COLUMN TB_RESULTREPORT2.report_result_date IS 'ó���Ͻ�'
/

COMMENT ON COLUMN TB_RESULTREPORT2.report_result_detail_no IS '�Ű�ó����ȣ'
/

ALTER TABLE TB_RESULTREPORT2
    ADD CONSTRAINT FK_TB_RESULTREPORT2_user_no_TB FOREIGN KEY (user_no)
        REFERENCES TB_USER2 (user_no)
/

ALTER TABLE TB_RESULTREPORT2
    ADD CONSTRAINT FK_TB_RESULTREPORT2_report_res FOREIGN KEY (report_result_detail_no)
        REFERENCES TB_RESULTREPORTREASON2 (report_result)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_COMMENT2
(
    comment_no          NUMBER            NOT NULL, 
    article_no          NUMBER            NOT NULL, 
    board_no            NUMBER            NOT NULL, 
    comment_content     VARCHAR2(2000)    NOT NULL, 
    user_no             NUMBER            NOT NULL, 
    comment_order       NUMBER            NOT NULL, 
    comment_originno    NUMBER            NULL, 
    create_date         DATE              NOT NULL, 
    revision_date       DATE              NULL, 
    is_delete           NUMBER            NOT NULL, 
    CONSTRAINT TB_COMMENT2_PK PRIMARY KEY (comment_no)
)
/

CREATE SEQUENCE TB_COMMENT2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_COMMENT2_AI_TRG
BEFORE INSERT ON TB_COMMENT2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_COMMENT2_SEQ.NEXTVAL
    INTO :NEW.comment_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_COMMENT2_AI_TRG;
/

--DROP SEQUENCE TB_COMMENT2_SEQ;
/

COMMENT ON TABLE TB_COMMENT2 IS '���'
/

COMMENT ON COLUMN TB_COMMENT2.comment_no IS '��۹�ȣ'
/

COMMENT ON COLUMN TB_COMMENT2.article_no IS '�۹�ȣ'
/

COMMENT ON COLUMN TB_COMMENT2.board_no IS '�Խ��ǹ�ȣ'
/

COMMENT ON COLUMN TB_COMMENT2.comment_content IS '��۳���'
/

COMMENT ON COLUMN TB_COMMENT2.user_no IS '�۾���(ȸ�����̺�����'
/

COMMENT ON COLUMN TB_COMMENT2.comment_order IS '���ۼ���(������0'
/

COMMENT ON COLUMN TB_COMMENT2.comment_originno IS '������۹�ȣ'
/

COMMENT ON COLUMN TB_COMMENT2.create_date IS '�����ۼ��ð�'
/

COMMENT ON COLUMN TB_COMMENT2.revision_date IS '���������ð�'
/

COMMENT ON COLUMN TB_COMMENT2.is_delete IS '��������'
/

ALTER TABLE TB_COMMENT2
    ADD CONSTRAINT FK_TB_COMMENT2_article_no_TB_B FOREIGN KEY (article_no, board_no)
        REFERENCES TB_BOARD2 (article_no, board_no)
/

ALTER TABLE TB_COMMENT2
    ADD CONSTRAINT FK_TB_COMMENT2_user_no_TB_USER FOREIGN KEY (user_no)
        REFERENCES TB_USER2 (user_no)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_FILE2
(
    file_no            NUMBER           NOT NULL, 
    file_originname    VARCHAR2(500)    NOT NULL, 
    file_storedname    VARCHAR2(200)    NOT NULL, 
    article_no         NUMBER           NULL, 
    board_no           NUMBER           NULL, 
    CONSTRAINT TB_FILE2_PK PRIMARY KEY (file_no)
)
/

CREATE SEQUENCE TB_FILE2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_FILE2_AI_TRG
BEFORE INSERT ON TB_FILE2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_FILE2_SEQ.NEXTVAL
    INTO :NEW.file_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_FILE2_AI_TRG;
/

--DROP SEQUENCE TB_FILE2_SEQ;
/

COMMENT ON TABLE TB_FILE2 IS '�Խ��� ÷������'
/

COMMENT ON COLUMN TB_FILE2.file_no IS '÷������ ��ȣ'
/

COMMENT ON COLUMN TB_FILE2.file_originname IS '�������� ���ϸ�'
/

COMMENT ON COLUMN TB_FILE2.file_storedname IS '������ ���ϸ�'
/

COMMENT ON COLUMN TB_FILE2.article_no IS '�Խñ۹�ȣ'
/

COMMENT ON COLUMN TB_FILE2.board_no IS '�Խ��Ǻз���ȣ'
/

ALTER TABLE TB_FILE2
    ADD CONSTRAINT FK_TB_FILE2_article_no_TB_BOAR FOREIGN KEY (article_no, board_no)
        REFERENCES TB_BOARD2 (article_no, board_no)
/


-- TB_GRADE2 Table Create SQL
CREATE TABLE TB_RECOMMEND2
(
    article_no    NUMBER    NOT NULL, 
    board_no      NUMBER    NOT NULL, 
    user_no       NUMBER    NOT NULL, 
    CONSTRAINT TB_RECOMMEND2_PK PRIMARY KEY (article_no, board_no, user_no)
)
/

CREATE SEQUENCE TB_RECOMMEND2_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TB_RECOMMEND2_AI_TRG
BEFORE INSERT ON TB_RECOMMEND2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TB_RECOMMEND2_SEQ.NEXTVAL
    INTO :NEW.article_no
    FROM DUAL;
END;
/

--DROP TRIGGER TB_RECOMMEND2_AI_TRG;
/

--DROP SEQUENCE TB_RECOMMEND2_SEQ;
/

COMMENT ON COLUMN TB_RECOMMEND2.article_no IS '�Խñ۹�ȣ'
/

COMMENT ON COLUMN TB_RECOMMEND2.board_no IS '�Խ��Ǻз���ȣ'
/

COMMENT ON COLUMN TB_RECOMMEND2.user_no IS '������ȣ'
/

ALTER TABLE TB_RECOMMEND2
    ADD CONSTRAINT FK_TB_RECOMMEND2_article_no_TB FOREIGN KEY (article_no, board_no)
        REFERENCES TB_BOARD2 (article_no, board_no)
/

ALTER TABLE TB_RECOMMEND2
    ADD CONSTRAINT FK_TB_RECOMMEND2_user_no_TB_US FOREIGN KEY (user_no)
        REFERENCES TB_USER2 (user_no)
/

-- �Ű����̺� ������ �߰��� ������ �Ű���Ƚ�� ���� Ʈ����
CREATE OR REPLACE TRIGGER TB_USER2_blockcnt_AI_TRG
BEFORE INSERT ON tb_userreport2
    for each row
begin 
    update tb_user2 set user_blockcnt = user_blockcnt +1
    where user_no = :new.user_no;
end; 
/

--tb_chattinguser2�� ���� �߰��� ä�ù� �ο� ���� Ʈ����
CREATE OR REPLACE TRIGGER TB_CHATTING2_USER_TOTAL_AI_TRG
AFTER INSERT ON tb_chattinguser2
    for each row
begin 
    update tb_chatting2 set user_total = user_total +1
    where chatting_no = :new.chatting_no;
end; 
/

--tb_chattinguser2�� ���� ������ ä�ù� �ο� ���� Ʈ����
CREATE OR REPLACE TRIGGER TB_CHATTING2_USER_TOTAL_AD_TRG
AFTER DELETE ON tb_chattinguser2
    for each row
begin 
    update tb_chatting2 set user_total = user_total -1
    where chatting_no = :old.chatting_no;
end; 
/

-- �ڵ������� Ʈ���� ���� �ڵ�
DROP TRIGGER "TB_RESULTREPORTREASON2_AI_TRG";
DROP TRIGGER "TB_RECOMMEND2_AI_TRG";
DROP TRIGGER "TB_FILE2_AI_TRG";
DROP TRIGGER "TB_COMMENT2_AI_TRG";
--DROP TRIGGER "TB_USERREPORT2_AI_TRG";
--DROP TRIGGER "TB_CHATTINGCONTENT2_AI_TRG";
DROP TRIGGER "TB_PAYMENT2_AI_TRG";
DROP TRIGGER "TB_RESULTREPORT2_AI_TRG";
DROP TRIGGER "TB_REPORTREASON2_AI_TRG";
--DROP TRIGGER "TB_CHATTING2_AI_TRG";
DROP TRIGGER "TB_BOARD2_AI_TRG";
DROP TRIGGER "TB_USER2_AI_TRG";
DROP TRIGGER "TB_GRADE2_AI_TRG";

DROP SEQUENCE tb_recruitBoard_seq;
CREATE SEQUENCE tb_recruitBoard_seq;
DROP SEQUENCE tb_recruitBoardComment_seq;
CREATE SEQUENCE tb_recruitBoardComment_seq;

commit;
