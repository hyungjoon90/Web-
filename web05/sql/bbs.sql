-- 사내 게시판

create table bbs_user(
	sabun number primary key,
	name varchar2(12) not null
);


create table bbs(
	num number primary key,
	sabun number references bbs_user(sabun),
	nalja date default sysdate,
	sub varchar2(30) default '제목없음',
	content varchar2(1024)
);

create sequence bbs_seq;


insert into BBS_USER values(1111,'user1');

insert into BBS values(bbs_seq.nextval,1111,sysdate,'test1','test1111');
insert into BBS values(bbs_seq.nextval,1111,sysdate,'test2','test2222');
insert into BBS values(bbs_seq.nextval,1111,sysdate,'test3','test3333');

select * from BBS;

-- 글번호,제목,날짜,글쓴이

--SELECT NUM,SUB,NALJA,(SELECT B.NAME FROM BBS_USER B WHERE B.SABUN=A.SABUN) AS NAME FROM BBS A;

--SELECT B.NUM,B.SUB,B.NALJA,A.NAME FROM BBS_USER A INNER JOIN BBS B ON A.SABUN = B.SABUN ORDER BY NUM DESC;

--SELECT A.NUM,A.SUB,A.NALJA,B.NAME FROM BBS A, BBS_USER B WHERE A.SABUN=B.SABUN;

SELECT NUM,SUB,NALJA,NAME FROM BBS NATURAL JOIN BBS_USER ORDER BY num DESC;

delete from bbs;















