create database DB_L43_MVC_JQuery_VC_52123
use DB_L43_MVC_JQuery_VC_52123

create table tblEmployee
(
empid int primary key identity,
name varchar(100),
address varchar(100),
age int
)

alter proc  sp_tblEmployee
@action varchar(100)=null,
@empid int =0,
@name varchar(100)=null,
@address varchar(100)=null,
@age int=0
as
begin
	if(@action='INSERT')
	begin
	INSERT INTO tblEmployee(name,address,age)VALUES(@name,@address,@age)
	end
	else if (@action='GET')
	begin
	SELECT * FROM tblEmployee
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
	update tblEmployee set name=@name,address=@address,age=@age where empid=@empid
	end
end
