
INSERT INTO utente(matricola, nome, cognome, email, password, n_telefono, stato_ban, n_ban, ultimo_accesso, giorno_iscrizione, n_commenti, n_recensioni, n_stelle, n_like, n_pubblicazioni, stato_presentazione                , presentazione) values( 707287, 'Lucinda', 'Knight', 'pukhujus@loul.gt', 'vSRl3kqkefsJ0', 3558654417, null, 0, '2020/05/22', '2078/11/05', 222, 1794, 1999, 309, 1008, 0, "presentazione");
INSERT INTO utente(matricola, nome, cognome, email, password, n_telefono, stato_ban, n_ban, ultimo_accesso, giorno_iscrizione, n_commenti, n_recensioni, n_stelle, n_like, n_pubblicazioni, stato_presentazione, livello_utenza, presentazione) values( 461442, 'Dollie', 'Spencer', 'uhouvje@setrogha.pr', 'mmJYeysVr0MXIb4ucw', 3746145460, 0, 2, '2052/11/02', '2073/09/21', 1841, 405, 466, 454, 808, 1, 1, "presentazione");
INSERT INTO utente(matricola, nome, cognome, email, password, n_telefono, stato_ban, n_ban, ultimo_accesso, giorno_iscrizione, n_commenti, n_recensioni, n_stelle, n_like, n_pubblicazioni, stato_presentazione                ) values( 221919, 'Lela', 'Sandoval', 'wa@je.it', 'Bkkc9PahJ0OZPOCSkS8', 3530173436, null, 2, '2071/06/19', '2042/06/30', 88, 810, 600, 1758, 1388, 0);
INSERT INTO utente(matricola, nome, cognome, email, password, n_telefono, stato_ban, n_ban, ultimo_accesso, giorno_iscrizione, n_commenti, n_recensioni, n_stelle, n_like, n_pubblicazioni, stato_presentazione, livello_utenza, presentazione) values( 864293, 'Victoria', 'Phillips', 'sodcu@ne.mg', 'SMm4bqFryhZjN', 3283061196, null, 2, '2096/04/23', '2049/09/29', 660, 320, 1903, 1795, 1746, 1, 0, "presentazione");
INSERT INTO utente(matricola, nome, cognome, email, password, n_telefono, stato_ban, n_ban, ultimo_accesso, giorno_iscrizione, n_commenti, n_recensioni, n_stelle, n_like, n_pubblicazioni, stato_presentazione                , presentazione) values( 181020, 'Lee', 'Chandler', 'emlaczo@zemje.lc', 'BekD4r2v4whsrhr', 3104390335, 1, 3, '2082/05/26', '2046/06/12', 792, 1624, 1967, 920, 272, 1, "presentazione");

INSERT INTO pubblicazione(isbn, giorno_pubblicazione, ora_pubblicazione, lingua, n_pagine, titolo, descrizione, editore, stato_pubblicazione, utente_matricola) values(5763622736558, '2101/11/05', '05:32:02', 'italiano',  458, 'law', 'descrizione 1', 'Ortega', 1, 707287);
INSERT INTO pubblicazione(isbn, giorno_pubblicazione, ora_pubblicazione, lingua, n_pagine, titolo, descrizione, editore, stato_pubblicazione, utente_matricola) values(1408892618492, '2049/04/28', '14:23:54', 'italiano',  482, 'atomic', 'descrizione 2', 'King', 0, 181020);
INSERT INTO pubblicazione(isbn, giorno_pubblicazione, ora_pubblicazione, lingua, n_pagine, titolo, descrizione, editore, stato_pubblicazione, utente_matricola) values(7198090073652, '2116/01/10', '12:00:04', 'inglese',  1733, 'sense', 'descrizione 3', 'Summers', 1, 707287);
INSERT INTO pubblicazione(isbn, giorno_pubblicazione, ora_pubblicazione, lingua, n_pagine, titolo, descrizione, editore, stato_pubblicazione, utente_matricola) values(4734401332680, '2082/08/27', '09:02:21', 'italiano',  322, 'sense', 'descrizione 4',  'Summers', 0, 181020);
INSERT INTO pubblicazione(isbn, giorno_pubblicazione, ora_pubblicazione, lingua, n_pagine, titolo, descrizione, editore, stato_pubblicazione, utente_matricola) values(9977757714223, '2107/02/05', '11:03:00', 'italiano',  839, 'mind', 'descrizione 5', 'Summers', 0, 461442);

