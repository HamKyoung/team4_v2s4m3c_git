/**********************************/
/* Table Name: 설문조사 */
/**********************************/
drop table surveymember;
drop table surveyitem;
drop table survey;
CREATE TABLE survey(
    surveyno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    topic                             VARCHAR2(200)    NOT NULL,
    startdate                       VARCHAR2(10)     NOT NULL,
    enddate                         VARCHAR2(10)     NOT NULL,
    poster                          VARCHAR2(100)      NULL,
    cnt                               NUMBER(7)        NULL ,
    continueyn                        CHAR(1)        NOT NULL
);

COMMENT ON TABLE survey is '설문조사';
COMMENT ON COLUMN survey.surveyno is '설문조사번호';
COMMENT ON COLUMN survey.topic is '제목';
COMMENT ON COLUMN survey.startdate is '시작날짜';
COMMENT ON COLUMN survey.enddate is '종료 날짜';
COMMENT ON COLUMN survey.poster is '포스터 파일';
COMMENT ON COLUMN survey.cnt is '참여인원';
COMMENT ON COLUMN survey.continueyn is '진행여부';

DROP SEQUENCE survey_seq;
CREATE SEQUENCE survey_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '설문조사', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '설문조사1', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '설문조사2', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '설문조사2', '2020-11-04', '2020-11-11', ' ', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, 'topic', '2020-11-04', '2020-11-11', ' ', 1, 'Y');

ALTER TABLE survey
ADD (word VARCHAR2(300));

--목록
SELECT surveyno, topic, startdate, enddate, poster, cnt, continueyn, word
FROM survey 
ORDER BY surveyno ASC;

SELECT surveyno, topic, startdate, enddate, poster, cnt, continueyn, word
FROM survey 
WHERE (topic LIKE '%' || 'topic' || '%' 
             OR poster LIKE '%' || topic || '%' 
             OR word LIKE '%' || topic || '%')
ORDER BY surveyno DESC;  

commit;

--조회
SELECT surveyno, topic, startdate, enddate, poster, cnt, continueyn
FROM survey 
WHERE surveyno=1;

--수정
UPDATE survey 
SET topic='제목', startdate='2020.01.10', enddate='2020.01.21', poster='검색어', cnt=2
WHERE surveyno=1;

--삭제
DELETE FROM survey
WHERE surveyno=1;

/**********************************/
/* Table Name: 일반 회원 */
/**********************************/
CREATE TABLE gen_member(
    gen_memberno                      NUMBER(7)    NOT NULL    PRIMARY KEY,
    gen_id                            VARCHAR2(50)     NOT NULL UNIQUE ,
    gen_passwd                        VARCHAR2(20)     NOT NULL,
    gen_name                          VARCHAR2(20)     NOT NULL,
    gen_resident                      VARCHAR2(13)     NOT NULL,
    gen_sex                           VARCHAR2(10)     NOT NULL,
    gen_phone                         VARCHAR2(20)     NOT NULL,
    gen_zipcode                       VARCHAR2(5)    NULL ,
    gen_addr                          VARCHAR2(100)    NULL ,
    gen_addr1                         VARCHAR2(50)     NULL ,
    gen_mail                          VARCHAR2(50)     NOT NULL,
    gen_date                          DATE     NOT NULL
);

COMMENT ON TABLE gen_member is '일반 회원';
COMMENT ON COLUMN gen_member.gen_memberno is '회원 번호';
COMMENT ON COLUMN gen_member.gen_id is '회원 아이디';
COMMENT ON COLUMN gen_member.gen_passwd is '비밀번호 ';
COMMENT ON COLUMN gen_member.gen_name is '회원 이름';
COMMENT ON COLUMN gen_member.gen_resident is '생년월일';
COMMENT ON COLUMN gen_member.gen_sex is '성별';
COMMENT ON COLUMN gen_member.gen_phone is '전화 번호';
COMMENT ON COLUMN gen_member.gen_zipcode is '우편 번호';
COMMENT ON COLUMN gen_member.gen_addr is '회원 주소';
COMMENT ON COLUMN gen_member.gen_addr1 is '회원 주소1';
COMMENT ON COLUMN gen_member.gen_mail is '이메일';
COMMENT ON COLUMN gen_member.gen_date is '가입 날짜';


