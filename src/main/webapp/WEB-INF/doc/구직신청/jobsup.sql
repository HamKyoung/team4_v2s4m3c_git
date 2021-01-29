/**********************************/
/* Table Name: 일반 회원 */
/**********************************/
drop table gen_member;
CREATE TABLE gen_member(
		gen_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		gen_id                        		VARCHAR2(50)		 NOT NULL UNIQUE ,
		gen_passwd                    		VARCHAR2(20)		 NOT NULL,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		gen_resident                  		VARCHAR2(13)		 NOT NULL,
		gen_sex                       		VARCHAR2(10)		 NOT NULL,
		gen_phone                     		VARCHAR2(20)		 NOT NULL,
		gen_zipcode                   		VARCHAR2(5)		 NULL ,
		gen_addr                      		VARCHAR2(100)		 NULL ,
		gen_addr1                     		VARCHAR2(50)		 NULL ,
		gen_mail                      		VARCHAR2(50)		 NOT NULL,
		gen_date                      		DATE		 NOT NULL
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

DROP SEQUENCE gen_member_seq;
CREATE SEQUENCE gen_member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 등록
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test1', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test2', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

SELECT * FROM gen_member;

commit;

-- 목록
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
ORDER BY gen_memberno ASC;

-- 조회
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
WHERE gen_memberno = 1;

commit;

/**********************************/
/* Table Name: 회사소개 */
/**********************************/
CREATE TABLE COM_INTRO(
		COMNO                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		COM_NAME                      		VARCHAR2(1000)		 NOT NULL,
		COM_FORM                      		VARCHAR2(1000)		 NOT NULL,
		COM_TYPE                      		VARCHAR2(1000)		 NOT NULL,
		SALES                         		VARCHAR2(50)		 NOT NULL,
		HOMEPAGE                      		VARCHAR2(1000)		 NOT NULL,
		ADDRESS                       		VARCHAR2(1000)		 NOT NULL,
		NUM_PEOPLE                    		VARCHAR2(50)		 NOT NULL,
		EDATE                         		VARCHAR2(500)		 NOT NULL,
		CEO_NAME                      		VARCHAR2(1000)		 NOT NULL,
		COR_MEMBERNO                  		NUMBER(7)		 NULL ,
		VISIBLE                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE COM_INTRO is '회사소개';
COMMENT ON COLUMN COM_INTRO.COMNO is '회사번호';
COMMENT ON COLUMN COM_INTRO.COM_NAME is '회사이름';
COMMENT ON COLUMN COM_INTRO.COM_FORM is '기업형태';
COMMENT ON COLUMN COM_INTRO.COM_TYPE is '업종';
COMMENT ON COLUMN COM_INTRO.SALES is '매출액';
COMMENT ON COLUMN COM_INTRO.HOMEPAGE is '홈페이지';
COMMENT ON COLUMN COM_INTRO.ADDRESS is '회사주소';
COMMENT ON COLUMN COM_INTRO.NUM_PEOPLE is '사원수';
COMMENT ON COLUMN COM_INTRO.EDATE is '설립일';
COMMENT ON COLUMN COM_INTRO.CEO_NAME is '대표자명';
COMMENT ON COLUMN COM_INTRO.COR_MEMBERNO is '기업 회원 번호';
COMMENT ON COLUMN COM_INTRO.VISIBLE is '출력모드';


/**********************************/
/* Table Name: 회사대분류 */
/**********************************/
CREATE TABLE COM_CATE(
		CATENO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		COMNO                         		NUMBER(10)		 NULL ,
		CATE_NAME                     		VARCHAR2(100)		 NOT NULL,
		CATE_SEQNO                    		NUMBER(10)		 NOT NULL,
		CATE_VISIBLE                  		CHAR(1)		 NOT NULL,
		CATE_DATE                     		DATE		 NOT NULL,
		CATE_CNT                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (COMNO) REFERENCES COM_INTRO (COMNO)
);

COMMENT ON TABLE COM_CATE is '회사대분류';
COMMENT ON COLUMN COM_CATE.CATENO is '대분류 번호';
COMMENT ON COLUMN COM_CATE.COMNO is '회사번호';
COMMENT ON COLUMN COM_CATE.CATE_NAME is '대분류 이름';
COMMENT ON COLUMN COM_CATE.CATE_SEQNO is '출력순서';
COMMENT ON COLUMN COM_CATE.CATE_VISIBLE is '출력모드';
COMMENT ON COLUMN COM_CATE.CATE_DATE is '등록일';
COMMENT ON COLUMN COM_CATE.CATE_CNT is '등록된 글 수';


/**********************************/
/* Table Name: 구인 */
/**********************************/
drop table recruit;
CREATE TABLE recruit(
		recruitno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cateno                        		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
        seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		content                       		CLOB		 NOT NULL,
		homepage                      		VARCHAR2(500)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		comno                         		NUMBER(8)         DEFAULT 0         NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
        word                                  VARCHAR2(300)         NULL ,
        rdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,
  FOREIGN KEY (cateno) REFERENCES COM_CATE (cateno)
);

COMMENT ON TABLE recruit is '구인';
COMMENT ON COLUMN recruit.recruitno is '구인번호';
COMMENT ON COLUMN recruit.cateno is '대분류 번호';
COMMENT ON COLUMN recruit.title is '제목';
COMMENT ON COLUMN recruit.seqno is '순서';
COMMENT ON COLUMN recruit.content is '내용';
COMMENT ON COLUMN recruit.homepage is '홈페이지';
COMMENT ON COLUMN recruit.visible is '출력모드';
COMMENT ON COLUMN recruit.comno is '회사번호';
COMMENT ON COLUMN recruit.passwd is '패스워드';
COMMENT ON COLUMN recruit.word is '검색어';
COMMENT ON COLUMN recruit.rdate is '등록일';
COMMENT ON COLUMN recruit.file1 is '메인 이미지';
COMMENT ON COLUMN recruit.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN recruit.size1 is '메인 이미지 크기';


DROP SEQUENCE recruit_seq;
CREATE SEQUENCE recruit_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

  
1) 글 등록(이미지 관련 컬러 추가)
-- cateno: 1이 사전에 등록이되어 있어야 INSERT 가능
INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년 하반기 직원 공개채용', 1, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년도 현성그룹 신입 / 경력사원 모집', 2, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년도 삼성그룹 신입모집', 3, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
             
INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2021년도 쿠팡 신입 / 경력사원 모집', 4, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
            
commit;

2) 전체목록
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate
FROM recruit 
ORDER BY recruitno DESC;

