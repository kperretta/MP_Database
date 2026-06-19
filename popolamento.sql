INSERT INTO Cliente (codiceFiscale, città, indirizzo, cellulare, email, cognome, nome, dataNascita, ragioneSociale) 
VALUES
('RSSMRA80A01H501Z', 'Roma', 'Via Roma 1', '1234567890', 'mario.rossi@gmail.com', 'Rossi', 'Mario', '1980-01-01', NULL),
('VRNDNC85A01F205X', 'Milano', 'Via Milano 2', '0987654321', 'daniela.verdi@gmail.com', 'Verdi', 'Daniela', '1985-05-15', NULL),
('12345624390', 'Roma', 'Via del Corso 3', '3456789012', 'francesco.bianchi@tiscali.it', NULL, NULL, NULL, 'Bianchi & Co Srl'),
('LZTLNE82A01D325P', 'Torino', 'Via Torino 4', '3412345678', 'luigi.zanetti@gmail.com', 'Zanetti', 'Luigi', '1982-11-30', NULL),
('GRLMPA92A01H501W', 'Bologna', 'Via Bologna 5', '3312345678', 'paolo.garilli@yahoo.com', 'Garilli', 'Paolo', '1992-04-25', NULL),
('FRTMRA78A01H501A', 'Firenze', 'Via Firenze 6', '3387654321', 'maria.ferrari@example.com', 'Ferrari', 'Maria', '1978-03-10', NULL),
('BLNMRI85A01H501T', 'Verona', 'Via Verona 7', '3401234567', 'alessandro.bianchi@yahoo.com', 'Bianchi', 'Alessandro', '1985-11-22', NULL),
('PNTGNN95A01H501Q', 'Roma', 'Via Nazionale 8', '3487654321', 'giovanni.ponti@outlook.com', 'Ponti', 'Giovanni', '1995-08-13', NULL),
('11527893012', 'Milano', 'Via Montenapoleone 9', '3476543210', 'grandi.alimentari@tiscali.it', NULL, NULL, NULL, 'Grandi Alimentari Srl'),
('23145627891', 'Catania', 'Via Catania 10', '3498765432', 'carlo.verona@gmail.com', 'Veronesi', 'Carlo', NULL, 'Veronesi GMA Srl');

INSERT INTO Impiegato (codiceFiscale, nome, cognome, dataNascita, ufficio) 
VALUES
('MLRNLS90A01F205Y', 'Luca', 'Milanesi', '1990-02-20', 'U01'),
('GBRSMN84A01A001X', 'Giulia', 'Brescia', '1984-07-10', 'U02'),
('RGTMLS85A01L219R', 'Marco', 'Rossi', '1985-03-15', 'U01'),
('SMDLNC76A01Z404P', 'Sandra', 'De Luca', '1976-09-23', 'U03'),
('FRNRRC89A01F205Y', 'Francesco', 'Ricci', '1989-10-17', 'U02'),
('PSLGRS92A01A001W', 'Giovanni', 'Pugliese', '1992-05-11', 'U01'),
('DLNMRK79A01H501Z', 'Simona', 'Del Nero', '1979-02-23', 'U03'),
('MNTLNR85A01H501S', 'Marco', 'Mantovani', '1985-04-20', 'U02'),
('BNTMCL78A01L312T', 'Lucia', 'Montagna', '1978-07-04', 'U01'),
('GFRGLL90A01H501P', 'Alessandra', 'Ferri', '1990-11-15', 'U02');

