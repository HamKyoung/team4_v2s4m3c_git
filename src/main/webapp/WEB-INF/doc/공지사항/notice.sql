/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE notice(
		notice_no             	NUMBER(10)		                             NOT NULL	 PRIMARY KEY,     -- �������� ��ȣ
		notice_name           VARCHAR2(200)		                         NOT NULL,                              -- �������� ���� 
		notice_con        		CLOB                  		                     NOT NULL,                              -- �������� ����
        notice_seqno          NUMBER(7)	    	 DEFAULT 0		 NOT NULL,                              -- �������� ��� ����
		notice_views       	NUMBER(10)		     DEFAULT 0		 NOT NULL,                              -- �������� ��ȸ��
		notice_visible       	CHAR(1)		         DEFAULT 'N'		 NOT NULL,                              -- �������� ���� ����
		notice_date         	DATE		                 NOT NULL,                                                       -- �������� �����
        notice_file1                                   VARCHAR(100)          NULL,
        notice_thumb1                              VARCHAR(100)          NULL,
        notice_size1                                 NUMBER(10)      DEFAULT 0 NULL  
);

COMMENT ON TABLE notice is '��������';
COMMENT ON COLUMN notice.notice_no is '�������� ��ȣ';
COMMENT ON COLUMN notice.notice_name is '�������� ����';
COMMENT ON COLUMN notice.notice_con is '�������� ����';
COMMENT ON COLUMN notice.notice_seqno is '�������� ��� ����';
COMMENT ON COLUMN notice.notice_views is '�������� ��ȸ��';
COMMENT ON COLUMN notice.notice_visible is '�������� ��¸��';
COMMENT ON COLUMN notice.notice_date is '�������� �ۼ���¥';
COMMENT ON COLUMN notice.notice_file1 is '�������� �̹���';
COMMENT ON COLUMN notice.notice_thumb1 is '�������� ���� �̹��� Preview';
COMMENT ON COLUMN notice.notice_size1 is '���� �̹��� ũ��';

DROP TABLE notice;

DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

  -- insert
INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1)
VALUES(notice_seq.nextval, 'ù��° ��������', 'ù��° �������� ����', '1', '0', 'N', sysdate, 'notice.jpg', 'notice_t.jpg', 23657);

INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1)
VALUES(notice_seq.nextval, '�ι�° ��������', '�ι�° �������� ����', '1', '0', 'N', sysdate, 'notice2.jpg', 'notice2_t.jpg', 23657);

INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1, notice_word)
VALUES(notice_seq.nextval, '����° ��������', '����° �������� ����', '1', '0', 'N', sysdate, 'notice2.jpg', 'notice2_t.jpg', 23657, '�˸�');

-- list
SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_word
FROM notice
ORDER BY notice_seqno ASC;

ALTER TABLE notice
ADD (notice_word VARCHAR2(300));


commit;

-- �˻��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM notice
WHERE word LIKE '%�Ե�ī��%';


-- step 3, 1 page
SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, r
FROM (
           SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, rownum as r
           FROM (
                     SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date
                     FROM notice
                     WHERE notice_word LIKE '%�Ե�ī��%'
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
                     WHERE notice_word LIKE '%�Ե�ī��%'
                     ORDER BY notice_no DESC
           )          
)
WHERE r >= 11 AND r <= 20;





-- read, ��ȸ
SELECT notice_no, notice_name, notice_con, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1
FROM notice
WHERE notice_no = 1;

-- update, ����
UPDATE notice
SET notice_name='������ ��������', notice_con='���� �Ϸ�', notice_file1='notice2', notice_thumb1='notice2_t', notice_size1='23657'
WHERE notice_no = 1;

-- dalete, ����
DELETE FROM notice
WHERE notice_no = 1;

 -- �켱���� ���� up 10 �� 1
UPDATE notice
SET notice_seqno = notice_seqno - 1
WHERE notice_no = 3;
  
-- �켱���� ���� down 1 �� 10
UPDATE notice
SET notice_seqno = notice_seqno + 1
WHERE notice_no = 1;

-- ��� ����� ����
UPDATE notice
SET notice_views='Y'
WHERE notice_no=1;

UPDATE notice
SET notice_file1='file name', notice_thumb1='thumb file name', notice_size1=5000
WHERE notice_no=5; 

commit;




