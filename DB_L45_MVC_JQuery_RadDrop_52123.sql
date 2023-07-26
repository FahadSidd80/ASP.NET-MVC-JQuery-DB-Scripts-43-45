create database DB_L45_MVC_JQuery_RadDrop_52123
use DB_L45_MVC_JQuery_RadDrop_52123

create table tblEmployee
(
empid int primary key identity,
name varchar(100),
address varchar(100),
age int,
gender int,
country int,
state int
)

alter proc  sp_tblEmployee
@action varchar(100)=null,
@empid int =0,
@name varchar(100)=null,
@address varchar(100)=null,
@age int=0,
@gender int=0,
@country int=0,
@state int=0
as
begin
	if(@action='INSERT')
	begin
	INSERT INTO tblEmployee(name,address,age,gender,country,state)VALUES(@name,@address,@age,@gender,@country,@state)
	end
	else if (@action='GET')
	begin
	SELECT * FROM tblEmployee
	join tblcountry on tblEmployee.country= tblcountry.cid
	join tblstate on tblEmployee.state = tblstate.sid
	end
	else if(@action='DELETE')
	begin
	DELETE FROM tblEmployee WHERE empid=@empid
	end
	else if(@action='EDIT')
	begin
	select * from tblEmployee where empid=@empid
	end
	else if(@action='UPDATE')
	begin
	update tblEmployee set name=@name,address=@address,age=@age,gender=@gender,country=@country,state=@state where empid=@empid
	end
end


create table tblcountry
(
cid int primary key identity,
cname varchar(100)
)
select * from tblcountry
insert into tblcountry(cname)values('India')
insert into tblcountry(cname)values('Pakistan')
insert into tblcountry(cname)values('USA')
insert into tblcountry(cname)values('UAE')
insert into tblcountry(cname)values('Canada')

create proc sp_tblcountry_get
as
begin
select * from tblcountry
end

create table tblstate
(
sid int primary key identity,
cid int,
sname varchar(100)
)

insert into tblstate(cid,sname)values(1,'Uttar Pradesh')
insert into tblstate(cid,sname)values(1,'Bihar')
insert into tblstate(cid,sname)values(1,'MP')
insert into tblstate(cid,sname)values(1,'Gujarat')
insert into tblstate(cid,sname)values(2,'Sindh')
insert into tblstate(cid,sname)values(2,'Khaiyber')
insert into tblstate(cid,sname)values(3,'California')
insert into tblstate(cid,sname)values(3,'Florida')
insert into tblstate(cid,sname)values(4,'Dubai')
insert into tblstate(cid,sname)values(4,'Sharjah')
insert into tblstate(cid,sname)values(5,'Ontario')
insert into tblstate(cid,sname)values(5,'New Jones')

select * from tblstate

create proc sp_tblstate_get
@cid int=0
as
begin
select * from tblstate where cid=@cid
end