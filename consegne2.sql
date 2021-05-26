/* 
  1. Conta gli ospiti raggruppandoli per anno di nascita
*/
SELECT YEAR(`date_of_birth`) AS `yob`, COUNT('id') AS `tot`
FROM `ospiti`
GROUP BY YEAR(`date_of_birth`);
/*      
  2. Somma i prezzi dei pagamenti raggruppandoli per status 
*/
SELECT `status`, SUM(`price`) AS `total`
FROM `pagamenti`
GROUP BY `status`;
/*      
  3. Conta quante volte è stata prenotata ogni stanza 
*/
SELECT `stanza_id` AS `stanza`, COUNT(*) AS `total`
FROM `prenotazioni`
GROUP BY `stanza`;
/*      
  4. Fai un'analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti
*/
SELECT HOUR(`created_at`) AS `ora_prenotazione`, COUNT(HOUR(`created_at`)) AS `prenotazioni_totali`
FROM `prenotazioni`
GROUP BY `ora_prenotazione`
ORDER BY `prenotazioni_totali` DESC;
/*      
  5. Quante prenotazioni ha fatto l'ospite che ha fatto più prenotazioni? (Quante, non chi!) 
*/
SELECT `ospite_id`, COUNT(*) AS `prenotazioni_totali`
FROM `prenotazioni_has_ospiti`
GROUP BY `ospite_id`
ORDER BY `prenotazioni_totali` DESC
LIMIT 1;
