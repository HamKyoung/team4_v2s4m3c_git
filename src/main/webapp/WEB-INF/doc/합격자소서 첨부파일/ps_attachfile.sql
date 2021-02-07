/**********************************/
/* Table Name: 기업 회원 */
/**********************************/
CREATE TABLE corporate_member(
		cor_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE corporate_member is '기업 회원';
COMMENT ON COLUMN corporate_member.cor_memberno is '기업 회원 번호';


/**********************************/
/* Table Name: 회사소개 */
/**********************************/
CREATE TABLE conpany_intro(
		comno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(20)		 NOT NULL,
		com_form                      		VARCHAR2(50)		 NOT NULL,
		com_type                      		VARCHAR2(50)		 NOT NULL,
		sales                         		NUMBER(10)		 NOT NULL,
		homepage                      		VARCHAR2(50)		 NOT NULL,
		address                       		VARCHAR2(50)		 NOT NULL,
		num_people                    		NUMBER(10)		 NOT NULL,
		com_date                      		DATE		 NOT NULL,
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


/**********************************/
/* Table Name: 합격자소서 */
/**********************************/
CREATE TABLE pass_self(
		pass_self_no                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		comno                         		NUMBER(10)		 NULL ,
		cor_memberno                  		NUMBER(7)		 NULL ,
		pass_self_title               		VARCHAR2(200)		 NOT NULL,
		pass_self_item1               		VARCHAR2(100)		 NOT NULL,
		pass_self_item2               		VARCHAR2(100)		 NULL ,
		pass_self_item3               		VARCHAR2(100)		 NULL ,
		pass_self_item4               		VARCHAR2(100)		 NULL ,
		pass_self_item5               		VARCHAR2(100)		 NULL ,
		pass_self_ans1                		VARCHAR2(2000)		 NOT NULL,
		pass_self_ans2                		VARCHAR2(2000)		 NULL ,
		pass_self_ans3                		VARCHAR2(2000)		 NULL ,
		pass_self_ans4                		VARCHAR2(2000)		 NULL ,
		pass_self_ans5                		VARCHAR2(2000)		 NULL ,
		pass_self_date                		DATE		 NOT NULL,
		pass_self_views               		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (cor_memberno) REFERENCES corporate_member (cor_memberno),
  FOREIGN KEY (comno) REFERENCES conpany_intro (comno)
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


/**********************************/
/* Table Name: 합격자소서 첨부파일 */
/**********************************/
CREATE TABLE ps_attachfile(
		ps_attachfileno               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		pass_self_no                  		NUMBER(7)		 NOT NULL,
		ps_fname                      		VARCHAR2(100)		 NOT NULL,
		ps_upname                     		VARCHAR2(100)		 NOT NULL,
		ps_thumb                      		VARCHAR2(100)		 NULL ,
		ps_fsize                      		NUMBER(10)		 NOT NULL,
		ps_rdate                      		DATE		 NOT NULL,
  FOREIGN KEY (pass_self_no) REFERENCES pass_self (pass_self_no)
);


COMMENT ON TABLE ps_attachfile is '합격자소서 첨부파일';
COMMENT ON COLUMN ps_attachfile.ps_attachfileno is '첨부파일 번호';
COMMENT ON COLUMN ps_attachfile.pass_self_no is '합격자소서 번호';
COMMENT ON COLUMN ps_attachfile.ps_fname is '원본 파일명';
COMMENT ON COLUMN ps_attachfile.ps_upname is '업로드 파일명';
COMMENT ON COLUMN ps_attachfile.ps_thumb is 'Thumb 파일명';
COMMENT ON COLUMN ps_attachfile.ps_fsize is '파일 사이즈';
COMMENT ON COLUMN ps_attachfile.ps_rdate is '등록일';


DROP SEQUENCE ps_attachfile_seq;
CREATE SEQUENCE ps_attachfile_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

commit;


-- 1) 등록
INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval, 3, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);     


-- 2) 목록( pass_self_no 기준 내림 차순, ps_attachfileno 기준 오름차순)
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
ORDER BY pass_self_no DESC,  ps_attachfileno ASC;


-- 3) 글별 파일 목록(pass_self_no 기준 내림 차순, ps_attachfileno 기준 오르차순)
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE pass_self_no = 1
ORDER BY ps_attachfileno ASC;


SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE ps_attachfileno=10;


-- 4) 하나의 파일 삭제
DELETE FROM ps_attachfile
WHERE ps_attachfileno = 9;


-- 5) FK pass_self_no 부모키 별 조회
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE pass_self_no=1;


-- 부모키별 갯수 산출
SELECT COUNT(*) as cnt
FROM ps_attachfile
WHERE pass_self_no=1;


-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM ps_attachfile
WHERE pass_self_no=1;


-- 7) pass_self, ps_attachfile join
    SELECT c.pass_self_title, a.ps_attachfileno, a.pass_self_no, a.ps_fname, a.ps_upname, a.ps_thumb, a.ps_fsize, a.ps_rdate
    FROM pass_self c, ps_attachfile a
    WHERE c.pass_self_no = a.pass_self_no
    ORDER BY c.pass_self_no DESC,  a.ps_attachfileno ASC;


-- 8) 조회
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE ps_attachfileno=8;