INSERT INTO Cantiere (codice, città, indirizzo, descrizione, dataInizio, dataFine, percentualeAvanzamento, dataAggiornamento, cfImpiegato) 
VALUES
('C0001', 'Roma', 'Via Roma 1', 'Costruzione edificio residenziale', '2023-01-01', '2024-01-01', 100, '2024-01-01', 'MLRNLS90A01F205Y'),
('C0002', 'Milano', 'Via Montenapoleone 2', 'Consolidamento strutturale', '2025-05-01', '2025-12-01', 0, '2025-05-01', 'GBRSMN84A01A001X'),  -- Modificato
('C0003', 'Roma', 'Via del Corso 3', 'Ristrutturazione', '2023-02-15', '2025-03-15', 44, '2023-09-01', 'RGTMLS85A01L219R'),
('C0004', 'Milano', 'Corso Vittorio Emanuele II 4', 'Ristrutturazione facciata', '2023-06-01', '2025-07-01', 17, '2023-09-01', 'SMDLNC76A01Z404P'),
('C0005', 'Bologna', 'Via Bologna 5', 'Adeguamento normativo', '2023-07-01', '2024-12-01', 100, '2024-12-01', 'FRNRRC89A01F205Y'),
('C0006', 'Roma', 'Via Nazionale 6', 'Manutenzione ordinaria', '2023-04-01', '2025-08-01', 35, '2023-08-15', 'PSLGRS92A01A001W'),
('C0007', 'Firenze', 'Via San Felice 8', 'Nuova costruzione', '2023-03-01', '2025-05-01', 10, '2023-04-01', 'DLNMRK79A01H501Z'),
('C0008', 'Verona', 'Via Verona 7', 'Impianti fotovoltaici', '2023-06-15', '2024-10-01', 100, '2024-10-01', 'MNTLNR85A01H501S'),
('C0009', 'Catania', 'Via Catania 10', 'Pavimentazione', '2023-07-01', '2025-09-01', 50, '2023-08-01', 'BNTMCL78A01L312T'),
('C0010', 'Roma', 'Via Nazionale 11', 'Ristrutturazione di una chiesa', '2023-08-01', '2024-11-01', 100, '2024-11-01', 'GFRGLL90A01H501P');

INSERT INTO Permesso (tipo) VALUES
('Occupazione suolo pubblico'),
('Modifiche strutturali'),
('Autorizzazione paesaggistica'),
('Lavori in quota'),
('Gestione rifiuti pericolosi');

INSERT INTO Autorizzazione (codCantiere, tipoPermesso) VALUES
('C0001', 'Modifiche strutturali'),
('C0002', 'Autorizzazione paesaggistica'),
('C0002', 'Modifiche strutturali'),
('C0003', 'Occupazione suolo pubblico'),
('C0004', 'Modifiche strutturali'),
('C0004', 'Autorizzazione paesaggistica'),
('C0005', 'Gestione rifiuti pericolosi'),
('C0006', 'Lavori in quota'),
('C0007', 'Gestione rifiuti pericolosi'),
('C0009', 'Modifiche strutturali'),
('C0010', 'Autorizzazione paesaggistica');

INSERT INTO Commissione (cfCliente, codCantiere, quotaCliente) 
VALUES
('RSSMRA80A01H501Z', 'C0001', 100),
('VRNDNC85A01F205X', 'C0002', 50),
('12345624390', 'C0002', 50),
('VRNDNC85A01F205X', 'C0003', 100),
('LZTLNE82A01D325P', 'C0004', 100),
('12345624390', 'C0005', 20),
('FRTMRA78A01H501A', 'C0005', 80),
('11527893012', 'C0006', 100),
('PNTGNN95A01H501Q', 'C0007', 100),
('PNTGNN95A01H501Q', 'C0008', 100),
('11527893012', 'C0009', 100),
('23145627891', 'C0010', 35),
('VRNDNC85A01F205X', 'C0010', 65);

INSERT INTO Fornitore (partitaIva, ragioneSociale, città, indirizzo) 
VALUES
('01234567890', 'Design & Strutture Srl', 'Roma', 'Via del Corso 1'),
('09876543210', 'Materiali Edili Milano', 'Milano', 'Piazza Cavour 5'),
('12345678901', 'Edilizia Esposito Spa', 'Napoli', 'Via Toledo 6'),
('98765432109', 'Biaggi Srl', 'Torino', 'Via Roma 2'),
('11223344556', 'Edil Bianchi', 'Bologna', 'Via Indipendenza 3'),
('22334455667', 'FGR Forniture', 'Firenze', 'Piazza della Repubblica 4'),
('33445566778', 'Versani Materiali', 'Verona', 'Via Mazzini 7'),
('44556677889', 'Forniture Rossi', 'Genova', 'Via Garibaldi 8'),
('55667788990', 'Bersa Spa', 'Padova', 'Via del Santo 9'),
('66778899001', 'Edilizia Padovani Srl', 'Catania', 'Via Etna 10'),
('01040360012', 'Edilizia Mattinetti Spa', 'Milano', 'Via dei Fabbri 12'),
('02040570013', 'Forniture Sarni', 'Torino', 'Corso Lombardia 85'),
('03040680014', 'Cemento e Marmi Srl', 'Roma', 'Via della Cementeria 34'),
('04040790015', 'Attrezzature Cersi', 'Napoli', 'Piazza del Plebiscito 10'),
('05040800016', 'Ferramenta Lombardi Sel', 'Bologna', 'Via Emilia 50'),
('06040910017', 'Legnami Donadio Spa', 'Firenze', 'Viale delle Industrie 120'),
('07041020018', 'Robertini Srl', 'Genova', 'Corso San Gottardo 300'),
('08041130019', 'Vetri e Finestre Rossino', 'Verona', 'Via della Tecnica 70'),
('09041240020', 'Impianti Idraulici Disiani', 'Padova', 'Viale delle Acque 90'),
('10041350021', 'Pavimenti e Rivestimenti Alleni', 'Catania', 'Via San Giovanni 22'),
('12041570023', 'Edilmarket Spa', 'Roma', 'Viale Marco Aurelio 120'),
('14041790025', 'Strutture Ianniberti Spa', 'Torino', 'Via Monginevro 50'),
('15041800026', 'Granito & Pietra Lauria', 'Genova', 'Piazza Dante 10'),
('19042240030', 'Sernini Srl', 'Padova', 'Piazza dei Signori 35'),
('20042350031', 'Pavimenti&Design Sessa Srl', 'Torino', 'Via Giovanni da Verrazzano 25'),
('21042460032', 'Sistemi Giannucci Sas', 'Milano', 'Via Antonio Gramsci 12'),
('22042570033', 'Edilizia Green Srl', 'Roma', 'Via Flaminia 250'),
('23042680034', 'Rivestimenti Seruli Spa', 'Napoli', 'Via Toledo 180');