/**********************************/
/* Table Name: 설문 조사 항목 */
/**********************************/

CREATE TABLE surveyitem(
    sur_itemno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    surveyno                          NUMBER(10)     NOT NULL,
    itemseq                           NUMBER(2) DEFAULT 1  NOT NULL,
    item                              VARCHAR2(200)    NOT NULL,
    itemfile                          VARCHAR2(100)    NULL,
    itemcnt                           NUMBER(7) DEFAULT 0  NOT NULL,
  FOREIGN KEY (surveyno) REFERENCES survey (surveyno)
);

COMMENT ON TABLE surveyitem is '설문 조사 항목';
COMMENT ON COLUMN surveyitem.sur_itemno is '설문 조사 항목 번호';
COMMENT ON COLUMN surveyitem.surveyno is '설문 조사 번호';
COMMENT ON COLUMN surveyitem.itemseq is '항목 출력 순서';
COMMENT ON COLUMN surveyitem.item is '항목';
COMMENT ON COLUMN surveyitem.itemfile is '항목 파일';
COMMENT ON COLUMN surveyitem.itemcnt is '항목 선택 인원';

drop table surveyitem;
DROP SEQUENCE surveyitem_seq;
CREATE SEQUENCE surveyitem_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 등록
INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '테스트', '파일', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '테스트', '파일', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '테스트', '파일', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, 'test', 'file', 0);

ALTER TABLE surveyitem
ADD (word VARCHAR2(300));

-- 목록
SELECT sur_itemno, surveyno, itemseq, item, itemfile, itemcnt, word
FROM surveyitem 
ORDER BY itemseq ASC;

commit;

-- 조회
SELECT sur_itemno, surveyno, itemseq, item, itemfile, itemcnt
FROM surveyitem 
WHERE sur_itemno=1;

-- 수정
UPDATE surveyitem 
SET itemseq =2, item='test', itemfile='test.jpg', itemcnt=1
WHERE sur_itemno=2;

--카운트
UPDATE surveyitem 
SET itemcnt = itemcnt + 1
WHERE surveyno = 8 and sur_itemno = 15;

-- 삭제
DELETE FROM surveyitem 
WHERE sur_itemno=1;

/**********************************/
/* Table Name: 설문 참여 회원 */
/**********************************/
CREATE TABLE surveymember(
    sur_memberno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    sur_itemno                        NUMBER(10)     NOT NULL,
    gen_memberno                      NUMBER(7)    NOT NULL,
    rdate                             DATE     NOT NULL,
  FOREIGN KEY (sur_itemno) REFERENCES surveyitem (sur_itemno),
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE surveymember is '설문 참여 회원';
COMMENT ON COLUMN surveymember.sur_memberno is '설문 참여 회원 번호';
COMMENT ON COLUMN surveymember.sur_itemno is '설문 조사 항목 번호';
COMMENT ON COLUMN surveymember.gen_memberno is '회원 번호';
COMMENT ON COLUMN surveymember.rdate is '설문 참여 날짜';

DROP SEQUENCE surveymember_seq;
CREATE SEQUENCE surveymember_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 1, sysdate);

INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 2, sysdate);

INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 3, sysdate);

-- 목록
SELECT sur_memberno, sur_itemno, gen_memberno, rdate
FROM surveymember 
ORDER BY sur_memberno ASC;

commit;

-- 조회
SELECT sur_memberno, sur_itemno, gen_memberno, rdate
FROM surveymember 
WHERE sur_memberno=1;

-- 수정
UPDATE surveymember 
SET rdate='2020-11-09'
WHERE sur_memberno=1;

-- 삭제
DELETE FROM surveymember
WHERE sur_memberno=1;

--멤버 조인
SELECT s.sur_memberno, s.sur_itemno, s.gen_memberno, s.rdate, g.gen_id as gid
FROM surveymember s , gen_member g
WHERE s.gen_memberno = g.gen_memberno
ORDER BY sur_memberno ASC;
