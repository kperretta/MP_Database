DROP DATABASE IF EXISTS mp;
CREATE DATABASE mp;
USE mp;

CREATE TABLE Impiegato (
    codiceFiscale CHAR(16) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    dataNascita DATE NOT NULL,
    ufficio CHAR(5) NOT NULL,
    CHECK (codiceFiscale REGEXP '^[A-Z0-9]{16}$')
);

CREATE TABLE Cliente (
    codiceFiscale VARCHAR(16) PRIMARY KEY,
    città VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(200) NOT NULL,
    cellulare CHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cognome VARCHAR(100),
    nome VARCHAR(100),
    dataNascita DATE,
    ragioneSociale VARCHAR(100)
);

CREATE TABLE Cantiere (
    codice CHAR(5) PRIMARY KEY,
    città VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(200) NOT NULL,
    descrizione VARCHAR(200) NOT NULL,
    dataInizio DATE NOT NULL,
    dataFine DATE,
    percentualeAvanzamento INTEGER NOT NULL,
    dataAggiornamento DATE NOT NULL,
    cfImpiegato CHAR(16) REFERENCES Impiegato(codiceFiscale) ON UPDATE CASCADE,
    CHECK(percentualeAvanzamento>=0 AND percentualeAvanzamento<=100)
);

CREATE TABLE Permesso (
	tipo VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Autorizzazione (
	codCantiere CHAR(5) REFERENCES Cantiere(codice) ON UPDATE CASCADE,
    tipoPermesso VARCHAR(50) REFERENCES Permesso(tipo) ON UPDATE CASCADE,
    PRIMARY KEY (codCantiere, tipoPermesso)
);

CREATE TABLE Commissione (
	cfCliente VARCHAR(16),
    codCantiere CHAR(5),
    quotaCliente INT DEFAULT 100,
    CHECK(quotaCliente>0 AND quotaCliente<=100),
    FOREIGN KEY (cfCliente) REFERENCES Cliente(codiceFiscale) ON UPDATE CASCADE,
    FOREIGN KEY (codCantiere) REFERENCES Cantiere(codice) ON UPDATE CASCADE
);

CREATE TABLE Fornitore (
    partitaIva CHAR(11) PRIMARY KEY,
    ragioneSociale VARCHAR(100) NOT NULL,
    città VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(200) NOT NULL,
    CHECK (partitaIva REGEXP '^[0-9]{11}$')
);

CREATE TABLE Materiale (
    nome VARCHAR(40) PRIMARY KEY,
    qtàDisponibile DOUBLE NOT NULL,
    unitaDiMisura VARCHAR(10) NOT NULL
);

CREATE TABLE Acquisto (
	pivaFornitore CHAR(11),
    nomeMateriale VARCHAR(40),
    data DATE NOT NULL,
    quantità DOUBLE NOT NULL,
    PRIMARY KEY (pivaFornitore, nomeMateriale, data),
    FOREIGN KEY (pivaFornitore) REFERENCES Fornitore(partitaIva) ON UPDATE CASCADE,
    FOREIGN KEY (nomeMateriale) REFERENCES Materiale(nome) ON UPDATE CASCADE
);

CREATE TABLE Impiego (
    codCantiere CHAR(5),
    nomeMateriale VARCHAR(40),
    data DATE,
    quantità DOUBLE NOT NULL,
    PRIMARY KEY (codCantiere, nomeMateriale, data),
    FOREIGN KEY (codCantiere) REFERENCES Cantiere(codice) ON UPDATE CASCADE,
    FOREIGN KEY (nomeMateriale) REFERENCES Materiale(nome) ON UPDATE CASCADE
);

CREATE TABLE Operaio (
    codiceFiscale CHAR(16) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    dataNascita DATE NOT NULL,
    specializzazione VARCHAR(20) NOT NULL,
    esperienza VARCHAR(20) NOT NULL,
    CHECK (codiceFiscale REGEXP '^[A-Z0-9]{16}$')
);

CREATE TABLE Lavoro (
    codCantiere CHAR(5),
    cfOperaio CHAR(16),
    dataInizio DATE,
    dataFine DATE,
    PRIMARY KEY (codCantiere, cfOperaio, dataInizio),
    FOREIGN KEY (codCantiere) REFERENCES Cantiere(codice) ON UPDATE CASCADE,
    FOREIGN KEY (cfOperaio) REFERENCES Operaio(codiceFiscale) ON UPDATE CASCADE
);

CREATE TABLE Officina (
    partitaIva CHAR(11) PRIMARY KEY,
    ragioneSociale VARCHAR(100) NOT NULL,
    città VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(200) NOT NULL,
    CHECK (partitaIva REGEXP '^[0-9]{11}$')
);

CREATE TABLE Veicolo (
    targa CHAR(7) PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    UltimaRevisione DATE NOT NULL,
    frequenzaRevisioni VARCHAR(10) NOT NULL,
    pivaOfficina CHAR(11),
    CHECK (targa REGEXP '^[A-Z]{2}[0-9]{3}[A-Z]{2}$'),
    FOREIGN KEY (pivaOfficina) REFERENCES Officina(partitaIva) ON UPDATE CASCADE
);

CREATE TABLE Autista (
    codiceFiscale CHAR(16) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    dataNascita DATE NOT NULL,
    CHECK (codiceFiscale REGEXP '^[A-Z0-9]{16}$')
);

CREATE TABLE Abilitazione (
    cfAutista CHAR(16),
    targaVeicolo CHAR(7),
    PRIMARY KEY (cfAutista, targaVeicolo),
    FOREIGN KEY (cfAutista) REFERENCES Autista(codiceFiscale) ON UPDATE CASCADE,
    FOREIGN KEY (targaVeicolo) REFERENCES Veicolo(targa) ON UPDATE CASCADE
);

CREATE TABLE Conduzione (
	codCantiere CHAR(5),
    cfAutista CHAR(16),
    targaVeicolo CHAR(7),
    dataInizio DATE,
    dataFine DATE,
    PRIMARY KEY(codCantiere, cfAutista, targaVeicolo, dataInizio),
    /* Controllo abilitazione */ FOREIGN KEY (cfAutista, targaVeicolo) REFERENCES Abilitazione(cfAutista, targaVeicolo) ON UPDATE CASCADE,
    FOREIGN KEY (codCantiere) REFERENCES Cantiere(codice) ON UPDATE CASCADE,
    FOREIGN KEY (cfAutista) REFERENCES Autista(codiceFiscale) ON UPDATE CASCADE,
    FOREIGN KEY (targaVeicolo) REFERENCES Veicolo(targa) ON UPDATE CASCADE
);

CREATE TABLE Riparazione (
	targaVeicolo CHAR(7),
    pivaOfficina CHAR(11),
    data DATE,
    tipo VARCHAR(30),
    PRIMARY KEY (targaVeicolo, pivaOfficina, data, tipo),
    FOREIGN KEY (targaVeicolo) REFERENCES Veicolo(targa) ON UPDATE CASCADE,
    FOREIGN KEY (pivaOfficina) REFERENCES Officina(partitaIva) ON UPDATE CASCADE
);

