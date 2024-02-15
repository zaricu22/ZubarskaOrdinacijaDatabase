
DROP TABLE IF EXISTS korisnik;

CREATE TABLE korisnik (
  identifikacioni_broj varchar(15) NOT NULL PRIMARY KEY,
  ime varchar(15) NOT NULL,
  prezime varchar(15) NOT NULL,
  tip_korisnika varchar(15) NOT NULL);

INSERT INTO korisnik VALUES ('','Paja','Pajic','pacijent'),('0213456789','Janko','Jankovic','pacijent'),('02144556677','Paja','Pajic','pacijent'),('432543','Filip','Filipovic','zubar');


DROP TABLE IF EXISTS parametri;

CREATE TABLE parametri (
  parametar_naziv varchar(45) NOT NULL PRIMARY KEY,
  parametar_vrednost int DEFAULT NULL);

INSERT INTO parametri VALUES ('rokOtkazivanja',2);


DROP TABLE IF EXISTS termin;

CREATE TABLE termin (
  id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  termin timestamp NOT NULL UNIQUE,
  tip_pregleda text NOT NULL,
  korisnik_id varchar(15) NOT NULL REFERENCES korisnik (identifikacioni_broj),
  status varchar(15) NOT NULL,
  trajanje int NOT NULL);

INSERT INTO termin(termin, tip_pregleda, korisnik_id, status, trajanje)
	VALUES ('2022-09-10 09:00:00','pregled','0213456789','zakazano',30),('2022-09-10 11:30:00','plombiranje','0213456789','zakazano',30),('2022-09-11 22:07:00','pregled','0213456789','zakazano',60),('2022-09-10 14:30:00','pregled','0213456789','zakazano',60),('2022-09-14 14:30:00','pregled','0213456789','zakazano',60),('2022-09-10 16:00:00','pregled','0213456789','zakazano',60),('2022-09-15 14:30:00','pregled','0213456789','zakazano',60),('2022-09-16 16:00:00','vadjenje','02144556677','zakazano',30),('2022-09-16 15:00:00','vadjenje','02144556677','otkazano',30),('2022-09-16 15:30:00','kontrola','02144556677','otkazano',30),('2022-09-16 11:30:00','operacija','0213456789','zakazano',30),('2022-09-16 16:30:00','ggg','0213456789','zakazano',30);
