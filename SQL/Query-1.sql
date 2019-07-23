/* QUERY DATABASE */

/* query 1 -------- okappa */

UPDATE utente SET stato_presentazione = 1 WHERE matricola =  "707287";

/* query 2 -------- okappa */ 

SELECT isbn FROM pubblicazione ORDER BY giorno_pubblicazione DESC LIMIT 10;

/* query 3 ----------okappa */

SELECT pubblicazione_isbn FROM storia 
       WHERE azione = "modificare" && TIMESTAMPDIFF(DAY, CURRENT_TIMESTAMP(), time_stamp) <= 30
       GROUP BY pubblicazione_isbn;

/* query 4 --------- okappa*/

SELECT matricola FROM utente ORDER BY n_pubblicazioni DESC LIMIT 3;

/* query 5 -------- okappa */

SELECT isbn FROM pubblicazione WHERE utente_matricola = "707287";

/* query 6 -------- okappa ma */

SELECT pubblicazione.titolo, pubblicazione.editore, pubblicazione.giorno_pubblicazione, autore.nome, autore.cognome FROM autore
        INNER JOIN scrivere ON autore.id = scrivere.autore_id
        INNER JOIN pubblicazione ON pubblicazione.isbn = scrivere.pubblicazione_isbn
        ORDER BY pubblicazione.titolo;

/* query 7 -------- okappa */

SELECT * FROM pubblicazione WHERE isbn = "1408892618492";

/* query 8 -------- okappa*/

SELECT * FROM pubblicazione
       WHERE titolo = " ";

SELECT * FROM pubblicazione
       WHERE isbn = " ";
    
SELECT pubblicazione.isbn FROM autore
        INNER JOIN scrivere ON autore.id = scrivere.autore_id
        INNER JOIN pubblicazione ON pubblicazione.isbn = scrivere.pubblicazione_isbn
        WHERE id = "2";

SELECT pubblicazione_isbn FROM contenere 
        WHERE parola_chiave = " ";

/* query 9 -------- okappa */ 

/* controllo se l'utente ha gia aggiunto una recensione per quella pubblicazione */


INSERT INTO recensione(stato_recensione, testo, stelle, giorno, ora, utente_matricola, pubblicazione_isbn) VALUES (0, "recensione numero sei", 4, '2019/03/07', '11:11:11', 221919, 7198090073652);

/* query 10 ------- okappa */

UPDATE recensione SET stato_recensione = 1 WHERE id = x ;
 
/* query 11 ------- okappa */ 

INSERT INTO noje VALUES (" ", " ", CURDATE(), NOW());

/* query 12 ------- okappa */

SELECT COUNT(pubblicazione_isbn) FROM noje WHERE pubblicazione_isbn = "1408892618492";

/* query 13 ------- okappa */ 

SELECT id FROM recensione WHERE pubblicazione_isbn = " " & stato_recensione == 1;

/* query 14 ------- okappa */ 

SELECT id FROM recensione WHERE stato_recensione = 0;

/* query 15 ------- okappa */

SELECT * FROM storia WHERE pubblicazione_isbn = "1408892618492";

/* query 16 ------- okappa */

SELECT pubblicazione_isbn FROM sorgente WHERE tipo = "download" ;

/* query 17 ------- okappa */

SELECT pubblicazione_isbn, giorno FROM ristampa;

/* query 18 ------- okappa */

SELECT i.pubblicazione_isbn FROM scrivere i 
INNER JOIN scrivere ON i.autore_id = scrivere.autore_id 
INNER JOIN  scrivere u ON i.autore_id = u.autore_id 
WHERE u.pubblicazione_isbn = 9977757714223 
GROUP BY i.pubblicazione_isbn;

/* 


                QUERY NOSTRE


*/

