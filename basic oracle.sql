create table users (
	userid          varchar2(50)	primary key, 
	username		    varchar2(50)	not null,
	userpassword	  varchar2(50)	not null,
	userage			    number(3)		  not null,
	useremail		    varchar2(50)	not null
);
create table boards (
    bno             number          primary key,
    btitle          varchar2(100)   not null,
    bcontent        clob            not null,
    bwriter         varchar2(50)    not null,
    bdate           date            default sysdate,
    bfilename       varchar2(50)    null,
    bfiledata		blob			null
);
CREATE SEQUENCE SEQ_BNO NOCACHE;
create table accounts (
  ano     varchar(20) primary key,
  owner   varchar(20) not null,
  balance number      not null
);

insert into accounts (ano, owner, balance) 
values ('111-111-1111', '한여름', 1000000);

insert into accounts (ano, owner, balance) 
values ('222-222-2222', '한겨울', 0);

commit;

CREATE OR REPLACE PROCEDURE user_create (
    a_userid        IN  users.userid%TYPE, 
    a_username      IN  users.username%TYPE,
    a_userpassword  IN  users.userpassword%TYPE,
    a_userage       IN  users.userage%TYPE,
    a_useremail     IN  users.useremail%TYPE,
    a_rows          OUT PLS_INTEGER
) 
IS
BEGIN
    INSERT INTO users (userid, username, userpassword, userage, useremail)
    VALUES (a_userid, a_username, a_userpassword,  a_userage, a_useremail);
    a_rows := SQL%ROWCOUNT;
    COMMIT;
END;
/
