CREATE TABLE MEMBER (
    member_no NUMBER PRIMARY KEY,
    member_id VARCHAR2(20) NOT NULL,
    member_pw VARCHAR2(20) NOT NULL,
    member_name VARCHAR2(20) NOT NULL,
    gender VARCHAR2(10) CHECK (gender IN ('M', 'F')),
    phone VARCHAR2(100) NOT NULL,
    address VARCHAR2(100),
    address_detail varchar2(200),
    email VARCHAR2(20) NOT NULL,
    birth DATE NOT NULL,
    nickname VARCHAR2(50) NOT NULL,
    introduce VARCHAR2(300) DEFAULT '안녕하세요! 반가워요!' NOT NULL,
    profile_img_Oriname VARCHAR2(50) DEFAULT '기본프로필.png',
    member_grade VARCHAR2(20) DEFAULT '회원' CHECK (member_grade IN ('회원', '아티스트', '관리자','탈퇴')),
    enroll_date DATE DEFAULT SYSDATE,
    UNIQUE (member_id),
    UNIQUE (nickname)
);
--INSERT TABLE MEMBER INTO member_grade VALUES('탈퇴');
ALTER TABLE member MODIFY email varchar(50);

ALTER TABLE member MODIFY (nickname VARCHAR2(50));

COMMENT ON COLUMN member.member_no IS '회원번호';
COMMENT ON COLUMN member.member_id IS '회원아이디';
COMMENT ON COLUMN member.member_pw IS '회원비밀번호';
COMMENT ON COLUMN member.member_name IS '회원이름';
COMMENT ON COLUMN member.address IS '회원주소';
COMMENT ON COLUMN member.address_detail IS '회원상세주소';
COMMENT ON COLUMN member.phone IS '회원연락처';
COMMENT ON COLUMN member.gender IS '회원성별';
COMMENT ON COLUMN member.enroll_date IS '회원등록일';
COMMENT ON COLUMN member.birth IS '회원생일';
COMMENT ON COLUMN member.nickname IS '닉네임';
COMMENT ON COLUMN member.profile_img_Oriname IS '프로필사진';
COMMENT ON COLUMN member.member_grade IS '회원등급';
COMMENT ON COLUMN member.email IS '이메일';
COMMENT ON COLUMN member.introduce IS '자기소개';

SELECT * FROM member;
--drop table member; 
create sequence seq_member_no
nocache
nocycle;
--drop SEQUENCE seq_member_no;
select * from user_sequences;
--create sequence seq_nickname; 검색해보니까 어려워서 생략 자바에서 만들자..


--관리자(등록완료)
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'admin','1234','관리자','F','01012345678',null, NULL,'admin@naver.com',to_date('96/07/05','RR/MM/DD'),'관리자','관리자입니다.',DEFAULT,'관리자',to_date('24/05/05','RR/MM/DD'));

--아티스트
INSERT INTO MEMBER values(SEQ_MEMBER_NO.nextval,'RIIZE1',1234,'쇼타로','M','01012345678',NULL,NULL,'riize1@example.com',TO_DATE('2000-11-25', 'YYYY-MM-DD'),'쇼타로',DEFAULT,DEFAULT,'아티스트',DEFAULT,3,NULL,NULL);
INSERT INTO MEMBER values(SEQ_MEMBER_NO.nextval,'RIIZE2',1234,'은석','M','01012345678',NULL,NULL,'riize1@example.com',TO_DATE('2001-03-19', 'YYYY-MM-DD'),'은석',DEFAULT,DEFAULT,'아티스트',DEFAULT,3,NULL,NULL);
INSERT INTO MEMBER values(SEQ_MEMBER_NO.nextval,'RIIZE3',1234,'성찬','M','01012345678',NULL,NULL,'riize1@example.com',TO_DATE('2001-09-13', 'YYYY-MM-DD'),'성찬',DEFAULT,DEFAULT,'아티스트',DEFAULT,3,NULL,NULL);
INSERT INTO MEMBER values(SEQ_MEMBER_NO.nextval,'RIIZE4',1234,'원빈','M','01012345678',NULL,NULL,'riize1@example.com',TO_DATE('2002-03-02', 'YYYY-MM-DD'),'원빈',DEFAULT,DEFAULT,'아티스트',DEFAULT,3,NULL,NULL);
INSERT INTO MEMBER values(SEQ_MEMBER_NO.nextval,'RIIZE5',1234,'승한','M','01012345678',NULL,NULL,'riize1@example.com',TO_DATE('2003-10-02', 'YYYY-MM-DD'),'승한',DEFAULT,DEFAULT,'아티스트',DEFAULT,3,NULL,NULL);
INSERT INTO MEMBER values(SEQ_MEMBER_NO.nextval,'RIIZE6',1234,'소희','M','01012345678',NULL,NULL,'riize1@example.com',TO_DATE('2003-11-21', 'YYYY-MM-DD'),'소희',DEFAULT,DEFAULT,'아티스트',DEFAULT,3,NULL,NULL);
INSERT INTO MEMBER values(SEQ_MEMBER_NO.nextval,'RIIZE7',1234,'앤톤','M','01012345678',NULL,NULL,'riize1@example.com',TO_DATE('2004-03-21', 'YYYY-MM-DD'),'앤톤',DEFAULT,DEFAULT,'아티스트',DEFAULT,3,NULL,NULL);

