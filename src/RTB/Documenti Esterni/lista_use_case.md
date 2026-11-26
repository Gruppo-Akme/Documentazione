# Lista completa dei Casi d'Uso — SmartDashboard

Elenco completo di **152 casi d'uso principali** (con relativi sottocasi) individuati a partire dal capitolato d'appalto **C7 — SmartDashboard (Ergon Informatica S.r.l.)** e aggiornati secondo le decisioni emerse nel **Verbale esterno 16/11/2026** (`src/RTB/Verbali Esterni/2026-11-16.typ`), strutturato per attore principale sul modello di `AnalisiDeiRequisiti.pdf`.

### Principali adeguamenti dal Verbale Esterno 16/11/2026
- **Separazione dei ruoli su tre livelli**: *Visualizzatore (Viewer)*, *Creatore (Editor)* e *Amministratore di Sistema*, con *Utente autenticato* come generalizzazione per le azioni comuni.
- **Target e dominio**: aziende italiane (nessun requisito multilingua) del settore *food & beverage*, con focus su aree **Amministrativa**, **Commerciale** (vendite e margini) e **Logistica/Magazzino** (spedizioni, tempi di sosta/percorrenza, stato magazzino).
- **Flusso Assistente AI per i widget**: l'assistente mostra un'anteprima in chat e, previa conferma dell'utente (*Creatore*), aggiunge direttamente il widget alla dashboard senza richiedere *drag & drop* manuale.
- **Gestione richieste ambigue AI**: in presenza di prompt generici o incompleti, l'assistente non applica filtri arbitrari ma pone domande di chiarimento all'utente.
- **Funzionalità Amministratore**: inclusi esplicitamente il **reset delle password** degli utenti e la **configurazione sicura delle chiavi API** per il layer AI.

> I casi d'uso contrassegnati con **[Già presente]** corrispondono ai primi 10 casi d'uso già inseriti in `Analisi dei Requisiti.typ`.

---

## 1. Sistema Web App — Attore principale: Utente non autenticato

- **UC1 — Autenticazione utente** *(Già presente)*: L'utente non autenticato accede alla piattaforma inserendo le proprie credenziali per avviare una sessione autenticata con il proprio ruolo (*Visualizzatore*, *Creatore* o *Amministratore*).
  - **UC1.1 — Inserimento identificativo (email/username)**: L'utente inserisce l'indirizzo email o il nome utente associato al proprio account.
  - **UC1.2 — Inserimento password**: L'utente inserisce la propria password di accesso.
- **UC2 — Autenticazione non riuscita** *(Già presente)*: Il sistema rifiuta l'accesso e mostra un messaggio di errore quando le credenziali inserite sono errate o inesistenti.
- **UC3 — Accesso con account sospeso**: Il sistema impedisce l'accesso e notifica l'utente se l'account risulta temporaneamente sospeso dall'amministratore.
- **UC4 — Autenticazione a due fattori (2FA)**: L'utente completa l'accesso inserendo il codice di verifica temporaneo inviato dal sistema.
- **UC5 — Codice 2FA errato**: Il sistema rifiuta l'autenticazione e mostra un errore se il codice 2FA inserito non corrisponde a quello generato.
- **UC6 — Codice 2FA scaduto**: Il sistema segnala la scadenza del codice di verifica 2FA invitando a richiederne uno nuovo.
- **UC7 — Re-invio codice 2FA**: L'utente richiede l'invio di un nuovo codice 2FA qualora il precedente non sia arrivato o sia scaduto.
- **UC8 — Impostazione prima password**: L'utente neo-registrato imposta la propria password iniziale tramite il link ricevuto via email.
  - **UC8.1 — Inserimento nuova password**: L'utente digita la nuova password scelta.
  - **UC8.2 — Conferma nuova password**: L'utente reinserisce la password per verificarne la corrispondenza.
- **UC9 — Richiesta recupero password dimenticata**: L'utente richiede l'invio di un'email con il link per reimpostare la password smarrita (o contatta l'amministratore per il reset).
  - **UC9.1 — Inserimento email per recupero**: L'utente specifica l'indirizzo email associato al proprio account.