INSERT INTO Materiale (nome, qtàDisponibile, unitaDiMisura) 
VALUES
('Cemento', 5000, 'kg'),
('Mattoni', 2000, 'pezzi'),
('Pittura', 200, 'litri'),
('Gesso', 1000, 'kg'),
('Pietra', 500, 'tonnellate'),
('Ceramica', 1200, 'm2'),
('Asfalto', 1500, 'tonnellate');

INSERT INTO Acquisto (pivaFornitore, nomeMateriale, data, quantità) 
VALUES
('01234567890', 'Cemento', '2023-01-10', 1000),
('09876543210', 'Mattoni', '2023-02-20', 500),
('98765432109', 'Pittura', '2023-04-10', 300),
('11223344556', 'Pietra', '2023-05-05', 1000),
('22334455667', 'Gesso', '2023-06-01', 500),
('33445566778', 'Pittura', '2023-07-10', 1500),
('44556677889', 'Ceramica', '2023-08-15', 700),
('55667788990', 'Asfalto', '2023-09-01', 1200),
('66778899001', 'Cemento', '2023-10-10', 1500);

INSERT INTO Impiego (codCantiere, nomeMateriale, data, quantità)
VALUES
('C0001', 'Cemento', '2023-01-15', 100),
('C0001', 'Ceramica', '2023-01-15', 200),
('C0002', 'Pietra', '2023-02-01', 500),  
('C0002', 'Asfalto', '2023-02-10', 300),
('C0003', 'Gesso', '2023-03-10', 150),
('C0003', 'Cemento', '2023-03-15', 100),
('C0004', 'Pittura', '2023-04-20', 400),
('C0004', 'Mattoni', '2023-04-25', 100),
('C0005', 'Mattoni', '2023-05-01', 500),
('C0005', 'Pittura', '2023-05-10', 200); 

INSERT INTO Operaio (codiceFiscale, nome, cognome, dataNascita, specializzazione, esperienza)
VALUES
('ZMPFNC75A01Z404X', 'Stefano', 'Zampieri', '1975-11-20', 'Muratore', 'Esperto'),
('LNSMRA88A01D325X', 'Andrea', 'Lombardi', '1988-02-11', 'Falegname', 'Apprendista'),
('RNGCFL84A01Z404P', 'Giovanni', 'Rango', '1984-07-30', 'Elettricista', 'Junior'),
('BNMCLI80A01C321V', 'Mario', 'Bianchi', '1980-05-12', 'Idraulico', 'Apprendista'),
('PFNNDR89A01D112S', 'Luca', 'Ferraro', '1989-09-05', 'Carpentiere', 'Esperto'),
('MLTNGR75A01F205A', 'Carlo', 'Maltini', '1975-10-10', 'Pavimentista', 'Esperto'),
('VNSFNC82A01F205M', 'Antonio', 'Vasquez', '1982-11-01', 'Manovale', 'Intermedio'),
('RCPFNC86A01A001T', 'Simone', 'Ricci', '1986-03-12', 'Operaio generico', 'Esperto'),
('FRTGRG83A01Z321C', 'Federico', 'Gariglietta', '1983-06-16', 'Muratore', 'Apprendista'),
('SPNNMR82A01F320D', 'Paolo', 'Spinelli', '1982-01-24', 'Idraulico', 'Esperto');

