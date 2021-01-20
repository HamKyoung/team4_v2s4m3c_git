/**********************************/
/* Table Name: 일반회원 */
/**********************************/
CREATE TABLE general_member(
		gen_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY
);

DROP TABLE general_member;

COMMENT ON TABLE general_member is '일반회원';
COMMENT ON COLUMN general_member.gen_memberno is '회원 번호';

DROP SEQUENCE general_seq;

CREATE SEQUENCE general_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO general_member(gen_memberno)
VALUES('general_seq.nextval');

INSERT INTO general_member(gen_memberno, gen_name)
VALUES(general_seq.nextval, '수제비');

DROP TABLE general_member;


ALTER TABLE general_member
ADD (gen_name VARCHAR2(20));

ALTER TABLE general_member
MODIFY (gen_name NOT NULL);

DESCRIBE general_member;

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

COMMENT ON TABLE questions is '질문';
COMMENT ON COLUMN questions.ques_no is '질문 번호';
COMMENT ON COLUMN questions.gen_memberno is '회원 번호';
COMMENT ON COLUMN questions.ques_title is '질문 제목';
COMMENT ON COLUMN questions.ques_con is '질문 내용';
COMMENT ON COLUMN questions.ques_date is '질문 등록날짜';
COMMENT ON COLUMN questions.ques_views is '질문 조회수';
COMMENT ON COLUMN questions.ques_passwd is '질문 비밀번호';

DROP TABLE questions;

DROP SEQUENCE questions_seq;
CREATE SEQUENCE questions_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

  -- insert
INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '1', '첫번째 질문', '오늘은 무슨요일 입니까?', sysdate, '0', '1234');

INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '1', '두번째 질문', '오늘은 몇일 입니까?', sysdate, '0', '1234');

INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '2', '세번째 질문', '오늘은 몇월 입니까?', sysdate, '0', '1234');

-- list
SELECT ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd
FROM questions
ORDER BY ques_no ASC;

SELECT q.ques_no, q.gen_memberno, q.ques_title, q.ques_con, q.ques_date, q.ques_views, q.ques_passwd, gm.gen_name
FROM questions q, general_member gm
WHERE q.gen_memberno = gm.gen_memberno
ORDER BY q.ques_no DESC;

-- read, 조회
SELECT ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd
FROM questions
WHERE ques_no = 1;

-- update, 수정
UPDATE questions
SET ques_title='질문을 수정합니다.', ques_con='수정한 질문'
WHERE ques_no = 1;

-- dalete, 삭제
DELETE FROM questions
WHERE ques_no = 4;

-- 패스워드 체크
SELECT COUNT(*) as passwd_cnt
FROM questions
WHERE ques_no=1 AND ques_passwd=1234;

commit;