/* 

COMBINAZIONE DELLE QUERY H. e J. 

quando un utente viene bannato ( soft ban ) la data del suo ultimo accesso
viene settata al momento del ban in modo tale che verra usata quella come controllo
per la scadenza del soft ban .
la prova è fatta sullutente "864293" che già ha 2 soft ban

incremento del soft ban di un utente, settaggio del flag di ban a 0 e cambio data ultimo accesso
*/

UPDATE utente SET n_ban = n_ban + 1 WHERE matricola = "864293";
UPDATE utente SET stato_ban = 0 WHERE matricola = "864293";
UPDATE utente SET ultimo_accesso = NOW() WHERE matricola = "864293";

/*

        quando un utente effettua l'accesso si dovrà controllare se quell'utente
        è in uno stato di ban in modo da non farlo entrare...controllo tramite matricola.

        Supponiamo che il sistema che gestisce tutto sia scritto in Java percio un utente 
        accede con la matricola e la query restituisce i flag necessari al programma
        java che si occupera di far accedere o no l'utente.

        quando un utente fa l'accesso controlleremo anche se il numero di ban è uguale 
        a 3 in modo da bannarlo permanentemente, quando un utente verrà bannato permanentemente

        all'accesso verra controllato anche quanto segnalazioni immpotivate avrà fatto l'utente
        e se saranno uguali a 3 partirà un soft ban

*/

/*      query che restituisce a java i dati necessari  per    */

SELECT stato_ban, n_ban, ultimo_accesso from utente WHERE matricola = "864293";

/*   query che toglie lo stato di ban di un utente perchè sono passati almeno 30 giorni   */

UPDATE utente SET stato_ban = null WHERE matricola = "864293";

/*   query che banna permanentemente un utente in quanto ha raggiunto 3 soft ban   */

UPDATE utente SET stato_ban = 1 WHERE matricola = "864293";
INSERT INTO utente_bannato(utente_matricola, motivazione, giorno, ora) values("864293", "motivo", CURDATE(), NOW());

/*   query che restituisce il numero di segnalazioni immpotivate fatte dall'utente che fa l'accesso   */

SELECT n_segnalazioni_immotivate FROM utente WHERE matricola = "864293";

/*


        Query che incrementa il numero di segnalazioni immpotivate 
        per un utente


*/

UPDATE utente SET n_segnalazioni_immotivate = n_segnalazioni_immotivate + 1 WHERE matricola = "221919";

/*

        query che restituisce gli utenti con 0 bann per eventuali promozioni a moderatori
        e promozione a moderatore di un utente

        per diventare moderatore deve essere controllato anche che sia attivo 

*/

SELECT matricola from utente WHERE n_ban = 0;

SELECT n_ban from utente WHERE matricola = "221919";

/*   controllo se l'utente è attivo   */

SELECT stato_presentazione FROM utente WHERE matricola = "221919";

UPDATE utente SET livello_utenza = 0 WHERE matricola = "221919";

/*

        modifica di un commento da parte di un moderatore

        - restituzione al programma java del testo del commento
        - query con nuovo testo e update dell'utente che ha scritto il commento

*/

SELECT testo FROM commento WHERE id = 5;

UPDATE commento SET testo = "nuovo testo 5" WHERE id = 5;
UPDATE commento SET utente_matricola = "864293" WHERE id = 5;

/*

        apprezzamento di una recensione ( stelle da 0 a 5)

*/

INSERT INTO apprezzare(utente_matricola, recensione_id, stelle) values("221919", 1, 2);

/*   prova del constraint mettendo un numero di stelle superiore a 5   */

INSERT INTO apprezzare(utente_matricola, recensione_id, stelle) values("221919", 2, 6);

/*   

        segnalazione di un commento con id = 5

*/

INSERT INTO notifica(tipo_notifica, tipo_entita, riferimento_entita, testo) values("segnalazione", "commento", "5", "commento non appropriato");

/*       

        eliminazione di una pubblicazione       

        quando una pubblicazione viene eliminata, verranno eliminati 
        anche tutte le recensioni, commenti, like e risposte a essa associata
        
*/

