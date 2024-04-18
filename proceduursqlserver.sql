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

-- tabeli struktuuri muutmine

CREATE PROCEDURE muudatus
@tegevus varchar(10),
@tabelinimi varchar(25),
@veerunimi varchar(25),
@tyyp varchar(25) =null
AS
BEGIN
	DECLARE @sqltegevus as varchar(max)
	set @sqltegevus=case 
	when @tegevus='add' then concat('ALTER TABLE ', 
	@tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)
	when @tegevus='drop' then concat('ALTER TABLE ', 
	@tabelinimi, ' DROP COLUMN ', @veerunimi)
END;
print @sqltegevus;
begin 
EXEC (@sqltegevus);
END
END;
--добавление столбца
EXEC muudatus @tegevus='add', 
@tabelinimi='tootaja', 
@veerunimi='test', 
@tyyp='varchar(1)';
select* from tootaja;

--удаление столбца
EXEC muudatus @tegevus='drop', 
@tabelinimi='tootaja', 
@veerunimi='test';
select* from tootaja;

---------------------------------------------------

create procedure nimiuuendamine
@uusnimi varchar (25),
@id int
as
begin
	select * from tootaja;
	update tootaja set eesnimi=@uusnimi
	where id=@id;
	select * from tootaja;
end;

exec nimiuuendamine 'andrei', 4;

create procedure tootajalisamineeee
@nimi varchar (25),
@perenimi varchar(25)
as

begin
	insert into tootaja(eesnimi, perenimi)
	values (@nimi, @perenimi);
	select * from tootaja;
end;

exec tootajalisamineeee 'andrei', 'warov'


