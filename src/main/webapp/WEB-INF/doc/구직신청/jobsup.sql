/**********************************/
/* Table Name: 析鋼 噺据 */
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

COMMENT ON TABLE gen_member is '析鋼 噺据';
COMMENT ON COLUMN gen_member.gen_memberno is '噺据 腰硲';
COMMENT ON COLUMN gen_member.gen_id is '噺据 焼戚巨';
COMMENT ON COLUMN gen_member.gen_passwd is '搾腔腰硲 ';
COMMENT ON COLUMN gen_member.gen_name is '噺据 戚硯';
COMMENT ON COLUMN gen_member.gen_resident is '持鰍杉析';
COMMENT ON COLUMN gen_member.gen_sex is '失紺';
COMMENT ON COLUMN gen_member.gen_phone is '穿鉢 腰硲';
COMMENT ON COLUMN gen_member.gen_zipcode is '酔畷 腰硲';
COMMENT ON COLUMN gen_member.gen_addr is '噺据 爽社';
COMMENT ON COLUMN gen_member.gen_addr1 is '噺据 爽社1';
COMMENT ON COLUMN gen_member.gen_mail is '戚五析';
COMMENT ON COLUMN gen_member.gen_date is '亜脊 劾促';

DROP SEQUENCE gen_member_seq;
CREATE SEQUENCE gen_member_seq
  START WITH 1              -- 獣拙 腰硲
  INCREMENT BY 1          -- 装亜葵
  MAXVALUE 9999999999 -- 置企葵: 9999999 --> NUMBER(10) 企誓
  CACHE 2                       -- 2腰精 五乞軒拭辞幻 域至
  NOCYCLE;                     -- 陥獣 1採斗 持失鞠澗 依聖 号走
  
-- 去系
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '砺什闘', '010101', '害切', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test1', '1234', '砺什闘', '010101', '害切', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test2', '1234', '砺什闘', '010101', '害切', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

SELECT * FROM gen_member;

commit;

-- 鯉系
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
ORDER BY gen_memberno ASC;

-- 繕噺
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
WHERE gen_memberno = 1;
commit;


/**********************************/
/* Table Name: 姥昔 */
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

COMMENT ON TABLE recruit is '姥昔';
COMMENT ON COLUMN recruit.recruitno is '姥昔腰硲';
COMMENT ON COLUMN recruit.cateno is '企歳嫌 腰硲';
COMMENT ON COLUMN recruit.title is '薦鯉';
COMMENT ON COLUMN recruit.seqno is '授辞';
COMMENT ON COLUMN recruit.content is '鎧遂';
COMMENT ON COLUMN recruit.homepage is '幡凪戚走';
COMMENT ON COLUMN recruit.visible is '窒径乞球';
COMMENT ON COLUMN recruit.comno is '噺紫腰硲';
COMMENT ON COLUMN recruit.passwd is '鳶什趨球';
COMMENT ON COLUMN recruit.word is '伊事嬢';
COMMENT ON COLUMN recruit.rdate is '去系析';
COMMENT ON COLUMN recruit.file1 is '五昔 戚耕走';
COMMENT ON COLUMN recruit.thumb1 is '五昔 戚耕走 Preview';
COMMENT ON COLUMN recruit.size1 is '五昔 戚耕走 滴奄';


DROP SEQUENCE recruit_seq;
CREATE SEQUENCE recruit_seq
  START WITH 1              -- 獣拙 腰硲
  INCREMENT BY 1          -- 装亜葵
  MAXVALUE 9999999999 -- 置企葵: 9999999 --> NUMBER(7) 企誓
  CACHE 2                       -- 2腰精 五乞軒拭辞幻 域至
  NOCYCLE;                     -- 陥獣 1採斗 持失鞠澗 依聖 号走

  
1) 越 去系(戚耕走 淫恵 鎮君 蓄亜)
-- cateno: 1戚 紫穿拭 去系戚鞠嬢 赤嬢醤 INSERT 亜管
INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020鰍 馬鋼奄 送据 因鯵辰遂', 1, '酔軒澗 護誤嗣澗陥' ,'http://www.daum.net',
             '1234', '馬鋼奄', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020鰍亀 薄失益血 重脊 / 井径紫据 乞増', 2, '酔軒澗 護誤嗣澗陥' ,'http://www.daum.net',
             '1234', '馬鋼奄', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020鰍亀 誌失益血 重脊乞増', 3, '酔軒澗 護誤嗣澗陥' ,'http://www.daum.net',
             '1234', '馬鋼奄', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
             
INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2021鰍亀 庭椴 重脊 / 井径紫据 乞増', 4, '酔軒澗 護誤嗣澗陥' ,'http://www.daum.net',
             '1234', '馬鋼奄', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
            
commit;

2) 穿端鯉系
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate
FROM recruit 
ORDER BY recruitno DESC;

commit;


