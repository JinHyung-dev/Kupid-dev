CREATE TABLE FEED (
	feed_no NUMBER,
	member_no NUMBER,
	writer_name varchar2(20),
	content varchar2(500),
	writedate DATE DEFAULT sysdate,
	updatedate DATE DEFAULT sysdate,
	likes NUMBER DEFAULT 1,
	declaration NUMBER,
	CONSTRAINT pk_feed_no PRIMARY KEY (feed_no)
--	CONSTRAINT fk_member_no FOREIGN KEY(member_no) REFERENCES MEMBER(USERID) ON DELETE SET NULL--
);
ALTER TABLE FEED ADD GROUP_NO NUMBER;

ALTER TABLE feed MODIFY updatedate date DEFAULT SYSDATE;


ALTER TABLE feed RENAME COLUMN declaration TO report;

CREATE SEQUENCE seq_feed_no
    START WITH 1
    INCREMENT BY 1;

INSERT INTO FEED VALUES(seq_feed_no.nextval,1,1,1,DEFAULT,DEFAULT,1,1);
INSERT INTO FEED VALUES(seq_feed_no.nextval,3,'qwerty','아이유를 보면 행복해요',DEFAULT,DEFAULT,0,0,4);
commit;
SELECT * FROM feed;
SELECT * FROM MEMBER;

SELECT * FROM tabs;

SELECT * FROM (SELECT ROWNUM AS RNUM,B.* FROM 
(SELECT ROWNUM AS REALNUM, INB.* FROM 
(SELECT * FROM FEED ORDER BY WRITEDATE DESC) INB )B) 
WHERE REALNUM BETWEEN 1 AND 10;


SELECT COUNT(*) FROM FEED;


CREATE TABLE feed_file(
	file_no NUMBER,
	feed_no NUMBER,
	file_path varchar2(100),
	CONSTRAINT pk_file_no PRIMARY KEY (file_no),
	CONSTRAINT fk_feed_no FOREIGN KEY (feed_no) REFERENCES Feed(feed_no) ON DELETE CASCADE 
);


CREATE SEQUENCE seq_feed_file_no
INCREMENT BY 1
START WITH 1
;

INSERT INTO feed VALUES (seq_feed_no.nextval,1,1,1,DEFAULT,DEFAULT,1,1);
   
   
SELECT * FROM FEED LEFT JOIN FEED_FILE USING (FEED_NO) ORDER BY WRITEDATE DESC;

INSERT INTO feed_file VALUES(seq_feed_file_no.nextval,seq_feed_no.CURRVAL,'123213');
SELECT seq_feed_no.nextval FROM dual;

BEGIN
    INSERT INTO feed VALUES (seq_feed_no.nextval,1,1,1,DEFAULT,DEFAULT,1,1);
    INSERT INTO feed_file VALUES (seq_feed_file_no.nextval,seq_feed_no.CURRVAL,'3232323');
END;
commit;
SELECT * FROM 
	(SELECT ROWNUM AS RNUM,B.* FROM 
		(SELECT ROWNUM AS REALNUM, INB.* FROM 
			(SELECT * FROM FEED LEFT JOIN (SELECT FEED_NO, LISTAGG(FILE_PATH, ',') WITHIN GROUP(ORDER BY file_no) AS file_Path, COUNT(1) FROM FEED_FILE GROUP BY FEED_NO) USING (FEED_NO) ORDER BY WRITEDATE DESC) INB )B)
		WHERE REALNUM BETWEEN 1 AND 50;
	
SELECT * FROM feed_file;
SELECT * FROM FEED;

SELECT * FROM FEED JOIN FEED_FILE USING (FEED_NO) ORDER BY WRITEDATE DESC;

SELECT FEED_NO, LISTAGG(FILE_PATH, ',') WITHIN GROUP(ORDER BY file_no), COUNT(1) FROM FEED_FILE GROUP BY FEED_NO HAVING COUNT(1) > 1;

INSERT INTO FEED VALUES(1,1,1,1,DEFAULT,DEFAULT,1,1);


SELECT * FROM MEMBER;

