/* 
  1. Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
*/
SELECT COUNT(*) as `tot`, `name`, `lastname` FROM `prenotazioni_has_ospiti`
INNER JOIN `ospiti`
ON ospite_id = ospiti.id
GROUP BY ospiti.id
HAVING `tot` > 2;

SELECT`name`, `lastname` FROM `prenotazioni_has_ospiti`
INNER JOIN `ospiti`
ON ospite_id = ospiti.id
GROUP BY ospiti.id
HAVING COUNT(*) > 2;
/*      
  2. Stampare tutti gli ospiti per ogni prenotazione 
*/
SELECT`name`, `lastname`, `ospite_id`, `prenotazione_id` FROM `prenotazioni_has_ospiti`
INNER JOIN `ospiti`
ON ospite_id = ospiti.id
/*      
  3. Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018
*/
/* TODO: riordinala! */
SELECT price, paganti.name AS `nome_pagante`, paganti.lastname AS `cognome_pagante`, ospiti.name, ospiti.lastname, prenotazioni.created_at
FROM `prenotazioni`
INNER JOIN `pagamenti` ON prenotazioni.id = `prenotazione_id`
INNER JOIN `paganti` ON paganti.id = `pagante_id`
INNER JOIN prenotazioni_has_ospiti
ON prenotazioni_has_ospiti.prenotazione_id = prenotazioni.id
INNER JOIN ospiti ON ospiti.id = prenotazioni_has_ospiti.ospite_id
WHERE YEAR(prenotazioni.created_at) = 2018 AND MONTH(prenotazioni.created_at) = 5;
/*      
  4. Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano
*/
SELECT SUM(price) AS `totale_primo_piano`
FROM `prenotazioni`
INNER JOIN `pagamenti`
ON prenotazioni.id = `prenotazione_id`
INNER JOIN `stanze`
ON stanze.id = `stanza_id`
WHERE floor = 1;
/*      
  5. Prendi i dati di fatturazione per la prenotazione con id=7 
*/
SELECT `name`, `lastname`, `address`
FROM `pagamenti`
INNER JOIN `paganti`
ON paganti.id = `pagante_id`
WHERE prenotazione_id = 7;
/*      
  6. Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate)
*/
SELECT `room_number`
FROM `stanze`
LEFT JOIN `prenotazioni`
ON stanze.id = `stanza_id`
WHERE prenotazioni.id IS NULL;


