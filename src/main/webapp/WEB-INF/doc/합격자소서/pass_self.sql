/**********************************/
/* Table Name: 회사소개 */
/**********************************/
DROP TABLE conpany_intro;
CREATE TABLE conpany_intro(
		comno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(20)		 NOT NULL,
		com_form                      		VARCHAR2(50)		 NOT NULL,
		com_type                          		VARCHAR2(50)		 NOT NULL,
		sales                         		NUMBER(10)		 NOT NULL,
		homepage                      		VARCHAR2(50)		 NOT NULL,
		address                       		VARCHAR2(50)		 NOT NULL,
		num_people                    		NUMBER(10)		 NOT NULL,
		com_date                          		DATE		 NOT NULL,
		ceo_name                      		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE conpany_intro is '회사소개';
COMMENT ON COLUMN conpany_intro.comno is '회사번호';
COMMENT ON COLUMN conpany_intro.com_name is '회사이름';
COMMENT ON COLUMN conpany_intro.com_form is '기업형태';
COMMENT ON COLUMN conpany_intro.com_type is '업종';
COMMENT ON COLUMN conpany_intro.sales is '매출액';
COMMENT ON COLUMN conpany_intro.homepage is '홈페이지';
COMMENT ON COLUMN conpany_intro.address is '회사주소';
COMMENT ON COLUMN conpany_intro.num_people is '사원수';
COMMENT ON COLUMN conpany_intro.com_date is '설립일';
COMMENT ON COLUMN conpany_intro.ceo_name is '대표자명';

DROP SEQUENCE conpany_intro_seq;
CREATE SEQUENCE conpany_intro_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO conpany_intro(comno, com_name, com_form, com_type, sales, homepage, address, num_people, com_date, ceo_name)
VALUES(conpany_intro_seq.nextval, '삼성', '아이티', '개발', 300, 'www.samsoung.com', '삼성동', 500, sysdate, '함경채');

INSERT INTO conpany_intro(comno, com_name, com_form, com_type, sales, homepage, address, num_people, com_date, ceo_name)
VALUES(conpany_intro_seq.nextval, 'LG', '아이티', '개발', 300, 'www.samsoung.com', '삼성동', 300, sysdate, '초롱이');

commit;

/**********************************/
/* Table Name: 기업 회원 */
/**********************************/
DROP TABLE corporate_member;
CREATE TABLE corporate_member(
		cor_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE corporate_member is '기업 회원';
COMMENT ON COLUMN corporate_member.cor_memberno is '기업 회원 번호';

DROP SEQUENCE corporate_member_seq;
CREATE SEQUENCE corporate_member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO corporate_member(cor_memberno)
VALUES(corporate_member_seq.nextval);
  
  


/**********************************/
/* Table Name: 합격자소서 */
/**********************************/
DROP TABLE pass_self;
CREATE TABLE pass_self(
		pass_self_no                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		comno                         		NUMBER(10)		 NULL ,
		cor_memberno                  		NUMBER(7)		 NULL ,
		pass_self_title               		VARCHAR2(200)		 NOT NULL,
		pass_self_item1               		VARCHAR2(500)		 NOT NULL,
		pass_self_item2               		VARCHAR2(500)		 NULL ,
		pass_self_item3               		VARCHAR2(500)		 NULL ,
		pass_self_item4               		VARCHAR2(500)		 NULL ,
		pass_self_item5               		VARCHAR2(500)		 NULL ,
		pass_self_ans1                		VARCHAR2(2000)		 NOT NULL,
		pass_self_ans2                		VARCHAR2(2000)		 NULL ,
		pass_self_ans3                		VARCHAR2(2000)		 NULL ,
		pass_self_ans4                		VARCHAR2(2000)		 NULL ,
		pass_self_ans5                		VARCHAR2(2000)		 NULL ,
		pass_self_date                		DATE		 NOT NULL,
		pass_self_views               		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (comno) REFERENCES conpany_intro (comno),
  FOREIGN KEY (cor_memberno) REFERENCES corporate_member (cor_memberno)
);

COMMENT ON TABLE pass_self is '합격자소서';
COMMENT ON COLUMN pass_self.pass_self_no is '합격자소서 번호';
COMMENT ON COLUMN pass_self.comno is '회사번호';
COMMENT ON COLUMN pass_self.cor_memberno is '기업 회원 번호';
COMMENT ON COLUMN pass_self.pass_self_title is '합격자소서 제목';
COMMENT ON COLUMN pass_self.pass_self_item1 is '합격자소서 항목1';
COMMENT ON COLUMN pass_self.pass_self_item2 is '합격자소서 항목2';
COMMENT ON COLUMN pass_self.pass_self_item3 is '합격자소서 항목3';
COMMENT ON COLUMN pass_self.pass_self_item4 is '합격자소서 항목4';
COMMENT ON COLUMN pass_self.pass_self_item5 is '합격자소서 항목5';
COMMENT ON COLUMN pass_self.pass_self_ans1 is '합격자소서 답변1';
COMMENT ON COLUMN pass_self.pass_self_ans2 is '합격자소서 답변2';
COMMENT ON COLUMN pass_self.pass_self_ans3 is '합격자소서 답변3';
COMMENT ON COLUMN pass_self.pass_self_ans4 is '합격자소서 답변4';
COMMENT ON COLUMN pass_self.pass_self_ans5 is '합격자소서 답변5';
COMMENT ON COLUMN pass_self.pass_self_date is '합격자소서 등록일';
COMMENT ON COLUMN pass_self.pass_self_views is '합격자소서 조회수';

DROP SEQUENCE pass_self_seq;
CREATE SEQUENCE pass_self_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '합격자소서 제목', '첫번째 항목', '두번째 항목', '세번째 항목', '네번째 항목', '마지막 항목', '첫번째 답변', '두번째 답변', '세번째 답변', '네번째 답변',
'다섯번째 답변', sysdate, '0');

INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '합격자소서 제목2', '첫번째 항목2', '두번째 항목2', '세번째 항목2', '네번째 항목2', '마지막 항목2', '첫번째 답변2', '두번째 답변2', '세번째 답변2', '네번째 답변2',
'다섯번째 답변2', sysdate, '0');

INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '합격자소서 제목3', '첫번째 항목3', '두번째 항목3', '세번째 항목3', '네번째 항목3', '마지막 항목3', '첫번째 답변3', '두번째 답변3', '세번째 답변3', '네번째 답변3',
'다섯번째 답변3', sysdate, '0');
  
-- list
SELECT pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views
FROM pass_self
ORDER BY pass_self_no DESC;

SELECT p.pass_self_no, p.comno, p.cor_memberno, p.cor_memberno, p.pass_self_title, p.pass_self_date, p.pass_self_views, c.com_name
FROM pass_self p, conpany_intro c
WHERE p.comno = c.comno
ORDER BY pass_self_no DESC;

-- read, 조회
SELECT pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views
FROM pass_self
WHERE pass_self_no = 2;

-- update, 수정
UPDATE pass_self
SET pass_self_title='제목 수정', pass_self_item1='수정된 첫번째 항목', pass_self_item2='수정된 두번째 항목', pass_self_item3='수정된 세번째 항목', pass_self_item4='수정된 네번째 항목', pass_self_item5='수정된 다섯번째 항목', 
                                pass_self_ans1='수정된 첫번째 답변', pass_self_ans2='수정된 두번째 답변', pass_self_ans3='수정된 세번째 답변', pass_self_ans4='수정된 네번째 답변', pass_self_ans5='수정된 다섯번째 답변'
WHERE pass_self_no = 2;

-- dalete, 삭제
DELETE FROM pass_self
WHERE pass_self_no = 3;






  
  
  