- **UC10 — Email non associata ad alcun account**: Il sistema segnala che l'indirizzo email inserito per il recupero password non corrisponde ad alcun utente registrato.
- **UC11 — Reimpostazione password dimenticata**: L'utente imposta una nuova password accedendo tramite il link temporaneo ricevuto via email.
  - **UC11.1 — Inserimento nuova password di ripristino**: L'utente inserisce la nuova password desiderata.
  - **UC11.2 — Conferma nuova password di ripristino**: L'utente conferma la nuova password inserita.
- **UC12 — Password non coincidenti**: Il sistema mostra un errore se la nuova password e il campo di conferma non corrispondono.
- **UC13 — Password non conforme ai criteri di sicurezza**: Il sistema mostra un errore se la password inserita non rispetta i requisiti minimi di complessità.
- **UC14 — Link di impostazione/reimpostazione password scaduto**: Il sistema blocca l'operazione e informa l'utente se il token temporaneo contenuto nel link è scaduto.
- **UC15 — Sessione scaduta o token non valido**: Il sistema disconnette automaticamente l'utente alla scadenza della sessione e lo reindirizza alla pagina di login.

---

## 2. Sistema Web App — Attore principale: Utente autenticato (comune a Visualizzatore, Creatore, Amministratore)

- **UC16 — Disconnessione (Logout)** *(corrisponde a UC3 già presente)*: L'utente autenticato termina la propria sessione di lavoro invalidando il token attivo.
- **UC17 — Modifica password**: L'utente autenticato aggiorna la propria password dall'area profilo.
  - **UC17.1 — Inserimento vecchia password**: L'utente inserisce la password attuale per confermare la propria identità.
- **UC18 — Vecchia password non corretta**: Il sistema annulla la modifica e mostra un errore se la password attuale inserita non è corretta.
- **UC19 — Visualizzazione profilo utente**: L'utente consulta i propri dati di profilo, il ruolo assegnato (*Visualizzatore*, *Creatore* o *Amministratore*) e le preferenze salvate.
- **UC20 — Selezione tema dell'interfaccia (Chiaro/Scuro)** *(corrisponde a UC4 già presente)*: L'utente sceglie tra tema chiaro (*light*) e tema scuro (*dark*) con salvataggio lato server della preferenza.

---

## 3. Sistema Web App — Attore principale: Visualizzatore (Viewer)

> Il *Visualizzatore* dispone dei permessi di sola consultazione delle dashboard, esplorazione dati, filtraggio, esportazione e interrogazione in sola lettura dell'assistente AI. Anche *Creatore* e *Amministratore* ereditano tali capacità di consultazione.

- **UC21 — Consultazione lista delle dashboard accessibili** *(corrisponde a UC5 già presente)*: L'utente visualizza l'elenco delle dashboard salvate accessibili al proprio profilo.
- **UC22 — Visualizzazione singola dashboard in lista**: L'utente legge le informazioni sintetiche di ciascuna dashboard nell'elenco.
  - **UC22.1 — Visualizzazione titolo dashboard**: Il sistema mostra il nome identificativo della dashboard.
  - **UC22.2 — Visualizzazione data ultimo aggiornamento**: Il sistema mostra data e ora dell'ultima modifica salvata.
  - **UC22.3 — Visualizzazione numero widget contenuti**: Il sistema mostra il conteggio dei widget configurati nella dashboard.
- **UC23 — Ricerca dashboard per titolo**: L'utente filtra l'elenco delle dashboard digitando una parola chiave.
- **UC24 — Ordinamento lista dashboard**: L'utente ordina l'elenco delle dashboard per titolo o per data di ultimo aggiornamento.
- **UC25 — Visualizzazione stato lista dashboard vuota**: Il sistema mostra un messaggio informativo se non sono ancora disponibili dashboard da consultare.
- **UC26 — Visualizzazione dashboard in modalità consultazione** *(corrisponde a UC6 già presente)*: L'utente apre una dashboard in sola lettura visualizzando tutti i widget popolati dal Data Warehouse (es. vendite, margini, spedizioni, stato magazzino).
- **UC27 — Consultazione dashboard da dispositivo mobile**: L'utente accede da smartphone o tablet alla versione mobile dedicata alla sola consultazione delle dashboard salvate.
- **UC28 — Aggiornamento manuale dati dashboard (Refresh)**: L'utente richiede il ricaricamento immediato dei dati della dashboard corrente dal Data Warehouse.
- **UC29 — Visualizzazione widget Scheda KPI**: L'utente legge su una scheda KPI l'indicatore di sintesi principale (es. fatturato totale, ordini evasi, tempi medi di consegna).
  - **UC29.1 — Visualizzazione valore sintetico KPI**: Il sistema mostra il valore aggregato formattato.
  - **UC29.2 — Visualizzazione variazione rispetto al periodo precedente**: Il sistema mostra lo scostamento percentuale positivo o negativo rispetto al periodo di confronto.
