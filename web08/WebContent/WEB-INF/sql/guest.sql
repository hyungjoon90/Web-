drop table guest;

create table guest(
	sabun number primary key,
	name varchar2(30) not null,
	nalja date,
	pay number
);

insert into guest values(1111,'È«±æµ¿',sysdate,1000);
insert into guest values(2222,'ÀÌ¸»³â',sysdate,2000);
insert into guest values(3333,'±è°³¶Ë',sysdate,3000);
insert into guest values(4444,'¹Ú¼ø½Ç',sysdate,4000);

select rownum as rn, SABUN, NAME, NALJA, PAY from guest;