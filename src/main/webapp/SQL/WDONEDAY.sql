CREATE TABLE WDONEDAY (
	wdopk	int		PRIMARY KEY,
	wdoname	varchar(150)		NOT NULL,
	wdoregion	varchar(30)		NOT NULL,
	wdoaddress	varchar(100)		NOT NULL,
	wdosubject	varchar(30)		NOT NULL,
	wdomainimg	varchar(100)	NOT NULL
);

drop table wdoneday;

select * from wdoneday;

SELECT WDO.*,WDI.WDIPICKNAME FROM WDONEDAY WDO, WDIMAGE WDI WHERE WDO.WDOPK = WDI.WDOPK;
SELECT * FROM (SELECT * FROM WDBOARD ORDER BY WDBPK DESC) where ROWNUM <= 6;