/**********************************/
/* Table Name: 戚径辞 */
/**********************************/
CREATE TABLE mem_res(
		res_no                        		NUMBER(10)		        NOT NULL		 PRIMARY KEY,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		res_phone                     		VARCHAR2(60)		 NOT NULL,
		res_mail1                      		VARCHAR2(200)		 NOT NULL,
		res_mail2                      		VARCHAR2(200)		 NOT NULL,
		res_title.                     		VARCHAR2(100)		    NOT NULL,
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
  START WITH 1              -- 獣拙 腰硲
  INCREMENT BY 1          -- 装亜葵
  MAXVALUE 9999999999 -- 置企葵: 9999999 --> NUMBER(7) 企誓
  CACHE 2                       -- 2腰精 五乞軒拭辞幻 域至
  NOCYCLE;                     -- 陥獣 1採斗 持失鞠澗 依聖 号走

/**********************************/
/* Table Name: 戚径辞 俳径舛左 */
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
/* Table Name: 切維装 */
/**********************************/
CREATE TABLE res_lice(
		res_lice1                     		VARCHAR2(50)		 NULL 		 ,
		res_lice1_lev                 		VARCHAR2(30)		 NULL ,
		res_lice2                     		VARCHAR2(50)		 NULL,
		res_lice2_lev                 		VARCHAR2(30)		 NULL ,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY ,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

-- 去系
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '畠掩疑', '010-1234-5678', 'abcde', 'naver.com', '照括馬室推', '切奄社鯵', 'しし噺紫 しし 送巷 悦巷', 'www.daum.net', 'Y', sysdate, '紫遭', '醇革析', 10, 1);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '沿社慎',  '010-1234-5678', 'abcde', 'naver.com', '照括馬室推', '切奄社鯵', 'しし噺紫 しし 送巷 悦巷', 'www.daum.net', 'Y', sysdate, '紫遭', '醇革析', 10, 2);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '沿旦呪',  '010-1234-5678', 'abcde', 'naver.com', '照括馬室推', '切奄社鯵', 'しし噺紫 しし 送巷 悦巷', 'www.daum.net', 'Y', sysdate, '紫遭', '醇革析', 10, 3);

INSERT INTO res_scho(res_scname, res_major1, res_major2, res_gotin,res_grad)
VALUES('辞随企俳嘘', '巨走登嬬度苧惟績蕉艦五戚芝因俳採', '紫噺差走俳引', 980076,998076);

INSERT INTO res_lice(res_lice1, res_lice1_lev, res_lice2, res_lice2_lev)
VALUES('塘斥', 960, '塘什', 7, 2);

INSERT ALL
INTO mem_res
VALUES(mem_res_seq.nextval, '酵走薄', '01012554841', 'abcde', 'naver.com', '薦鯉', '切奄社鯵', 'しし噺紫 しし 送巷 悦巷', 'www.daum.net', 'Y', sysdate, '紫遭', '醇革析', 10, 1)
INTO res_scho
VALUES ('薦爽企俳嘘', '慎嬢慎庚俳引', '重庚号勺俳引', 200106, 201115,mem_res_seq.nextval)
INTO res_lice
VALUES('塘斥', 990, '塘什', 9,mem_res_seq.nextval)
SELECT * FROM DUAL; 


-- 鯉系
SELECT*FROM mem_res ORDER BY res_no ASC;
SELECT*FROM res_scho;
SELECT*FROM res_lice;
SELECT*FROM mem_res ORDER BY gen_memberno ASC;

-- 繕噺
SELECT r.res_no as mem_res_res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, 
s.res_no as res_scho_res_no, res_scname, res_major1, res_major2, res_gotin,res_grad, 
l.res_no as res_lice_res_no, res_lice1, res_lice1_lev, res_lice2, res_lice2_lev
FROM mem_res r, res_scho s, res_lice l
WHERE r.res_no=s.res_no AND s.res_no=l.res_no AND r.res_no = 1;

-- 呪舛
UPDATE mem_res
SET res_visible='N'
WHERE res_no = 1;

-- 肢薦
DELETE mem_res
WHERE res_no = 8;

COMMIT;

/**********************************/
/* Table Name: 噺紫社鯵 */
/**********************************/
DROP TABLE com_intro CASCADE CONSTRAINTS; 
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
        visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
);

DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- 獣拙 腰硲
  INCREMENT BY 1          -- 装亜葵
  MAXVALUE 9999999999 -- 置企葵: 9999999 --> NUMBER(7) 企誓
  CACHE 2                       -- 2腰精 五乞軒拭辞幻 域至
  NOCYCLE;                     -- 陥獣 1採斗 持失鞠澗 依聖 号走

-- 去系
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '車汽什滴','俳据','陳濃斗俳据','10常据','www.soldesk.com','曽稽姥淫旦稽','50誤','2010-01-01','車据舌','Y');

INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '誌失穿切','000','000','10常据','www.soldesk.com','曽稽姥淫旦稽','1000誤','2010-01-01','車据舌','Y');


