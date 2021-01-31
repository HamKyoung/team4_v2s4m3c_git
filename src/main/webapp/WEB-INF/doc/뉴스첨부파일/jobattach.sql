/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
DROP TABLE jobattach;
CREATE TABLE jobattach(
        jobattachno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        jobnwsno                   NUMBER(10)         NULL ,
        jobattach_fname                             VARCHAR2(100)         NOT NULL,
        jobattach_fupname                      VARCHAR2(100)         NOT NULL,
        jobattach_thumb                         VARCHAR2(100)         NULL ,
        jobattach_fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
        jobattach_date                           DATE     NOT NULL,
  FOREIGN KEY (jobnwsno) REFERENCES jobnws (jobnwsno)
);

COMMENT ON TABLE  jobattachno is '뉴스첨부파일';
COMMENT ON COLUMN jobattach.jobnwsno is '뉴스번호';
COMMENT ON COLUMN jobattach.jobattach_fname is '원본 파일명';
COMMENT ON COLUMN jobattach.jobattach_fupname is '업로드 파일명';
COMMENT ON COLUMN jobattach.jobattach_thumb is 'Thumb 파일명';
COMMENT ON COLUMN jobattach.jobattach_fsize is '파일 사이즈';
COMMENT ON COLUMN jobattach.jobattach_date is '등록일';

DROP SEQUENCE jobattach_seq;
CREATE SEQUENCE jobattach_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 1) 등록  
INSERT INTO jobattach(jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date)
VALUES(jobattach_seq.nextval, 4, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO jobattach(jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date)
VALUES(jobattach_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO jobattach(jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date)
VALUES(jobattach_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);   


-- 2) 목록( jobnwsno 기준 내림 차순, jobattachno 기준 오르차순)
SELECT jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date
FROM jobattach
ORDER BY jobnwsno DESC,  jobattachno ASC;

-- 3) 글별 파일 목록(jobnwsno 기준 내림 차순, jobattachno 기준 오르차순)
SELECT jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date
FROM jobattach
WHERE jobnwsno = 1
ORDER BY jobattach_fname ASC;

-- 4) 하나의 파일 삭제
DELETE FROM jobattach
WHERE jobattachno = 1;

-- 5) FK contentsno 부모키 별 조회
SELECT jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date
FROM jobattach
WHERE jobnwsno=1;

-- 부모키별 갯수 산출
SELECT COUNT(*) as cnt
FROM jobattach
WHERE jobnwsno=1;

-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM jobattach
WHERE jobnwsno=1;


   
-- 7) jobnws, Jobattach join
    SELECT c.title, 
               a.jobattachno, a.jobnwsno, a.jobattach_fname, a.jobattach_fupname, a.jobattach_thumb, a.jobattach_fsize, a.jobattach_date
    FROM jobnws c, jobattach a
    WHERE c.jobnwsno = a.jobnwsno
    ORDER BY c.jobnwsno DESC,  a.jobattachno ASC;
    
-- 8) 조회
SELECT jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date
FROM jobattach
WHERE jobattachno=1;    
