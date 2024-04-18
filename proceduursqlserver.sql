create table tootaja(
id int primary key identity(1,1),
eesnimi varchar(25),
perenimi varchar(25),
isikukood varchar(11));
select * from tootaja;

---
create Procedure tootajaLisamine

@uusnimi varchar(25),
@uusperenimi varchar(25)
as

begin
	insert into tootaja(eesnimi, perenimi)
	values (@uusnimi, @uusperenimi);
	select * from tootaja;
end;

exec tootajaLisamine 'Igor', 'Pimahhov';
exec tootajaLisamine '2', '2';

create procedure tootajauuendus
@uusperenimi varchar (25),
@id int
as
begin
	select * from tootaja;
	update tootaja set perenimi=@uusperenimi
	where id=@id;
	select * from tootaja;
end;

exec tootajauuendus 'test', 2;


--proc mis kustutab sisestatud id jargi

create procedure tootajakustuta
@id int
as
begin
	select * from tootaja;
	delete from tootaja 
	where id=@id;
	select * from tootaja;

end;

exec tootajakustuta 1;