INSERT INTO Lavoro (codCantiere, cfOperaio, dataInizio, dataFine)
VALUES
('C0001', 'ZMPFNC75A01Z404X', '2023-01-01', '2023-03-01'),
('C0001', 'LNSMRA88A01D325X', '2023-01-01', '2023-03-01'),
('C0002', 'RNGCFL84A01Z404P', '2023-02-01', '2023-04-01'),
('C0002', 'BNMCLI80A01C321V', '2023-02-01', '2023-04-01'),
('C0003', 'PFNNDR89A01D112S', '2023-03-10', '2023-05-01'),
('C0003', 'MLTNGR75A01F205A', '2023-03-10', '2023-05-01'),
('C0004', 'VNSFNC82A01F205M', '2023-04-01', '2023-06-01'),
('C0004', 'RCPFNC86A01A001T', '2023-04-01', '2023-06-01'),
('C0005', 'FRTGRG83A01Z321C', '2023-05-01', '2023-07-01'),
('C0005', 'SPNNMR82A01F320D', '2023-05-01', '2023-07-01');

INSERT INTO Officina (partitaIva, ragioneSociale, città, indirizzo)
VALUES
('12345678901', 'Officina Carmisi Srl', 'Roma', 'Via Roma 15'),
('23456789012', 'Riparazioni Milano', 'Milano', 'Via Garibaldi 22'),
('34567890123', 'Autofficina Torsi', 'Torino', 'Via Po 33'),
('45678901234', 'Carrozzeria Napoli', 'Napoli', 'Via Toledo 25'),
('56789012345', 'Officina Meccanica Bolassi', 'Bologna', 'Via Nazionale 10'),
('67890123456', 'SDR Riparazioni', 'Genova', 'Via XX Settembre 20'),
('78901234567', 'Carrozzeria Fornisi', 'Firenze', 'Via Tornabuoni 30'),
('89012345678', 'Officina Polletta', 'Padova', 'Via Umberto I 40'),
('90123456789', 'Riparazioni Gennisi Srl', 'Catania', 'Corso Italia 18'),
('01234567890', 'Carrozzeria Verdi', 'Verona', 'Via Velli 5');

INSERT INTO Veicolo (targa, tipo, UltimaRevisione, frequenzaRevisioni, pivaOfficina)
VALUES
('AB123CD', 'Camion', '2023-01-01', 'Annuale', '90123456789'),
('CD234EF', 'Gru Mobile', '2023-02-15', 'Annuale', '90123456789'),
('EF345GH', 'Furgone', '2023-03-20', 'Annuale', '01234567890'),
('GH456IJ', 'Carrello Elevatore', '2023-04-10', 'Annuale', '90123456789'),
('IJ567KL', 'Gru Mobile', '2023-05-30', 'Annuale', '56789012345'),
('KL678MN', 'Escavatore', '2023-06-05', 'Annuale', '12345678901'),
('MN789OP', 'Camion', '2023-07-15', 'Annuale', '90123456789'),
('OP890QR', 'Autocarro', '2023-08-01', 'Annuale', '90123456789'),
('QR901ST', 'Furgone', '2023-09-15', 'Annuale', '90123456789'),
('ST012UV', 'Camion', '2023-10-10', 'Annuale', '90123456789');

INSERT INTO Autista (codiceFiscale, nome, cognome, dataNascita)
VALUES
('MSLRSL85A01H501F', 'Alessandro', 'Mazzini', '1985-10-01'),
('BNSLNR88A01D325V', 'Giovanni', 'Basso', '1988-06-15'),
('CNSLND82A01F205D', 'Luca', 'Costa', '1982-03-21'),
('LRSRGR79A01Z404F', 'Federico', 'Luisi', '1979-07-30'),
('PRTGRS85A01A001G', 'Riccardo', 'Pierro', '1985-11-10'),
('MRGRLD89A01H501S', 'Matteo', 'Giorgi', '1989-04-22'),
('FNTNMG88A01F205T', 'Francesco', 'Negrasta', '1988-01-10'),
('BRTMNS80A01Z404L', 'Marco', 'Bertoni', '1980-12-19'),
('TMRGNN75A01A001P', 'Antonio', 'Tommasini', '1975-05-05'),
('LRGRCL83A01H501M', 'Rachele', 'Largi', '1983-09-16');

