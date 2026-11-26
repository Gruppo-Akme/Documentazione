#import "../../Templates/templateDocumentiGenerici.typ": report

#show: report.with(
  titolo: "Analisi dei Requisiti",
  stato: "In verifica",
  versione: "0.1.0",
  tipo-documento: "Documento Esterno",
  registro-modifiche: (
    ("0.1.0", "23/11/2026", "Pietro Giulio Bassi", "DaXin Chen", "Prima stesura del documento: introduzione, casi d'uso e requisiti."),
  ),
)

= Introduzione <cap:introduzione>

== Scopo del documento <sec:scopo_documento>

Il presente documento di *Analisi dei Requisiti* definisce in modo formale, completo e non ambiguo i requisiti funzionali, di qualità e di vincolo del sistema software *SmartDashboard*, sviluppato da *Akme Group* nell'ambito del progetto didattico del corso di Ingegneria del Software (A.A. 2026/2027) e commissionato dall'azienda proponente *Ergon Informatica S.r.l.* secondo il capitolato d'appalto *C7*.

Questo artefatto costituisce il riferimento contrattuale e tecnico per tutte le successive fasi di progettazione architetturale, codifica, verifica e validazione, assicurando la piena aderenza agli obiettivi espressi dal committente e dai referenti aziendali.

Nello specifico, il documento si articola nei seguenti contenuti:
- la descrizione dettagliata dei casi d'uso principali e secondari del sistema, corredati dai relativi diagrammi UML per illustrare le interazioni tra attori e funzionalità;
- la specifica formale dei requisiti individuati, suddivisi per tipologia e classificati per grado di priorità;
- le matrici di tracciamento bidirezionale tra fonti, casi d'uso e requisiti, volte a garantire la copertura completa e verificabile delle specifiche.

