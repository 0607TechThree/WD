CREATE TABLE CHAT(
	chatpk	int		PRIMARY KEY,
	chatpw	varchar(30)		NOT NULL
);

select * from chat;
SELECT COUNT(*) AS TOTAL FROM CHAT;
drop table chat;

