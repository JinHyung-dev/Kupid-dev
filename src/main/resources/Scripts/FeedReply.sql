DROP TABLE reply;
SELECT * FROM reply;
CREATE TABLE reply (
                         reply_number	number		NOT NULL,
                         feed_No	number		NOT NULL,
                         reply_content	varchar2(1000)		NULL,
                         reply_date	date		NULL,
                         likes	number		NULL,
                         memberNo	number NOT NULL
);

ALTER TABLE reply ADD CONSTRAINT PK_REPLY PRIMARY KEY (
                                                           reply_number
    );

SELECT * FROM
                  (SELECT ROWNUM AS RNUM,B.* FROM 
                                                      (SELECT ROWNUM AS REALNUM, INB.* FROM 
                                                                                                (SELECT * FROM FEED 
                                                                                                                   LEFT JOIN (SELECT FEED_NO, LISTAGG(FILE_PATH, ',') WITHIN GROUP(ORDER BY file_no) AS file_Path, COUNT(1) FROM FEED_FILE GROUP BY FEED_NO) USING (FEED_NO) 
                                                                                                                   LEFT JOIN MEMBER using(MEMBER_NO) 
                                                                                                                   LEFT JOIN (SELECT count(FEED_NO) commentCnt,FEED_NO  FROM reply GROUP BY FEED_NO) using(feed_no)
                                                                                                 ORDER BY WRITEDATE DESC) INB )B)
WHERE REALNUM BETWEEN ? AND ?;