In conformità con le indicazioni del capitolato e con le convenzioni fissate nelle *Norme di Progetto*, i requisiti sono classificati secondo tre livelli di priorità:
- *Obbligatori (O)*: requisiti indispensabili per il funzionamento minimo del sistema (MVP#super[G]) e irrinunciabili per il committente;
- *Desiderabili (D)*: requisiti non strettamente critici per il primo rilascio, ma in grado di apportare un significativo valore aggiunto operativo e analitico;
- *Opzionali / Facoltativi (F)*: funzionalità migliorative o estensioni avanzate implementabili una volta consolidato il nucleo applicativo.

I destinatari principali del presente documento sono:
- *Proponente (Ergon Informatica S.r.l.)*: per validare la corretta comprensione e interpretazione delle specifiche funzionali e di dominio;
- *Committenti (Prof. Tullio Vardanega e Prof. Riccardo Cardin)*: per valutare il rigore metodologico, la chiarezza espositiva e la tracciabilità dell'analisi condotta;
- *Team di Sviluppo (Progettisti e Programmatori)*: come guida vincolante per la definizione dell'architettura e l'implementazione del prodotto;
- *Team di Verifica*: per la progettazione dei test di sistema e di accettazione volti ad accertare il soddisfacimento di ogni requisito.

== Prospettiva del prodotto <sec:prospettiva_prodotto>

*SmartDashboard* si configura come una piattaforma di Business Intelligence#super[G] (BI) self-service end-to-end potenziata da Intelligenza Artificiale (AI). Il sistema nasce dall'esigenza delle aziende operanti nella produzione e nella distribuzione di beni di consumo di liberare i dati operativi (ordini, vendite, movimenti di magazzino, logistica, marginalità) dai sistemi gestionali ERP#super[G], rendendoli immediatamente esplorabili dai decisori aziendali senza dover dipendere continuamente dal reparto IT per la creazione di nuovi report.

Per garantire separazione delle responsabilità, manutenibilità ed evoluzione indipendente dei componenti, il sistema è concepito secondo un'architettura disaccoppiata a tre livelli principali:
1. *Raw Data Store*: livello di ingestione e persistenza che acquisisce e storicizza una copia fedele dei dati grezzi provenienti dal gestionale ERP aziendale tramite connettori standard (ODBC) o middleware dedicato;
2. *Data Warehouse#super[G]*: livello analitico alimentato da processi ETL#super[G] (estrazione, pulizia, normalizzazione e trasformazione), che organizza le informazioni secondo un modello dimensionale a stella (*star schema*) ottimizzato per interrogazioni analitiche ad alte prestazioni su motore colonnare (DuckDB#super[G]);
3. *Web App e Layer AI*: livello applicativo composto da un backend che espone API REST#super[G] controllate (impedendo l'accesso diretto del frontend alla base dati) e da un frontend web responsive. Quest'ultimo ospita l'ambiente di costruzione self-service delle dashboard e un assistente conversazionale basato su Large Language Model (LLM#super[G]) per l'interrogazione in linguaggio naturale e l'interpretazione automatica dei dati.

Gli obiettivi strategici perseguiti dal prodotto sono:
- *Autonomia analitica*: permettere a utenti non tecnici (direzione commerciale, controllo di gestione, responsabili logistici) di comporre e personalizzare report in modo rapido e intuitivo;
- *Accessibilità conversazionale*: abbattere la barriera tecnica nella formulazione delle query, consentendo di generare grafici e indicatori tramite richieste in linguaggio naturale;
- *Supporto decisionale proattivo*: affiancare ai numeri spiegazioni contestuali, rilevamento automatico di anomalie, tendenze e stagionalità;
- *Modularità ed estensibilità*: disaccoppiare la logica applicativa dal motore analitico sottostante, predisponendo l'architettura per l'eventuale supporto multi-database.

== Funzioni del prodotto <sec:funzioni_prodotto>

In accordo con il capitolato d'appalto C7 e con gli incontri di allineamento svolti con Ergon Informatica S.r.l., *SmartDashboard* offre le seguenti macro-funzionalità:
- *Acquisizione e consolidamento dati*: recupero automatico e sincronizzazione dei dati grezzi dal gestionale ERP verso il Raw Data Store e successiva trasformazione tramite pipeline ETL nel Data Warehouse dimensionale;
- *Costruzione self-service di dashboard*: composizione interattiva di viste personalizzate tramite interfaccia *drag & drop* su griglia reattiva, con possibilità di ridimensionare, configurare e salvare le dashboard nel profilo utente;
- *Libreria completa di visualizzazioni*: messa a disposizione di widget analitici eterogenei tra cui grafici (a barre, a linee, a torta), schede KPI, indicatori a quadrante (*gauge*), tabelle standard, tabelle pivot e mappe geografiche;
- *Interattività e filtraggio trasversale*: applicazione dinamica di filtri globali (per intervallo temporale, area geografica, linea di prodotto, agente) ed esplorazione dei dati a diversi livelli di dettaglio (*drill-down*);
- *Assistente AI per Text-to-Analytics#super[G]*: pannello conversazionale integrato capace di interpretare richieste in linguaggio naturale e generare automaticamente i widget e le visualizzazioni pertinenti;
- *Insight automatici e spiegazione indicatori*: generazione proattiva di sintesi narrative su anomalie e scostamenti significativi, unitamente alla spiegazione contestuale su richiesta delle cause sottostanti a uno specifico KPI o andamento;
- *Personalizzazione ed esportazione*: supporto ai temi chiaro/scuro, interfaccia adattiva e possibilità di esportare le dashboard e i relativi dati nei formati standard PDF ed Excel;
- *Autenticazione e persistenza*: gestione dell'accesso riservato agli utenti autenticati con salvataggio lato server delle configurazioni e delle preferenze individuali.

== Caratteristiche utente <sec:caratteristiche_utente>

La piattaforma è progettata per risultare immediata e accessibile anche a personale privo di competenze informatiche o di modellazione dati, differenziando le capacità operative in base al ruolo ricoperto in azienda:

- *Utente Analista#super[G] / Decisore Aziendale* (es. direzione commerciale, controllo di gestione, responsabile logistica): utente autenticato che consulta le dashboard esistenti, applica filtri interattivi, costruisce nuove viste tramite l'editor *drag & drop*, esporta report e utilizza l'assistente AI per generare grafici o ottenere spiegazioni sui fenomeni di business;
- *Amministratore#super[G] di Sistema / Tecnico IT*: utente con privilegi amministrativi incaricato della gestione delle utenze, della configurazione delle sorgenti dati, del monitoraggio dei flussi di ingestione ed ETL e della supervisione del corretto funzionamento della piattaforma.

== Glossario#super[G] <sec:glossario>

Al fine di evitare ambiguità terminologiche e garantire uniformità lessicale tra tutta la documentazione prodotta da *Akme Group*, i termini tecnici, gli acronimi e le locuzioni specifiche del dominio sono definiti all'interno del documento *Glossario*.

Per agevolare la lettura, ogni termine presente nel Glossario viene contrassegnato automaticamente nel testo mediante apice "G".

== Riferimenti <sec:riferimenti>

=== Riferimenti normativi <sec:riferimenti_normativi>
- *Capitolato d'appalto#super[G] C7 — SmartDashboard (Ergon Informatica S.r.l.)*: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Progetto/C7-SD.pdf") \
  _(Ultima consultazione: 23 novembre 2026)_
- *Norme di Progetto* (documento interno di Akme Group, versione corrente): regolamento interno relativo al Way of Working, ai processi di ciclo di vita, alla struttura dei documenti e alle convenzioni redazionali.
- *Regolamento del Progetto Didattico*: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/T03.pdf") \
  _(Ultima consultazione: 23 novembre 2026)_

=== Riferimenti informativi <sec:riferimenti_informativi>
- *Lezione del Prof. Tullio Vardanega sull'Analisi dei Requisiti (T05)*: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/T05.pdf") \
  _(Ultima consultazione: 23 novembre 2026)_
- *Lezione del Prof. Riccardo Cardin sui Diagrammi dei Casi d'Uso*: \
  #link("https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf") \
  _(Ultima consultazione: 23 novembre 2026)_
- *Standard ISO/IEC/IEEE 29148:2018* (evoluzione di *ISO/IEC 830:1998*) — _Systems and software engineering — Life cycle processes — Requirements engineering_: \
  #link("https://ieeexplore.ieee.org/document/8559686") \
  _(Ultima consultazione: 23 novembre 2026)_
- *Standard ISO/IEC 12207:1995* — _Information technology — Software life cycle processes_: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf") \
  _(Ultima consultazione: 23 novembre 2026)_
- *Glossario* (documento esterno di Akme Group, versione corrente): raccolta delle definizioni dei termini tecnici e di dominio utilizzati nella documentazione di progetto. \
  #link("https://gruppo-akme.github.io/Documentazione/website/glossary.html")

= Casi d'uso <cap:casi_uso>

== Introduzione <sec:casi_uso_intro>

La definizione dei casi d'uso#super[G] rappresenta una fase fondamentale nell'analisi dei requisiti della piattaforma *SmartDashboard* prevista dal capitolato d'appalto *C7*. I casi d'uso permettono di descrivere in maniera chiara, strutturata e verificabile come gli attori interagiscono con il sistema per raggiungere un determinato obiettivo operativo o analitico.

In questo documento, con il termine *Attore* si intende una qualunque entità esterna al sistema considerato che interagisce con lo stato di quest'ultimo, in lettura e/o in scrittura. Con *Sistema* si intende invece l'applicazione web *SmartDashboard* (comprensiva di backend, frontend e layer AI) esposta agli utenti finali e agli amministratori.

Ogni caso d'uso è corredato da una descrizione testuale dettagliata che specifica i seguenti elementi:
- *Attore principale*: l'attore che interagisce attivamente con il sistema avviando il flusso principale del caso d'uso;
- *Attori secondari* (se presenti): eventuali attori o sistemi esterni che intervengono in modo indiretto o passivo nel caso d'uso;
- *Pre-condizioni*: le condizioni sullo stato del sistema che devono essere soddisfatte affinché l'attore possa avviare il caso d'uso;
- *Post-condizioni*: le condizioni sullo stato del sistema che risultano vere al termine dell'esecuzione del flusso principale del caso d'uso;
- *Scenario principale*: la sequenza ordinata di passi che descrive l'interazione tra attore e sistema in assenza di errori o situazioni eccezionali;
- *Scenari alternativi* (se presenti): deviazioni o interruzioni del flusso principale dovute a scelte alternative dell'attore o a condizioni di errore;
- *Inclusioni* (se presenti): riferimenti a casi d'uso il cui comportamento è sempre incluso nell'esecuzione del caso d'uso corrente;
- *Estensioni* (se presenti): riferimenti a casi d'uso che descrivono scenari alternativi o opzionali attivabili al verificarsi di specifiche condizioni.

== Attori <sec:attori>

La piattaforma *SmartDashboard* coinvolge diverse tipologie di attori umani e sistemi esterni, differenziati in base al livello di autenticazione e al ruolo ricoperto all'interno dell'organizzazione. La tabella seguente riporta l'elenco degli attori individuati e una breve descrizione per ciascuno di essi.

#figure(
  table(
    columns: (0.3fr, 0.7fr),
    align: (left, left),
    inset: 8pt,
    table.header([*Attore*], [*Descrizione*]),
    [*Utente non autenticato*], [Un qualunque utente che non abbia ancora eseguito l'accesso alla piattaforma *SmartDashboard*.],
    [*Utente autenticato*], [Un qualunque utente che abbia eseguito l'accesso alla piattaforma *SmartDashboard*. Corrisponde alla generalizzazione di *Visualizzatore*, *Creatore* e *Amministratore di Sistema*.],
    [*Visualizzatore (Viewer)*], [Utente autenticato con permessi di sola lettura che consulta le dashboard esistenti, applica filtri, esplora i dati tramite *drill-down*, esporta report e consulta l'assistente AI senza poter modificare le dashboard.],
    [*Creatore (Editor)*], [Utente autenticato (es. direzione commerciale, controllo di gestione, responsabile logistica/magazzino) abilitato alla creazione e modifica delle dashboard tramite editor *drag & drop* e inserimento automatico di widget tramite l'assistente AI.],
    [*Amministratore#super[G] di Sistema*], [Utente autenticato con privilegi amministrativi incaricato della gestione delle utenze e dei ruoli, del reset delle password, della configurazione delle chiavi API per l'AI, delle sorgenti dati e del monitoraggio dei flussi ETL#super[G].],
    [*Gestionale ERP#super[G]*], [Sistema gestionale aziendale esterno che funge da sorgente primaria dei dati operativi grezzi acquisiti dal *Raw Data Store*.],
  ),
  caption: [Nomi degli attori e relativa descrizione],
) <tab:attori>

== Piattaforma SmartDashboard — Lista dei casi d'uso <sec:lista_casi_uso>

In questa sezione, il termine «sistema» si riferisce alla piattaforma *SmartDashboard*, considerata raggiungibile e operativa.

=== Attore principale — Utente non autenticato <sec:uc_utente_non_autenticato>

L'utente non autenticato è chiunque non abbia ancora effettuato l'accesso alla piattaforma *SmartDashboard* e intenda autenticarsi per usufruire delle funzionalità riservate.

==== UC1 — Autenticazione utente <uc1>

#figure(
  image("/src/assets/diagrammi/uc1_autenticazione.svg", width: 95%),
  caption: [UC1, UC1.1, UC1.2, UC2, UC3 — Autenticazione utente],
) <fig:uc1_autenticazione>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
  - L'Utente possiede un account registrato e attivo nella piattaforma.
- *Post-condizioni*:
  - Il sistema riconosce le credenziali e autentica l'Utente con il ruolo associato (*Visualizzatore*, *Creatore* o *Amministratore di Sistema*).
  - L'Utente accede alla propria area personale della web application.
- *Scenario principale*:
  1. L'Utente accede alla pagina di autenticazione della piattaforma.
  2. L'Utente inserisce il proprio identificativo (indirizzo email o nome utente).
  3. L'Utente inserisce la propria password.
  4. L'Utente conferma l'invio delle credenziali e il sistema avvia la sessione autenticata.
- *Scenari alternativi*:
  - L'Utente inserisce credenziali errate o associate a un account inesistente.
  - L'Utente tenta di accedere con un account sospeso dall'amministratore.
  - L'account richiede la verifica tramite autenticazione a due fattori (@uc4).
- *Inclusioni*:
  - @uc1_1
  - @uc1_2
- *Estensioni*:
  - @uc2
  - @uc3

===== UC1.1 — Inserimento identificativo (email/username) <uc1_1>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
- *Post-condizioni*:
  - Il sistema riceve l'identificativo inserito dall'Utente.
- *Scenario principale*:
  1. L'Utente inserisce l'indirizzo email o il nome utente associato al proprio account.

===== UC1.2 — Inserimento password <uc1_2>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
- *Post-condizioni*:
  - Il sistema riceve la password inserita dall'Utente.
- *Scenario principale*:
  1. L'Utente inserisce la propria password di accesso.

==== UC2 — Autenticazione non riuscita <uc2>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
  - L'Utente ha tentato l'accesso inserendo un identificativo inesistente oppure una password errata.
- *Post-condizioni*:
  - Il sistema non autentica l'Utente e non avvia alcuna sessione.
  - Il sistema mostra un messaggio di errore informativo senza esporre dettagli sensibili.
- *Scenario principale*:
  1. L'Utente invia credenziali non valide durante il tentativo di accesso.
  2. Il sistema rileva la mancata corrispondenza delle credenziali.
  3. L'Utente visualizza il messaggio di errore e rimane nella pagina di autenticazione.

==== UC3 — Accesso con account sospeso <uc3>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
  - L'Utente ha inserito credenziali valide associate a un account temporaneamente sospeso.
- *Post-condizioni*:
  - Il sistema nega l'accesso alla piattaforma e non avvia alcuna sessione.
  - Viene mostrato un messaggio informativo sullo stato di sospensione dell'account.
- *Scenario principale*:
  1. L'Utente tenta di autenticarsi con le credenziali di un account sospeso.
  2. Il sistema rileva lo stato di sospensione e mostra l'avviso all'Utente.

==== UC4 — Autenticazione a due fattori (2FA) <uc4>

#figure(
  image("/src/assets/diagrammi/uc4_2fa.svg", width: 95%),
  caption: [UC4, UC5, UC6, UC7 — Autenticazione a due fattori (2FA)],
) <fig:uc4_2fa>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
  - L'Utente ha superato il primo controllo di email/username e password (@uc1).
  - L'account dell'Utente ha l'autenticazione a due fattori (2FA) abilitata.
- *Post-condizioni*:
  - Il sistema verifica la validità del codice temporaneo e autentica l'Utente con il ruolo associato.
- *Scenario principale*:
  1. Il sistema genera e invia un codice temporaneo di verifica (2FA) all'Utente.
  2. L'Utente inserisce il codice ricevuto nell'apposito campo.
  3. Il sistema valida il codice e completa l'accesso alla piattaforma.
- *Scenari alternativi*:
  - L'Utente inserisce un codice 2FA errato (@uc5).
  - L'Utente inserisce un codice 2FA scaduto (@uc6).
  - L'Utente richiede il re-invio del codice 2FA (@uc7).
- *Estensioni*:
  - @uc5
  - @uc6
  - @uc7

==== UC5 — Codice 2FA errato <uc5>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha superato il primo controllo delle credenziali e ha inserito un codice 2FA non corrispondente a quello generato.
- *Post-condizioni*:
  - Il sistema non completa l'autenticazione e mostra un messaggio di errore.
- *Scenario principale*:
  1. L'Utente invia un codice 2FA errato.
  2. Il sistema rifiuta il codice e segnala l'errore all'Utente.

==== UC6 — Codice 2FA scaduto <uc6>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha inserito un codice 2FA corretto ma oltre il limite temporale di validità.
- *Post-condizioni*:
  - Il sistema non completa l'autenticazione e invita l'Utente a richiedere un nuovo codice.
- *Scenario principale*:
  1. L'Utente invia un codice 2FA scaduto.
  2. Il sistema segnala la scadenza del codice temporaneo.

==== UC7 — Re-invio codice 2FA <uc7>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente è in attesa di completare la verifica 2FA (@uc4).
- *Post-condizioni*:
  - Il sistema genera un nuovo codice 2FA invalidando il precedente e lo invia all'Utente.
- *Scenario principale*:
  1. L'Utente richiede il re-invio del codice di verifica.
  2. Il sistema genera un nuovo codice temporaneo e lo trasmette all'Utente.

==== UC8 — Impostazione prima password <uc8>

#figure(
  image("/src/assets/diagrammi/uc8_impostazione_password.svg", width: 92%),
  caption: [UC8, UC8.1, UC8.2 — Impostazione prima password],
) <fig:uc8_impostazione_password>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
  - L'Utente è stato registrato dall'Amministratore e ha ricevuto l'email con il link di attivazione/impostazione della prima password.
- *Post-condizioni*:
  - La password dell'Utente viene salvata in forma sicura e l'account risulta pronto per l'accesso.
- *Scenario principale*:
  1. L'Utente apre il link di impostazione password ricevuto via email.
  2. L'Utente inserisce la nuova password (@uc8_1).
  3. L'Utente reinserisce la password per conferma (@uc8_2).
  4. Il sistema verifica i criteri di sicurezza e salva la password associandola all'account.
- *Scenari alternativi*:
  - La nuova password e la conferma non coincidono (@uc12).
  - La nuova password non rispetta i criteri minimi di sicurezza (@uc13).
  - Il link di impostazione password è scaduto (@uc14).
- *Inclusioni*:
  - @uc8_1
  - @uc8_2
- *Estensioni*:
  - @uc12
  - @uc13
  - @uc14

===== UC8.1 — Inserimento nuova password <uc8_1>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha aperto un link valido per l'impostazione della password.
- *Post-condizioni*:
  - Il sistema riceve la nuova password digitata dall'Utente.
- *Scenario principale*:
  1. L'Utente digita la nuova password scelta nell'apposito campo.

===== UC8.2 — Conferma nuova password <uc8_2>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha inserito la nuova password (@uc8_1).
- *Post-condizioni*:
  - Il sistema riceve la password di conferma e ne verifica la corrispondenza con la nuova password.
- *Scenario principale*:
  1. L'Utente reinserisce la nuova password nel campo di conferma.

==== UC9 — Richiesta recupero password dimenticata <uc9>

#figure(
  image("/src/assets/diagrammi/uc9_recupero_password.svg", width: 94%),
  caption: [UC9, UC9.1, UC10 — Richiesta recupero password dimenticata],
) <fig:uc9_recupero_password>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
- *Post-condizioni*:
  - Il sistema genera un link temporaneo di reimpostazione e lo invia all'indirizzo email dell'Utente.
- *Scenario principale*:
  1. L'Utente seleziona l'opzione di recupero password dalla pagina di accesso.
  2. L'Utente inserisce l'indirizzo email associato al proprio account (@uc9_1).
  3. Il sistema verifica l'esistenza dell'account e invia l'email con il link di reimpostazione.
- *Scenari alternativi*:
  - L'indirizzo email inserito non è associato ad alcun account registrato (@uc10).
- *Inclusioni*:
  - @uc9_1
- *Estensioni*:
  - @uc10

===== UC9.1 — Inserimento email per recupero <uc9_1>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha avviato la procedura di recupero password.
- *Post-condizioni*:
  - Il sistema riceve l'indirizzo email specificato dall'Utente.
- *Scenario principale*:
  1. L'Utente inserisce il proprio indirizzo email nell'apposito campo.

==== UC10 — Email non associata ad alcun account <uc10>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha inviato una richiesta di recupero password inserendo un indirizzo email non presente nel sistema.
- *Post-condizioni*:
  - Il sistema non invia alcuna email di ripristino e informa l'Utente dell'esito della verifica.
- *Scenario principale*:
  1. L'Utente inserisce un indirizzo email non associato ad alcun account.
  2. Il sistema rileva l'assenza dell'account e mostra il relativo messaggio informativo.

==== UC11 — Reimpostazione password dimenticata <uc11>

#figure(
  image("/src/assets/diagrammi/uc11_reimpostazione_password.svg", width: 95%),
  caption: [UC11, UC11.1, UC11.2, UC12, UC13, UC14 — Reimpostazione password dimenticata],
) <fig:uc11_reimpostazione_password>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente non è autenticato nel sistema.
  - L'Utente ha ricevuto l'email di reimpostazione password (@uc9).
- *Post-condizioni*:
  - La password dell'Utente viene reimpostata in forma sicura.
  - Il sistema registra l'evento nei log di audit.
- *Scenario principale*:
  1. L'Utente clicca sul link temporaneo di reimpostazione ricevuto via email.
  2. L'Utente inserisce la nuova password (@uc11_1).
  3. L'Utente inserisce la conferma della nuova password (@uc11_2).
  4. Il sistema verifica i criteri di sicurezza e aggiorna la password dell'account.
- *Scenari alternativi*:
  - La nuova password e la conferma non coincidono (@uc12).
  - La nuova password non rispetta i criteri di sicurezza (@uc13).
  - Il link di reimpostazione password è scaduto (@uc14).
- *Inclusioni*:
  - @uc11_1
  - @uc11_2
- *Estensioni*:
  - @uc12
  - @uc13
  - @uc14

===== UC11.1 — Inserimento nuova password di ripristino <uc11_1>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha aperto un link valido per la reimpostazione della password.
- *Post-condizioni*:
  - Il sistema riceve la nuova password inserita dall'Utente.
- *Scenario principale*:
  1. L'Utente digita la nuova password desiderata nell'apposito campo.

===== UC11.2 — Conferma nuova password di ripristino <uc11_2>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha inserito la nuova password (@uc11_1).
- *Post-condizioni*:
  - Il sistema riceve la conferma e ne verifica la corrispondenza con la nuova password.
- *Scenario principale*:
  1. L'Utente reinserisce la nuova password nel campo di conferma.

==== UC12 — Password non coincidenti <uc12>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente sta impostando o modificando la password e ha inserito due valori differenti tra nuova password e campo di conferma.
- *Post-condizioni*:
  - Il sistema annulla il salvataggio della password e mostra un messaggio di errore.
- *Scenario principale*:
  1. L'Utente conferma l'invio di due password non coincidenti.
  2. Il sistema rileva la discrepanza e mostra il messaggio di errore all'Utente.

==== UC13 — Password non conforme ai criteri di sicurezza <uc13>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha inserito una nuova password che non soddisfa i requisiti minimi di sicurezza previsti dalla piattaforma.
- *Post-condizioni*:
  - Il sistema annulla il salvataggio della password e mostra i criteri di sicurezza richiesti.
- *Scenario principale*:
  1. L'Utente invia una password non conforme ai criteri di sicurezza.
  2. Il sistema blocca l'operazione e mostra il messaggio informativo con i requisiti da rispettare.

==== UC14 — Link di impostazione/reimpostazione password scaduto <uc14>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente ha ricevuto un link temporaneo di impostazione o reimpostazione password il cui periodo di validità è trascorso.
- *Post-condizioni*:
  - Il sistema impedisce la procedura di impostazione/reimpostazione e mostra un messaggio di errore.
- *Scenario principale*:
  1. L'Utente accede tramite il link scaduto.
  2. Il sistema verifica la scadenza del token e notifica l'impossibilità di proseguire.

==== UC15 — Sessione scaduta o token non valido <uc15>

- *Attore principale*: Utente non autenticato
- *Pre-condizioni*:
  - L'Utente disponeva di una sessione precedente il cui token di autenticazione è scaduto o è stato invalidato.
- *Post-condizioni*:
  - Il sistema nega l'accesso alle risorse protette e reindirizza l'Utente alla pagina di autenticazione.
- *Scenario principale*:
  1. L'Utente tenta di interagire con la piattaforma dopo la scadenza della sessione.
  2. Il sistema rileva il token non valido o scaduto e richiede una nuova autenticazione (@uc1).

=== Attore principale — Utente autenticato <sec:uc_utente_autenticato>

L'utente autenticato è chiunque abbia eseguito con successo l'accesso alla piattaforma *SmartDashboard* e disponga di una sessione attiva. Corrisponde alla generalizzazione dei ruoli *Visualizzatore*, *Creatore* e *Amministratore di Sistema* per le funzionalità comuni di gestione sessione, profilo e interfaccia.

==== UC16 — Disconnessione (Logout) <uc16>

#figure(
  image("/src/assets/diagrammi/uc16_uc20_profilo.svg", width: 92%),
  caption: [UC16, UC19, UC20 — Gestione sessione, profilo e tema dell'interfaccia],
) <fig:uc16_uc20_profilo>

- *Attore principale*: Utente autenticato
- *Pre-condizioni*:
  - L'Utente è autenticato nel sistema.
- *Post-condizioni*:
  - Il sistema invalida la sessione corrente e disconnette l'Utente.
  - L'Utente viene reindirizzato alla pagina di autenticazione.
- *Scenario principale*:
  1. L'Utente seleziona il comando di disconnessione dall'interfaccia della web application.
  2. Il sistema termina la sessione utente lato server e rimuove i token di accesso attivi.

==== UC17 — Modifica password <uc17>

#figure(
  image("/src/assets/diagrammi/uc17_modifica_password.svg", width: 95%),
  caption: [UC17, UC17.1, UC11.1, UC12, UC13, UC18 — Modifica password],
) <fig:uc17_modifica_password>

