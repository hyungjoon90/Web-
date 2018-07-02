delete from GUEST;

select * from GUEST;





select rownum,sabun,name from (select * from guest order by sabun desc);
--p1 rownum 1~10
select rownum,sabun,name from (select * from guest order by sabun desc) where rownum>=1 and rownum<=10; 
--p2 rownum 11~20
select * from (select rownum as A,sabun,name from (select * from guest order by sabun desc)) where A>=11 and A<=20;
--p3 rownum 21~30
