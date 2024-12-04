SELECT * FROM FEED ;
SELECT * FROM "MEMBER";
SELECT * FROM LIKE_FEED ;

DELETE LIKE_FEED;

CREATE TABLE LIKE_FEED(
	memberNo NUMBER,
	feed_No NUMBER,
	likes NUMBER,
	likes_switch number(1) DEFAULT 0,
	FOREIGN KEY (memberNo) REFERENCES MEMBER(MEMBER_NO),
	FOREIGN KEY (feed_No) REFERENCES FEED(FEED_NO)
);

CREATE TABLE like_feed (
                           MEMBERNO NUMBER REFERENCES MEMBER(member_no) ON DELETE cascade,
                           FEED_NO NUMBER REFERENCES FEED(feed_no) ON DELETE cascade
);

--ALTER TABLE LIKE_FEED ADD likes_switch NUMBER(1) DEFAULT 0;

DROP TABLE LIKE_feed;
alter session set ddl_lock_timeout = 5;

SELECT * FROM LIKE_FEED LEFT JOIN feed using(feed_no);

SELECT * FROM like_feed a left JOIN feed b ON a.feed_no = b.feed_no;

UPDATE (SELECT * FROM like_feed a left JOIN feed b ON a.feed_no = b.feed_no)
SET CONTENT = '11e122121'
WHERE feed_no= 403;
ALTER TABLE LIKE_FEED DROP COLUMN likes;

DELETE like_feed;

CREATE OR REPLACE TRIGGER TR_LIKE_FEED
AFTER INSERT ON LIKE_FEED
FOR EACH ROW
BEGIN
    UPDATE FEED 
    SET LIKES = LIKES + 1
    WHERE feed_no = :NEW.feed_no;
END;
/

CREATE OR REPLACE TRIGGER TR_LIKE_FEED_del
AFTER DELETE ON LIKE_FEED
FOR EACH ROW
BEGIN
    UPDATE FEED 
    SET LIKES = LIKES - 1
    WHERE feed_no = :old.feed_no;
END;
/

UPDATE feed SET likes =0;

DROP TRIGGER TR_LIKE_FEED_del;

ALTER TABLE LIKE_FEED DROP COLUMN likes_switch;

ALTER TABLE LIKE_feed
    ADD CONSTRAINT CASCADE_LIKE_FEED_FEED
        FOREIGN KEY (feed_no)
            REFERENCES feed(feed_no)
                ON DELETE CASCADE;


SELECT * FROM
    (SELECT ROWNUM AS RNUM,B.* FROM
        (SELECT ROWNUM AS REALNUM, INB.* FROM
            (SELECT * FROM FEED
                               LEFT JOIN (SELECT FEED_NO, LISTAGG(FILE_PATH, ',') WITHIN GROUP(ORDER BY file_no) AS file_Path, COUNT(1) FROM FEED_FILE GROUP BY FEED_NO) USING (FEED_NO)
                               LEFT JOIN MEMBER using(MEMBER_NO)
                               LEFT JOIN (SELECT count(FEED_NO) commentCnt,FEED_NO  FROM reply GROUP BY FEED_NO) using(feed_no)
             ORDER BY WRITEDATE DESC) INB )B)
WHERE REALNUM BETWEEN 1 AND 10;


alter table LIKe_feed

    add constraint CASCADE_LIKE_FEED_FEED

        FOREIGN KEY (feed_no)

            references  feed(feed_no);

--on delete cascade;