- *Attore principale*: Utente autenticato
- *Pre-condizioni*:
  - L'Utente è autenticato nel sistema.
- *Post-condizioni*:
  - La password dell'Utente viene aggiornata al nuovo valore specificato.
- *Scenario principale*:
  1. L'Utente accede alla sezione del proprio profilo e avvia la modifica della password.
  2. L'Utente inserisce la vecchia password (@uc17_1).
  3. L'Utente inserisce la nuova password (@uc11_1) e la relativa conferma (@uc11_2).
  4. Il sistema verifica la vecchia password, controlla la validità della nuova e salva l'aggiornamento.
- *Scenari alternativi*:
  - La vecchia password inserita non è corretta (@uc18).
  - La nuova password e la conferma non coincidono (@uc12).
  - La nuova password non rispetta i criteri di sicurezza (@uc13).
- *Inclusioni*:
  - @uc17_1
  - @uc11_1
  - @uc11_2
- *Estensioni*:
  - @uc18
  - @uc12
  - @uc13

===== UC17.1 — Inserimento vecchia password <uc17_1>

- *Attore principale*: Utente autenticato
- *Pre-condizioni*:
  - L'Utente è autenticato nel sistema.
- *Post-condizioni*:
  - Il sistema riceve la password attuale inserita dall'Utente per la verifica.
