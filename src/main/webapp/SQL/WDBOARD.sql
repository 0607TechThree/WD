CREATE TABLE WDBOARD (
	wdbpk	int		not null,
	wdbwriter	varchar(30)		not null,
	wdbtitle	varchar(120)		not null,
	wdbcontent	LONG		not null,
	wdblike	int	DEFAULT 0	,
	wdbopen	int	DEFAULT 0	
);
drop table wdboard;
select * from wdboard;
SELECT MAX(wdbpk) FROM WDBOARD;

SELECT A.*,ROWNUM FROM (SELECT * FROM WDBOARD WHERE WDBOPEN = 0 ORDER BY WDBPK DESC) A WHERE ROWNUM <= 3;

UPDATE WDBOARD SET WDBTITLE='dd', WDBCONTENT='1' WHERE WDBPK='1';