- **UC30 — Visualizzazione widget Grafico a barre**: L'utente visualizza dati categorici o temporali confrontati tramite grafico a barre.
  - **UC30.1 — Ispezione valori tramite tooltip su grafico a barre**: L'utente passa il cursore sulle barre per leggere i valori esatti.
- **UC31 — Visualizzazione widget Grafico a linee**: L'utente visualizza l'andamento temporale di una o più serie di dati (es. fatturato mensile, tempi di percorrenza) tramite grafico a linee.
  - **UC31.1 — Ispezione punti temporali tramite tooltip**: L'utente legge il valore puntuale di ciascun istante temporale sul grafico.
- **UC32 — Visualizzazione widget Grafico a torta**: L'utente visualizza la ripartizione percentuale di una misura per categoria tramite grafico a torta o ad anello.
  - **UC32.1 — Visualizzazione legenda e percentuali**: L'utente consulta le etichette di categoria e il peso percentuale di ogni fetta.
- **UC33 — Visualizzazione widget Indicatore a quadrante (Gauge)**: L'utente visualizza il livello di raggiungimento di un obiettivo rispetto a soglie configurate.
- **UC34 — Visualizzazione widget Tabella standard**: L'utente consulta i dati analitici in forma tabellare.
  - **UC34.1 — Ordinamento colonne tabella**: L'utente ordina le righe in senso crescente o decrescente cliccando sull'intestazione di colonna.
  - **UC34.2 — Paginazione tabella**: L'utente naviga tra le pagine dei record restituiti nella tabella.
- **UC35 — Visualizzazione widget Tabella pivot**: L'utente consulta aggregazioni multidimensionali incrociate su righe e colonne.
  - **UC35.1 — Espansione e compressione livelli pivot**: L'utente espande o comprime i raggruppamenti gerarchici nella tabella pivot.
- **UC36 — Visualizzazione widget Mappa geografica**: L'utente visualizza la distribuzione territoriale dei dati (regioni, province o aree di consegna) su mappa interattiva.
  - **UC36.1 — Ispezione area geografica su mappa**: L'utente visualizza i valori associati a una specifica area tramite tooltip o selezione.