INSERT INTO Abilitazione (cfAutista, targaVeicolo)
VALUES
('MSLRSL85A01H501F', 'AB123CD'),
('BNSLNR88A01D325V', 'CD234EF'),
('CNSLND82A01F205D', 'EF345GH'),
('LRSRGR79A01Z404F', 'GH456IJ'),
('PRTGRS85A01A001G', 'IJ567KL'),
('MRGRLD89A01H501S', 'KL678MN'),
('FNTNMG88A01F205T', 'MN789OP'),
('BRTMNS80A01Z404L', 'OP890QR'),
('TMRGNN75A01A001P', 'QR901ST'),
('LRGRCL83A01H501M', 'ST012UV'),
('LRGRCL83A01H501M', 'AB123CD'),
('LRGRCL83A01H501M', 'CD234EF'),
('LRGRCL83A01H501M', 'EF345GH'),
('LRGRCL83A01H501M', 'GH456IJ'),
('LRGRCL83A01H501M', 'IJ567KL'),
('LRGRCL83A01H501M', 'KL678MN'),
('LRGRCL83A01H501M', 'MN789OP'),
('LRGRCL83A01H501M', 'OP890QR'),
('LRGRCL83A01H501M', 'QR901ST');

INSERT INTO Conduzione (codCantiere, cfAutista, targaVeicolo, dataInizio, dataFine)
VALUES
('C0001', 'MSLRSL85A01H501F', 'AB123CD', '2023-01-01', '2023-03-01'),
('C0001', 'BNSLNR88A01D325V', 'CD234EF', '2023-01-01', '2023-03-01'),
('C0002', 'CNSLND82A01F205D', 'EF345GH', '2023-02-01', '2023-04-01'),
('C0002', 'LRSRGR79A01Z404F', 'GH456IJ', '2023-02-01', NULL),
('C0003', 'PRTGRS85A01A001G', 'IJ567KL', '2023-03-10', '2023-05-01'),
('C0003', 'MRGRLD89A01H501S', 'KL678MN', '2023-03-10', '2023-05-01'),
('C0004', 'FNTNMG88A01F205T', 'MN789OP', '2023-04-01', '2023-06-01'),
('C0004', 'BRTMNS80A01Z404L', 'OP890QR', '2023-04-01', '2023-06-01'),
('C0005', 'TMRGNN75A01A001P', 'QR901ST', '2023-05-01', '2023-07-01'),
('C0005', 'LRGRCL83A01H501M', 'ST012UV', '2023-05-01', '2023-07-01'),
('C0005', 'LRGRCL83A01H501M', 'ST012UV', '2020-09-01', '2022-10-11'),
('C0001', 'LRGRCL83A01H501M', 'AB123CD', '2023-04-01', '2023-08-10'),
('C0002', 'LRGRCL83A01H501M', 'CD234EF', '2019-05-01', '2020-07-18'),
('C0002', 'LRGRCL83A01H501M', 'EF345GH', '2025-01-04', NULL),
('C0006', 'LRGRCL83A01H501M', 'GH456IJ', '2020-05-01', '2024-07-18'),
('C0002', 'LRGRCL83A01H501M', 'IJ567KL', '2023-10-01', '2024-07-01'),
('C0003', 'LRGRCL83A01H501M', 'KL678MN', '2022-01-09', '2023-01-10'),
('C0003', 'LRGRCL83A01H501M', 'MN789OP', '2023-10-01', '2024-07-18'),
('C0001', 'LRGRCL83A01H501M', 'OP890QR', '2024-03-08', '2024-11-18'),
('C0004', 'LRGRCL83A01H501M', 'QR901ST', '2023-03-10', NULL);

INSERT INTO Riparazione (targaVeicolo, pivaOfficina, data, tipo)
VALUES
('AB123CD', '12345678901', '2023-01-10', 'Sostituzione freni'),
('CD234EF', '23456789012', '2023-02-15', 'Cambio olio'),
('EF345GH', '34567890123', '2023-03-10', 'Sostituzione ruote'),
('GH456IJ', '45678901234', '2023-04-05', 'Riparazione motore'),
('IJ567KL', '56789012345', '2023-05-12', 'Riparazione carrozzeria'),
('KL678MN', '67890123456', '2023-06-22', 'Cambio batteria'),
('MN789OP', '78901234567', '2023-07-01', 'Sostituzione sospensioni'),
('OP890QR', '89012345678', '2023-08-08', 'Riparazione frizione'),
('QR901ST', '90123456789', '2023-09-25', 'Verifica impianto elettrico'),
('ST012UV', '01234567890', '2023-10-15', 'Riparazione carburatore');