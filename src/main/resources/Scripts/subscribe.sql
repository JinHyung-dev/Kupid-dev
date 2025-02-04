--그룹 삭제시 또는 회원삭제시 데이터 삭제됨
CREATE TABLE subscribe (
	subscribe_no number	PRIMARY key,
	group_no number REFERENCES artist_group(group_no) ON DELETE cascade, 
	member_no NUMBER REFERENCES MEMBER(member_no) ON DELETE cascade
);

SELECT * from subscribe;
SELECT * from ARTIST_GROUP ;
SELECT * from MEMBER;
SELECT * FROM faq;
ALTER TABLE faq MODIFY (faq_content VARCHAR2(3000));
select count(*) as result from member where member_name='박댕댕' and email='hey@n.com';

CREATE SEQUENCE seq_subscribe_no
nocache
nocycle;
select * from user_sequences;

--회원 구독 더미 데이터 추가(김말년 회원qwerty -> iu, aespa)
INSERT INTO SUBSCRIBE values(seq_subscribe_no.nextval, 4,3);
INSERT INTO SUBSCRIBE values(seq_subscribe_no.nextval, 4,3);
INSERT INTO SUBSCRIBE values(seq_subscribe_no.nextval, 5,3);

--구독자가 없는 사람은 조회가 불가능함
SELECT * FROM subscribe 
	RIGHT JOIN ARTIST_GROUP USING(group_no)
	LEFT JOIN MEMBER using(member_no) 
where member_id='admin'
;
SELECT * FROM subscribe 
	LEFT JOIN MEMBER using(member_no) 
	LEFT JOIN ARTIST_GROUP USING(group_no) 
where member_id='qwerty'
;
--구독 없는 회원 조회 쿼리
SELECT * FROM MEMBER
	left JOIN SUBSCRIBE using(member_no)
	left JOIN ARTIST_GROUP ON subscribe.GROUP_NO = artist_group.GROUP_NO
WHERE member_id='qwerty';
	;
--해당 회원번호의 구독 테이블 조회 + 전체아티스트명단

SELECT * FROM MEMBER
	left JOIN SUBSCRIBE using(member_no)
where member_id='qwerty';

--selectMemberFavorite=
select member_no, member_id, group_name, group_img from member 
					left JOIN SUBSCRIBE using(member_no) 
					right JOIN ARTIST_GROUP ON subscribe.GROUP_NO = artist_group.GROUP_NO;
				
--selectGroupSubscribe=
SELECT * FROM ARTIST_GROUP 
			LEFT JOIN SUBSCRIBE s using(group_no);
--selectMemberForProfile=
SELECT * FROM MEMBER 
	left JOIN SUBSCRIBE using(member_no) 
	left JOIN ARTIST_GROUP ON subscribe.GROUP_NO = artist_group.GROUP_NO 
where member_id='qwerty';
--ALTER TABLE MEMBER DROP CONSTRAINT 제약조건명 제약조건(컬럼명)

SELECT UC.CONSTRAINT_NAME, UC.TABLE_NAME, CONSTRAINT_TYPE, COLUMN_NAME
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
WHERE UC.TABLE_NAME = 'member'; 