commit;


/**********************************/
/* Table Name: 기업 회원 */
/**********************************/
CREATE TABLE cor_member(
cor_memberno                   NUMBER(7)  NOT NULL  PRIMARY KEY,
cor_id                         VARCHAR2(50)  NOT NULL UNIQUE,
cor_passwd                     VARCHAR2(20)  NOT NULL,
cor_name                       VARCHAR2(20)  NOT NULL,
cor_resident                   VARCHAR2(13)  NOT NULL,
cor_sex                        VARCHAR2(10)  NOT NULL,
cor_phone                      VARCHAR2(20)  NOT NULL,
cor_zipcode                    VARCHAR2(5)  NULL ,
cor_addr                       VARCHAR2(100)  NULL ,
cor_addr1                      VARCHAR2(50)  NULL ,
cor_mail                       VARCHAR2(50)  NOT NULL,
cor_date                       DATE  NOT NULL
);

COMMENT ON TABLE cor_member is '기업 회원';
COMMENT ON COLUMN cor_member.cor_memberno is '기업 회원 번호';
COMMENT ON COLUMN cor_member.cor_id is '기업 회원 아이디';
COMMENT ON COLUMN cor_member.cor_passwd is '기업 회원 비밀번호';
COMMENT ON COLUMN cor_member.cor_name is '기업 회원 이름';
COMMENT ON COLUMN cor_member.cor_resident is '기업 회원 생년월일';
COMMENT ON COLUMN cor_member.cor_sex is '기업 회원 성별 ';
COMMENT ON COLUMN cor_member.cor_phone is '기업 회원 전화 번호';
COMMENT ON COLUMN cor_member.cor_zipcode is '기업 회원 우편 번호';
COMMENT ON COLUMN cor_member.cor_addr is '기업 회원 주소';
COMMENT ON COLUMN cor_member.cor_addr1 is '기업 회원 주소1';
COMMENT ON COLUMN cor_member.cor_mail is '기업 회원 이메일';
COMMENT ON COLUMN cor_member.cor_date is '기업 회원 가입 날짜';

