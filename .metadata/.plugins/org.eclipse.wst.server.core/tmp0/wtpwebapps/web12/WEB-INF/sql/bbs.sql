
select * from bbs;

select * from bbs_user;

delete from bbs where num>4;

insert into bbs values(1,1111,sysdate,'test1','test1111');
insert into bbs values(2,1111,sysdate,'test2','test2222');
insert into bbs values(3,1111,sysdate,'test3','test3333');

select * from 

drop sequence bbs_seq;

create sequence bbs_seq start with 4;

alter table bbs add(cnt number);

update bbs set cnt=0 where cnt is null;