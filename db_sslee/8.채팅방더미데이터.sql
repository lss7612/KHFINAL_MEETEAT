

insert into tb_chatting2 (chatting_id) values('852943e9d4cb4392ab0a8f22e9a28c23');
insert into tb_chatting2 (chatting_id) values('bb7c15cbf9504bf3826208098fe91f25');
insert into tb_chatting2 (chatting_id, chatting_name) values('c3a616c31ecb4c929a13b26a528e8asd', 'ȸ�� ��ü ä�ù�');
insert into tb_chatting2 (chatting_id, chatting_name) values('c4a616c31ecb4c929a13b26a528e8asd', 'ȸ�� ��ü ä�ù�2');

insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like '852943e9d4cb4392ab0a8f22e9a28c23'), 6);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like '852943e9d4cb4392ab0a8f22e9a28c23'), 7);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'bb7c15cbf9504bf3826208098fe91f25'), 6);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'bb7c15cbf9504bf3826208098fe91f25'), 9);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 6);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 7);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 8);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 9);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 10);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 11);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 12);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 13);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 14);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 15);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'), 16);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 6);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 16);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 26);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 36);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 46);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 56);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 66);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 76);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 86);
insert into tb_chattinguser2 (chatting_no, user_no) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'), 96);


insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like '852943e9d4cb4392ab0a8f22e9a28c23'),6, '6��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like '852943e9d4cb4392ab0a8f22e9a28c23'),7, '7��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'b7c15cbf9504bf3826208098fe91f25'),6, '6��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'b7c15cbf9504bf3826208098fe91f25'),9, '9��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),6, '6��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),7, '7��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),8, '8��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),9, '9��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),10, '10��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),11, '11��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),12, '12��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),13, '13��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),14, '14��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),15, '15��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c3a616c31ecb4c929a13b26a528e8asd'),16, '16��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),6, '6��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),16, '16��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),26, '26��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),36, '36��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),46, '46��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),56, '56��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),66, '66��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),76, '76��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),86, '86��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values( (select chatting_no from tb_chatting2 where chatting_id like 'c4a616c31ecb4c929a13b26a528e8asd'),96, '96��ȸ�� ����', sysdate,'ENTER');


commit;