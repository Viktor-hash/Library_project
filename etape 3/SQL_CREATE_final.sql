

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


CREATE TABLE Media(
type VARCHAR,
localisation VARCHAR NOT NULL,
support VARCHAR NOT NULL,
edition VARCHAR NOT NULL,
PRIMARY KEY(type,support,edition)
);

INSERT INTO Media(type,localisation,support,edition) VALUES ('bande dessine','etage 1','livre','folio');
INSERT INTO Media(type,localisation,support,edition) VALUES ('roman','etage 2','livre','baudelaire');
INSERT INTO Media(type,localisation,support,edition) VALUES ('film horreur','etage 3','DVD','edition');
INSERT INTO Media(type,localisation,support,edition) VALUES ('manga','etage 10000','Livre','Kana');
INSERT INTO Media(type,localisation,support,edition) VALUES ('bande dessine audio','etage 0','DVD','Casterman');
INSERT INTO Media(type,localisation,support,edition) VALUES ('jeu d enquete','etage 20','jeu de societe','edition cluedo');

CREATE TABLE Proprietaire(
reference  VARCHAR PRIMARY KEY,
nom VARCHAR NOT NULL,
type  VARCHAR NOT NULL
);

INSERT INTO Proprietaire(reference,nom,type) VALUES ('0','patrick','particulier');
INSERT INTO Proprietaire(reference,nom,type) VALUES ('1','UTC','ecole');

CREATE TABLE Proprietaire_media(
proprietaire VARCHAR,
type VARCHAR,
support VARCHAR,
edition VARCHAR,
PRIMARY KEY(proprietaire,type,support,edition)
);

INSERT INTO Proprietaire_media(proprietaire,type,support,edition) VALUES ('0','bande dessine','livre','folio');
INSERT INTO Proprietaire_media(proprietaire,type,support,edition) VALUES ('1','bande dessine','livre','folio');
INSERT INTO Proprietaire_media(proprietaire,type,support,edition) VALUES ('1','roman','livre','baudelaire');
INSERT INTO Proprietaire_media(proprietaire,type,support,edition) VALUES ('0','film horreur','DVD','edition');
INSERT INTO Proprietaire_media(proprietaire,type,support,edition) VALUES ('0','manga','Livre','Kana');
INSERT INTO Proprietaire_media(proprietaire,type,support,edition) VALUES ('0','jeu d enquete','jeu de societe','edition cluedo');


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


CREATE TABLE Ensemble_oeuvre(
nom  VARCHAR NOT NULL, 
reference  VARCHAR PRIMARY KEY
);

INSERT INTO Ensemble_oeuvre(nom,reference) VALUES ('Integral Tintin','0');

CREATE TABLE Oeuvre_media(
type VARCHAR NOT NULL,
support VARCHAR NOT NULL,
edition VARCHAR NOT NULL,
FOREIGN KEY (type,support,edition) REFERENCES Media(type,support,edition),
oeuvre VARCHAR NOT NULL REFERENCES Oeuvre(reference),
PRIMARY KEY(type,support,edition,oeuvre),
ensemble VARCHAR REFERENCES Ensemble_oeuvre(reference)
);

INSERT INTO Oeuvre_media(type,support,edition,oeuvre,ensemble) VALUES ('bande dessine','livre','folio','0','0');
INSERT INTO Oeuvre_media(type,support,edition,oeuvre,ensemble) VALUES ('bande dessine','livre','folio','1','0');
INSERT INTO Oeuvre_media(type,support,edition,oeuvre,ensemble) VALUES ('bande dessine','livre','folio','2','0');
INSERT INTO Oeuvre_media(type,support,edition,oeuvre,ensemble) VALUES ('bande dessine','livre','folio','3','0');
INSERT INTO Oeuvre_media(type,support,edition,oeuvre,ensemble) VALUES ('bande dessine','livre','folio','4','0');
INSERT INTO Oeuvre_media(type,support,edition,oeuvre,ensemble) VALUES ('bande dessine','livre','folio','5','0');
INSERT INTO Oeuvre_media(type,support,edition,oeuvre,ensemble) VALUES ('bande dessine','livre','folio','6','0');

INSERT INTO Oeuvre_media(type,support,edition,oeuvre) VALUES ('bande dessine audio','DVD','Casterman','0');

