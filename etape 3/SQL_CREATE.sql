

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
type VARCHAR PRIMARY KEY,
localisation VARCHAR NOT NULL
);

INSERT INTO Media(type,localisation) VALUES ('bande dessine','etage 1');
INSERT INTO Media(type,localisation) VALUES ('roman','etage 2');
INSERT INTO Media(type,localisation) VALUES ('film horreur','etage 3');
INSERT INTO Media(type,localisation) VALUES ('manga','etage 10000');
INSERT INTO Media(type,localisation) VALUES ('bande dessine audio','etage 0');
INSERT INTO Media(type,localisation) VALUES ('jeu d enquete','etage 20');

CREATE TABLE Proprietaire(
reference  VARCHAR PRIMARY KEY,
nom VARCHAR NOT NULL,
type  VARCHAR NOT NULL
);

INSERT INTO Proprietaire(reference,nom,type) VALUES ('0','patrick','particulier');
INSERT INTO Proprietaire(reference,nom,type) VALUES ('1','UTC','ecole');

CREATE TABLE Proprietaire_media(
proprietaire VARCHAR,
FOREIGN KEY (proprietaire) REFERENCES Proprietaire(reference),
media VARCHAR,
FOREIGN KEY (media) REFERENCES Media(type),
PRIMARY KEY (proprietaire,media)
);

INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','bande dessine');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('1','bande dessine');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('1','roman');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','film horreur');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','manga');
INSERT INTO Proprietaire_media(proprietaire,media) VALUES ('0','jeu d enquete');


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
media VARCHAR REFERENCES Media(type),
oeuvre VARCHAR REFERENCES Oeuvre(reference),
PRIMARY KEY(media,oeuvre),
edition VARCHAR NOT NULL,
quantite INTEGER NOT NULL,
ensemble VARCHAR REFERENCES Ensemble_oeuvre(reference)
);

INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite,ensemble) VALUES ('bande dessine','0','Casterman',5,'0');
INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite,ensemble) VALUES ('bande dessine','1','Casterman',2,'0');
INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite,ensemble) VALUES ('bande dessine','2','Casterman',9,'0');
INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite,ensemble) VALUES ('bande dessine','3','Casterman',1,'0');
INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite,ensemble) VALUES ('bande dessine','4','Casterman',20,'0');
INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite,ensemble) VALUES ('bande dessine','5','Casterman',3,'0');
INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite,ensemble) VALUES ('bande dessine','6','Casterman',8,'0');

INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite) VALUES ('bande dessine audio','0','Casterman',8);

INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite) VALUES ('roman','9','Folio',2);
INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite) VALUES ('manga','8','Kana',5);
INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite) VALUES ('film horreur','7','Studio',5);

INSERT INTO Oeuvre_media(media,oeuvre,edition,quantite) VALUES ('jeu d enquete','10','Casi',10);


CREATE TABLE Support(
type VARCHAR PRIMARY KEY
);

INSERT INTO Support(type) VALUES ('DVD');
INSERT INTO Support(type) VALUES ('Livre');
INSERT INTO Support(type) VALUES ('jeu de societe');

CREATE TABLE Precision_quantite(
support VARCHAR REFERENCES Support(type),
media VARCHAR,
oeuvre VARCHAR,
FOREIGN KEY (media,oeuvre) REFERENCES Oeuvre_media(media,oeuvre),
PRIMARY KEY(support,media,oeuvre),
nombre_support INTEGER NOT NULL
);

INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','bande dessine','0',1);
INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','bande dessine','1',1);
INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','bande dessine','2',1);
INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','bande dessine','3',1);
INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','bande dessine','4',1);
INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','bande dessine','5',1);
INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','bande dessine','6',1);

INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','bande dessine audio','0',1);
INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('DVD','bande dessine audio','0',2);

INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('DVD','film horreur','7',3);

INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','manga','8',1);

INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('Livre','roman','9',1);

INSERT INTO Precision_quantite(support,media,oeuvre,nombre_support) VALUES ('jeu de societe','jeu d enquete','10',1);

CREATE TABLE Extension_jeu_de_societe(
nom VARCHAR NOT NULL,
reference VARCHAR PRIMARY KEY,
quantite INTEGER NOT NULL,
jeu_support VARCHAR,
jeu_media VARCHAR,
jeu_oeuvre VARCHAR,
FOREIGN KEY (jeu_support,jeu_media,jeu_oeuvre) REFERENCES Precision_Quantite(support,media,oeuvre),
CHECK (jeu_support='jeu de societe')
);

INSERT INTO Extension_jeu_de_societe(nom,reference,quantite,jeu_support,jeu_media,jeu_oeuvre) VALUES ('super cluedo','0',3,'jeu de societe','jeu d enquete','10');
INSERT INTO Extension_jeu_de_societe(nom,reference,quantite) VALUES ('chasseur de fantome','1',5);


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
oeuvre VARCHAR,
media VARCHAR,
reference VARCHAR,
FOREIGN KEY (oeuvre,media) REFERENCES Oeuvre_media(oeuvre,media),
emprunteur_nom VARCHAR,
emprunteur_prenom VARCHAR,
emprunteur_date_naissance TIMESTAMP,
FOREIGN KEY (emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance) REFERENCES Emprunteur(nom,prenom,Date_naissance),
PRIMARY KEY (oeuvre,media,reference)
);

INSERT INTO Pret(date_debut,date_fin,rendu,oeuvre,media,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance,reference) VALUES ('2020-05-20','2020-06-01','false','0','bande dessine','Will','Por','1995-10-02','0');
INSERT INTO Pret(date_debut,date_fin,rendu,oeuvre,media,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance,reference) VALUES ('2020-05-20','2020-06-01','false','1','bande dessine','Will','Por','1995-10-02','1');
INSERT INTO Pret(date_debut,date_fin,rendu,oeuvre,media,emprunteur_nom,emprunteur_prenom,emprunteur_date_naissance,reference) VALUES ('2020-05-20','2020-06-01','false','0','bande dessine','Vic','Par','1990-10-02','2');
