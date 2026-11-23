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
