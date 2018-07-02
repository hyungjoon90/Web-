drop table coffee;

create table coffee(
	name varchar2(30),
	coffee number,
	milk number
);

insert into coffee values('hongdae',150,100);
insert into coffee values('shinchon',100,80);
insert into coffee values('gangnam',200,150);
insert into coffee values('ilsan',300,250);

select * from coffee;