- **UC37 — Visualizzazione widget a schermo intero (Focus)**: L'utente espande temporaneamente un singolo widget a tutto schermo per osservarne i dettagli.
- **UC38 — Errore caricamento dati di un widget**: Il sistema mostra un messaggio di errore circoscritto al singolo widget se l'interrogazione fallisce, senza bloccare il resto della dashboard.
- **UC39 — Applicazione filtri trasversali alla dashboard** *(corrisponde a UC7 già presente)*: L'utente applica filtri globali che aggiornano dinamicamente tutti i widget compatibili della dashboard.
- **UC40 — Filtro trasversale per intervallo temporale**: L'utente seleziona un periodo di analisi (es. anno, trimestre, mese o date personalizzate).
- **UC41 — Intervallo temporale non valido**: Il sistema segnala un errore se la data di inizio selezionata è successiva alla data di fine.
- **UC42 — Filtro trasversale per area geografica**: L'utente filtra tutti i widget della dashboard per area geografica, regione o provincia.
- **UC43 — Filtro trasversale per linea di prodotto**: L'utente filtra tutti i widget per linea o categoria di prodotto (es. linee *food & beverage*).
- **UC44 — Filtro trasversale per agente o vettore logistico**: L'utente filtra i dati commerciali o di consegna per singolo agente, cliente o vettore.
- **UC45 — Combinazione multipla di filtri trasversali**: L'utente applica contemporaneamente più criteri di filtro incrociati (es. periodo + area + linea prodotto).
- **UC46 — Rimozione singolo filtro trasversale**: L'utente disattiva un singolo criterio di filtro mantenendo attivi gli altri.
- **UC47 — Reset completo dei filtri trasversali**: L'utente ripristina tutti i filtri della dashboard ai valori predefiniti.
- **UC48 — Nessun dato disponibile per i filtri selezionati**: Il sistema mostra uno stato informativo nei widget quando la combinazione di filtri non restituisce record.
- **UC49 — Esplorazione dei dati tramite drill-down** *(corrisponde a UC8 già presente)*: L'utente interagisce con un elemento di un widget per scendere a un livello di dettaglio gerarchico inferiore.
- **UC50 — Risalita gerarchica tramite drill-up**: L'utente risale al livello di aggregazione precedente dopo aver eseguito un *drill-down*.
- **UC51 — Esportazione dashboard in PDF**: L'utente esporta e scarica la dashboard corrente in formato PDF mantenendo layout e visualizzazioni.
- **UC52 — Esportazione dati dashboard in Excel**: L'utente esporta i dati sottostanti ai widget della dashboard in un file `.xlsx`.
- **UC53 — Esportazione dati singolo widget**: L'utente esporta in Excel o CSV i dati specifici di un singolo widget (es. tabella o grafico).
- **UC54 — Errore durante l'esportazione**: Il sistema notifica l'utente qualora la generazione del file PDF o Excel non vada a buon fine.
- **UC55 — Visualizzazione data ultimo aggiornamento Data Warehouse**: L'utente legge nell'intestazione della dashboard il timestamp dell'ultima sincronizzazione dei dati dall'ERP.
- **UC56 — Visualizzazione stato vuoto su widget privo di dati**: Il sistema mostra un avviso grafico pulito quando un widget configurato non ha ancora dati disponibili.
- **UC57 — Salvataggio combinazione filtri preferita**: L'utente salva una combinazione ricorrente di filtri trasversali per uso personale.
- **UC58 — Applicazione combinazione filtri salvata**: L'utente richiama con un clic una combinazione di filtri precedentemente salvata.
- **UC59 — Consultazione insight automatici sulla dashboard**: Il *Visualizzatore* legge nel riquadro dedicato i riassunti narrativi su anomalie, scostamenti, tendenze e stagionalità generati dall'AI.
- **UC60 — Richiesta spiegazione contestuale su un KPI o grafico**: Il *Visualizzatore* chiede all'assistente AI il perché di un fenomeno osservato su un indicatore o grafico in consultazione senza modificare la dashboard.

---

## 4. Sistema Web App — Attore principale: Creatore (Editor)

> Il *Creatore* è l'utente di business (direzione commerciale, controllo di gestione, responsabile logistica/magazzino) abilitato oltre che alla consultazione anche alla creazione, modifica ed eliminazione delle dashboard e all'inserimento automatico di widget tramite l'Assistente AI.

### 4.1. Costruzione Self-Service delle Dashboard

- **UC61 — Creazione di una nuova dashboard self-service** *(corrisponde a UC9 già presente)*: Il *Creatore* inizializza una nuova dashboard vuota accedendo all'editor *drag & drop*.
  - **UC61.1 — Inserimento titolo dashboard**: Il *Creatore* assegna un nome identificativo alla nuova dashboard.
- **UC62 — Titolo dashboard non valido o vuoto**: Il sistema impedisce la creazione o il salvataggio se il titolo della dashboard è mancante o non valido.
- **UC63 — Passaggio alla modalità costruzione (Edit)**: Il *Creatore* apre una dashboard esistente in modalità modifica per alterarne layout o widget.
- **UC64 — Rinomina dashboard**: Il *Creatore* modifica il titolo di una dashboard esistente.
- **UC65 — Duplicazione dashboard esistente**: Il *Creatore* crea una copia indipendente di una dashboard salvata per personalizzarla.
- **UC66 — Eliminazione dashboard**: Il *Creatore* elimina definitivamente una propria dashboard salvata.
  - **UC66.1 — Conferma eliminazione dashboard**: Il sistema richiede conferma esplicita prima di rimuovere la dashboard dal server.
