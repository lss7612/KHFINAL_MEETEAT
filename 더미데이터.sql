
-- grade ����
select * from tb_grade2;

insert into tb_grade2 values(0, '������');
insert into tb_grade2 values(1, '���� ����');
insert into tb_grade2 values(2, '����� ����');
insert into tb_grade2 values(3, '�������� ����');
select * from tb_grade2;

-- �Խñ� �з�
insert into tb_boardclass2 values(1, '��������');
insert into tb_boardclass2 values(2, '����Ʈã��Խ���');
insert into tb_boardclass2 values(3, '���� �Խ���');
insert into tb_boardclass2 values(4, '�ı� �Խ���');
insert into tb_boardclass2 values(5, '���� �Խ���');
insert into tb_boardclass2 values(6, '�̺�Ʈ ��� �Խ���');

select * from tb_boardclass2;

--�Ű�������̺�
insert into tb_reportreason2 values (1,'�弳 �Ű�');
insert into tb_reportreason2 values (2,'���� �� ���� �Ű�');
insert into tb_reportreason2 values (3,'��ų�(��� ��) �Ű�');
insert into tb_reportreason2 values (4,'��Ƣ �Ű�');
insert into tb_reportreason2 values (5,'��Ÿ ���� �Ű�');

select * from tb_reportreason2;

--�Ű�ó���������̺�
insert into tb_resultreportreason2 values(1, '���� ����');
select * from tb_resultreportreason2;

-- ȸ�� ���� ���̵�����

select * from tb_user2
order by user_no;

insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('admin1', 'admin1', 'admin', 'M', '20-29', 0, 'userid1@a.com',0);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid2', 'userpw2', 'nick2', 'F', '20-29', 0, 'userid2@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid3', 'userpw3', 'nick3', 'M', '30-39', 0, 'userid3@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid4', 'userpw4', 'nick4', 'F', '40-49', 0, 'userid4@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid5', 'userpw5', 'nick5', 'M', '50-59', 0, 'userid5@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid6', 'userpw6', 'nick6', 'F', '60-69', 0, 'userid6@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid7', 'userpw7', 'nick7', 'M', '70-79', 0, 'userid7@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid8', 'userpw8', 'nick8', 'F', '80-89', 0, 'userid8@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid9', 'userpw9', 'nick9', 'M', '90-99', 0, 'userid9@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid10', 'userpw10', 'nick10', 'F', '10-19', 0, 'userid10@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid11', 'userpw11', 'nick11', 'M', '20-29', 0, 'userid11@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid12', 'userpw12', 'nick12', 'F', '30-39', 0, 'userid12@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid13', 'userpw13', 'nick13', 'M', '40-49', 0, 'userid13@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid14', 'userpw14', 'nick14', 'F', '50-59', 0, 'userid14@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid15', 'userpw15', 'nick15', 'M', '60-69', 0, 'userid15@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid16', 'userpw16', 'nick16', 'F', '70-79', 0, 'userid16@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid17', 'userpw17', 'nick17', 'M', '80-89', 0, 'userid17@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid18', 'userpw18', 'nick18', 'F', '90-99', 0, 'userid18@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid19', 'userpw19', 'nick19', 'M', '10-19', 0, 'userid19@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid20', 'userpw20', 'nick20', 'F', '20-29', 0, 'userid20@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid21', 'userpw21', 'nick21', 'M', '30-39', 0, 'userid21@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid22', 'userpw22', 'nick22', 'F', '40-49', 0, 'userid22@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid23', 'userpw23', 'nick23', 'M', '50-59', 0, 'userid23@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid24', 'userpw24', 'nick24', 'F', '60-69', 0, 'userid24@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid25', 'userpw25', 'nick25', 'M', '70-79', 0, 'userid25@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid26', 'userpw26', 'nick26', 'F', '80-89', 0, 'userid26@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid27', 'userpw27', 'nick27', 'M', '90-99', 0, 'userid27@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid28', 'userpw28', 'nick28', 'F', '10-19', 0, 'userid28@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid29', 'userpw29', 'nick29', 'M', '20-29', 0, 'userid29@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid30', 'userpw30', 'nick30', 'F', '30-39', 0, 'userid30@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid31', 'userpw31', 'nick31', 'M', '40-49', 0, 'userid31@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid32', 'userpw32', 'nick32', 'F', '50-59', 0, 'userid32@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid33', 'userpw33', 'nick33', 'M', '60-69', 0, 'userid33@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid34', 'userpw34', 'nick34', 'F', '70-79', 0, 'userid34@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid35', 'userpw35', 'nick35', 'M', '80-89', 0, 'userid35@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid36', 'userpw36', 'nick36', 'F', '90-99', 0, 'userid36@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid37', 'userpw37', 'nick37', 'M', '10-19', 0, 'userid37@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid38', 'userpw38', 'nick38', 'F', '20-29', 0, 'userid38@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid39', 'userpw39', 'nick39', 'M', '30-39', 0, 'userid39@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid40', 'userpw40', 'nick40', 'F', '40-49', 0, 'userid40@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid41', 'userpw41', 'nick41', 'M', '50-59', 0, 'userid41@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid42', 'userpw42', 'nick42', 'F', '60-69', 0, 'userid42@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid43', 'userpw43', 'nick43', 'M', '70-79', 0, 'userid43@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid44', 'userpw44', 'nick44', 'F', '80-89', 0, 'userid44@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid45', 'userpw45', 'nick45', 'M', '90-99', 0, 'userid45@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid46', 'userpw46', 'nick46', 'F', '10-19', 0, 'userid46@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid47', 'userpw47', 'nick47', 'M', '20-29', 0, 'userid47@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid48', 'userpw48', 'nick48', 'F', '30-39', 0, 'userid48@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid49', 'userpw49', 'nick49', 'M', '40-49', 0, 'userid49@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid50', 'userpw50', 'nick50', 'F', '50-59', 0, 'userid50@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid51', 'userpw51', 'nick51', 'M', '60-69', 0, 'userid51@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid52', 'userpw52', 'nick52', 'F', '70-79', 0, 'userid52@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid53', 'userpw53', 'nick53', 'M', '80-89', 0, 'userid53@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid54', 'userpw54', 'nick54', 'F', '90-99', 0, 'userid54@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid55', 'userpw55', 'nick55', 'M', '10-19', 0, 'userid55@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid56', 'userpw56', 'nick56', 'F', '20-29', 0, 'userid56@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid57', 'userpw57', 'nick57', 'M', '30-39', 0, 'userid57@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid58', 'userpw58', 'nick58', 'F', '40-49', 0, 'userid58@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid59', 'userpw59', 'nick59', 'M', '50-59', 0, 'userid59@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid60', 'userpw60', 'nick60', 'F', '60-69', 0, 'userid60@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid61', 'userpw61', 'nick61', 'M', '70-79', 0, 'userid61@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid62', 'userpw62', 'nick62', 'F', '80-89', 0, 'userid62@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid63', 'userpw63', 'nick63', 'M', '90-99', 0, 'userid63@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid64', 'userpw64', 'nick64', 'F', '10-19', 0, 'userid64@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid65', 'userpw65', 'nick65', 'M', '20-29', 0, 'userid65@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid66', 'userpw66', 'nick66', 'F', '30-39', 0, 'userid66@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid67', 'userpw67', 'nick67', 'M', '40-49', 0, 'userid67@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid68', 'userpw68', 'nick68', 'F', '50-59', 0, 'userid68@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid69', 'userpw69', 'nick69', 'M', '60-69', 0, 'userid69@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid70', 'userpw70', 'nick70', 'F', '70-79', 0, 'userid70@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid71', 'userpw71', 'nick71', 'M', '80-89', 0, 'userid71@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid72', 'userpw72', 'nick72', 'F', '90-99', 0, 'userid72@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid73', 'userpw73', 'nick73', 'M', '10-19', 0, 'userid73@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid74', 'userpw74', 'nick74', 'F', '20-29', 0, 'userid74@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid75', 'userpw75', 'nick75', 'M', '30-39', 0, 'userid75@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid76', 'userpw76', 'nick76', 'F', '40-49', 0, 'userid76@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid77', 'userpw77', 'nick77', 'M', '50-59', 0, 'userid77@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid78', 'userpw78', 'nick78', 'F', '60-69', 0, 'userid78@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid79', 'userpw79', 'nick79', 'M', '70-79', 0, 'userid79@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid80', 'userpw80', 'nick80', 'F', '80-89', 0, 'userid80@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid81', 'userpw81', 'nick81', 'M', '90-99', 0, 'userid81@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid82', 'userpw82', 'nick82', 'F', '10-19', 0, 'userid82@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid83', 'userpw83', 'nick83', 'M', '20-29', 0, 'userid83@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid84', 'userpw84', 'nick84', 'F', '30-39', 0, 'userid84@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid85', 'userpw85', 'nick85', 'M', '40-49', 0, 'userid85@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid86', 'userpw86', 'nick86', 'F', '50-59', 0, 'userid86@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid87', 'userpw87', 'nick87', 'M', '60-69', 0, 'userid87@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid88', 'userpw88', 'nick88', 'F', '70-79', 0, 'userid88@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid89', 'userpw89', 'nick89', 'M', '80-89', 0, 'userid89@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid90', 'userpw90', 'nick90', 'F', '90-99', 0, 'userid90@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid91', 'userpw91', 'nick91', 'M', '10-19', 0, 'userid91@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid92', 'userpw92', 'nick92', 'F', '20-29', 0, 'userid92@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid93', 'userpw93', 'nick93', 'M', '30-39', 0, 'userid93@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid94', 'userpw94', 'nick94', 'F', '40-49', 0, 'userid94@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid95', 'userpw95', 'nick95', 'M', '50-59', 0, 'userid95@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid96', 'userpw96', 'nick96', 'F', '60-69', 0, 'userid96@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid97', 'userpw97', 'nick97', 'M', '70-79', 0, 'userid97@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid98', 'userpw98', 'nick98', 'F', '80-89', 0, 'userid98@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid99', 'userpw99', 'nick99', 'M', '90-99', 0, 'userid99@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid100', 'userpw100', 'nick100', 'F', '10-19', 0, 'userid100@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid101', 'userpw101', 'nick101', 'M', '20-29', 0, 'userid101@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid102', 'userpw102', 'nick102', 'F', '30-39', 0, 'userid102@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid103', 'userpw103', 'nick103', 'M', '40-49', 0, 'userid103@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid104', 'userpw104', 'nick104', 'F', '50-59', 0, 'userid104@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid105', 'userpw105', 'nick105', 'M', '60-69', 0, 'userid105@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid106', 'userpw106', 'nick106', 'F', '70-79', 0, 'userid106@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid107', 'userpw107', 'nick107', 'M', '80-89', 0, 'userid107@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid108', 'userpw108', 'nick108', 'F', '90-99', 0, 'userid108@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid109', 'userpw109', 'nick109', 'M', '10-19', 0, 'userid109@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid110', 'userpw110', 'nick110', 'F', '20-29', 0, 'userid110@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid111', 'userpw111', 'nick111', 'M', '30-39', 0, 'userid111@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid112', 'userpw112', 'nick112', 'F', '40-49', 0, 'userid112@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid113', 'userpw113', 'nick113', 'M', '50-59', 0, 'userid113@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid114', 'userpw114', 'nick114', 'F', '60-69', 0, 'userid114@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid115', 'userpw115', 'nick115', 'M', '70-79', 0, 'userid115@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid116', 'userpw116', 'nick116', 'F', '80-89', 0, 'userid116@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid117', 'userpw117', 'nick117', 'M', '90-99', 0, 'userid117@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid118', 'userpw118', 'nick118', 'F', '10-19', 0, 'userid118@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid119', 'userpw119', 'nick119', 'M', '20-29', 0, 'userid119@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid120', 'userpw120', 'nick120', 'F', '30-39', 0, 'userid120@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid121', 'userpw121', 'nick121', 'M', '40-49', 0, 'userid121@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid122', 'userpw122', 'nick122', 'F', '50-59', 0, 'userid122@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid123', 'userpw123', 'nick123', 'M', '60-69', 0, 'userid123@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid124', 'userpw124', 'nick124', 'F', '70-79', 0, 'userid124@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid125', 'userpw125', 'nick125', 'M', '80-89', 0, 'userid125@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid126', 'userpw126', 'nick126', 'F', '90-99', 0, 'userid126@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid127', 'userpw127', 'nick127', 'M', '10-19', 0, 'userid127@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid128', 'userpw128', 'nick128', 'F', '20-29', 0, 'userid128@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid129', 'userpw129', 'nick129', 'M', '30-39', 0, 'userid129@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid130', 'userpw130', 'nick130', 'F', '40-49', 0, 'userid130@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid131', 'userpw131', 'nick131', 'M', '50-59', 0, 'userid131@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid132', 'userpw132', 'nick132', 'F', '60-69', 0, 'userid132@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid133', 'userpw133', 'nick133', 'M', '70-79', 0, 'userid133@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid134', 'userpw134', 'nick134', 'F', '80-89', 0, 'userid134@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid135', 'userpw135', 'nick135', 'M', '90-99', 0, 'userid135@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid136', 'userpw136', 'nick136', 'F', '10-19', 0, 'userid136@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid137', 'userpw137', 'nick137', 'M', '20-29', 0, 'userid137@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid138', 'userpw138', 'nick138', 'F', '30-39', 0, 'userid138@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid139', 'userpw139', 'nick139', 'M', '40-49', 0, 'userid139@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid140', 'userpw140', 'nick140', 'F', '50-59', 0, 'userid140@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid141', 'userpw141', 'nick141', 'M', '60-69', 0, 'userid141@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid142', 'userpw142', 'nick142', 'F', '70-79', 0, 'userid142@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid143', 'userpw143', 'nick143', 'M', '80-89', 0, 'userid143@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid144', 'userpw144', 'nick144', 'F', '90-99', 0, 'userid144@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid145', 'userpw145', 'nick145', 'M', '10-19', 0, 'userid145@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid146', 'userpw146', 'nick146', 'F', '20-29', 0, 'userid146@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid147', 'userpw147', 'nick147', 'M', '30-39', 0, 'userid147@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid148', 'userpw148', 'nick148', 'F', '40-49', 0, 'userid148@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid149', 'userpw149', 'nick149', 'M', '50-59', 0, 'userid149@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid150', 'userpw150', 'nick150', 'F', '60-69', 0, 'userid150@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid151', 'userpw151', 'nick151', 'M', '70-79', 0, 'userid151@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid152', 'userpw152', 'nick152', 'F', '80-89', 0, 'userid152@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid153', 'userpw153', 'nick153', 'M', '90-99', 0, 'userid153@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid154', 'userpw154', 'nick154', 'F', '10-19', 0, 'userid154@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid155', 'userpw155', 'nick155', 'M', '20-29', 0, 'userid155@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid156', 'userpw156', 'nick156', 'F', '30-39', 0, 'userid156@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid157', 'userpw157', 'nick157', 'M', '40-49', 0, 'userid157@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid158', 'userpw158', 'nick158', 'F', '50-59', 0, 'userid158@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid159', 'userpw159', 'nick159', 'M', '60-69', 0, 'userid159@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid160', 'userpw160', 'nick160', 'F', '70-79', 0, 'userid160@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid161', 'userpw161', 'nick161', 'M', '80-89', 0, 'userid161@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid162', 'userpw162', 'nick162', 'F', '90-99', 0, 'userid162@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid163', 'userpw163', 'nick163', 'M', '10-19', 0, 'userid163@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid164', 'userpw164', 'nick164', 'F', '20-29', 0, 'userid164@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid165', 'userpw165', 'nick165', 'M', '30-39', 0, 'userid165@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid166', 'userpw166', 'nick166', 'F', '40-49', 0, 'userid166@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid167', 'userpw167', 'nick167', 'M', '50-59', 0, 'userid167@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid168', 'userpw168', 'nick168', 'F', '60-69', 0, 'userid168@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid169', 'userpw169', 'nick169', 'M', '70-79', 0, 'userid169@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid170', 'userpw170', 'nick170', 'F', '80-89', 0, 'userid170@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid171', 'userpw171', 'nick171', 'M', '90-99', 0, 'userid171@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid172', 'userpw172', 'nick172', 'F', '10-19', 0, 'userid172@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid173', 'userpw173', 'nick173', 'M', '20-29', 0, 'userid173@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid174', 'userpw174', 'nick174', 'F', '30-39', 0, 'userid174@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid175', 'userpw175', 'nick175', 'M', '40-49', 0, 'userid175@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid176', 'userpw176', 'nick176', 'F', '50-59', 0, 'userid176@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid177', 'userpw177', 'nick177', 'M', '60-69', 0, 'userid177@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid178', 'userpw178', 'nick178', 'F', '70-79', 0, 'userid178@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid179', 'userpw179', 'nick179', 'M', '80-89', 0, 'userid179@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid180', 'userpw180', 'nick180', 'F', '90-99', 0, 'userid180@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid181', 'userpw181', 'nick181', 'M', '10-19', 0, 'userid181@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid182', 'userpw182', 'nick182', 'F', '20-29', 0, 'userid182@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid183', 'userpw183', 'nick183', 'M', '30-39', 0, 'userid183@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid184', 'userpw184', 'nick184', 'F', '40-49', 0, 'userid184@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid185', 'userpw185', 'nick185', 'M', '50-59', 0, 'userid185@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid186', 'userpw186', 'nick186', 'F', '60-69', 0, 'userid186@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid187', 'userpw187', 'nick187', 'M', '70-79', 0, 'userid187@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid188', 'userpw188', 'nick188', 'F', '80-89', 0, 'userid188@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid189', 'userpw189', 'nick189', 'M', '90-99', 0, 'userid189@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid190', 'userpw190', 'nick190', 'F', '10-19', 0, 'userid190@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid191', 'userpw191', 'nick191', 'M', '20-29', 0, 'userid191@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid192', 'userpw192', 'nick192', 'F', '30-39', 0, 'userid192@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid193', 'userpw193', 'nick193', 'M', '40-49', 0, 'userid193@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid194', 'userpw194', 'nick194', 'F', '50-59', 0, 'userid194@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid195', 'userpw195', 'nick195', 'M', '60-69', 0, 'userid195@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid196', 'userpw196', 'nick196', 'F', '70-79', 0, 'userid196@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid197', 'userpw197', 'nick197', 'M', '80-89', 0, 'userid197@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid198', 'userpw198', 'nick198', 'F', '90-99', 0, 'userid198@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid199', 'userpw199', 'nick199', 'M', '10-19', 0, 'userid199@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid200', 'userpw200', 'nick200', 'F', '20-29', 0, 'userid200@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid201', 'userpw201', 'nick201', 'M', '30-39', 0, 'userid201@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid202', 'userpw202', 'nick202', 'F', '40-49', 0, 'userid202@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid203', 'userpw203', 'nick203', 'M', '50-59', 0, 'userid203@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid204', 'userpw204', 'nick204', 'F', '60-69', 0, 'userid204@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid205', 'userpw205', 'nick205', 'M', '70-79', 0, 'userid205@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid206', 'userpw206', 'nick206', 'F', '80-89', 0, 'userid206@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid207', 'userpw207', 'nick207', 'M', '90-99', 0, 'userid207@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid208', 'userpw208', 'nick208', 'F', '10-19', 0, 'userid208@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid209', 'userpw209', 'nick209', 'M', '20-29', 0, 'userid209@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid210', 'userpw210', 'nick210', 'F', '30-39', 0, 'userid210@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid211', 'userpw211', 'nick211', 'M', '40-49', 0, 'userid211@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid212', 'userpw212', 'nick212', 'F', '50-59', 0, 'userid212@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid213', 'userpw213', 'nick213', 'M', '60-69', 0, 'userid213@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid214', 'userpw214', 'nick214', 'F', '70-79', 0, 'userid214@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid215', 'userpw215', 'nick215', 'M', '80-89', 0, 'userid215@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid216', 'userpw216', 'nick216', 'F', '90-99', 0, 'userid216@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid217', 'userpw217', 'nick217', 'M', '10-19', 0, 'userid217@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid218', 'userpw218', 'nick218', 'F', '20-29', 0, 'userid218@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid219', 'userpw219', 'nick219', 'M', '30-39', 0, 'userid219@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid220', 'userpw220', 'nick220', 'F', '40-49', 0, 'userid220@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid221', 'userpw221', 'nick221', 'M', '50-59', 0, 'userid221@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid222', 'userpw222', 'nick222', 'F', '60-69', 0, 'userid222@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid223', 'userpw223', 'nick223', 'M', '70-79', 0, 'userid223@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid224', 'userpw224', 'nick224', 'F', '80-89', 0, 'userid224@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid225', 'userpw225', 'nick225', 'M', '90-99', 0, 'userid225@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid226', 'userpw226', 'nick226', 'F', '10-19', 0, 'userid226@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid227', 'userpw227', 'nick227', 'M', '20-29', 0, 'userid227@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid228', 'userpw228', 'nick228', 'F', '30-39', 0, 'userid228@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid229', 'userpw229', 'nick229', 'M', '40-49', 0, 'userid229@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid230', 'userpw230', 'nick230', 'F', '50-59', 0, 'userid230@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid231', 'userpw231', 'nick231', 'M', '60-69', 0, 'userid231@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid232', 'userpw232', 'nick232', 'F', '70-79', 0, 'userid232@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid233', 'userpw233', 'nick233', 'M', '80-89', 0, 'userid233@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid234', 'userpw234', 'nick234', 'F', '90-99', 0, 'userid234@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid235', 'userpw235', 'nick235', 'M', '10-19', 0, 'userid235@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid236', 'userpw236', 'nick236', 'F', '20-29', 0, 'userid236@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid237', 'userpw237', 'nick237', 'M', '30-39', 0, 'userid237@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid238', 'userpw238', 'nick238', 'F', '40-49', 0, 'userid238@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid239', 'userpw239', 'nick239', 'M', '50-59', 0, 'userid239@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid240', 'userpw240', 'nick240', 'F', '60-69', 0, 'userid240@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid241', 'userpw241', 'nick241', 'M', '70-79', 0, 'userid241@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid242', 'userpw242', 'nick242', 'F', '80-89', 0, 'userid242@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid243', 'userpw243', 'nick243', 'M', '90-99', 0, 'userid243@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid244', 'userpw244', 'nick244', 'F', '10-19', 0, 'userid244@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid245', 'userpw245', 'nick245', 'M', '20-29', 0, 'userid245@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid246', 'userpw246', 'nick246', 'F', '30-39', 0, 'userid246@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid247', 'userpw247', 'nick247', 'M', '40-49', 0, 'userid247@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid248', 'userpw248', 'nick248', 'F', '50-59', 0, 'userid248@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid249', 'userpw249', 'nick249', 'M', '60-69', 0, 'userid249@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid250', 'userpw250', 'nick250', 'F', '70-79', 0, 'userid250@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid251', 'userpw251', 'nick251', 'M', '80-89', 0, 'userid251@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid252', 'userpw252', 'nick252', 'F', '90-99', 0, 'userid252@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid253', 'userpw253', 'nick253', 'M', '10-19', 0, 'userid253@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid254', 'userpw254', 'nick254', 'F', '20-29', 0, 'userid254@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid255', 'userpw255', 'nick255', 'M', '30-39', 0, 'userid255@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid256', 'userpw256', 'nick256', 'F', '40-49', 0, 'userid256@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid257', 'userpw257', 'nick257', 'M', '50-59', 0, 'userid257@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid258', 'userpw258', 'nick258', 'F', '60-69', 0, 'userid258@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid259', 'userpw259', 'nick259', 'M', '70-79', 0, 'userid259@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid260', 'userpw260', 'nick260', 'F', '80-89', 0, 'userid260@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid261', 'userpw261', 'nick261', 'M', '90-99', 0, 'userid261@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid262', 'userpw262', 'nick262', 'F', '10-19', 0, 'userid262@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid263', 'userpw263', 'nick263', 'M', '20-29', 0, 'userid263@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid264', 'userpw264', 'nick264', 'F', '30-39', 0, 'userid264@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid265', 'userpw265', 'nick265', 'M', '40-49', 0, 'userid265@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid266', 'userpw266', 'nick266', 'F', '50-59', 0, 'userid266@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid267', 'userpw267', 'nick267', 'M', '60-69', 0, 'userid267@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid268', 'userpw268', 'nick268', 'F', '70-79', 0, 'userid268@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid269', 'userpw269', 'nick269', 'M', '80-89', 0, 'userid269@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid270', 'userpw270', 'nick270', 'F', '90-99', 0, 'userid270@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid271', 'userpw271', 'nick271', 'M', '10-19', 0, 'userid271@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid272', 'userpw272', 'nick272', 'F', '20-29', 0, 'userid272@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid273', 'userpw273', 'nick273', 'M', '30-39', 0, 'userid273@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid274', 'userpw274', 'nick274', 'F', '40-49', 0, 'userid274@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid275', 'userpw275', 'nick275', 'M', '50-59', 0, 'userid275@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid276', 'userpw276', 'nick276', 'F', '60-69', 0, 'userid276@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid277', 'userpw277', 'nick277', 'M', '70-79', 0, 'userid277@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid278', 'userpw278', 'nick278', 'F', '80-89', 0, 'userid278@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid279', 'userpw279', 'nick279', 'M', '90-99', 0, 'userid279@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid280', 'userpw280', 'nick280', 'F', '10-19', 0, 'userid280@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid281', 'userpw281', 'nick281', 'M', '20-29', 0, 'userid281@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid282', 'userpw282', 'nick282', 'F', '30-39', 0, 'userid282@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid283', 'userpw283', 'nick283', 'M', '40-49', 0, 'userid283@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid284', 'userpw284', 'nick284', 'F', '50-59', 0, 'userid284@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid285', 'userpw285', 'nick285', 'M', '60-69', 0, 'userid285@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid286', 'userpw286', 'nick286', 'F', '70-79', 0, 'userid286@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid287', 'userpw287', 'nick287', 'M', '80-89', 0, 'userid287@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid288', 'userpw288', 'nick288', 'F', '90-99', 0, 'userid288@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid289', 'userpw289', 'nick289', 'M', '10-19', 0, 'userid289@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid290', 'userpw290', 'nick290', 'F', '20-29', 0, 'userid290@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid291', 'userpw291', 'nick291', 'M', '30-39', 0, 'userid291@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid292', 'userpw292', 'nick292', 'F', '40-49', 0, 'userid292@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid293', 'userpw293', 'nick293', 'M', '50-59', 0, 'userid293@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid294', 'userpw294', 'nick294', 'F', '60-69', 0, 'userid294@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid295', 'userpw295', 'nick295', 'M', '70-79', 0, 'userid295@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid296', 'userpw296', 'nick296', 'F', '80-89', 0, 'userid296@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid297', 'userpw297', 'nick297', 'M', '90-99', 0, 'userid297@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid298', 'userpw298', 'nick298', 'F', '10-19', 0, 'userid298@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid299', 'userpw299', 'nick299', 'M', '20-29', 0, 'userid299@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid300', 'userpw300', 'nick300', 'F', '30-39', 0, 'userid300@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid301', 'userpw301', 'nick301', 'M', '40-49', 0, 'userid301@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid302', 'userpw302', 'nick302', 'F', '50-59', 0, 'userid302@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid303', 'userpw303', 'nick303', 'M', '60-69', 0, 'userid303@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid304', 'userpw304', 'nick304', 'F', '70-79', 0, 'userid304@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid305', 'userpw305', 'nick305', 'M', '80-89', 0, 'userid305@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid306', 'userpw306', 'nick306', 'F', '90-99', 0, 'userid306@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid307', 'userpw307', 'nick307', 'M', '10-19', 0, 'userid307@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid308', 'userpw308', 'nick308', 'F', '20-29', 0, 'userid308@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid309', 'userpw309', 'nick309', 'M', '30-39', 0, 'userid309@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid310', 'userpw310', 'nick310', 'F', '40-49', 0, 'userid310@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid311', 'userpw311', 'nick311', 'M', '50-59', 0, 'userid311@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid312', 'userpw312', 'nick312', 'F', '60-69', 0, 'userid312@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid313', 'userpw313', 'nick313', 'M', '70-79', 0, 'userid313@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid314', 'userpw314', 'nick314', 'F', '80-89', 0, 'userid314@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid315', 'userpw315', 'nick315', 'M', '90-99', 0, 'userid315@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid316', 'userpw316', 'nick316', 'F', '10-19', 0, 'userid316@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid317', 'userpw317', 'nick317', 'M', '20-29', 0, 'userid317@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid318', 'userpw318', 'nick318', 'F', '30-39', 0, 'userid318@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid319', 'userpw319', 'nick319', 'M', '40-49', 0, 'userid319@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid320', 'userpw320', 'nick320', 'F', '50-59', 0, 'userid320@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid321', 'userpw321', 'nick321', 'M', '60-69', 0, 'userid321@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid322', 'userpw322', 'nick322', 'F', '70-79', 0, 'userid322@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid323', 'userpw323', 'nick323', 'M', '80-89', 0, 'userid323@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid324', 'userpw324', 'nick324', 'F', '90-99', 0, 'userid324@a.com',1);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid325', 'userpw325', 'nick325', 'M', '10-19', 0, 'userid325@a.com',2);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid326', 'userpw326', 'nick326', 'F', '20-29', 0, 'userid326@a.com',1);


insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid327', 'userpw327', 'nick327', 'M', '30-39', 10, 'userid327@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid328', 'userpw328', 'nick328', 'F', '40-49', 10, 'userid328@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid329', 'userpw329', 'nick329', 'M', '50-59', 10, 'userid329@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid330', 'userpw330', 'nick330', 'F', '60-69', 10, 'userid330@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid331', 'userpw331', 'nick331', 'M', '70-79', 10, 'userid331@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid332', 'userpw332', 'nick332', 'F', '80-89', 10, 'userid332@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid333', 'userpw333', 'nick333', 'M', '90-99', 10, 'userid333@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid334', 'userpw334', 'nick334', 'F', '10-19', 10, 'userid334@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid335', 'userpw335', 'nick335', 'M', '20-29', 10, 'userid335@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid336', 'userpw336', 'nick336', 'F', '30-39', 10, 'userid336@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid337', 'userpw337', 'nick337', 'M', '40-49', 10, 'userid337@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid338', 'userpw338', 'nick338', 'F', '50-59', 10, 'userid338@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid339', 'userpw339', 'nick339', 'M', '60-69', 10, 'userid339@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid340', 'userpw340', 'nick340', 'F', '70-79', 10, 'userid340@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid341', 'userpw341', 'nick341', 'M', '80-89', 10, 'userid341@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid342', 'userpw342', 'nick342', 'F', '90-99', 10, 'userid342@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid343', 'userpw343', 'nick343', 'M', '10-19', 10, 'userid343@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid344', 'userpw344', 'nick344', 'F', '20-29', 10, 'userid344@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid345', 'userpw345', 'nick345', 'M', '30-39', 10, 'userid345@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid346', 'userpw346', 'nick346', 'F', '40-49', 10, 'userid346@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid347', 'userpw347', 'nick347', 'M', '50-59', 10, 'userid347@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid348', 'userpw348', 'nick348', 'F', '60-69', 10, 'userid348@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid349', 'userpw349', 'nick349', 'M', '70-79', 10, 'userid349@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid350', 'userpw350', 'nick350', 'F', '80-89', 10, 'userid350@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid351', 'userpw351', 'nick351', 'M', '90-99', 10, 'userid351@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid352', 'userpw352', 'nick352', 'F', '10-19', 10, 'userid352@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid353', 'userpw353', 'nick353', 'M', '20-29', 10, 'userid353@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid354', 'userpw354', 'nick354', 'F', '30-39', 10, 'userid354@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid355', 'userpw355', 'nick355', 'M', '40-49', 10, 'userid355@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid356', 'userpw356', 'nick356', 'F', '50-59', 10, 'userid356@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid357', 'userpw357', 'nick357', 'M', '60-69', 10, 'userid357@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid358', 'userpw358', 'nick358', 'F', '70-79', 10, 'userid358@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid359', 'userpw359', 'nick359', 'M', '80-89', 10, 'userid359@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid360', 'userpw360', 'nick360', 'F', '90-99', 10, 'userid360@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid361', 'userpw361', 'nick361', 'M', '10-19', 10, 'userid361@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid362', 'userpw362', 'nick362', 'F', '20-29', 10, 'userid362@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid363', 'userpw363', 'nick363', 'M', '30-39', 10, 'userid363@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid364', 'userpw364', 'nick364', 'F', '40-49', 10, 'userid364@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid365', 'userpw365', 'nick365', 'M', '50-59', 10, 'userid365@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid366', 'userpw366', 'nick366', 'F', '60-69', 10, 'userid366@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid367', 'userpw367', 'nick367', 'M', '70-79', 10, 'userid367@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid368', 'userpw368', 'nick368', 'F', '80-89', 10, 'userid368@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid369', 'userpw369', 'nick369', 'M', '90-99', 10, 'userid369@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid370', 'userpw370', 'nick370', 'F', '10-19', 10, 'userid370@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid371', 'userpw371', 'nick371', 'M', '20-29', 10, 'userid371@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid372', 'userpw372', 'nick372', 'F', '30-39', 10, 'userid372@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid373', 'userpw373', 'nick373', 'M', '40-49', 10, 'userid373@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid374', 'userpw374', 'nick374', 'F', '50-59', 10, 'userid374@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid375', 'userpw375', 'nick375', 'M', '60-69', 10, 'userid375@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid376', 'userpw376', 'nick376', 'F', '70-79', 10, 'userid376@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid377', 'userpw377', 'nick377', 'M', '80-89', 10, 'userid377@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid378', 'userpw378', 'nick378', 'F', '90-99', 10, 'userid378@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid379', 'userpw379', 'nick379', 'M', '10-19', 10, 'userid379@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid380', 'userpw380', 'nick380', 'F', '20-29', 10, 'userid380@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid381', 'userpw381', 'nick381', 'M', '30-39', 10, 'userid381@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid382', 'userpw382', 'nick382', 'F', '40-49', 10, 'userid382@a.com',3);
insert into tb_user2(user_id, user_pw, user_nick, user_gender, user_age, user_blockcnt, user_email, user_grade) values('userid383', 'userpw383', 'nick383', 'M', '50-59', 10, 'userid383@a.com',3);


