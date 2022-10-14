CREATE TABLE WDMEMBER (
	wdmpk	int		NOT NULL,
	wdmid	varchar(30)		NOT NULL,
	wdmpw	varchar(30)		NOT NULL,
	wdmnick	varchar(30)		NOT NULL,
	wdmemail	varchar(50)		NOT NULL,
	wdmgender	varchar(30)		NOT NULL,
	wdmmbti	varchar(30)		NOT NULL,
	nemail	varchar(50)		NULL,
	kemail	varchar(50)		NULL,
	wdmvip	int	DEFAULT 0	NOT NULL
);
select *from WDMEMBER;
INSERT INTO WDMEMBER VALUES((SELECT NVL(MAX(WDMPK),0) +1 FROM WDMEMBER),1,1,1,1,1,1,null,null,0);
INSERT INTO WDMEMBER VALUES((SELECT NVL(MAX(WDMPK),0) +1 FROM WDMEMBER),2,2,2,2,2,2,null,null,0);
INSERT INTO WDMEMBER VALUES((SELECT NVL(MAX(WDMPK),0) +1 FROM WDMEMBER),3,3,3,3,3,3,null,null,0);

DELETE from WDMEMBER WHERE WDMPK = 3;

drop table wdmember;