- **UC67 — Composizione e personalizzazione widget tramite drag & drop** *(corrisponde a UC10 già presente)*: Il *Creatore* trascina widget dalla libreria sulla griglia reattiva e ne configura dati e aspetto.
- **UC68 — Consultazione libreria dei widget**: Il *Creatore* esplora il catalogo dei widget disponibili nel pannello laterale dell'editor.
- **UC69 — Ricerca o filtraggio widget nella libreria**: Il *Creatore* cerca o filtra per tipologia i widget presenti nella libreria.
- **UC70 — Aggiunta widget tramite drag & drop sul canvas**: Il *Creatore* trascina un widget dalla libreria nell'area di rilascio della griglia reattiva.
- **UC71 — Riposizionamento widget sulla griglia**: Il *Creatore* sposta un widget già presente sul canvas in una diversa posizione della griglia.
- **UC72 — Ridimensionamento widget sulla griglia**: Il *Creatore* ridimensiona larghezza e altezza di un widget adattandolo al layout responsive.
- **UC73 — Adattamento automatico layout su griglia reattiva**: Il sistema ricalcola automaticamente il posizionamento dei widget adiacenti in caso di spostamento o cambio risoluzione.
- **UC74 — Selezione tabella/cubo dati dal catalogo metadati**: Il *Creatore* sceglie la sorgente logica del Data Warehouse (es. vendite, ordini, spedizioni, magazzino) da associare al widget.
- **UC75 — Configurazione metriche e funzioni di aggregazione**: Il *Creatore* seleziona le misure numeriche (es. fatturato netto, margine, tempi di sosta) e la relativa aggregazione.
- **UC76 — Configurazione dimensioni di raggruppamento**: Il *Creatore* seleziona le dimensioni analitiche (es. mese, regione, articolo, agente) per gli assi o le categorie del widget.
- **UC77 — Configurazione filtri locali del widget**: Il *Creatore* imposta condizioni di filtro specifiche valide solo per il widget selezionato.
- **UC78 — Personalizzazione titolo e descrizione del widget**: Il *Creatore* modifica l'intestazione e l'eventuale sottotitolo esplicativo del widget.
- **UC79 — Personalizzazione stile e formattazione widget**: Il *Creatore* configura colori, unità di misura (valuta, percentuale, ore/giorni), decimali e soglie visive.
- **UC80 — Configurazione confronto temporale su scheda KPI**: Il *Creatore* abilita e configura il calcolo della variazione rispetto al periodo precedente sulla scheda KPI.
- **UC81 — Configurazione righe, colonne e valori per tabella pivot**: Il *Creatore* associa le dimensioni a righe/colonne e le metriche alle celle della tabella pivot.
- **UC82 — Configurazione livello geografico per mappa**: Il *Creatore* imposta la granularità territoriale (nazione, regione, provincia) per il widget mappa.
- **UC83 — Duplicazione widget sul canvas**: Il *Creatore* clona un widget già configurato all'interno della stessa dashboard.
- **UC84 — Rimozione widget dal canvas**: Il *Creatore* elimina un widget dalla griglia durante la modifica della dashboard.
- **UC85 — Anteprima dashboard in costruzione**: Il *Creatore* passa temporaneamente alla vista *Anteprima* per verificare la resa grafica e interattiva della dashboard prima del salvataggio.
- **UC86 — Salvataggio configurazione dashboard lato server**: Il *Creatore* salva sul server layout, dimensioni, posizioni e configurazioni di tutti i widget della dashboard.
- **UC87 — Annullamento modifiche non salvate**: Il *Creatore* scarta le modifiche effettuate nella sessione di editing corrente ripristinando l'ultima versione salvata.
- **UC88 — Avviso di uscita con modifiche non salvate**: Il sistema chiede conferma all'utente se tenta di abbandonare l'editor in presenza di modifiche non salvate.

### 4.2. Assistente AI (Generazione automatica widget, Disambiguazione, Insight e Designer)