INSERT INTO sorgente(uri, tipo, formato, descrizione, pubblicazione_isbn) values( 'https://provauriIxEdVhb', 'immagine', 'jpg', 'descrizione 1', 5763622736558);
INSERT INTO sorgente(uri, tipo, formato, descrizione, pubblicazione_isbn) values( 'https://provauriGjkTUKFcaAxbfgAZoQa', 'download', 'pdf', 'descrizione 2', 1408892618492);
INSERT INTO sorgente(uri, tipo, formato, descrizione, pubblicazione_isbn) values( 'https://provauriUjPdJlyLhdq', 'acquisto', 'copertina flessibile', 'descrizione 3', 7198090073652);
INSERT INTO sorgente(uri, tipo, formato, descrizione, pubblicazione_isbn) values( 'https://provauriMghZUJdQxyAye', 'immagine', 'jpg', 'descrizione 4', 4734401332680);
INSERT INTO sorgente(uri, tipo, formato, descrizione, pubblicazione_isbn) values( 'https://provauriwYxGmfnN', 'video', 'youtube', 'descrizione 5', 9977757714223);

INSERT INTO materia(nome) values('informatica');
INSERT INTO materia(nome) values('biologia');
INSERT INTO materia(nome) values('fisica');
INSERT INTO materia(nome) values('biotecnologia');
INSERT INTO materia(nome) values('matematica');

INSERT INTO ristampa(pubblicazione_isbn, ora, giorno, numero) values(5763622736558, '03:02:00', '2091/10/25', 1);
INSERT INTO ristampa(pubblicazione_isbn, ora, giorno, numero) values(4734401332680, '11:04:54', '2058/12/30', 1);
INSERT INTO ristampa(pubblicazione_isbn, ora, giorno, numero) values(9977757714223, '21:02:12', '2047/6/12/', 1);
INSERT INTO ristampa(pubblicazione_isbn, ora, giorno, numero) values(5763622736558 , '07:23:24', '2118/9/24/', 2);
INSERT INTO ristampa(pubblicazione_isbn, ora, giorno, numero) values(5763622736558 , '00:00:00', '2092/3/23/', 3);

INSERT INTO recensione(stato_recensione, testo, stelle, giorno, ora, pubblicazione_isbn, utente_matricola) values(0, 'recensione numero uno', 2, '2019/09/05', '11:03:12', 9977757714223, 221919);
INSERT INTO recensione(stato_recensione, testo, stelle, giorno, ora, pubblicazione_isbn, utente_matricola) values(0, 'recensione numero due', 0, '2093/11/08', '12:34:42', 4734401332680, 221919);
INSERT INTO recensione(stato_recensione, testo, stelle, giorno, ora, pubblicazione_isbn, utente_matricola) values(1, 'recensione numero tre', 2, '2116/08/05', '02:12:32', 7198090073652, 707287);
INSERT INTO recensione(stato_recensione, testo, stelle, giorno, ora, pubblicazione_isbn, utente_matricola) values(0, 'recensione numero quattro', 0, '2025/05/11', '21:12:21', 1408892618492, 461442);
INSERT INTO recensione(stato_recensione, testo, stelle, giorno, ora, pubblicazione_isbn, utente_matricola) values(1, 'recensione numero cinque', 3, '2045/04/05', '22:32:21', 5763622736558, 221919);

INSERT INTO utente_bannato(utente_matricola, motivazione, giorno, ora) values( 181020, 'motivazione del ban', '2075/03/28', '21:21:00');

INSERT INTO storia(azione, time_stamp, utente_matricola, pubblicazione_isbn) values( 'aggiungere', CURRENT_TIMESTAMP(), 461442, 9977757714223);
INSERT INTO storia(azione, time_stamp, utente_matricola, pubblicazione_isbn) values( 'eliminare', CURRENT_TIMESTAMP(), 181020, 9977757714223);
INSERT INTO storia(azione, time_stamp, utente_matricola, pubblicazione_isbn) values( 'aggiungere', CURRENT_TIMESTAMP(), 461442, 4734401332680);
INSERT INTO storia(azione, time_stamp, utente_matricola, pubblicazione_isbn) values( 'aggiungere', CURRENT_TIMESTAMP(), 864293, 7198090073652);
INSERT INTO storia(azione, time_stamp, utente_matricola, pubblicazione_isbn) values( 'aggiungere', CURRENT_TIMESTAMP(), 221919, 1408892618492);
INSERT INTO storia(azione, time_stamp, utente_matricola, pubblicazione_isbn) values( 'modificare', CURRENT_TIMESTAMP(), 461442, 4734401332680);

