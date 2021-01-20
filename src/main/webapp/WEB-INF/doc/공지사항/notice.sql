/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		notice_no             	NUMBER(10)		                             NOT NULL	 PRIMARY KEY,     -- 공지사항 번호
		notice_name           VARCHAR2(200)		                         NOT NULL,                              -- 공지사항 제목 
		notice_con        		CLOB                  		                     NOT NULL,                              -- 공지사항 내용
        notice_seqno          NUMBER(7)	    	 DEFAULT 0		 NOT NULL,                              -- 공지사항 출력 순서
		notice_views       	NUMBER(10)		     DEFAULT 0		 NOT NULL,                              -- 공지사항 조회수
		notice_visible       	CHAR(1)		         DEFAULT 'N'		 NOT NULL,                              -- 공지사항 공개 여부
		notice_date         	DATE		                 NOT NULL,                                                       -- 공지사항 등록일
        notice_file1                                   VARCHAR(100)          NULL,
        notice_thumb1                              VARCHAR(100)          NULL,
        notice_size1                                 NUMBER(10)      DEFAULT 0 NULL  
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.notice_no is '공지사항 번호';
COMMENT ON COLUMN notice.notice_name is '공지사항 제목';
COMMENT ON COLUMN notice.notice_con is '공지사항 내용';
COMMENT ON COLUMN notice.notice_seqno is '공지사항 출력 순서';
COMMENT ON COLUMN notice.notice_views is '공지사항 조회수';
COMMENT ON COLUMN notice.notice_visible is '공지사항 출력모드';
COMMENT ON COLUMN notice.notice_date is '공지사항 작성날짜';
COMMENT ON COLUMN notice.notice_file1 is '공지사항 이미지';
COMMENT ON COLUMN notice.notice_thumb1 is '공지사항 메인 이미지 Preview';
COMMENT ON COLUMN notice.notice_size1 is '메인 이미지 크기';

DROP TABLE notice;

DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

  -- insert
INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1)
VALUES(notice_seq.nextval, '첫번째 공지사항', '첫번째 공지사항 내용', '1', '0', 'N', sysdate, 'notice.jpg', 'notice_t.jpg', 23657);

INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1)
VALUES(notice_seq.nextval, '두번째 공지사항', '두번째 공지사항 내용', '1', '0', 'N', sysdate, 'notice2.jpg', 'notice2_t.jpg', 23657);

INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1, notice_word)
VALUES(notice_seq.nextval, '세번째 공지사항', '세번째 공지사항 내용', '1', '0', 'N', sysdate, 'notice2.jpg', 'notice2_t.jpg', 23657, '알림');

-- list
SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_word
FROM notice
ORDER BY notice_seqno ASC;

ALTER TABLE notice
ADD (notice_word VARCHAR2(300));


commit;

-- 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM notice
WHERE word LIKE '%롯데카드%';


-- step 3, 1 page
SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, r
FROM (
           SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, rownum as r
           FROM (
                     SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date
                     FROM notice
                     WHERE notice_word LIKE '%롯데카드%'
                     ORDER BY notice_no DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, r
FROM (
           SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, rownum as r
           FROM (
                     SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date
                     FROM notice
                     WHERE notice_word LIKE '%롯데카드%'
                     ORDER BY notice_no DESC
           )          
)
WHERE r >= 11 AND r <= 20;





-- read, 조회
SELECT notice_no, notice_name, notice_con, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1
FROM notice
WHERE notice_no = 1;

-- update, 수정
UPDATE notice
SET notice_name='수정된 공지사항', notice_con='수정 완료', notice_file1='notice2', notice_thumb1='notice2_t', notice_size1='23657'
WHERE notice_no = 1;

-- dalete, 삭제
DELETE FROM notice
WHERE notice_no = 1;

 -- 우선순위 상향 up 10 ▷ 1
UPDATE notice
SET notice_seqno = notice_seqno - 1
WHERE notice_no = 3;
  
-- 우선순위 하향 down 1 ▷ 10
UPDATE notice
SET notice_seqno = notice_seqno + 1
WHERE notice_no = 1;

-- 출력 모드의 변경
UPDATE notice
SET notice_views='Y'
WHERE notice_no=1;

UPDATE notice
SET notice_file1='file name', notice_thumb1='thumb file name', notice_size1=5000
WHERE notice_no=5; 

commit;




