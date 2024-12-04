SELECT * FROM SCHEDULE;

SELECT * FROM tabs;

SELECT * FROM ARTIST_GROUP LEFT JOIN SCHEDULE s USING (group_no) WHERE s.SC_TITLE IS NOT NULL AND GROUP_NO =3;


INSERT INTO SCHEDULE values()

INSERT INTO schedule values(seq_sc_no.nextval,'생일',TO_DATE('2024-05-29', 'YYYY-MM-DD'),TO_DATE('2024-05-29', 'YYYY-MM-DD'),null,3);


CREATE TABLE schedule (
                          sc_id NUMBER PRIMARY KEY,
                          sc_title varchar(50),
                          sc_start DATE,
                          sc_end DATE,
                          field varchar(50),
                          GROUP_no NUMBER
    --CONSTRAINTS fk_sc_gr_groupno FOREIGN KEY(GROUP_no)
    --  REFERENCES ARTIST_GROUP(group_no)
);

DROP TABLE SCHEDULE ;

SELECT * FROM schedule;