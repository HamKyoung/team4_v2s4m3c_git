/**********************************/
/* Table Name: 일반회원 */
/**********************************/
CREATE TABLE general_member(
		gen_memberno NUMBER(7) NOT NULL PRIMARY KEY
);

/**********************************/
/* Table Name: 질문 */
/**********************************/
CREATE TABLE questions(
		ques_no                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		gen_memberno                  		NUMBER(7)		 NOT NULL ,
		ques_title                    		VARCHAR2(200)		 NOT NULL,
		ques_con                      		CLOB		 NOT NULL,
		ques_date                     		DATE		 NOT NULL,
		ques_views                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		ques_passwd                   		VARCHAR2(10)		 NOT NULL,
  FOREIGN KEY (gen_memberno) REFERENCES general_member (gen_memberno)
);

/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE answer(
		ans_no NUMBER(10) NOT NULL PRIMARY KEY,
		ques_no NUMBER(10),
		ans_title VARCHAR2(200) NOT NULL,
		ans_con CLOB NOT NULL,
		ans_date DATE NOT NULL,
		ans_views NUMBER(10) DEFAULT 0 NOT NULL,
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
VALUES(answer_seq.nextval, '3', '세번째 질문에 대한 답변', '세번째 답변입니다.', sysdate, '0');

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

