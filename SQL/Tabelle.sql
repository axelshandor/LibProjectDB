
/* Tabelle Entità e Relazioni */

CREATE TABLE utente (                    
    matricola varchar(10), 
    nome varchar(20) NOT NULL,
    cognome varchar(20) NOT NULL,
    email varchar(59) NOT NULL unique,
    password varchar(30) NOT NULL CONSTRAINT password_ck CHECK(char_length(password) > 7),
    n_telefono varchar(10),
    stato_ban boolean default null,      /* null = normale, 0 = soft_ban | 1 = perma_ban */
    n_ban int NOT NULL default 0,
    ultimo_accesso date NOT NULL,
    giorno_iscrizione date NOT NULL,
    n_commenti int NOT NULL default 0 CONSTRAINT n_commenti_ck CHECK(n_commenti >= 0),
    n_recensioni int NOT NULL default 0 CONSTRAINT n_recensioni_ck CHECK(n_recensioni >= 0),
    n_stelle int NOT NULL default 0 CONSTRAINT n_stelle_ck CHECK(n_stelle >= 0),
    n_like int NOT NULL default 0 CONSTRAINT n_like_ck CHECK(n_like >= 0),
    n_pubblicazioni int NOT NULL default 0 CONSTRAINT n_pubblicazioni_ck CHECK(n_pubblicazioni >= 0),
    presentazione text default null,
    stato_presentazione boolean NOT NULL default 0,  /* 0 = non accettata, 1 = accettata */
    livello_utenza boolean default null,   /* null = attivo, 0 = moderatore, 1 = gestore ovviamente se u */
    n_segnalazioni_immotivate int default 0 NOT NULL,
    primary key(matricola)
);

CREATE TABLE pubblicazione (
    isbn varchar(15),
    giorno_pubblicazione date NOT NULL,
    ora_pubblicazione time NOT NULL,
    lingua enum('italiano', 'inglese', 'altro') NOT NULL,
    n_pagine int NOT NULL CONSTRAINT n_pagine_ck CHECK(n_pagine > 0),
    titolo varchar(100) NOT NULL,
    descrizione text,
    indice blob,
    editore varchar(50) NOT NULL,
    stato_pubblicazione boolean NOT NULL default 0,    /* 0 = non accettata, 1 = accettata */
    utente_matricola varchar(10) NOT NULL,
    foreign key(utente_matricola)references utente(matricola),
    primary key(isbn)
);

CREATE TABLE sorgente (
    id int auto_increment,
    uri varchar(2100) NOT NULL,
    tipo enum('immagine', 'download', 'acquisto', 'video', 'altro') NOT NULL,
    formato enum('jpg', 'pdf', 'epub', 'copertina rigida', 'copertina flessibile', 'youtube', 'vimeo', 'altro'),
    descrizione text,
    pubblicazione_isbn varchar(15) NOT NULL,
    foreign key(pubblicazione_isbn)references pubblicazione(isbn),
    primary key(id)
);

CREATE TABLE materia (
    nome varchar(20),
    primary key(nome)
);

CREATE TABLE ristampa (
    id int auto_increment,
    ora time NOT NULL,
    giorno date NOT NULL,
    numero int NOT NULL CONSTRAINT numero_ck CHECK(numero > 0),
    pubblicazione_isbn varchar(15) NOT NULL,
    foreign key(pubblicazione_isbn)references pubblicazione(isbn),
    CONSTRAINT no_duplicati_numero_ristampa UNIQUE(numero, pubblicazione_isbn);
    primary key(id)
); 

CREATE TABLE recensione (
    id int auto_increment,
    stato_recensione boolean NOT NULL default 0,    /* 0 = non accettata, 1 = accettata */
    testo text NOT NULL,
    stelle int NOT NULL CONSTRAINT stelle_ck CHECK(stelle >= 0 and stelle < 6),
    giorno date NOT NULL,
    ora time NOT NULL,
    utente_matricola varchar(10) NOT NULL,
    pubblicazione_isbn varchar(15) NOT NULL,
    foreign key(utente_matricola)references utente(matricola),
    foreign key(pubblicazione_isbn)references pubblicazione(isbn),
    CONSTRAINT una_recensione_per_pubblicazione UNIQUE(utente_matricola, pubblicazione_isbn),
    primary key(id)
);