- **UC89 — Apertura pannello conversazionale Assistente AI**: L'utente apre il pannello laterale di chat dell'Assistente AI dalla dashboard.
- **UC90 — Chiusura pannello conversazionale Assistente AI**: L'utente chiude o comprime il pannello dell'Assistente AI per liberare spazio sul canvas.
- **UC91 — Consultazione storico messaggi della chat AI**: L'utente scorre le richieste inviate e le risposte ricevute nella sessione conversazionale corrente.
- **UC92 — Azzeramento contesto conversazione AI**: L'utente avvia una nuova chat per interrogare l'assistente senza il contesto delle domande precedenti.
- **UC93 — Generazione visualizzazione da linguaggio naturale**: Il *Creatore* descrive a parole il dato o grafico desiderato (evitando query SQL manuali) e ottiene una proposta di widget in chat.
- **UC94 — Invio prompt in linguaggio naturale**: L'utente digita e invia una richiesta testuale nell'apposito campo della chat AI.
- **UC95 — Visualizzazione anteprima widget generato dall'AI in chat**: L'assistente mostra all'interno della chat l'anteprima interattiva del widget generato dai dati del Data Warehouse.
- **UC96 — Conferma e inserimento automatico widget nella dashboard via AI**: Previa conferma esplicita dell'utente sull'anteprima in chat, l'agente AI aggiunge direttamente il widget nella dashboard senza richiedere *drag & drop* manuale.
- **UC97 — Raffinamento iterativo del widget tramite chat**: L'utente chiede all'assistente di modificare l'anteprima proposta prima di confermarne l'inserimento (es. *"Cambialo in grafico a linee"* o *"Limita al settore food"*).
- **UC98 — Rifiuto o scarto dell'anteprima widget proposta dall'AI**: L'utente rifiuta l'anteprima generata in chat evitando l'inserimento nella dashboard.
- **UC99 — Rilevamento richiesta AI ambigua o incompleta**: In presenza di prompt generici (es. *"mostrami le vendite"*), l'assistente evita di applicare filtri arbitrari e segnala la necessità di ulteriori dettagli.
- **UC100 — Richiesta di chiarimento da parte dell'Assistente AI**: L'assistente pone domande mirate all'utente (es. su periodo, dimensione o metrica) per circoscrivere esattamente il dato desiderato.
- **UC101 — Risposta dell'utente alle domande di chiarimento AI**: L'utente fornisce i dettagli richiesti dall'assistente per consentire la generazione accurata dell'anteprima.
- **UC102 — Richiesta AI su dati non disponibili nel modello**: Il sistema informa l'utente che le metriche o dimensioni richieste non esistono nel Data Warehouse.
- **UC103 — Rilevamento automatico anomalie e scostamenti (Insight)**: Il sistema evidenzia nei testi degli insight anomalie rilevanti o scostamenti significativi nei dati visualizzati (es. picchi di ritardo consegne o cali di margine).
- **UC104 — Rilevamento automatico tendenze e stagionalità (Insight)**: Il sistema sintetizza nei testi degli insight trend di crescita/calo e pattern stagionali individuati.
- **UC105 — Aggiornamento insight automatici al cambio dei filtri**: Il layer AI ricalcola gli insight automatici quando l'utente modifica i filtri trasversali della dashboard.
- **UC106 — Analisi contesto dashboard da parte dell'Assistente Designer**: L'assistente esamina i widget già presenti sulla dashboard e i metadati delle sorgenti per individuare visualizzazioni complementari utili.
- **UC107 — Proposta proattiva di widget pertinenti (Designer)**: L'assistente designer mostra un suggerimento in chat proponendo l'aggiunta automatica di un nuovo widget correlato.
- **UC108 — Accettazione suggerimento dell'Assistente Designer**: Previa conferma del *Creatore*, l'assistente inserisce automaticamente il widget suggerito nella dashboard.
- **UC109 — Rifiuto suggerimento dell'Assistente Designer**: Il *Creatore* declina la proposta dell'assistente designer.
- **UC110 — Gestione errore o timeout del servizio LLM**: Il sistema mostra un messaggio di errore chiaro e non bloccante se l'API del modello linguistico non è raggiungibile o non supera i controlli di coerenza.

---

## 5. Sistema Web App — Attore principale: Amministratore di Sistema (Tecnico IT)

### 5.1. Gestione Utenze, Ruoli e Sicurezza

- **UC111 — Visualizzazione dashboard amministrativa**: L'amministratore accede alla vista di sintesi sullo stato di sistema, utenti attivi, sorgenti dati, chiavi API ed esecuzioni ETL.
- **UC112 — Visualizzazione lista utenti**: L'amministratore consulta l'elenco di tutti gli utenti registrati nella piattaforma.
- **UC113 — Visualizzazione singolo utente in lista**: L'amministratore legge i dettagli sintetici di ciascun utente in elenco.
  - **UC113.1 — Visualizzazione email utente**: Il sistema mostra l'indirizzo email dell'utente.
  - **UC113.2 — Visualizzazione ruolo utente**: Il sistema mostra il ruolo assegnato (*Visualizzatore*, *Creatore* o *Amministratore*).
  - **UC113.3 — Visualizzazione stato account**: Il sistema mostra lo stato dell'account (*attivo* o *sospeso*).
