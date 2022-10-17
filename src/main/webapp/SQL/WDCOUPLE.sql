CREATE TABLE WDCOUPLE (
	wdcpk	int		PRIMARY KEY,
	wdcwoori	varchar(30)		NOT NULL,
	wdcdoori	varchar(30)		NOT NULL,
	wdcdate	varchar(30)		NOT NULL
);
select * from WDCOUPLE;

drop table wdcouple;

insert into WDCOUPLE values(1,1,2,0);