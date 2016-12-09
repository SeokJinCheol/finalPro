--------------------------------------------------------
--  파일이 생성됨 - 금요일-12월-09-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REVIEW" 
   (	"CODENUM" NUMBER(10,0), 
	"REVIEWPOINT" NUMBER(5,0), 
	"REVIEWID" VARCHAR2(25 BYTE), 
	"REVIEWTEXT" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