- **UC114 — Ricerca e filtraggio lista utenti**: L'amministratore filtra gli utenti per email, ruolo o stato.
- **UC115 — Creazione nuovo account utente**: L'amministratore registra un nuovo utente nel sistema inviandogli l'email di impostazione password.
  - **UC115.1 — Inserimento email nuovo utente**: L'amministratore inserisce l'indirizzo email del nuovo account.
  - **UC115.2 — Assegnazione ruolo nuovo utente**: L'amministratore seleziona il ruolo da attribuire (*Visualizzatore*, *Creatore* o *Amministratore*).
- **UC116 — Email già utilizzata in creazione utente**: Il sistema blocca la registrazione e segnala che l'email inserita appartiene già a un altro account.
- **UC117 — Modifica ruolo e permessi utente**: L'amministratore promuove o modifica il ruolo di un utente registrato tra i tre livelli previsti.
- **UC118 — Reset password utente da parte dell'Amministratore**: L'amministratore avvia il ripristino della password di un utente (inviando un link di reimpostazione o generando una password temporanea).
  - **UC118.1 — Conferma reset password utente**: L'amministratore conferma l'operazione di reset della password per l'account selezionato.
- **UC119 — Sospensione account utente**: L'amministratore disabilita temporaneamente l'accesso di un utente.
  - **UC119.1 — Conferma sospensione utente**: L'amministratore conferma la sospensione dell'account selezionato.
- **UC120 — Riattivazione account utente**: L'amministratore riabilita un account precedentemente sospeso.
  - **UC120.1 — Conferma riattivazione utente**: L'amministratore conferma la riattivazione dell'account.
- **UC121 — Eliminazione account utente**: L'amministratore rimuove definitivamente un account dal sistema.
  - **UC121.1 — Conferma eliminazione utente**: L'amministratore conferma l'eliminazione definitiva dell'utente.

### 5.2. Configurazione Chiavi API AI, Sorgenti Dati, ETL e Audit

- **UC122 — Configurazione chiavi API per l'Intelligenza Artificiale**: L'amministratore inserisce, aggiorna o ruota in sicurezza le chiavi API del provider LLM commerciale (es. OpenAI/Anthropic) senza esporle lato client o nel repository.
- **UC123 — Test connettività API Layer AI**: L'amministratore verifica che la chiave API configurata e il servizio LLM rispondano correttamente.
- **UC124 — Errore o chiave API AI non valida**: Il sistema notifica l'amministratore se la chiave API inserita è scaduta, errata o priva di quota.
- **UC125 — Configurazione parametri operativi Layer AI**: L'amministratore imposta modello LLM selezionato, timeout delle richieste e limiti di utilizzo.
- **UC126 — Configurazione connessione al Gestionale ERP**: L'amministratore inserisce o modifica i parametri del connettore ODBC o del middleware JSON verso l'ERP aziendale.
- **UC127 — Test connessione al Gestionale ERP**: L'amministratore verifica in tempo reale la raggiungibilità e l'autenticazione verso il gestionale ERP.
- **UC128 — Errore di connessione al Gestionale ERP**: Il sistema mostra i dettagli diagnostici se il test di connessione all'ERP fallisce.
- **UC129 — Configurazione database relazionale di servizio (Raw Data Store)**: L'amministratore configura i parametri di accesso al database relazionale (es. PostgreSQL).
- **UC130 — Selezione e configurazione motore analitico (Supporto Multi-Database)**: L'amministratore configura il motore analitico del Data Warehouse tramite sorgente *pluggable* (DuckDB predefinito o database alternativi supportati).
- **UC131 — Test connessione al Data Warehouse**: L'amministratore verifica il corretto funzionamento della connessione al motore analitico selezionato.
- **UC132 — Visualizzazione catalogo metadati dello Star Schema**: L'amministratore consulta tabelle dei fatti, dimensioni e colonne esposte dal Data Warehouse.
- **UC133 — Aggiornamento catalogo metadati per il layer AI**: L'amministratore aggiorna descrizioni semantiche di tabelle e campi (vendite, ordini, logistica, magazzino) per migliorare l'accuratezza delle risposte AI.
- **UC134 — Configurazione pianificazione automatica ETL**: L'amministratore imposta la frequenza o la schedulazione dei flussi di ingestione e trasformazione dati.
- **UC135 — Avvio manuale pipeline ETL**: L'amministratore lancia immediatamente l'esecuzione della pipeline ETL su richiesta.
- **UC136 — Visualizzazione storico esecuzioni ETL**: L'amministratore consulta l'elenco cronologico delle esecuzioni ETL effettuate.
- **UC137 — Visualizzazione dettagli singola esecuzione ETL**: L'amministratore ispeziona i dati di un singolo job ETL.
  - **UC137.1 — Visualizzazione timestamp avvio e fine ETL**: Il sistema mostra orario di inizio e completamento del job.
  - **UC137.2 — Visualizzazione esito esecuzione ETL**: Il sistema mostra lo stato (*completato*, *in corso*, *fallito*).
  - **UC137.3 — Visualizzazione numero record elaborati**: Il sistema mostra quanti record sono stati estratti, trasformati e caricati.
