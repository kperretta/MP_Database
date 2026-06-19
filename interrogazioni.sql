-- Una selezione ordinata su un attributo di una tabella con condizioni AND e OR;
-- Elenca in ordine crescente in base alla percentuale di avanzamento i lavori a Firenze o Milano non ancora terminati
SELECT *
FROM cantiere
WHERE (città='Firenze' OR città='Milano')
	  AND percentualeAvanzamento<>100
ORDER BY percentualeAvanzamento;
      
      
-- Una selezione su due o più tabelle con condizioni;
-- Elenca gli impiegati che getiscono cantieri attualmente in corso a Roma, con una percentuale di avanzamento superiore al 30%. 
SELECT i.nome AS nomeImpiegato, i.cognome AS cognomeImpiegato, c.codice, c.città, c.indirizzo, c.descrizione, c.dataInizio, c.dataFine, c.percentualeAvanzamento, c.dataAggiornamento
FROM cantiere c JOIN impiegato i ON c.cfImpiegato=i.codiceFiscale
WHERE c.città='Roma'
      AND percentualeAvanzamento>30 AND percentualeAvanzamento<>100;
     
     
-- Una selezione aggregata su tutti i valori 
-- Mostra il numero totale di dipendenti nell'azienda 
SELECT 
    (SELECT COUNT(*) FROM Impiegato) + 
    (SELECT COUNT(*) FROM Operaio) + 
    (SELECT COUNT(*) FROM Autista) AS '#Dipendenti';


-- Una selezione aggregata su raggruppamenti
-- Mostra il numero dei cantieri commissionati e la percentuale di avanzamento media per ogni città
SELECT città, COUNT(*) AS '#cantieriCommisionati',  ROUND( AVG(percentualeAvanzamento) ) AS mediaAvanzamenti
FROM cantiere
GROUP BY città;


-- Una selezione aggregata su raggruppamenti con condizioni 
-- Elenca i cantieri in cui hanno lavorato operai con un'età media di almeno 40 anni
SELECT c.codice, c.città, c.indirizzo, c.descrizione, ROUND( AVG( TIMESTAMPDIFF(YEAR, o.dataNascita, CURDATE()) ) )  AS etàMediaOperai
FROM Cantiere c JOIN Lavoro l ON c.codice=l.codCantiere
     JOIN Operaio o ON l.cfOperaio=o.codiceFiscale
GROUP BY c.codice, c.città, c.indirizzo, c.descrizione
HAVING etàMediaOperai >= 40;	


-- Una selezione aggregata su raggruppamenti con condizioni che includano un’altra funzione di raggruppamento 
-- Mostra le officine a cui è affidata la manutenzione del maggior numero di veicoli
SELECT o.partitaIva, o.ragioneSociale, COUNT(v.targa) AS numeroVeicoli
FROM veicolo v JOIN officina o ON v.pivaOfficina = o.partitaIva
GROUP BY o.partitaIva, o.ragioneSociale
HAVING numeroVeicoli = ( SELECT MAX(numVeicoli)
						 FROM ( SELECT COUNT(targa) AS numVeicoli
								FROM Veicolo 
								GROUP BY pivaOfficina ) AS subQuery );


-- Una selezione con operazioni insiemistiche
-- Elenca i clienti che si erano già rivolti all'azienda per lavori conclusi ed hanno commissionato ulteriori lavori non ancora terminati
SELECT DISTINCT c.codiceFiscale, c.cognome, c.nome, c.ragioneSociale
FROM cliente c JOIN commissione cm ON c.codiceFiscale=cm.cfCliente
     JOIN cantiere ct ON cm.codCantiere = ct.codice
WHERE ct.percentualeAvanzamento=100 
      AND c.codiceFiscale IN ( SELECT c.codiceFiscale
							   FROM cliente c JOIN commissione cm ON c.codiceFiscale=cm.cfCliente
                                    JOIN cantiere ct ON cm.codCantiere = ct.codice
                               WHERE ct.percentualeAvanzamento < 100 );


-- Una selezione con l’uso appropriato della divisione
-- Elenca gli autisti che hanno condotto tutti i veicoli dell'azienda almeno una volta
SELECT a.codiceFiscale, a.nome, a.cognome
FROM autista a JOIN conduzione c ON a.codiceFiscale=c.cfAutista
GROUP BY a.codiceFiscale, a.nome, a.cognome
HAVING COUNT(DISTINCT c.targaVeicolo) = (SELECT COUNT(*) 
                                         FROM veicolo);
			