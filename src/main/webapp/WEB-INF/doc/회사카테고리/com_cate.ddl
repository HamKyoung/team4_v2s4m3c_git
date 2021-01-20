/**********************************/
/* Table Name: com_cate */
/**********************************/
CREATE TABLE 회사대분류(
	  cateno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    comno                             NUMBER(10)     NULL ,
    cate_name                           VARCHAR2(100)    NOT NULL,
    cate_seqno                            NUMBER(10)     DEFAULT 0     NOT NULL,
    cate_visible                              CHAR(1)    DEFAULT 'Y'     NOT NULL,
    cate_date                               DATE     NOT NULL,
    cate_cnt                        NUMBER(10)     DEFAULT 0     NOT NULL,
    comno                             NUMBER(7)    NULL 

);

COMMENT ON TABLE 회사대분류 is 'com_cate';
COMMENT ON COLUMN 회사대분류.대분류 번호 is 'cateno';
COMMENT ON COLUMN 회사대분류.회사번호 is 'comno';
COMMENT ON COLUMN 회사대분류.대분류 이름 is 'cate_name';
COMMENT ON COLUMN 회사대분류.출력 순서 is 'cate_seqno';
COMMENT ON COLUMN 회사대분류.출력모드 is 'cate_visible';
COMMENT ON COLUMN 회사대분류.등록일 is 'cate_date';
COMMENT ON COLUMN 회사대분류.등록된 글 수 is 'cate_cnt';
COMMENT ON COLUMN 회사대분류.comno is '회사번호';