-- 鯉系
SELECT comno, com_name, com_form,com_type, sales, homepage,address,num_people,edate,ceo_name,visible
FROM com_intro
ORDER BY comno ASC;


commit;

/**********************************/
/* Table Name: 姥送重短 */
/**********************************/
CREATE TABLE jobsup(
		jobsupno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        com_name                           VARCHAR2(1000)		 NOT NULL,
        title                                    VARCHAR2(300)		 NOT NULL,
        gen_name                      		VARCHAR2(20)		     NOT NULL,
        res_intro                     		    VARCHAR2(800)		 NOT NULL,
		jobsup_title                  		VARCHAR2(300)		 NOT NULL,
		jobsup_msg                    		VARCHAR2(1000)		 NOT NULL,
		jobsup_date                   		DATE		 NOT NULL,
FOREIGN KEY (com_name) REFERENCES com_intro (com_name),        
FOREIGN KEY (title) REFERENCES recruit (title),
FOREIGN KEY (gen_name) REFERENCES gen_member (gen_name),
FOREIGN KEY (res_intro) REFERENCES mem_res (res_intro)
);



DROP TABLE jobsup;
CREATE TABLE jobsup(
		jobsupno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        comno                               NUMBER(10)         NOT NULL,
        recruitno                             NUMBER(10)		 NOT NULL,
        gen_memberno                  	NUMBER(7)		 NOT NULL,  
        res_no                                NUMBER(10)		 NOT NULL,
		jobsup_title                  		VARCHAR2(300)		 NOT NULL,
		jobsup_msg                    		VARCHAR2(1000)		 NOT NULL,
		jobsup_date                   		DATE		 NOT NULL,
FOREIGN KEY (comno) REFERENCES com_intro (comno),        
FOREIGN KEY (recruitno) REFERENCES recruit (recruitno),
FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno),
FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

COMMENT ON TABLE jobsup is '姥送 重短';
COMMENT ON COLUMN jobsup.jopsupno is '姥送 重短 腰硲';
COMMENT ON COLUMN jobsup.comno is '噺紫 腰硲';
COMMENT ON COLUMN jobsup.recruitno is '辰遂 腰硲';
COMMENT ON COLUMN jobsup.gen_memberno is '噺据 腰硲';
COMMENT ON COLUMN jobsup.res_no is '戚径辞 腰硲';
COMMENT ON COLUMN jobsup.jopsup_title is '走据 薦鯉';
COMMENT ON COLUMN jobsup.jobsup_msg is '走据 五室走';
COMMENT ON COLUMN jobsup.jobsup_date is '走据 去系析';

COMMIT;

DROP SEQUENCE jobsup_seq;
CREATE SEQUENCE jobsup_seq
  START WITH 1              -- 獣拙 腰硲
  INCREMENT BY 1          -- 装亜葵
  MAXVALUE 9999999999 -- 置企葵: 9999999 --> NUMBER(7) 企誓
  CACHE 2                       -- 2腰精 五乞軒拭辞幻 域至
  NOCYCLE;                     -- 陥獣 1採斗 持失鞠澗 依聖 号走
  
 COMMIT; 
  
  
-- 去系
INSERT INTO jobsup(jobsupno, comno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 1, 1, 1, 1, '肱製送馬壱 可可廃紫寓脊艦陥.', '煽澗 戚 噺紫拭 走据馬壱 粛精 戚政澗 構左陥 儀戚琶推背辞 脊艦陥.', sysdate);

INSERT INTO jobsup(jobsupno, comno ,recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 2, 2, 2, 2, '肱製送馬壱 可可廃紫寓脊艦陥.', '煽澗 戚 噺紫拭 走据馬壱 粛精 戚政澗 構左陥 儀戚琶推背辞 脊艦陥.', sysdate);

INSERT INTO jobsup(jobsupno, comno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 3, 3, 3, 3, '肱製送馬壱 可可廃紫寓脊艦陥.', '煽澗 戚 噺紫拭 走据馬壱 粛精 戚政澗 構左陥 儀戚琶推背辞 脊艦陥.', sysdate);
  
INSERT INTO jobsup(jobsupno, comno,recruitno, gen_memberno,jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval,  7, 1,'test', 'test', sysdate);
COMMIT;

-- 鯉系
SELECT jobsupno, comno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
ORDER BY jobsupno ASC;

-- 繕噺
SELECT jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
WHERE jobsupno = 1;

-- 呪舛
UPDATE jobsup
SET jobsup_title='肱製送馬壱 可可廃紫寓脊艦陥.', jobsup_msg='儀戚琶推背辞 脊艦陥'
WHERE jobsupno = 1;

UPDATE jobsup
SET recruitno = 2;
WHERE jobsupno = 2;

UPDATE jobsup
SET recruitno = 3;
WHERE jobsupno = 3;

COMMIT;