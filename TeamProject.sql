질문 게시판 테이블
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

포링키 연결 문
ALTER TABLE qnaboard ADD FOREIGN KEY(id) REFERENCES REGISTER_USER(userid);

------------------------------------------------------------------------------------
예약테이블
CREATE TABLE RESERVATION(
RUSERNAME VARCHAR2(20) NOT NULL,
RUSERPHONE VARCHAR2(20) NOT NULL,
RUSERCOUNT NUMBER(10) NOT NULL,
CHECKIN DATE NOT NULL,
CHECKOUT DATE NOT NULL,
ROOMTYPE VARCHAR2(20) NOT NULL,
RUSERPRICE NUMBER(20) NOT NULL);

insert into reservation values('한대현', '010-4033-5958', '2', '2021-01-01', '2021-01-05', '스탠다드', '100000');
포링키 연결문
ALTER TABLE RESERVATION ADD FOREIGN KEY(RUSERID) REFERENCES REGISTER_USER(userid);

예약기간 중복체크하기 예제
INSERT INTO TEST VALUES('2021-01-01', '2021-01-05');
SELECT count(*) FROM RESERVATION WHERE checkin <= '2021-01-10' AND checkout <= '2021-01-03';
카운트가 0일때 예약기간중복, 1일때 예약가능
-----------------------------------------------------------------------------------------------

객실 테이블
CREATE TABLE ROOM

--------------------------------------------------------------------------------------------------
회원가입 테이블
//1. ID에 unique 값 추가
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

시퀀스 데이터 삭제/생성
DROP SEQUENCE register_user_seq;
DROP SEQUENCE seq_qna;

시퀀스 만들기
CREATE SEQUENCE register_user_seq START WITH 1;
CREATE SEQUENCE seq_qna START WITH 1;

<insert>
insert into REGISTER_USER values(register_user_seq.nextval,'4444','3333','한동호','1994-03-22','010-3333-3333','cocu7714@naver.com','서울시 관악구',sysdate,4);
insert into REGISTER_USER values(register_user_seq.nextval,'test7713','1111','테스트','1994-03-21','010-1111-1111','test7712@naver.com','서울시 관악구','2020-04-17',1);

insert into QNABOARD values(seq_qna.nextval,'test7713','토끼와 거북이 답변','토끼와 거북이가 살았습니다.',2,1,0,0,sysdate,'true');
insert into QNABOARD values(seq_qna.nextval,'4444','3333','테스트중',7,0,0,0,sysdate,'true');

create table TEST (CHECKIN DATE NOT NULL,
CHECKOUT DATE NOT NULL);

******예약기간 중복체크하기*******
INSERT INTO TEST VALUES('2021-01-01', '2021-01-05');
SELECT count(*) FROM TEST WHERE checkout >= '2021-01-03' AND checkin <= '2021-02-01';
