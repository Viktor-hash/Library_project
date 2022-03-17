DROP TABLE Createur_original,oeuvre,ensemble_oeuvre,media,proprietaire,Proprietaire_media,Createur_original_oeuvre,emprunteur,pret CASCADE;
DROP VIEW Oeuvre_Auteur,Oeuvre_media_titre;

CREATE TABLE Createur_original(
Nom  VARCHAR,
Prenom  VARCHAR,
Type  VARCHAR,
Date_naissance  TIMESTAMP,
PRIMARY KEY(Nom,Prenom,type,Date_naissance)
);

INSERT INTO Createur_original(nom,prenom,type,Date_naissance) VALUES ('Hitchcock','Alfred','scenariste','1899-08-13');
INSERT INTO Createur_original(nom,prenom,type,Date_naissance) VALUES ('Remi','Georges','auteur','1907-05-22');
INSERT INTO Createur_original(nom,prenom,type,Date_naissance) VALUES ('Remi','Georges','dessinateur','1907-05-22');
INSERT INTO Createur_original(nom,prenom,type,Date_naissance) VALUES ('Zola','Emile','auteur','1974-11-08');
INSERT INTO Createur_original(nom,prenom,type,Date_naissance) VALUES ('Masashi','Kishimoto','dessinateur','1899-08-13');
INSERT INTO Createur_original(nom,prenom,type,Date_naissance) VALUES ('Cluedo','Creator','createur jeu','1899-08-13');


CREATE TABLE Oeuvre(
titre  VARCHAR NOT NULL,
Reference  VARCHAR PRIMARY KEY,
classe_age  VARCHAR NOT NULL,
mot_clef  VARCHAR NOT NULL
);

INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Tintin au tibet','0','tout public','aventure');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Tintin au congo','1','tout public','aventure');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Tintin tout seul','2','tout public','aventure');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Tintin loin','3','tout public','aventure');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('just Tintin','4','tout public','aventure');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Encore Tintin','5','tout public','aventure');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Un petit dernier Tintin','6','tout public','aventure');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('The birds','7','adulte','horreur');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Naruto tome 1','8','tout public','action');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Contes a ninon','9','tout public','naturaliste');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Cluedo','10','tout public','meurtre');
INSERT INTO Oeuvre(titre,reference,classe_age,mot_clef) VALUES ('Cluedo deluxe','11','tout public','meurtre');

CREATE TABLE Ensemble_oeuvre(
nom  VARCHAR NOT NULL, 
reference  VARCHAR PRIMARY KEY
);

INSERT INTO Ensemble_oeuvre(nom,reference) VALUES ('Integral Tintin','0');


CREATE TABLE Media(
reference VARCHAR PRIMARY KEY,
type VARCHAR NOT NULL,
localisation VARCHAR NOT NULL,
support VARCHAR NOT NULL,
edition VARCHAR NOT NULL,
oeuvre VARCHAR NOT NULL REFERENCES Oeuvre(reference),
ensemble_oeuvre VARCHAR REFERENCES Ensemble_oeuvre(reference),
oeuvre_extension VARCHAR REFERENCES Media(reference)
);

INSERT INTO Media(reference,type,localisation,support,edition,oeuvre,ensemble_oeuvre) VALUES ('0','bande dessine','etage 1','livre','folio','0','0');
INSERT INTO Media(reference,type,localisation,support,edition,oeuvre,ensemble_oeuvre) VALUES ('1','bande dessine','etage 1','livre','folio','1','0');
INSERT INTO Media(reference,type,localisation,support,edition,oeuvre,ensemble_oeuvre) VALUES ('2','bande dessine','etage 1','livre','folio','2','0');
INSERT INTO Media(reference,type,localisation,support,edition,oeuvre,ensemble_oeuvre) VALUES ('3','bande dessine','etage 1','livre','folio','3','0');
INSERT INTO Media(reference,type,localisation,support,edition,oeuvre,ensemble_oeuvre) VALUES ('4','bande dessine','etage 1','livre','folio','4','0');
INSERT INTO Media(reference,type,localisation,support,edition,oeuvre,ensemble_oeuvre) VALUES ('5','bande dessine','etage 1','livre','folio','5','0');
INSERT INTO Media(reference,type,localisation,support,edition,oeuvre,ensemble_oeuvre) VALUES ('6','bande dessine','etage 1','livre','folio','6','0');