commit;

SELECT * FROM TB_USER2
order by user_no asc;

--�Ű� ���̺�
select * from tb_userreport2
order by user_no asc;
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(300, sysdate + (1/24/60/60)*20, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(301, sysdate + (1/24/60/60)*21, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(302, sysdate + (1/24/60/60)*22, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(303, sysdate + (1/24/60/60)*23, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(304, sysdate + (1/24/60/60)*24, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(305, sysdate + (1/24/60/60)*25, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(306, sysdate + (1/24/60/60)*26, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(307, sysdate + (1/24/60/60)*27, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(308, sysdate + (1/24/60/60)*28, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(309, sysdate + (1/24/60/60)*29, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(310, sysdate + (1/24/60/60)*30, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(311, sysdate + (1/24/60/60)*31, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(312, sysdate + (1/24/60/60)*32, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(313, sysdate + (1/24/60/60)*33, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(314, sysdate + (1/24/60/60)*34, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(315, sysdate + (1/24/60/60)*35, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(316, sysdate + (1/24/60/60)*36, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(317, sysdate + (1/24/60/60)*37, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(318, sysdate + (1/24/60/60)*38, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(319, sysdate + (1/24/60/60)*39, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(320, sysdate + (1/24/60/60)*40, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(321, sysdate + (1/24/60/60)*41, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(322, sysdate + (1/24/60/60)*42, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(323, sysdate + (1/24/60/60)*43, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(324, sysdate + (1/24/60/60)*44, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(325, sysdate + (1/24/60/60)*45, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(326, sysdate + (1/24/60/60)*46, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(300, sysdate + (1/24/60/60)*47, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(301, sysdate + (1/24/60/60)*48, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(302, sysdate + (1/24/60/60)*49, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(303, sysdate + (1/24/60/60)*50, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(304, sysdate + (1/24/60/60)*51, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(305, sysdate + (1/24/60/60)*52, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(306, sysdate + (1/24/60/60)*53, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(307, sysdate + (1/24/60/60)*54, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(308, sysdate + (1/24/60/60)*55, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(309, sysdate + (1/24/60/60)*56, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(310, sysdate + (1/24/60/60)*57, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(311, sysdate + (1/24/60/60)*58, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(312, sysdate + (1/24/60/60)*59, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(313, sysdate + (1/24/60/60)*60, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(314, sysdate + (1/24/60/60)*61, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(315, sysdate + (1/24/60/60)*62, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(316, sysdate + (1/24/60/60)*63, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(317, sysdate + (1/24/60/60)*64, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(318, sysdate + (1/24/60/60)*65, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(319, sysdate + (1/24/60/60)*66, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(320, sysdate + (1/24/60/60)*67, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(321, sysdate + (1/24/60/60)*68, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(322, sysdate + (1/24/60/60)*69, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(323, sysdate + (1/24/60/60)*70, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(324, sysdate + (1/24/60/60)*71, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(325, sysdate + (1/24/60/60)*72, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(326, sysdate + (1/24/60/60)*73, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(300, sysdate + (1/24/60/60)*74, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(301, sysdate + (1/24/60/60)*75, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(302, sysdate + (1/24/60/60)*76, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(303, sysdate + (1/24/60/60)*77, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(304, sysdate + (1/24/60/60)*78, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(305, sysdate + (1/24/60/60)*79, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(306, sysdate + (1/24/60/60)*80, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(307, sysdate + (1/24/60/60)*81, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(308, sysdate + (1/24/60/60)*82, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(309, sysdate + (1/24/60/60)*83, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(310, sysdate + (1/24/60/60)*84, 1, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(311, sysdate + (1/24/60/60)*85, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(312, sysdate + (1/24/60/60)*86, 3, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(313, sysdate + (1/24/60/60)*87, 2, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(314, sysdate + (1/24/60/60)*88, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(315, sysdate + (1/24/60/60)*89, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(316, sysdate + (1/24/60/60)*90, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(317, sysdate + (1/24/60/60)*91, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(318, sysdate + (1/24/60/60)*92, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(319, sysdate + (1/24/60/60)*93, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(320, sysdate + (1/24/60/60)*94, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(321, sysdate + (1/24/60/60)*95, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(322, sysdate + (1/24/60/60)*96, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(323, sysdate + (1/24/60/60)*97, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(324, sysdate + (1/24/60/60)*98, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(325, sysdate + (1/24/60/60)*99, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(326, sysdate + (1/24/60/60)*100, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(300, sysdate + (1/24/60/60)*101, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(301, sysdate + (1/24/60/60)*102, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(302, sysdate + (1/24/60/60)*103, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(303, sysdate + (1/24/60/60)*104, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(304, sysdate + (1/24/60/60)*105, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(305, sysdate + (1/24/60/60)*106, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(306, sysdate + (1/24/60/60)*107, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(307, sysdate + (1/24/60/60)*108, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(308, sysdate + (1/24/60/60)*109, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(309, sysdate + (1/24/60/60)*110, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(310, sysdate + (1/24/60/60)*111, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(311, sysdate + (1/24/60/60)*112, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(312, sysdate + (1/24/60/60)*113, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(313, sysdate + (1/24/60/60)*114, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(314, sysdate + (1/24/60/60)*115, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(315, sysdate + (1/24/60/60)*116, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(316, sysdate + (1/24/60/60)*117, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(317, sysdate + (1/24/60/60)*118, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(318, sysdate + (1/24/60/60)*119, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(319, sysdate + (1/24/60/60)*120, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(320, sysdate + (1/24/60/60)*121, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(321, sysdate + (1/24/60/60)*122, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(322, sysdate + (1/24/60/60)*123, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(323, sysdate + (1/24/60/60)*124, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(324, sysdate + (1/24/60/60)*125, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(325, sysdate + (1/24/60/60)*126, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(326, sysdate + (1/24/60/60)*127, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(300, sysdate + (1/24/60/60)*128, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(301, sysdate + (1/24/60/60)*129, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(302, sysdate + (1/24/60/60)*130, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(303, sysdate + (1/24/60/60)*131, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(304, sysdate + (1/24/60/60)*132, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(305, sysdate + (1/24/60/60)*133, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(306, sysdate + (1/24/60/60)*134, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(307, sysdate + (1/24/60/60)*135, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(308, sysdate + (1/24/60/60)*136, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(309, sysdate + (1/24/60/60)*137, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(310, sysdate + (1/24/60/60)*138, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(311, sysdate + (1/24/60/60)*139, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(312, sysdate + (1/24/60/60)*140, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(313, sysdate + (1/24/60/60)*141, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(314, sysdate + (1/24/60/60)*142, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(315, sysdate + (1/24/60/60)*143, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(316, sysdate + (1/24/60/60)*144, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(317, sysdate + (1/24/60/60)*145, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(318, sysdate + (1/24/60/60)*146, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(319, sysdate + (1/24/60/60)*147, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(320, sysdate + (1/24/60/60)*148, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(321, sysdate + (1/24/60/60)*149, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(322, sysdate + (1/24/60/60)*150, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(323, sysdate + (1/24/60/60)*151, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(324, sysdate + (1/24/60/60)*152, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(325, sysdate + (1/24/60/60)*153, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(326, sysdate + (1/24/60/60)*154, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(300, sysdate + (1/24/60/60)*155, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(301, sysdate + (1/24/60/60)*156, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(302, sysdate + (1/24/60/60)*157, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(303, sysdate + (1/24/60/60)*158, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(304, sysdate + (1/24/60/60)*159, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(305, sysdate + (1/24/60/60)*160, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(306, sysdate + (1/24/60/60)*161, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(307, sysdate + (1/24/60/60)*162, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(308, sysdate + (1/24/60/60)*163, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(309, sysdate + (1/24/60/60)*164, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(310, sysdate + (1/24/60/60)*165, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(311, sysdate + (1/24/60/60)*166, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(312, sysdate + (1/24/60/60)*167, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(313, sysdate + (1/24/60/60)*168, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(314, sysdate + (1/24/60/60)*169, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(315, sysdate + (1/24/60/60)*170, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(316, sysdate + (1/24/60/60)*171, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(317, sysdate + (1/24/60/60)*172, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(318, sysdate + (1/24/60/60)*173, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(319, sysdate + (1/24/60/60)*174, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(320, sysdate + (1/24/60/60)*175, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(321, sysdate + (1/24/60/60)*176, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(322, sysdate + (1/24/60/60)*177, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(323, sysdate + (1/24/60/60)*178, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(324, sysdate + (1/24/60/60)*179, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(325, sysdate + (1/24/60/60)*180, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(326, sysdate + (1/24/60/60)*181, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(300, sysdate + (1/24/60/60)*182, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(301, sysdate + (1/24/60/60)*183, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(302, sysdate + (1/24/60/60)*184, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(303, sysdate + (1/24/60/60)*185, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(304, sysdate + (1/24/60/60)*186, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(305, sysdate + (1/24/60/60)*187, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(306, sysdate + (1/24/60/60)*188, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(307, sysdate + (1/24/60/60)*189, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(308, sysdate + (1/24/60/60)*190, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(309, sysdate + (1/24/60/60)*191, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(310, sysdate + (1/24/60/60)*192, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(311, sysdate + (1/24/60/60)*193, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(312, sysdate + (1/24/60/60)*194, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(313, sysdate + (1/24/60/60)*195, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(314, sysdate + (1/24/60/60)*196, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(315, sysdate + (1/24/60/60)*197, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(316, sysdate + (1/24/60/60)*198, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(317, sysdate + (1/24/60/60)*199, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(318, sysdate + (1/24/60/60)*200, 1,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(319, sysdate + (1/24/60/60)*201, 2,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(320, sysdate + (1/24/60/60)*202, 3,null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(321, sysdate + (1/24/60/60)*203, 4, null, 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(322, sysdate + (1/24/60/60)*204, 5, 'test', 0);
insert into tb_userreport2 (user_no, report_time, reason_no, report_content, is_processed) values(323, sysdate + (1/24/60/60)*205, 1,null, 0);

select * from tb_userreport2
order by report_time desc;

select * from tb_user2;

--�Ű�ó�� ���̵�����
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(327,sysdate + (1/24/60/60)*20, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(328,sysdate + (1/24/60/60)*21, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(329,sysdate + (1/24/60/60)*22, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(330,sysdate + (1/24/60/60)*23, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(331,sysdate + (1/24/60/60)*24, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(332,sysdate + (1/24/60/60)*25, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(333,sysdate + (1/24/60/60)*26, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(334,sysdate + (1/24/60/60)*27, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(335,sysdate + (1/24/60/60)*28, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(336,sysdate + (1/24/60/60)*29, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(337,sysdate + (1/24/60/60)*30, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(338,sysdate + (1/24/60/60)*31, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(339,sysdate + (1/24/60/60)*32, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(340,sysdate + (1/24/60/60)*33, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(341,sysdate + (1/24/60/60)*34, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(342,sysdate + (1/24/60/60)*35, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(343,sysdate + (1/24/60/60)*36, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(344,sysdate + (1/24/60/60)*37, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(345,sysdate + (1/24/60/60)*38, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(346,sysdate + (1/24/60/60)*39, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(347,sysdate + (1/24/60/60)*40, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(348,sysdate + (1/24/60/60)*41, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(349,sysdate + (1/24/60/60)*42, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(350,sysdate + (1/24/60/60)*43, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(351,sysdate + (1/24/60/60)*44, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(352,sysdate + (1/24/60/60)*45, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(353,sysdate + (1/24/60/60)*46, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(354,sysdate + (1/24/60/60)*47, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(355,sysdate + (1/24/60/60)*48, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(356,sysdate + (1/24/60/60)*49, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(357,sysdate + (1/24/60/60)*50, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(358,sysdate + (1/24/60/60)*51, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(359,sysdate + (1/24/60/60)*52, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(360,sysdate + (1/24/60/60)*53, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(361,sysdate + (1/24/60/60)*54, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(362,sysdate + (1/24/60/60)*55, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(363,sysdate + (1/24/60/60)*56, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(364,sysdate + (1/24/60/60)*57, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(365,sysdate + (1/24/60/60)*58, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(366,sysdate + (1/24/60/60)*59, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(367,sysdate + (1/24/60/60)*60, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(368,sysdate + (1/24/60/60)*61, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(369,sysdate + (1/24/60/60)*62, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(370,sysdate + (1/24/60/60)*63, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(371,sysdate + (1/24/60/60)*64, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(372,sysdate + (1/24/60/60)*65, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(373,sysdate + (1/24/60/60)*66, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(374,sysdate + (1/24/60/60)*67, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(375,sysdate + (1/24/60/60)*68, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(376,sysdate + (1/24/60/60)*69, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(377,sysdate + (1/24/60/60)*70, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(378,sysdate + (1/24/60/60)*71, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(379,sysdate + (1/24/60/60)*72, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(380,sysdate + (1/24/60/60)*73, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(381,sysdate + (1/24/60/60)*74, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(382,sysdate + (1/24/60/60)*75, 1);
insert into tb_resultreport2 (user_no, report_result_date, report_result_detail_no) values(383,sysdate + (1/24/60/60)*76, 1);



select * from tb_resultreport2;
commit;


--�Խñ� ���̵�����
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'�����ǳ��� ������Բ��� ��Ƽ����',' ���� Ȳ�ݽô��� �츮 ���� ���̴�. ���ҳ⿡�Լ� �� �𷡻��� �󸶳� ���� ã�� ǰ����, ������? ������ ���踦 ������ �̻� �ٸ� �ǰ� ���ٶ��̴�. ������ ��ī�ο쳪 ��°� �縷�̴�. ������ �����Ѵ� �׵��� ���� ���̴�. ������ û���� �ִ� ���� ���ϱ� �밨�ϰ� ������ ưư�ϸ�, ���ٶ��̴�. �ǰ� �����̽��� Ǯ�� �Ǵ�. Ŀ�ٶ� Ȳ�ݽô��� �Ƹ���� ���� �츮 ����� ���Ͽ�, �̰��̴�. ���̴� �� ��� �� �׷��Ƿ� ������ �׵��� �ൿ�ϴ�. �׵��� ������ Ʈ��, ���ٶ��� ���ڴ� �󸶳� ���� ������ �ǿ� ���ִ�. �η��� �ƴϴ���, ���ϱ� �ູ������ �̰��̴�.
û���� �λ��� �󸶳� ���� ���̴� ���Ͽ���, �� ������ ��ī�ο쳪 ��´�. �̰��̾߸��� ������ ������ ������ �׸��ڴ� õ���� �׵��� Į�̴�. Ȳ�ݽô븦 ������, �츮�� �̻� ũ�� ������ ���л��̴�. �� ������ ǰ����, �Ǵ� û���� ��ġ�� �縷�̴�. ���ڴ� Ǯ�� �߰ſ�����, �ΰ��� Ǯ�翡 ���� �ڽŰ� ���. ���� ���� ���Ͽ� �׷��Ƿ� ���� û���� �縷�̴�. â���� �׸��ڴ� ������ �𷡻��� Ǯ�� �׸��Ͽ��°�? �� ���� �ڽŰ� �Ҿ� ���̴� �������̸�, ��Ȳ�Ͽ�����, ������ �ൿ�ϴ�. ���꿡�� ���� ����� ������ ���� �׵��� �ൿ�ϴ�. ������ ������ ������ �縷�̴�.
�ູ������ ���� �׵鿡�� �� ���꿡�� ���Ͽ���, �縷�̴�. �����ϰ� �׵��� ���� ���ٶ��̴�. ���̸�, �ξ�, �װ��� �Ƹ��ٿ��? �׸��ڴ� �η��� �� Ǯ�� �׸��Ͽ��°�? ������ ������ �츮�� ���� ���Ͽ�, �ǰ� Ŀ�ٶ� ������ ���� �ƴϴ�. ��� ���ϱ� ���� ���ٶ��� �׸��Ͽ��°�? �츮 ������ �̴� �� �縷�̴�. ����� �̻��� ���� ��� õ�ϸ� �Ǵ�. ������ ���̴�.����, �̴� �� ���´�. ���� �°� ����, ���̴�. ������ ������ �װ��� ������ ���̴�.', 3,'��õ',88,
to_date('2020-4-24 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,171,to_date('2020-01-06 1200', 'YYYY-MM-DDHH24MI'));

INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'���޿� �߰������Ƽ�Ͻ� ��',' ���� Ȳ�ݽô��� �츮 ���� ���̴�. ���ҳ⿡�Լ� �� �𷡻��� �󸶳� ���� ã�� ǰ����, ������? ������ ���踦 ������ �̻� �ٸ� �ǰ� ���ٶ��̴�. ������ ��ī�ο쳪 ��°� �縷�̴�. ������ �����Ѵ� �׵��� ���� ���̴�. ������ û���� �ִ� ���� ���ϱ� �밨�ϰ� ������ ưư�ϸ�, ���ٶ��̴�. �ǰ� �����̽��� Ǯ�� �Ǵ�. Ŀ�ٶ� Ȳ�ݽô��� �Ƹ���� ���� �츮 ����� ���Ͽ�, �̰��̴�. ���̴� �� ��� �� �׷��Ƿ� ������ �׵��� �ൿ�ϴ�. �׵��� ������ Ʈ��, ���ٶ��� ���ڴ� �󸶳� ���� ������ �ǿ� ���ִ�. �η��� �ƴϴ���, ���ϱ� �ູ������ �̰��̴�.
û���� �λ��� �󸶳� ���� ���̴� ���Ͽ���, �� ������ ��ī�ο쳪 ��´�. �̰��̾߸��� ������ ������ ������ �׸��ڴ� õ���� �׵��� Į�̴�. Ȳ�ݽô븦 ������, �츮�� �̻� ũ�� ������ ���л��̴�. �� ������ ǰ����, �Ǵ� û���� ��ġ�� �縷�̴�. ���ڴ� Ǯ�� �߰ſ�����, �ΰ��� Ǯ�翡 ���� �ڽŰ� ���. ���� ���� ���Ͽ� �׷��Ƿ� ���� û���� �縷�̴�. â���� �׸��ڴ� ������ �𷡻��� Ǯ�� �׸��Ͽ��°�? �� ���� �ڽŰ� �Ҿ� ���̴� �������̸�, ��Ȳ�Ͽ�����, ������ �ൿ�ϴ�. ���꿡�� ���� ����� ������ ���� �׵��� �ൿ�ϴ�. ������ ������ ������ �縷�̴�.
�ູ������ ���� �׵鿡�� �� ���꿡�� ���Ͽ���, �縷�̴�. �����ϰ� �׵��� ���� ���ٶ��̴�. ���̸�, �ξ�, �װ��� �Ƹ��ٿ��? �׸��ڴ� �η��� �� Ǯ�� �׸��Ͽ��°�? ������ ������ �츮�� ���� ���Ͽ�, �ǰ� Ŀ�ٶ� ������ ���� �ƴϴ�. ��� ���ϱ� ���� ���ٶ��� �׸��Ͽ��°�? �츮 ������ �̴� �� �縷�̴�. ����� �̻��� ���� ��� õ�ϸ� �Ǵ�. ������ ���̴�.����, �̴� �� ���´�. ���� �°� ����, ���̴�. ������ ������ �װ��� ������ ���̴�.', 3,'����',236,
to_date('2020-4-8 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,11,to_date('2020-01-13 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'�ݿ��Ͽ� ŷũ������Ƽ�� ���� ��',' �� ������ ������ ����� �ƴϴ�. û�� �̰��� ���� ��´�. �󸶳� ������, õ�� ��ȭ������ �� ������, ����� ������ ��ġ�� �̰��̴�. �׵��� ���� �ǰ� ���ҳ⿡�Լ� ���̴�. �ҷ� �ִ� �׵��� ����. �������ν� ��Ⱑ �λ��� �� ������ ������ ���� �ΰ��� Ÿ������ ������̴�. Ŀ�ٶ� �̻��� ������ �ϴ� �ż��� �츮 �װ��� ���踦 ���Ͽ���. ���ٶ��� ����� ���� �Ǿ�� ����� �ƴϴ�. ������ ���߿��� �츮 ũ�� Į�̴�.
���̴�.����, �׵��� �߰ſ�����, öȯ�Ͽ��°�? �ϴ� �� �̰��� �ΰ��� ���̴�. ���� û���� ����� ������ ���� �ұ��̶� �̻��� ������ �ִ�. ������, ���� �η��� �̻��� �� ��ī�ο쳪 ưư�ϸ�, �縷�̴�. â���� �󸶳� ����� �Ǵ�. ǰ���� �׿� �Ͽ��� �밨�ϰ� �°� �ǰ� �����̽��� ���� ���̴�. ����, �ִ� ��⸸ ���� �� ���̴� ���̴�. �׵��� ǰ�� �ٷ� ��ڸ�, ������ �ʴ� ���� ������ ���ٶ��̴�. �̻�, ���ϱ� ���ϴ� ������?
����� �׸��ڴ� ��� �λ��� �׵��� Ȳ�ݽô��. �η��� �츮 �ָ�, ���� ��´�. ���и� �󸶳� â���� �����ϱ� ������ �ż��� ������ ���̴�. �ִ� ���� ������, �� ũ�� ����� �̰��̴�. �ٳ�� ������ ���� ���̸�, ������ �ΰ��� �ִ� ���� ������? ������ �� ���� ������, �λ��� �׵��� ������ �׸��Ͽ��°�? ǰ�� �ٸ� �׵��� ���� ���̴�. ����� õ�ڸ�ȫ�� �׿� Ŀ�ٶ� �ϴ� ���ִ�. ������ �λ��� ���� �װ��� õ�ϸ� �ִ°�? �Ͽ��� �ǰ� ���� ���Ͽ� �°� ���ٳ���, ������ �� ���̴�. õ���� ���� ���̴� ��� ���Ͽ��� �󸶳� �ִ� ���� ������̴�.', 3,'����',186,
to_date('2020-5-13 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,01,to_date('2020-05-29 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'�ҷ����� ������Բ� ���¿�� ��',' �� ������ ������ ����� �ƴϴ�. û�� �̰��� ���� ��´�. �󸶳� ������, õ�� ��ȭ������ �� ������, ����� ������ ��ġ�� �̰��̴�. �׵��� ���� �ǰ� ���ҳ⿡�Լ� ���̴�. �ҷ� �ִ� �׵��� ����. �������ν� ��Ⱑ �λ��� �� ������ ������ ���� �ΰ��� Ÿ������ ������̴�. Ŀ�ٶ� �̻��� ������ �ϴ� �ż��� �츮 �װ��� ���踦 ���Ͽ���. ���ٶ��� ����� ���� �Ǿ�� ����� �ƴϴ�. ������ ���߿��� �츮 ũ�� Į�̴�.
���̴�.����, �׵��� �߰ſ�����, öȯ�Ͽ��°�? �ϴ� �� �̰��� �ΰ��� ���̴�. ���� û���� ����� ������ ���� �ұ��̶� �̻��� ������ �ִ�. ������, ���� �η��� �̻��� �� ��ī�ο쳪 ưư�ϸ�, �縷�̴�. â���� �󸶳� ����� �Ǵ�. ǰ���� �׿� �Ͽ��� �밨�ϰ� �°� �ǰ� �����̽��� ���� ���̴�. ����, �ִ� ��⸸ ���� �� ���̴� ���̴�. �׵��� ǰ�� �ٷ� ��ڸ�, ������ �ʴ� ���� ������ ���ٶ��̴�. �̻�, ���ϱ� ���ϴ� ������?
����� �׸��ڴ� ��� �λ��� �׵��� Ȳ�ݽô��. �η��� �츮 �ָ�, ���� ��´�. ���и� �󸶳� â���� �����ϱ� ������ �ż��� ������ ���̴�. �ִ� ���� ������, �� ũ�� ����� �̰��̴�. �ٳ�� ������ ���� ���̸�, ������ �ΰ��� �ִ� ���� ������? ������ �� ���� ������, �λ��� �׵��� ������ �׸��Ͽ��°�? ǰ�� �ٸ� �׵��� ���� ���̴�. ����� õ�ڸ�ȫ�� �׿� Ŀ�ٶ� �ϴ� ���ִ�. ������ �λ��� ���� �װ��� õ�ϸ� �ִ°�? �Ͽ��� �ǰ� ���� ���Ͽ� �°� ���ٳ���, ������ �� ���̴�. õ���� ���� ���̴� ��� ���Ͽ��� �󸶳� �ִ� ���� ������̴�.', 3,'����',266,
to_date('2020-10-23 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,141,to_date('2020-03-12 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'�����Ͽ� ���̹�ħ���Բ��� ��Ƽ����',' ����� �츮 �׸��ڴ� �ӿ� ������ ������ ���Ͽ���. �Ҿ� ��ȭ������ �����ϴ� �Ǿ�� �̰��̴�. �Ƹ���� Ǯ�� �̹��� �λ��� �̰��̴�. �󸶳� �ǿ� ������, �Ҿ� �ұ��̶� �׵��� �׵��� �̻��� ��ȭ������ �׸��Ͽ��°�? ����� ���� ������ ���� ������ �׵��� �����̴�. Ǯ�� ������, �ٷ� �׵��� �׵鿡�� �ΰ��� ������ ��´�. ������ û���� �밨�ϰ� ����� Ȳ�ݽô븦 �ӿ� ���̴�. õ�ϸ� ����ϴ� ���Ͽ��� ���´�. ��߿� ����� �ִ� ����� �׵��� ���� �߰�, ������ ���. �ʴ� ���� ������ �̰��� ���� �ϴ� �α� �׵��� û���� ������̴�.
����� �����ϰ� ǰ���� �׵鿡�� �����Ϸ�? ����� ����� �ϴ� ������ ��ī�ο쳪 ����� ���� ��¦�̴� ��Ȳ�Ͽ�����, ����. ��Ⱑ ���Ͽ�, ������ �Ͽ�����, ������ û�� �ູ������ �� �̰��̾߸��� ���̴�. û���� ������ �������� �����ϵ� �Ƿ� ������, ���� ���� ���̴�. �Ͽ��� ����� �׵��� �׸��Ͽ��°�? ������ ���� û�� ��� ���� ���ٶ��̴�. ������ Ʈ��, ���̸�, ���� �۰� ������ �縷�̴�. û���� �ູ������ �̻��� ��ġ�� ���ٶ��̴�. Ȳ�ݽô��� ���ϱ� ���߿��� ��°� ���� �λ��� �Ͽ�����, �׵��� �ΰ��� ���̴�.
�η��� �ǰ�, �߰ſ�����, �ӿ��� ���̴�. ������ ��� �� �װ��� �ΰ��� ���̴�. �ƴ��� ������ ưư�ϸ�, �����ϰ�, �����Ϸ�? ���� ������ ưư�ϸ�, õ���� �̻� ���̴�. ��ī�ο쳪 �̻� �������� �� �� ���ϱ� ����� ���л��̴�. �Ҿ� ��¦�̴� ������ �ִ� �츮 ������ ���� ���� ���л��̴�. �ٳ�� ���� �뷡�ϸ� ���� �̼��� �츮 ���� �̰��� ���� ���̴�. �̼��� �߰ſ�����, ��ġ�� �̻�, �׵��� ������ õ�� ǰ�� �׸��Ͽ��°�? ������ ���� �ΰ��� ���̴�. ũ�� ���꿡�� �ǰ� ���� ���Ÿ� ���� �̻� ���̴�.', 3,'����',237,
to_date('2020-8-22 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,71,to_date('2020-02-06 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'��ó�Կ��ų��� ȸ�͸��̽� ��',' ���� Ȳ�ݽô��� �츮 ���� ���̴�. ���ҳ⿡�Լ� �� �𷡻��� �󸶳� ���� ã�� ǰ����, ������? ������ ���踦 ������ �̻� �ٸ� �ǰ� ���ٶ��̴�. ������ ��ī�ο쳪 ��°� �縷�̴�. ������ �����Ѵ� �׵��� ���� ���̴�. ������ û���� �ִ� ���� ���ϱ� �밨�ϰ� ������ ưư�ϸ�, ���ٶ��̴�. �ǰ� �����̽��� Ǯ�� �Ǵ�. Ŀ�ٶ� Ȳ�ݽô��� �Ƹ���� ���� �츮 ����� ���Ͽ�, �̰��̴�. ���̴� �� ��� �� �׷��Ƿ� ������ �׵��� �ൿ�ϴ�. �׵��� ������ Ʈ��, ���ٶ��� ���ڴ� �󸶳� ���� ������ �ǿ� ���ִ�. �η��� �ƴϴ���, ���ϱ� �ູ������ �̰��̴�.
û���� �λ��� �󸶳� ���� ���̴� ���Ͽ���, �� ������ ��ī�ο쳪 ��´�. �̰��̾߸��� ������ ������ ������ �׸��ڴ� õ���� �׵��� Į�̴�. Ȳ�ݽô븦 ������, �츮�� �̻� ũ�� ������ ���л��̴�. �� ������ ǰ����, �Ǵ� û���� ��ġ�� �縷�̴�. ���ڴ� Ǯ�� �߰ſ�����, �ΰ��� Ǯ�翡 ���� �ڽŰ� ���. ���� ���� ���Ͽ� �׷��Ƿ� ���� û���� �縷�̴�. â���� �׸��ڴ� ������ �𷡻��� Ǯ�� �׸��Ͽ��°�? �� ���� �ڽŰ� �Ҿ� ���̴� �������̸�, ��Ȳ�Ͽ�����, ������ �ൿ�ϴ�. ���꿡�� ���� ����� ������ ���� �׵��� �ൿ�ϴ�. ������ ������ ������ �縷�̴�.
�ູ������ ���� �׵鿡�� �� ���꿡�� ���Ͽ���, �縷�̴�. �����ϰ� �׵��� ���� ���ٶ��̴�. ���̸�, �ξ�, �װ��� �Ƹ��ٿ��? �׸��ڴ� �η��� �� Ǯ�� �׸��Ͽ��°�? ������ ������ �츮�� ���� ���Ͽ�, �ǰ� Ŀ�ٶ� ������ ���� �ƴϴ�. ��� ���ϱ� ���� ���ٶ��� �׸��Ͽ��°�? �츮 ������ �̴� �� �縷�̴�. ����� �̻��� ���� ��� õ�ϸ� �Ǵ�. ������ ���̴�.����, �̴� �� ���´�. ���� �°� ����, ���̴�. ������ ������ �װ��� ������ ���̴�.', 3,'��õ',241,
to_date('2020-8-23 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,71,to_date('2020-12-09 1200', 'YYYY-MM-DDHH24MI'));
INSERT INTO tb_board2 (
article_no, article_title, article_content, board_no
, party_location, user_no, create_date, revision_date
, is_delete, article_hit, meet_time )
VALUES (tb_recruitBoard_seq.nextval,'1��1�Ͽ� ����͸��̽� ��',' �� ������ ������ ����� �ƴϴ�. û�� �̰��� ���� ��´�. �󸶳� ������, õ�� ��ȭ������ �� ������, ����� ������ ��ġ�� �̰��̴�. �׵��� ���� �ǰ� ���ҳ⿡�Լ� ���̴�. �ҷ� �ִ� �׵��� ����. �������ν� ��Ⱑ �λ��� �� ������ ������ ���� �ΰ��� Ÿ������ ������̴�. Ŀ�ٶ� �̻��� ������ �ϴ� �ż��� �츮 �װ��� ���踦 ���Ͽ���. ���ٶ��� ����� ���� �Ǿ�� ����� �ƴϴ�. ������ ���߿��� �츮 ũ�� Į�̴�.
���̴�.����, �׵��� �߰ſ�����, öȯ�Ͽ��°�? �ϴ� �� �̰��� �ΰ��� ���̴�. ���� û���� ����� ������ ���� �ұ��̶� �̻��� ������ �ִ�. ������, ���� �η��� �̻��� �� ��ī�ο쳪 ưư�ϸ�, �縷�̴�. â���� �󸶳� ����� �Ǵ�. ǰ���� �׿� �Ͽ��� �밨�ϰ� �°� �ǰ� �����̽��� ���� ���̴�. ����, �ִ� ��⸸ ���� �� ���̴� ���̴�. �׵��� ǰ�� �ٷ� ��ڸ�, ������ �ʴ� ���� ������ ���ٶ��̴�. �̻�, ���ϱ� ���ϴ� ������?
����� �׸��ڴ� ��� �λ��� �׵��� Ȳ�ݽô��. �η��� �츮 �ָ�, ���� ��´�. ���и� �󸶳� â���� �����ϱ� ������ �ż��� ������ ���̴�. �ִ� ���� ������, �� ũ�� ����� �̰��̴�. �ٳ�� ������ ���� ���̸�, ������ �ΰ��� �ִ� ���� ������? ������ �� ���� ������, �λ��� �׵��� ������ �׸��Ͽ��°�? ǰ�� �ٸ� �׵��� ���� ���̴�. ����� õ�ڸ�ȫ�� �׿� Ŀ�ٶ� �ϴ� ���ִ�. ������ �λ��� ���� �װ��� õ�ϸ� �ִ°�? �Ͽ��� �ǰ� ���� ���Ͽ� �°� ���ٳ���, ������ �� ���̴�. õ���� ���� ���̴� ��� ���Ͽ��� �󸶳� �ִ� ���� ������̴�.', 3,'��õ',225,
to_date('2020-8-17 12:00', 'YYYY-MM-DD HH24:MI'), null ,
0,141,to_date('2020-05-21 1200', 'YYYY-MM-DDHH24MI'));


-- ä�ù� ����
insert into tb_chatting2 (chatting_id) values('852943e9d4cb4392ab0a8f22e9a28c23');
insert into tb_chatting2 (chatting_id) values('bb7c15cbf9504bf3826208098fe91f25');
insert into tb_chatting2 (chatting_id, chatting_name) values('f459334d815b4109dc19029b1f22fbf0', '�����ڿ� ����ȸ��, �Ϲ�ȸ���� ä�ù�');
insert into tb_chatting2 (chatting_id, chatting_name) values('c3a616c31ecb4c929a13b26a528e8asd', 'ȸ�� ��ü ä�ù�');
insert into tb_chatting2 (chatting_id, chatting_name) values('c3a616c31ecb4c929a13b26a528e8asd', 'ȸ�� ��ü ä�ù�2');

select * from tb_chatting2
order by chatting_no desc;



--ä�ù� ������ ����
insert into tb_chattinguser2 (chatting_no, user_no) values( 1, 2);
insert into tb_chattinguser2 (chatting_no, user_no) values( 1, 3);
insert into tb_chattinguser2 (chatting_no, user_no) values( 2, 2);
insert into tb_chattinguser2 (chatting_no, user_no) values( 2, 4);
insert into tb_chattinguser2 (chatting_no, user_no) values( 3, 1);
insert into tb_chattinguser2 (chatting_no, user_no) values( 3, 2);
insert into tb_chattinguser2 (chatting_no, user_no) values( 3, 3);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 2);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 3);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 4);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 5);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 6);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 7);
insert into tb_chattinguser2 (chatting_no, user_no) values( 4, 8);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 2);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 12);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 22);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 32);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 132);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 222);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 242);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 52);
insert into tb_chattinguser2 (chatting_no, user_no) values( 5, 92);

--ä�ù濡 �޽��� ����
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(1,2, '2��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(1,3, '3�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(1,2, '��������', sysdate,'CHAT');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(2,2, '2��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(2,4, '4�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(2,2, '�ȳ�', sysdate,'CHAT');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(3,2, '2��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(3,4, '4�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(3,2, '�����', sysdate,'CHAT');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(4,2, '2��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(4,3, '3�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(4,4, '4�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(4,5, '5�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(4,6, '6�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(4,7, '7�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(4,8, '8�� ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(4,8, '����', sysdate,'CHAT');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,2, '2��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,12, '12��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,22, '22��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,32, '32��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,132, '132��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,222, '222��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,242, '242��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,52, '52��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,92, '92��ȸ�� ����', sysdate,'ENTER');
insert into tb_chattingcontent2(chatting_no, user_no, msg_content, msg_date, msg_type) values(5,222, '�ȳ�', sysdate,'CHAT');


commit;