CREATE TABLE commento (
    id int auto_increment,
    testo text NOT NULL,
    giorno date NOT NULL,
    ora time NOT NULL,
    recensione_id int NOT NULL,
    utente_matricola varchar(10) NOT NULL,
    foreign key(recensione_id)references recensione(id),
    foreign key(utente_matricola)references utente(matricola),
    primary key(id)
);

CREATE TABLE risposta (
    id int auto_increment,
    testo text NOT NULL,
    giorno date NOT NULL,
    ora time NOT NULL,
    commento_id int NOT NULL,
    utente_matricola varchar(10) NOT NULL,
    foreign key(commento_id)references commento(id),
    foreign key(utente_matricola)references utente(matricola),
    primary key(id)
);

CREATE TABLE notifica (
    id int auto_increment, 
    tipo_notifica enum('segnalazione', 'approvazione') NOT NULL,
    tipo_entita enum('commento', 'risposta', 'recensione', 'pubblicazione', 'presentazione') NOT NULL,
    riferimento_entita varchar(50) NOT NULL, /* avrà un formato del tipo "id:{key}" */
    testo text NOT NULL,
    primary key(id)
);

CREATE TABLE utente_bannato (
    utente_matricola varchar(10),
    motivazione text NOT NULL,
    giorno date NOT NULL,
    ora time NOT NULL,
    foreign key(utente_matricola)references utente(matricola),
    primary key(utente_matricola)
);

CREATE TABLE storia (
    id int auto_increment,
    azione enum('aggiungere', 'eliminare', 'modificare') NOT NULL,
    time_stamp timestamp NOT NULL,
    utente_matricola varchar(10) NOT NULL,
    pubblicazione_isbn varchar(15) NOT NULL,
    foreign key(pubblicazione_isbn)references pubblicazione(isbn),
    foreign key(utente_matricola)references utente(matricola),
    primary key(id)
);

CREATE TABLE autore (
    id int auto_increment,
    nome varchar(20) NOT NULL,
    cognome varchar(20) NOT NULL, 
    primary key(id)
);

CREATE TABLE parola_chiave (
    parola varchar(20),
    primary key(parola)
);

CREATE TABLE contenere (
    parola_chiave varchar(20), 
    pubblicazione_isbn varchar(20),
    foreign key (parola_chiave) references parola_chiave(parola),
    foreign key (pubblicazione_isbn) references pubblicazione(isbn),
    primary key (parola_chiave, pubblicazione_isbn)
);

CREATE TABLE scrivere (
    autore_id int,
    pubblicazione_isbn varchar(15),
    foreign key(autore_id)references autore(id),
    foreign key(pubblicazione_isbn)references pubblicazione(isbn),
    primary key(autore_id, pubblicazione_isbn)
);

/* questa scelta è stata fatta per non avere valori nulli */
CREATE TABLE aggiornare (
    pubblicazione_isbn varchar(15) NOT NULL, 
    riedizione_isbn varchar(15) NOT NULL unique,
    foreign key(pubblicazione_isbn)references pubblicazione(isbn),
    foreign key(riedizione_isbn)references pubblicazione(isbn),
    primary key(riedizione_isbn)
);

CREATE TABLE appartenere ( 
    materia_nome varchar(20),
    pubblicazione_isbn varchar(15),
    foreign key(pubblicazione_isbn)references pubblicazione(isbn),
    foreign key(materia_nome)references materia(nome),
    primary key(materia_nome, pubblicazione_isbn)
);

CREATE TABLE apprezzare ( 
    utente_matricola varchar(10),
    recensione_id int,
    stelle int NOT NULL CONSTRAINT stelle_ck2 CHECK(stelle >= 0 and stelle < 6),
    foreign key(recensione_id)references recensione(id),
    foreign key(utente_matricola)references utente(matricola),
    primary key(recensione_id, utente_matricola)
);

CREATE TABLE noje ( 
    pubblicazione_isbn varchar(15),
    utente_matricola varchar(10),
    giorno date NOT NULL,
    ora time NOT NULL,
    foreign key(pubblicazione_isbn)references pubblicazione(isbn),
    foreign key(utente_matricola)references utente(matricola),
    CONSTRAINT un_like_pre_pubblicazione UNIQUE(pubblicazione_isbn, utente_matricola),
    primary key(pubblicazione_isbn, utente_matricola)
);

CREATE TABLE ricevere ( 
    utente_matricola varchar(10),
    notifica_id int,
    giorno date NOT NULL,
    ora time NOT NULL,
    foreign key(utente_matricola)references utente(matricola),
    foreign key(notifica_id)references notifica(id),
    primary key(utente_matricola, notifica_id)
);