-- addTestData.sql test data for testing SQL 
-- for testing sql scripts
insert into workers (name,username,password,department)
  values ('admin','root',md5('admin'),'admin');
insert into workers (name,username,password,department)
  values ('Jane Doe','janedoe',md5('jane'),'Fiscal');
insert into workers (name,username,password,department)
  values ('John Doe','johndoe',md5('john'),'Human Resources');
insert into workers (name,username,password,department)
  values ('Bill Gates','billgates',md5('bill'),'Administration');
insert into workers (name,username,password,department)
  values ('Cedric Everett','cedriceverett',md5('cedric'),'Fiscal'); 
insert into workers (name,username,password,department)
  values ('Edieson Dumlao','ediesondumlao',md5('edieson'),'Human Resources');
insert into workers (name,username,password,department)
  values ('Avery Johnson','averyjohnson',md5('avery'),'Administration');
insert into workers (name,username,password,department)
  values ('Mia Lum','mialum',md5('mia'),'Fiscal');
insert into workers (name,username,password,department)
  values ('Michelle Lee','michellelee',md5('mlee'),'Fiscal');
  
insert into workshops (title) values ('Intro to Rails');
insert into workshops (title) values ('Intro to PostgreSQL');
insert into workshops (title) values ('Writing plpgsql functions');

insert into worker_workshop (worker_id,workshop_id)
  values (2,1);
insert into worker_workshop (worker_id,workshop_id)
  values (3,1);
