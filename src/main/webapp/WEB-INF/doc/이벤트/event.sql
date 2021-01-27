DROP TABLE event CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 이벤트 */
/**********************************/
CREATE TABLE event(
		eventno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		eve_title                     		VARCHAR2(80)		 NOT NULL,
		eve_content                   		VARCHAR2(800)		 NOT NULL,
		eve_visible                   		CHAR(1)		 NOT NULL,
		eve_date                      		DATE		 NOT NULL,
		eve_pic                       		VARCHAR2(500)		 NULL ,
		eve_thumb                     		VARCHAR2(100)		 NULL ,
		eve_size                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE event is '이벤트';
COMMENT ON COLUMN event.eventno is '이벤트 번호';
COMMENT ON COLUMN event.eve_title is '이벤트 제목';
COMMENT ON COLUMN event.eve_content is '이벤트 내용';
COMMENT ON COLUMN event.eve_visible is '공개 여부';
COMMENT ON COLUMN event.eve_date is '작성일';
COMMENT ON COLUMN event.eve_pic is '사진';
COMMENT ON COLUMN event.eve_thumb is '썸네일';
COMMENT ON COLUMN event.eve_size is '사진 용량';


DROP SEQUENCE event_seq;
CREATE SEQUENCE event_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
-- 등록
INSERT INTO event(eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size)
VALUES(event_seq.nextval, '이벤트 제목', '이벤트 내용입니다. 기간: 2021.01.27~2021.12.31 이벤트를 개최합니다. 응모시 추첨을 통하여 상품을 드립니다.', 'Y', sysdate, '사진', '사진_t', 1); 
  
--목록
SELECT * FROM event
ORDER BY eventno ASC;


-- 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM event
WHERE eve_title LIKE '%제목%';

-- step 3, 1 page
SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, r
FROM (
           SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, rownum as r
           FROM (
                     SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size
                     FROM event
                     WHERE eve_title LIKE '%제목%'
                     ORDER BY eventno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, r
FROM (
           SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, rownum as r
           FROM (
                     SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size
                     FROM event
                     WHERE eve_title LIKE '%제목%'
                     ORDER BY eventno DESC
           )          
)WHERE r >= 11 AND r <= 20;

-- read, 조회
SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size
FROM event
WHERE eventno = 1;

-- update, 수정
UPDATE event
SET eve_title='수정 완료', eve_content='수정 완료'
WHERE eventno = 1;

-- dalete, 삭제
DELETE FROM event
WHERE eventno = 3;

-- 출력 모드의 변경
UPDATE event
SET eve_visible='N'
WHERE eventno=1;

COMMIT;  

  
  
  
  
  
  
  
  
  