INSERT INTO Oeuvre_media(type,support,edition,oeuvre) VALUES ('roman','livre','baudelaire','9');
INSERT INTO Oeuvre_media(type,support,edition,oeuvre) VALUES ('manga','Livre','Kana','8');
INSERT INTO Oeuvre_media(type,support,edition,oeuvre) VALUES ('film horreur','DVD','edition','7');

INSERT INTO Oeuvre_media(type,support,edition,oeuvre) VALUES ('jeu d enquete','jeu de societe','edition cluedo','10');


CREATE TABLE Extension_jeu_de_societe(
nom VARCHAR NOT NULL,
reference VARCHAR PRIMARY KEY,
type VARCHAR,
support VARCHAR,
edition VARCHAR,
oeuvre VARCHAR,
FOREIGN KEY (type,support,edition,oeuvre) REFERENCES Oeuvre_media(type,support,edition,oeuvre),
CHECK (support='jeu de societe')
);

INSERT INTO Extension_jeu_de_societe(nom,reference,type,support,edition,oeuvre) VALUES ('super cluedo','0','jeu d enquete','jeu de societe','edition cluedo','10');
INSERT INTO Extension_jeu_de_societe(nom,reference) VALUES ('chasseur de fantome','1');


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
CHECK (date_debut<=date_fin),
rendu BOOLEAN NOT NULL,

type VARCHAR,
support VARCHAR,
edition VARCHAR,
oeuvre VARCHAR,

FOREIGN KEY (type,support,edition,oeuvre) REFERENCES Oeuvre_media(type,support,edition,oeuvre),


emprunteur_nom VARCHAR,
emprunteur_prenom VARCHAR,
emprunteur_date_naissance TIMESTAMP,

FOREIGN KEY (emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance) REFERENCES Emprunteur(nom,prenom,Date_naissance),
PRIMARY KEY (type,support,edition,oeuvre,emprunteur_prenom,emprunteur_nom,emprunteur_date_naissance)
);

INSERT INTO Pret(date_debut,date_fin,rendu,type,support,edition,oeuvre,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance) VALUES ('2020-05-20','2020-06-01','false','film horreur','DVD','edition','7','Will','Por','1995-10-02');
INSERT INTO Pret(date_debut,date_fin,rendu,type,support,edition,oeuvre,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance) VALUES ('2020-05-20','2020-06-01','false','bande dessine audio','DVD','Casterman','0','Will','Por','1995-10-02');
INSERT INTO Pret(date_debut,date_fin,rendu,type,support,edition,oeuvre,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance) VALUES ('2020-05-20','2020-06-01','false','film horreur','DVD','edition','7','Vic','Par','1990-10-02');


/*selection en fonction de l'edition*/
CREATE VIEW Oeuvre_media_titre(type,support,edition,oeuvre,ensemble)
AS
SELECT type,support,edition,titre,ensemble
FROM Oeuvre
INNER JOIN Oeuvre_media ON Oeuvre.Reference=Oeuvre_media.oeuvre;

/*selection des oeuvres ayant pour edition folio*/
SELECT oeuvre FROM Oeuvre_media_titre WHERE edition='folio';

/*selection en fonction de l'auteur*/
CREATE VIEW Oeuvre_Auteur(oeuvre,createur_nom ,createur_prenom,createur_type,createur_naissance,mot_clef,classe_age)
AS
SELECT titre,createur_nom ,createur_prenom,createur_type,createur_naissance,mot_clef,classe_age
FROM Oeuvre
INNER JOIN Createur_original_oeuvre ON Oeuvre.Reference=Createur_original_oeuvre.oeuvre;

/*selection par dessinateur*/
SELECT oeuvre FROM Oeuvre_Auteur WHERE createur_nom='Masashi'AND createur_prenom='Kishimoto' AND createur_type='dessinateur';

/*selection par auteur*/
SELECT oeuvre FROM Oeuvre_Auteur WHERE createur_nom='Remi' AND createur_prenom='Georges' AND createur_type='auteur';

/*selection par mot_clef*/
SELECT oeuvre FROM Oeuvre_Auteur WHERE mot_clef='horreur';

/*selection par classe d'age*/
SELECT titre FROM Oeuvre WHERE classe_age='tout public';


