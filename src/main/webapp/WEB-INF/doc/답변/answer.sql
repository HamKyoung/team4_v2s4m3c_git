/**********************************/
/* Table Name: 일반회원 */
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


drop table gen_member


/**********************************/
/* Table Name: 질문 */
/**********************************/
CREATE TABLE questions(
    ques_no                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    gen_memberno                      NUMBER(7)    NOT NULL,
    ques_title                        VARCHAR2(200)    NOT NULL,
    ques_con                          CLOB     NOT NULL,
    ques_date                         DATE     NOT NULL,
    ques_views                        NUMBER(10)     DEFAULT 0     NOT NULL,
    ques_passwd                       VARCHAR2(10)     NOT NULL,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE questions is '질문';
COMMENT ON COLUMN questions.ques_no is '질문 번호';
COMMENT ON COLUMN questions.gen_memberno is '회원 번호';
COMMENT ON COLUMN questions.ques_title is '질문 제목';
COMMENT ON COLUMN questions.ques_con is '질문 내용';
COMMENT ON COLUMN questions.ques_date is '질문 등록날짜';
COMMENT ON COLUMN questions.ques_views is '질문 조회수';
COMMENT ON COLUMN questions.ques_passwd is '질문 비밀번호';
drop table questions
/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE answer(
    ans_no NUMBER(10) NOT NULL PRIMARY KEY,
    ques_no NUMBER(10),
    ans_title VARCHAR2(200) NOT NULL,
    ans_con CLOB NOT NULL,
    ans_date DATE NOT NULL,
    ans_views NUMERIC(10) DEFAULT 0 NOT NULL,
  FOREIGN KEY (ques_no) REFERENCES questions (ques_no)
);


COMMENT ON TABLE answer is '답변';
COMMENT ON COLUMN answer.ans_no is '답변 번호';
COMMENT ON COLUMN answer.ques_no is '질문 번호';
COMMENT ON COLUMN answer.ans_title is '답변 제목';
COMMENT ON COLUMN answer.ans_con is '답변 내용';
COMMENT ON COLUMN answer.ans_date is '답변 등록날짜';
COMMENT ON COLUMN answer.ans_views is '답변 조회수';

DROP TABLE answer;

DROP SEQUENCE answer_seq;

CREATE SEQUENCE answer_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지



INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '1', '첫번째 질문에 대한 답변', '첫번째 답변입니다.', sysdate, '0');

INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '2', '두번째 질문에 대한 답변', '두번째 답변입니다.', sysdate, '0');

INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '5', '세번째 질문에 대한 답변', '세번째 답변입니다.', sysdate, '0');

-- list
SELECT ans_no, ques_no, ans_title, ans_con, ans_date, ans_views
FROM answer
ORDER BY ques_no ASC;

-- read, 조회
SELECT ans_no, ques_no, ans_title, ans_con, ans_date, ans_views
FROM answer
WHERE ques_no = 1;

-- update, 수정
UPDATE answer
SET ans_title='수정된 답변 제목', ans_con='수정된 답변 내용'
WHERE ans_no = 4;

-- dalete, 삭제
DELETE FROM answer
WHERE ans_no = 4;


SELECT COUNT(*) as ans_cnt
FROM answer
WHERE ques_no = 14;

commit;