- *Scenario principale*:
  1. L'Utente digita la propria password attuale nell'apposito campo.

==== UC18 — Vecchia password non corretta <uc18>

- *Attore principale*: Utente autenticato
- *Pre-condizioni*:
  - L'Utente è autenticato nel sistema e ha inserito una vecchia password errata durante la procedura di modifica (@uc17).
- *Post-condizioni*:
  - Il sistema annulla la modifica della password e mostra un messaggio di errore.
- *Scenario principale*:
  1. L'Utente invia una password attuale non corrispondente a quella registrata.
  2. Il sistema rileva l'errore e notifica l'Utente senza modificare la password.

==== UC19 — Visualizzazione profilo utente <uc19>

- *Attore principale*: Utente autenticato
- *Pre-condizioni*:
  - L'Utente è autenticato nel sistema.
- *Post-condizioni*:
  - Il sistema mostra i dati del profilo dell'Utente, il ruolo assegnato (*Visualizzatore*, *Creatore* o *Amministratore*) e le preferenze salvate.
- *Scenario principale*:
  1. L'Utente accede alla pagina del proprio profilo personale.
  2. Il sistema recupera e visualizza le informazioni associate all'account.

==== UC20 — Selezione tema dell'interfaccia (Chiaro/Scuro) <uc20>

- *Attore principale*: Utente autenticato
- *Pre-condizioni*:
  - L'Utente è autenticato nel sistema.
- *Post-condizioni*:
  - L'interfaccia grafica della web application adotta il tema selezionato (chiaro o scuro).
  - La preferenza viene salvata lato server nel profilo dell'Utente per le sessioni successive.
- *Scenario principale*:
  1. L'Utente seleziona l'opzione di cambio tema nell'intestazione o nelle impostazioni dell'interfaccia.
  2. Il sistema applica immediatamente il tema scelto (chiaro o scuro) a tutti i componenti visivi.
  3. Il sistema persiste la preferenza associata al profilo dell'Utente.
