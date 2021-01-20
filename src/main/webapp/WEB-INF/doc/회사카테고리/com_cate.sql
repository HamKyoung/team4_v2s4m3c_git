/**********************************/
/* Table Name: 회사소개 */
/**********************************/
DROP TABLE com_intro;
CREATE TABLE com_intro(
		comno                         		NUMBER(7)		    NOT NULL		 PRIMARY KEY,
		com_name                      	VARCHAR2(1000)		 NOT NULL,
		com_form                      		VARCHAR2(1000)		 NOT NULL,
		com_type                      		VARCHAR2(1000)		 NOT NULL,
		sales                         		    VARCHAR2(50)	         NOT NULL,
		homepage                      	VARCHAR2(1000)		 NOT NULL,
		address                       		VARCHAR2(1000)		 NOT NULL,
		num_people                    	VARCHAR2(50)	         NOT NULL,
		edate                          		VARCHAR2(500)	                 NOT NULL,
		ceo_name                      		VARCHAR2(1000)		 NOT NULL,
		cor_memberno                  	NUMBER(7)		     NULL ,
        visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
  FOREIGN KEY (cor_memberno) REFERENCES corporate_member (cor_memberno)
);

COMMENT ON TABLE com_intro is '회사소개';
COMMENT ON COLUMN com_intro.comno is '회사번호';
COMMENT ON COLUMN com_intro.com_name is '회사이름';
COMMENT ON COLUMN com_intro.com_form is '기업형태';
COMMENT ON COLUMN com_intro.com_type is '업종';
COMMENT ON COLUMN com_intro.sales is '매출액';
COMMENT ON COLUMN com_intro.homepage is '홈페이지';
COMMENT ON COLUMN com_intro.address is '회사주소';
COMMENT ON COLUMN com_intro.num_people is '사원수';
COMMENT ON COLUMN com_intro.edate is '설립일';
COMMENT ON COLUMN com_intro.ceo_name is '대표자명';
COMMENT ON COLUMN com_intro.cor_memberno is '기업 회원 번호';


/**********************************/
/* Table Name: com_cate */
/**********************************/
drop table com_cate;
CREATE TABLE com_cate(
		cateno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		comno                           NUMBER(10)		 NULL ,
		cate_name                      VARCHAR2(100)		 NOT NULL,
		cate_seqno                     NUMBER(10)		 DEFAULT 0		 NOT NULL,
		cate_visible                     CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		cate_date                        DATE		 NOT NULL,
		cate_cnt                    		 NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (comno) REFERENCES com_intro (comno)
);

COMMENT ON TABLE com_cate is '회사대분류';
COMMENT ON COLUMN com_cate.cateno is '대분류 번호';
COMMENT ON COLUMN com_cate.comno is '회사번호';
COMMENT ON COLUMN com_cate.cate_name is '대분류 이름';
COMMENT ON COLUMN com_cate.cate_seqno is '출력순서';
COMMENT ON COLUMN com_cate.cate_visible is '출력모드';
COMMENT ON COLUMN com_cate.cate_date is '등록일';
COMMENT ON COLUMN com_cate.cate_cnt is '등록된 글 수';

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


--등록  
--(부모테이블 먼저)
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,cor_memberno,visible)
VALUES(comintro_seq.nextval, '솔데스크','학원','컴퓨터학원','10억원','www.soldesk.com','종로구관철로','50명','2010-01-01','솔원장',1,'Y');

--(자식테이블)
INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 2, '경영＊사무', 1, 'Y', sysdate, 0);

INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 2, '마케팅＊광고＊홍보', 2, 'Y', sysdate, 0);

INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 2, 'IT＊인터넷', 3, 'Y', sysdate, 0);


-- 목록
SELECT cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt
FROM com_cate
ORDER BY cateno ASC;

--조회
SELECT cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt
FROM com_cate
WHERE cateno=1;

DELETE com_intro
WHERE cateno = 5;

SELECT r.comno as r_comno, r.com_name as r_com_name,
           c.cateno, c.comno, c.cate_name, c.cate_seqno, c.cate_visible, c.cate_date, c.cate_cnt
FROM com_intro r, com_cate c
WHERE r.comno = c.comno
ORDER BY r.comno ASC, c.cate_seqno ASC;


SELECT r.comno as r_comno, r.com_name as r_com_name,
           c.cateno, c.comno, c.cate_name, c.cate_seqno, c.cate_visible, c.cate_date, c.cate_cnt
FROM com_intro r, com_cate c
WHERE (r.comno = c.comno) AND r.comno=1
ORDER BY r.comno ASC, c.cate_seqno ASC;


commit;