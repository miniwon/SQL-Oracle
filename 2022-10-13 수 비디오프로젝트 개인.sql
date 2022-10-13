CREATE TABLE MEMBER(
TEL1        VARCHAR2(13) CONSTRAINT PK_MEMBER_TEL1 PRIMARY KEY,
NAME        VARCHAR2(20),
TEL2        VARCHAR2(13),
ADDRESS     VARCHAR2(200),
EMAIL       VARCHAR2(100)
);

CREATE TABLE MOVIE(
MOVIENO     NUMBER(10) CONSTRAINT PK_MOVIE_MOVIENO PRIMARY KEY,
TITLE       VARCHAR2(30),
GENRE       VARCHAR2(60),
DIRECTOR    VARCHAR2(30),
ACTOR       VARCHAR2(60),
EXP         VARCHAR2(300)
);

CREATE TABLE VIDEO(
VIDEONO     NUMBER(10) CONSTRAINT PK_VIDEO_VIDEONO PRIMARY KEY,
MOVIENO     NUMBER(10) CONSTRAINT FK_VIDEO_MOVIENO REFERENCES MOVIE(MOVIENO)
);

CREATE TABLE STATUS(
RENTNO      NUMBER(10) CONSTRAINT PK_STATUS_RENTNO PRIMARY KEY,
TEL         VARCHAR2(13) CONSTRAINT FK_STATUS_TEL REFERENCES MEMBER(TEL1),
VIDEONO     NUMBER(10) CONSTRAINT FK_STATUS_VIDEONO REFERENCES VIDEO(VIDEONO),
RENTDATE    DATE,
RETURN      CHAR(1)
);

CREATE SEQUENCE SEQ_MOVIENO
INCREMENT BY 1
START WITH 1000
NOCYCLE;

CREATE SEQUENCE SEQ_VIDEONO
INCREMENT BY 1
START WITH 100
NOCYCLE;

CREATE SEQUENCE SEQ_RENTNO
INCREMENT BY 1
START WITH 10
NOCYCLE;
