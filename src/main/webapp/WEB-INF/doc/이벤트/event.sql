DROP TABLE event CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: �̺�Ʈ */
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

COMMENT ON TABLE event is '�̺�Ʈ';
COMMENT ON COLUMN event.eventno is '�̺�Ʈ ��ȣ';
COMMENT ON COLUMN event.eve_title is '�̺�Ʈ ����';
COMMENT ON COLUMN event.eve_content is '�̺�Ʈ ����';
COMMENT ON COLUMN event.eve_visible is '���� ����';
COMMENT ON COLUMN event.eve_date is '�ۼ���';
COMMENT ON COLUMN event.eve_pic is '����';
COMMENT ON COLUMN event.eve_thumb is '�����';
COMMENT ON COLUMN event.eve_size is '���� �뷮';


DROP SEQUENCE event_seq;
CREATE SEQUENCE event_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
-- ���
INSERT INTO event(eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size)
VALUES(event_seq.nextval, '�̺�Ʈ ����', '�̺�Ʈ �����Դϴ�. �Ⱓ: 2021.01.27~2021.12.31 �̺�Ʈ�� �����մϴ�. ����� ��÷�� ���Ͽ� ��ǰ�� �帳�ϴ�.', 'Y', sysdate, '����', '����_t', 1); 
  
--���
SELECT * FROM event
ORDER BY eventno ASC;


-- �˻��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM event
WHERE eve_title LIKE '%����%';

-- step 3, 1 page
SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, r
FROM (
           SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, rownum as r
           FROM (
                     SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size
                     FROM event
                     WHERE eve_title LIKE '%����%'
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
                     WHERE eve_title LIKE '%����%'
                     ORDER BY eventno DESC
           )          
)WHERE r >= 11 AND r <= 20;

-- read, ��ȸ
SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size
FROM event
WHERE eventno = 1;

-- update, ����
UPDATE event
SET eve_title='���� �Ϸ�', eve_content='���� �Ϸ�'
WHERE eventno = 1;

-- dalete, ����
DELETE FROM event
WHERE eventno = 3;

-- ��� ����� ����
UPDATE event
SET eve_visible='N'
WHERE eventno=1;

COMMIT;  

  
  
  
  
  
  
  
  
  