INSERT INTO autore(nome, cognome) values('Emily', 'Peters');
INSERT INTO autore(nome, cognome) values('Leah', 'Sharp');
INSERT INTO autore(nome, cognome) values('Cecilia', 'Jacobs');
INSERT INTO autore(nome, cognome) values('Jessie', 'Houston');
INSERT INTO autore(nome, cognome) values('Beatrice', 'Gill');

INSERT INTO parola_chiave(parola) values('ereditarietà');
INSERT INTO parola_chiave(parola) values('classi');
INSERT INTO parola_chiave(parola) values('linguaggio');
INSERT INTO parola_chiave(parola) values('automa');

INSERT INTO contenere(parola_chiave, pubblicazione_isbn) values('ereditarietà', 9977757714223);
INSERT INTO contenere(parola_chiave, pubblicazione_isbn) values('classi', 9977757714223);
INSERT INTO contenere(parola_chiave, pubblicazione_isbn) values('linguaggio', 7198090073652);
INSERT INTO contenere(parola_chiave, pubblicazione_isbn) values('classi', 1408892618492);
INSERT INTO contenere(parola_chiave, pubblicazione_isbn) values('classi', 5763622736558);

INSERT INTO aggiornare(pubblicazione_isbn, riedizione_isbn) values( 9977757714223, 4734401332680);
INSERT INTO aggiornare(pubblicazione_isbn, riedizione_isbn) values( 4734401332680, 1408892618492);

INSERT INTO appartenere(materia_nome, pubblicazione_isbn) values( 'informatica', 9977757714223);
INSERT INTO appartenere(materia_nome, pubblicazione_isbn) values( 'informatica', 4734401332680);
INSERT INTO appartenere(materia_nome, pubblicazione_isbn) values( 'biologia', 7198090073652);
INSERT INTO appartenere(materia_nome, pubblicazione_isbn) values( 'fisica', 1408892618492);
INSERT INTO appartenere(materia_nome, pubblicazione_isbn) values( 'matematica', 5763622736558);

INSERT INTO noje(pubblicazione_isbn, utente_matricola, giorno, ora) values( 5763622736558, 181020, '2069/10/10' , '11:22:33');
INSERT INTO noje(pubblicazione_isbn, utente_matricola, giorno, ora) values( 1408892618492, 181020, '2091/03/30' , '22:11:34');
INSERT INTO noje(pubblicazione_isbn, utente_matricola, giorno, ora) values( 1408892618492, 864293, '2050/11/12' , '12:23:43');
INSERT INTO noje(pubblicazione_isbn, utente_matricola, giorno, ora) values( 9977757714223, 221919, '2086/12/06' , '21:21:32');
INSERT INTO noje(pubblicazione_isbn, utente_matricola, giorno, ora) values( 7198090073652, 461442, '2067/12/06' , '01:23:21');

INSERT INTO scrivere(autore_id, pubblicazione_isbn) values(1, 9977757714223);
INSERT INTO scrivere(autore_id, pubblicazione_isbn) values(2, 7198090073652);
INSERT INTO scrivere(autore_id, pubblicazione_isbn) values(2, 9977757714223);
INSERT INTO scrivere(autore_id, pubblicazione_isbn) values(3, 1408892618492);
INSERT INTO scrivere(autore_id, pubblicazione_isbn) values(3, 5763622736558);
INSERT INTO scrivere(autore_id, pubblicazione_isbn) values(4, 1408892618492);
INSERT INTO scrivere(autore_id, pubblicazione_isbn) values(4, 9977757714223);

INSERT INTO commento(testo, giorno, ora, recensione_id, utente_matricola) values("commento 1", CURDATE(), NOW(), 1, 221919);
INSERT INTO commento(testo, giorno, ora, recensione_id, utente_matricola) values("commento 2", CURDATE(), NOW(), 1, 221919);
INSERT INTO commento(testo, giorno, ora, recensione_id, utente_matricola) values("commento 3", CURDATE(), NOW(), 3, 707287);
INSERT INTO commento(testo, giorno, ora, recensione_id, utente_matricola) values("commento 4", CURDATE(), NOW(), 5, 181020);
INSERT INTO commento(testo, giorno, ora, recensione_id, utente_matricola) values("commento 5", CURDATE(), NOW(), 4, 461442);
