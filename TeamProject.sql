���� �Խ��� ���̺�
CREATE TABLE QnABoard(
NO NUMBER PRIMARY KEY,
id varchar2(40) NOT NULL,
title varchar2(100) NOT NULL,
board varchar2(2000) NOT NULL,
Ref number(20) NOT NULL,
step number(20) NOT NULL,
AnswerNum number(20) NOT NULL,
ParontNum number(20) NOT NULL,
r_date DATE NOT NULL,
qna_delete varchar2(10) NOT NULL
);

����Ű ���� ��
ALTER TABLE qnaboard ADD FOREIGN KEY(id) REFERENCES REGISTER_USER(userid);

------------------------------------------------------------------------------------
�������̺�
CREATE TABLE RESERVATION(
RUSERNAME VARCHAR2(20) NOT NULL,
RUSERPHONE VARCHAR2(20) NOT NULL,
RUSERCOUNT NUMBER(10) NOT NULL,
CHECKIN DATE NOT NULL,
CHECKOUT DATE NOT NULL,
ROOMTYPE VARCHAR2(20) NOT NULL,
RUSERPRICE NUMBER(20) NOT NULL);

insert into reservation values('�Ѵ���', '010-4033-5958', '2', '2021-01-01', '2021-01-05', '���Ĵٵ�', '100000');
����Ű ���Ṯ
ALTER TABLE RESERVATION ADD FOREIGN KEY(RUSERID) REFERENCES REGISTER_USER(userid);

����Ⱓ �ߺ�üũ�ϱ� ����
INSERT INTO TEST VALUES('2021-01-01', '2021-01-05');
SELECT count(*) FROM RESERVATION WHERE checkin <= '2021-01-10' AND checkout <= '2021-01-03';
ī��Ʈ�� 0�϶� ����Ⱓ�ߺ�, 1�϶� ���డ��
-----------------------------------------------------------------------------------------------

���� ���̺�
CREATE TABLE ROOM

--------------------------------------------------------------------------------------------------
ȸ������ ���̺�
//1. ID�� unique �� �߰�
CREATE TABLE REGISTER_USER(
    USERCODE NUMBER PRIMARY KEY,
    USERID VARCHAR2(40) NOT NULL unique,
    USERPASSWORD VARCHAR2(20) NOT NULL, 
    USERNAME VARCHAR2(20) NOT NULL, 
    USERBIRTH VARCHAR2(20) NOT NULL, 
    USERPHONE VARCHAR2(20) NOT NULL,  
    USEREMAIL VARCHAR2(40) NOT NULL, 
    USERADDRESS VARCHAR2(100) NOT NULL, 
    USERREGDATE DATE DEFAULT SYSDATE NOT NULL,
    USERGRADE NUMBER(2) NOT NULL);

������ ������ ����/����
DROP SEQUENCE register_user_seq;
DROP SEQUENCE seq_qna;

������ �����
CREATE SEQUENCE register_user_seq START WITH 1;
CREATE SEQUENCE seq_qna START WITH 1;

<insert>
insert into REGISTER_USER values(register_user_seq.nextval,'4444','3333','�ѵ�ȣ','1994-03-22','010-3333-3333','cocu7714@naver.com','����� ���Ǳ�',sysdate,4);
insert into REGISTER_USER values(register_user_seq.nextval,'test7713','1111','�׽�Ʈ','1994-03-21','010-1111-1111','test7712@naver.com','����� ���Ǳ�','2020-04-17',1);

insert into QNABOARD values(seq_qna.nextval,'test7713','�䳢�� �ź��� �亯','�䳢�� �ź��̰� ��ҽ��ϴ�.',2,1,0,0,sysdate,'true');
insert into QNABOARD values(seq_qna.nextval,'4444','3333','�׽�Ʈ��',7,0,0,0,sysdate,'true');

create table TEST (CHECKIN DATE NOT NULL,
CHECKOUT DATE NOT NULL);

******����Ⱓ �ߺ�üũ�ϱ�*******
INSERT INTO TEST VALUES('2021-01-01', '2021-01-05');
SELECT count(*) FROM TEST WHERE checkout >= '2021-01-03' AND checkin <= '2021-02-01';
