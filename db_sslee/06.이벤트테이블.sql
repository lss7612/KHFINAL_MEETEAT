INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '2���� ����Ǵ� �˾����� �̺�Ʈ ù��°' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-01-01','YYYY-MM-DD')
    ,to_date('2021-02-28', 'YYYY-MM-DD') 
);

INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '2���� ����Ǵ� �˾����� �̺�Ʈ �ι�°' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-01-01','YYYY-MM-DD')
    ,to_date('2021-02-28', 'YYYY-MM-DD') 
);



INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '2���� ����Ǵ� �������� �̺�Ʈ' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-01-01','YYYY-MM-DD')
    ,to_date('2021-02-28', 'YYYY-MM-DD') 
);

INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '2�� ���� �������� � �̺�Ʈ' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-01-01','YYYY-MM-DD')
    ,to_date('2021-02-28', 'YYYY-MM-DD') 
);
INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '2���� ����Ǵ� �̺�Ʈ ù��°' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-01-01','YYYY-MM-DD')
    ,to_date('2021-02-28', 'YYYY-MM-DD') 
);

INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '2���� ����Ǵ� �������� �̺�Ʈ' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-01-01','YYYY-MM-DD')
    ,to_date('2021-02-28', 'YYYY-MM-DD') 
);

INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '�۳⿡ ����� �������� � �̺�Ʈ' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-12-01','YYYY-MM-DD')
    ,to_date('2020-12-31', 'YYYY-MM-DD') 
);

INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '�۳⿡ ����� �� �̺�Ʈ' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-12-01','YYYY-MM-DD')
    ,to_date('2020-12-31', 'YYYY-MM-DD') 
);

INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '����Ⱓ ���� � �̺�Ʈ' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2021-12-01','YYYY-MM-DD')
    ,to_date('2020-12-31', 'YYYY-MM-DD') 
);

INSERT INTO tb_board2 (
    article_no, article_title, article_content
    ,board_no, user_no, create_date
    ,is_delete, article_hit
    , start_date
    , terminate_date
)
VALUES (
    tb_eventBoard_seq.nextval, '����� � �̺�Ʈ' , '<p>����</p>'
    ,6, 1, sysdate
    ,0, 0
    ,to_date('2020-12-01','YYYY-MM-DD')
    ,to_date('2020-12-31', 'YYYY-MM-DD') 
);


INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 1, 6, 1);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 2, 6, 1);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 3, 6, 0);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 4, 6, 0);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 5, 6, 0);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 6, 6, 0);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 7, 6, 0);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 8, 6, 0);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 9, 6, 0);
INSERT INTO tb_popup2( article_no, board_no, is_popup )	VALUES( 10, 6, 0);


commit;