- **UC138 — Visualizzazione log errori ETL**: L'amministratore legge il dettaglio degli errori verificatisi durante una pipeline ETL fallita.
- **UC139 — Visualizzazione lista audit log di sistema**: L'amministratore consulta il registro delle azioni rilevanti eseguite dagli utenti sulla piattaforma.
- **UC140 — Filtraggio audit log**: L'amministratore filtra gli audit log per utente, tipologia di operazione o intervallo temporale.
- **UC141 — Esportazione audit log**: L'amministratore scarica gli audit log filtrati in un file testuale o CSV.
- **UC142 — Monitoraggio utilizzo API e Layer AI**: L'amministratore visualizza statistiche su tempi di risposta delle API backend (es. FastAPI) e numero di interrogazioni elaborate dall'assistente AI.

---

## 6. Pipeline Dati e Backend — Attori di Sistema (Gestionale ERP / Sistema Interno)

- **UC143 — Estrazione dati grezzi da Gestionale ERP via ODBC**: Il connettore di ingestione legge periodicamente i dati operativi (ordini, vendite, spedizioni, tempi di sosta/percorrenza, magazzino) dal gestionale aziendale tramite driver ODBC.
- **UC144 — Ricezione dati grezzi da Gestionale ERP via middleware JSON**: Il livello di ingestione riceve flussi di dati strutturati in formato JSON da un middleware interposto con l'ERP.
- **UC145 — Storicizzazione fedele nel Raw Data Store**: Il sistema salva e storicizza una copia fedele dei dati grezzi ricevuti nel database relazionale di servizio (es. PostgreSQL) mantenendo traccia di quanto arrivato dall'ERP.
- **UC146 — Gestione fallimento acquisizione dati ERP**: Il sistema registra l'errore di connessione o timeout verso l'ERP, interrompe il ciclo corrente in sicurezza e genera un avviso per l'amministratore.
- **UC147 — Avvio pipeline ETL di trasformazione**: Il processo ETL legge i nuovi dati grezzi storicizzati nel *Raw Data Store* secondo la pianificazione o su comando manuale.
- **UC148 — Pulizia, normalizzazione e calcolo campi derivati in ETL**: La pipeline ETL rimuove duplicati, normalizza formati e calcola grandezze derivate dai dati grezzi (es. fatturato netto da fatturato lordo e sconti).
- **UC149 — Popolamento tabelle dimensione e fatti (Star Schema)**: Il processo ETL aggiorna le tabelle dimensionali (clienti, articoli, agenti, tempo) e delle fatti (ordini, vendite, consegne, magazzino) nel Data Warehouse.
- **UC150 — Gestione record anomali o incompleti in ETL**: La pipeline ETL intercetta record privi di chiavi referenziali valide o con tipi errati, li isola in apposito log di scarto e prosegue il caricamento valido.
- **UC151 — Validazione permessi per ruolo e isolamento API REST**: Il backend (es. FastAPI) verifica token, ruolo (*Visualizzatore*, *Creatore*, *Amministratore*) e autorizzazioni su ogni richiesta API REST, eseguendo le query sul motore analitico tramite sorgente *pluggable* senza esporre il database al frontend.
- **UC152 — Traduzione sicura e validazione risposte Layer AI**: Il layer AI elabora i prompt usando esclusivamente metadati autorizzati e verifica la coerenza sintattica e semantica delle query/configurazioni widget generate prima di inviarle all'interfaccia.
