/**********************************/
/* Table Name: com_cate */
/**********************************/
CREATE TABLE ȸ���з�(
	  cateno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    comno                             NUMBER(10)     NULL ,
    cate_name                           VARCHAR2(100)    NOT NULL,
    cate_seqno                            NUMBER(10)     DEFAULT 0     NOT NULL,
    cate_visible                              CHAR(1)    DEFAULT 'Y'     NOT NULL,
    cate_date                               DATE     NOT NULL,
    cate_cnt                        NUMBER(10)     DEFAULT 0     NOT NULL,
    comno                             NUMBER(7)    NULL 

);

COMMENT ON TABLE ȸ���з� is 'com_cate';
COMMENT ON COLUMN ȸ���з�.��з� ��ȣ is 'cateno';
COMMENT ON COLUMN ȸ���з�.ȸ���ȣ is 'comno';
COMMENT ON COLUMN ȸ���з�.��з� �̸� is 'cate_name';
COMMENT ON COLUMN ȸ���з�.��� ���� is 'cate_seqno';
COMMENT ON COLUMN ȸ���з�.��¸�� is 'cate_visible';
COMMENT ON COLUMN ȸ���з�.����� is 'cate_date';
COMMENT ON COLUMN ȸ���з�.��ϵ� �� �� is 'cate_cnt';
COMMENT ON COLUMN ȸ���з�.comno is 'ȸ���ȣ';