DROP SEQUENCE cor_member_seq;
CREATE SEQUENCE cor_member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


-- 등록
insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_mail, cor_date)
values(cor_member_seq.nextval, 'test', '1234', '테스트', '1111111', '남자', '01011111111', 'test@test.com', sysdate);



/**********************************/
/* Table Name: 이력서 */
/**********************************/
CREATE TABLE mem_res(
		res_no                        		NUMBER(10)		        NOT NULL		 PRIMARY KEY,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		res_phone                     		VARCHAR2(60)		 NOT NULL,
		res_mail1                      		VARCHAR2(200)		 NOT NULL,
		res_mail2                      		VARCHAR2(200)		 NOT NULL,
		res_title                     		VARCHAR2(100)		    NOT NULL,
		res_intro                     		VARCHAR2(800)		    NOT NULL,
		res_work                      	CLOB		                    DEFAULT 0		 NULL ,
		res_web                       	VARCHAR2(100)		NULL ,
		res_visible                   	CHAR(1)		            DEFAULT 'Y'	 NOT NULL,
		res_date                      		DATE		                NOT NULL,
		res_pic                       		VARCHAR2(100)		 NULL ,
		res_thumb                     	VARCHAR2(100)		 NULL ,
		res_size                      		NUMBER(10)		         NULL ,
		gen_memberno               	NUMBER(7)		         NULL ,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

CREATE SEQUENCE mem_res_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 이력서 학력정보 */
/**********************************/
CREATE TABLE res_scho(
		res_scname                     VARCHAR2(80)		            NOT NULL,
		res_major1                        VARCHAR2(100)		        NOT NULL,
		res_major2                    	VARCHAR2(100)		        NULL ,
		res_gotin                     		VARCHAR2(50)		            NOT NULL,
		res_grad                      	VARCHAR2(50)		            NOT NULL,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

/**********************************/
/* Table Name: 자격증 */
/**********************************/
CREATE TABLE res_lice(
		res_lice1                     		VARCHAR2(50)		 NULL 		 ,
		res_lice1_lev                 		VARCHAR2(30)		 NULL ,
		res_lice2                     		VARCHAR2(50)		 NULL,
		res_lice2_lev                 		VARCHAR2(30)		 NULL ,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY ,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

-- 등록
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '홍길동', '010-1234-5678', 'abcde', 'naver.com', '안녕하세요', '자기소개', 'ㅇㅇ회사 ㅇㅇ 직무 근무', 'www.daum.net', 'Y', sysdate, '사진', '썸네일', 10, 1);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '김소영',  '010-1234-5678', 'abcde', 'naver.com', '안녕하세요', '자기소개', 'ㅇㅇ회사 ㅇㅇ 직무 근무', 'www.daum.net', 'Y', sysdate, '사진', '썸네일', 10, 2);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '김철수',  '010-1234-5678', 'abcde', 'naver.com', '안녕하세요', '자기소개', 'ㅇㅇ회사 ㅇㅇ 직무 근무', 'www.daum.net', 'Y', sysdate, '사진', '썸네일', 10, 3);

INSERT INTO res_scho(res_scname, res_major1, res_major2, res_gotin,res_grad)
VALUES('서울대학교', '디지털콘텐츠게임애니메이션공학부', '사회복지학과', 980076,998076);

INSERT INTO res_lice(res_lice1, res_lice1_lev, res_lice2, res_lice2_lev)
VALUES('토익', 960, '토스', 7, 2);