--일반회원(등록완료)
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'abcde','1234','아무개','M','01012345678',null, NULL,'abcde@naver.com',to_date('99/07/05','RR/MM/DD'),'닉네임아무개','안녕하세요, 아무개입니당..',DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'qwerty','asdf','김말년','M','01098765432',null,null,'qwerty@naver.com',to_date('93/02/05','RR/MM/DD'),'김말이','김말이는 맛있어',DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'hihiroo','1234','김안녕','F','01023454635',null,null,'hihiroo@naver.com',to_date('99/12/05','RR/MM/DD'),'heyHi','모두들 안녕하신가요',DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'abcdeFG','1234','아무개','M','01012345678',null, NULL,'abcde@naver.com',to_date('99/07/05','RR/MM/DD'),'닉네임아123','안녕하세요, 아무개입니당..',DEFAULT, '탈퇴', DEFAULT);

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'MEMBER'
AND constraint_type IN ('C');

SELECT
    uc.constraint_name,
    uc.table_name AS referencing_table,
    ucc.column_name AS referencing_column
FROM
    user_constraints uc
JOIN
    user_cons_columns ucc
ON
    uc.constraint_name = ucc.constraint_name
WHERE
    uc.constraint_type = 'R'
AND
    uc.r_constraint_name = 'MEMBER_MEMBER_GRADE_C';
   
--ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_MEMBER_GRADE_C; 제약조건 삭제 하는 구문


--SELECT * FROM ARTIST_GROUP LEFT JOIN SUBSCRIBE s using(group_no);


INSERT INTO MEMBER VALUES (2, 'qwer', '1234', '아몰라', 'F', '010-2345-6789', '부산광역시 해운대구', '해운대로 456', 'artist1@example.com', TO_DATE('1985-05-05', 'YYYY-MM-DD'), '예술이', '안녕하세요! 김예술입니다!', '프로필2.png', '아티스트', SYSDATE,NULL, NULL,null);


INSERT ALL
    INTO MEMBER (member_no, member_id, member_pw, member_name, gender, phone, address, address_detail, email, birth, nickname, introduce, profile_img_Oriname, member_grade, enroll_date)
VALUES (2, 'qwer', '1234', '김예술', 'F', '010-2345-6789', '부산광역시 해운대구', '해운대로 456', 'artist1@example.com', TO_DATE('1985-05-05', 'YYYY-MM-DD'), '예술이', '안녕하세요! 김예술입니다!', '프로필2.png', '아티스트', SYSDATE)
INTO MEMBER (member_no, member_id, member_pw, member_name, gender, phone, address, address_detail, email, birth, nickname, introduce, profile_img_Oriname, member_grade, enroll_date)
VALUES (3, 'asdf', '1234', '이관리', 'M', '010-3456-7890', '대구광역시 중구', '중앙대로 789', 'admin1@example.com', TO_DATE('1975-03-03', 'YYYY-MM-DD'), '관리자', '안녕하세요! 관리자입니다!', '프로필3.png', '관리자', SYSDATE)
INTO MEMBER (member_no, member_id, member_pw, member_name, gender, phone, address, address_detail, email, birth, nickname, introduce, profile_img_Oriname, member_grade, enroll_date)
VALUES (4, 'zxcv', '1234', '박사용자', 'F', '010-4567-8901', '인천광역시 남동구', '남동대로 123', 'user2@example.com', TO_DATE('2000-12-12', 'YYYY-MM-DD'), '사용자2', '안녕하세요! 박사용자입니다!', '기본프로필.png', '회원', SYSDATE)
INTO MEMBER (member_no, member_id, member_pw, member_name, gender, phone, address, address_detail, email, birth, nickname, introduce, profile_img_Oriname, member_grade, enroll_date)
VALUES (5, '1234', '1234', '최탈퇴', 'M', '010-5678-9012', '광주광역시 서구', '서구대로 456', 'user3@example.com', TO_DATE('1995-07-07', 'YYYY-MM-DD'), '탈퇴자', '안녕하세요! 최탈퇴입니다!', '기본프로필.png', '탈퇴', SYSDATE)