INSERT INTO Media(reference,type,localisation,support,edition,oeuvre) VALUES ('7','jeu d enquete','etage 20','jeu de societe','edition cluedo','10');
INSERT INTO Media(reference,type,localisation,support,edition,oeuvre,oeuvre_extension) VALUES ('8','jeu d enquete','etage 20','jeu de societe','edition cluedo','11','7');


INSERT INTO Media(reference,type,localisation,support,edition,oeuvre) VALUES ('9','roman','etage 2','livre','baudelaire','9');

INSERT INTO Media(reference,type,localisation,support,edition,oeuvre) VALUES ('10','film horreur','etage 3','DVD','edition','7');

INSERT INTO Media(reference,type,localisation,support,edition,oeuvre) VALUES ('11','manga','etage 10000','Livre','Kana','8');
INSERT INTO Media(reference,type,localisation,support,edition,oeuvre) VALUES ('12','bande dessine audio','etage 0','DVD','Casterman','5');

CREATE TABLE Proprietaire(
reference  VARCHAR PRIMARY KEY,
nom VARCHAR NOT NULL,
type  VARCHAR NOT NULL
);

INSERT INTO Proprietaire(reference,nom,type) VALUES ('0','patrick','particulier');
INSERT INTO Proprietaire(reference,nom,type) VALUES ('1','UTC','ecole');

CREATE TABLE Proprietaire_media(
proprietaire VARCHAR REFERENCES Proprietaire(reference),
media VARCHAR REFERENCES Media(reference),
PRIMARY KEY(proprietaire,media)
);

INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','0');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('1','1');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','1');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','2');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','3');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('1','4');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','5');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','6');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('1','7');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','8');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','9');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','10');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','11');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','12');

CREATE TABLE Createur_original_oeuvre(
oeuvre VARCHAR REFERENCES Oeuvre(reference), 
createur_nom VARCHAR,
createur_prenom VARCHAR,
createur_type VARCHAR,
createur_naissance TIMESTAMP,
FOREIGN KEY (createur_nom,createur_prenom,createur_type,createur_naissance)REFERENCES Createur_original(nom,prenom,type,Date_naissance),
PRIMARY KEY(oeuvre,createur_nom,createur_prenom,createur_type,createur_naissance)
);

INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('0','Remi','Georges','auteur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('1','Remi','Georges','auteur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('2','Remi','Georges','auteur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('3','Remi','Georges','auteur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('4','Remi','Georges','auteur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('5','Remi','Georges','auteur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('6','Remi','Georges','auteur','1907-05-22');

INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('0','Remi','Georges','dessinateur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('1','Remi','Georges','dessinateur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('2','Remi','Georges','dessinateur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('3','Remi','Georges','dessinateur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('4','Remi','Georges','dessinateur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('5','Remi','Georges','dessinateur','1907-05-22');
INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('6','Remi','Georges','dessinateur','1907-05-22');

INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('7','Hitchcock','Alfred','scenariste','1899-08-13');

INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('8','Masashi','Kishimoto','dessinateur','1899-08-13');

INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('9','Zola','Emile','auteur','1974-11-08');

INSERT INTO Createur_original_oeuvre(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance) VALUES ('10','Cluedo','Creator','createur jeu','1899-08-13');

CREATE TABLE Emprunteur(
Nom  VARCHAR, 
Prenom  VARCHAR,
Date_naissance  TIMESTAMP,
PRIMARY KEY(Nom,prenom,Date_naissance)
);

INSERT INTO Emprunteur(Nom,Prenom,Date_naissance) VALUES ('Will','Por','1995-10-02');
INSERT INTO Emprunteur(Nom,Prenom,Date_naissance) VALUES ('Vic','Par','1990-10-02');

CREATE TABLE Pret(
date_debut TIMESTAMP NOT NULL,
date_fin TIMESTAMP NOT NULL,
reference VARCHAR NOT NULL,
CHECK (date_debut<=date_fin),
rendu BOOLEAN NOT NULL,


media VARCHAR REFERENCES Media(reference),

emprunteur_nom VARCHAR,
emprunteur_prenom VARCHAR,
emprunteur_date_naissance TIMESTAMP,

FOREIGN KEY (emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance) REFERENCES Emprunteur(nom,prenom,Date_naissance),
PRIMARY KEY (media,emprunteur_prenom,emprunteur_nom,emprunteur_date_naissance,reference)
);

INSERT INTO Pret(date_debut,date_fin,rendu,media,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance,reference) VALUES ('2020-05-20','2020-06-01','false','0','Will','Por','1995-10-02','0');
INSERT INTO Pret(date_debut,date_fin,rendu,media,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance,reference) VALUES ('2020-05-20','2020-06-01','true','10','Will','Por','1995-10-02','1');
INSERT INTO Pret(date_debut,date_fin,rendu,media,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance,reference) VALUES ('2020-05-20','2020-06-20','false','1','Vic','Par','1990-10-02','2');
INSERT INTO Pret(date_debut,date_fin,rendu,media,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance,reference) VALUES ('2020-05-20','2020-06-20','false','1','Vic','Par','1990-10-02','3');

/*selection en fonction de l'edition*/
CREATE VIEW Oeuvre_media_titre(type,support,edition,oeuvre,ensemble_oeuvre)
AS
SELECT type,support,edition,titre,ensemble_oeuvre
FROM Oeuvre
INNER JOIN Media ON Oeuvre.Reference=Media.oeuvre;

/*selection des oeuvres ayant pour edition folio*/
SELECT oeuvre FROM Oeuvre_media_titre WHERE edition='folio';

/*selection en fonction de l'auteur*/
CREATE VIEW Oeuvre_Auteur(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance,mot_clef,classe_age)
AS
SELECT titre,createur_nom ,createur_prenom,createur_type,createur_naissance,mot_clef,classe_age
FROM Oeuvre
INNER JOIN Createur_original_oeuvre ON Oeuvre.Reference=Createur_original_oeuvre.oeuvre;

/*selection par auteur*/
SELECT oeuvre FROM Oeuvre_Auteur WHERE createur_nom='Remi' AND createur_prenom='Georges' AND createur_type='auteur';

/*selection par mot_clef*/
SELECT oeuvre FROM Oeuvre_Auteur WHERE mot_clef='horreur';

/*selection par classe d'age*/
SELECT titre FROM Oeuvre WHERE classe_age='tout public';

/*selection par dessinateur*/
SELECT oeuvre FROM Oeuvre_Auteur WHERE createur_nom='Masashi'AND createur_prenom='Kishimoto' AND createur_type='dessinateur';



/*media le plus emprunte*/
CREATE VIEW nb_media_emprunte_reference(media,nb_emprunt) AS
SELECT media, COUNT(*) AS nb_emprunt FROM Pret GROUP BY media;

CREATE VIEW nb_media_emprunte(type,support,edition,oeuvre,nb_emprunt) AS
SELECT type,support,edition,oeuvre,nb_emprunt
FROM nb_media_emprunte_reference
INNER JOIN Media ON nb_media_emprunte_reference.media=Media.reference;

CREATE VIEW nb_media_emprunte_oeuvre(type,support,edition,oeuvre,nb_emprunt) AS
SELECT type,support,edition,titre,nb_emprunt
FROM nb_media_emprunte
INNER JOIN Oeuvre ON nb_media_emprunte.oeuvre=Oeuvre.reference;

SELECT type,support,edition,oeuvre FROM nb_media_emprunte_oeuvre
 WHERE nb_emprunt= (SELECT MAX(nb_emprunt)
 FROM nb_media_emprunte_oeuvre);

/*emprunts en retard*/
SELECT reference FROM Pret WHERE (SELECT CAST(NOW() AS DATE))>date_fin AND rendu='false';

/*utilisateurs qui ont des emprunts en retard*/
SELECT reference,emprunteur_prenom,emprunteur_nom FROM Pret WHERE (SELECT CAST(NOW() AS DATE))>date_fin AND rendu='false';