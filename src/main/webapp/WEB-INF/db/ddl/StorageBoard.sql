--------------------------------------------------------
--  파일이 생성됨 - 금요일-12월-09-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STORAGEBOARD
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."STORAGEBOARD" 
   (	"SNUM" NUMBER(10,0), 
	"CODENUM" NUMBER(10,0), 
	"STARTDATE" VARCHAR2(30 BYTE), 
	"ENDDATE" VARCHAR2(30 BYTE), 
	"RENTTER" VARCHAR2(25 BYTE), 
	"BILL" NUMBER(15,0), 
	"DEPOSIT" NUMBER(15,0), 
	"PACKAGESTATUS" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table STORAGEBOARD
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."STORAGEBOARD" MODIFY ("PACKAGESTATUS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."STORAGEBOARD" MODIFY ("STARTDATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."STORAGEBOARD" MODIFY ("CODENUM" NOT NULL ENABLE);
