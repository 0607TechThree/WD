CREATE TABLE WDBLIKE (
	wdlpk	int		PRIMARY KEY,
	wdbpk	int		NOT NULL,
	wdmpk	int		NOT NULL,
	wdcheck int not null,
	CONSTRAINT WDBOARD_WDBLIKE FOREIGN KEY (WDBPK) REFERENCES WDBOARD (WDBPK) ON DELETE CASCADE
);
select * from WDBLIKE;
drop table wdblike;