INSERT ALL
INTO mem_res
VALUES(mem_res_seq.nextval, '박지현', '01012554841', 'abcde', 'naver.com', '제목', '자기소개', 'ㅇㅇ회사 ㅇㅇ 직무 근무', 'www.daum.net', 'Y', sysdate, '사진', '썸네일', 10, 1)
INTO res_scho
VALUES ('제주대학교', '영어영문학과', '신문방송학과', 200106, 201115,mem_res_seq.nextval)
INTO res_lice
VALUES('토익', 990, '토스', 9,mem_res_seq.nextval)
SELECT * FROM DUAL; 


-- 목록
SELECT*FROM mem_res ORDER BY res_no ASC;
SELECT*FROM res_scho;
SELECT*FROM res_lice;
SELECT*FROM mem_res ORDER BY gen_memberno ASC;

-- 조회
SELECT r.res_no as mem_res_res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, 
s.res_no as res_scho_res_no, res_scname, res_major1, res_major2, res_gotin,res_grad, 
l.res_no as res_lice_res_no, res_lice1, res_lice1_lev, res_lice2, res_lice2_lev
FROM mem_res r, res_scho s, res_lice l
WHERE r.res_no=s.res_no AND s.res_no=l.res_no AND r.res_no = 1;

-- 수정
UPDATE mem_res
SET res_visible='N'
WHERE res_no = 1;

-- 삭제
DELETE mem_res
WHERE res_no = 8;

COMMIT;


/**********************************/
/* Table Name: 구직신청 */
/**********************************/
DROP TABLE jobsup;
CREATE TABLE jobsup(
		jobsupno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        recruitno                             NUMBER(10)		 NOT NULL,
        gen_memberno                  	NUMBER(7)		 NOT NULL,  
        res_no                                NUMBER(10)		 NOT NULL,
		jobsup_title                  		VARCHAR2(300)		 NOT NULL,
		jobsup_msg                    		VARCHAR2(1000)		 NOT NULL,
		jobsup_date                   		DATE		 NOT NULL,
FOREIGN KEY (recruitno) REFERENCES recruit (recruitno),
FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno),
FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

COMMENT ON TABLE jobsup is '구직 신청';
COMMENT ON COLUMN jobsup.jopsupno is '구직 신청 번호';
COMMENT ON COLUMN jobsup.recruitno is '채용 번호'
COMMENT ON COLUMN jobsup.gen_memberno is '회원 번호';;
COMMENT ON COLUMN jobsup.res_no is '이력서 번호';
COMMENT ON COLUMN jobsup.jopsup_title is '지원 제목';
COMMENT ON COLUMN jobsup.jobsup_msg is '지원 메세지';
COMMENT ON COLUMN jobsup.jobsup_date is '지원 등록일';

COMMIT;

DROP SEQUENCE jobsup_seq;
CREATE SEQUENCE jobsup_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
 COMMIT; 
  
  
-- 등록
INSERT INTO jobsup(jobsupno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 1, 1, 1, '믿음직하고 꼼꼼한사람입니다.', '저는 이 회사에 지원하고 싶은 이유는 뭣보다 돈이필요해서 입니다.', sysdate);

INSERT INTO jobsup(jobsupno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 2, 2, 2, '믿음직하고 꼼꼼한사람입니다.', '저는 이 회사에 지원하고 싶은 이유는 뭣보다 돈이필요해서 입니다.', sysdate);

INSERT INTO jobsup(jobsupno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 3, 3, 3, '믿음직하고 꼼꼼한사람입니다.', '저는 이 회사에 지원하고 싶은 이유는 뭣보다 돈이필요해서 입니다.', sysdate);
  
COMMIT;

-- 목록
SELECT jobsupno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
ORDER BY jobsupno ASC;

-- 조회
SELECT jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
WHERE jobsupno = 1;

-- 수정
UPDATE jobsup
SET jobsup_title='믿음직하고 꼼꼼한사람입니다.', jobsup_msg='돈이필요해서 입니다'
WHERE jobsupno = 1;

UPDATE jobsup
SET recruitno = 2;
WHERE jobsupno = 2;

UPDATE jobsup
SET recruitno = 3;
WHERE jobsupno = 3;

COMMIT;
  