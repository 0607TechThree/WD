CREATE TABLE WDIMAGE (
	wdipk	int		PRIMARY KEY,
	wdopk	int		NOT NULL,
	wdipickname	varchar(50)		NOT NULL
);

drop table wdimage;
select * from WDIMAGE;
select * from WDONEDAY;