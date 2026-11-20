#import "../../Templates/templateDocumentiGenerici.typ": report, gloss

#let url-valutazione = "https://gruppo-akme.github.io/Documentazione/output/Candidatura/Valutazione%20Capitolati.pdf"
#let url-preventivo = "https://gruppo-akme.github.io/Documentazione/output/Candidatura/preventivo_costi.pdf"
#let url-sito = "https://gruppo-akme.github.io/Documentazione/website/"
#let url-repo = "https://github.com/Gruppo-Akme/Documentazione"
#let url-capitolato_ = "https://www.math.unipd.it/~tullio/IS-1/2026/Progetto/C7-SD.pdf"
#let url-ApprISO_IEC_IEEEG_12207_1995 = "https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf"
#let url-Standard_ISO_IEC_9126 = "https://en.wikipedia.org/wiki/ISO/IEC_9126"
#let url-Gloss = "https://gruppo-akme.github.io/Documentazione/website/glossary.html"
#let url-presentazione = "https://gruppo-akme.github.io/Documentazione/output/Candidatura/Lettera_di_presentazione.pdf"
#let url-presentazione-RTB = "manca"
#let url-analisi_requisiti = "manca"
#let url-piano_progetto = "manca"
#let url-piano_qualifica = "manca"
#let url-templateDiarioDiBordo = "https://canva.link/hbcmth8yheox1ep"
#let url-templateDocumentiGenerici = "https://github.com/Gruppo-Akme/Documentazione/blob/main/src/Templates/templateDocumentiGenerici.typ"
#let url-templateLettera = "https://github.com/Gruppo-Akme/Documentazione/blob/main/src/Templates/templateLettera.typ"
#let url-templateVerbali = "https://github.com/Gruppo-Akme/Documentazione/blob/main/src/Templates/templateVerbali.typ"

#show outline: it => { 
  if it.depth == 4 { 
      it 
    } else { 
      let args = it.fields() 
      args.depth = 4 
      outline(..args) 
    } 
  }

#set heading(numbering: "1.1")

#show: report.with(
  titolo: "Norme di progetto",
  tipo-documento: "RTB - Documento interno",
  stato: "Bozza",
  versione: "0.3.1",
  registro-modifiche: (
    ("0.3.1", "20/11/2026", "Mattia Cadamuro", "Marco Giacon", "Correzione paragrafo 3.1.3.1 e 3.1.3.3"),
    ("0.3.0", "19/11/2026", "Mattia Cadamuro", "Marco Giacon", "Aggiunta capitolo 3 e indici di 3° e 4° profondità"),
    ("0.2.0", "12/11/2026", "Mattia Cadamuro", "Marco Giacon", "Aggiunta capitolo 2 e aggiunta link"),
    ("0.1.0", "10/11/2026", "Mattia Cadamuro", "Marco Giacon", "Creazione e prima stesura documento"),
  ),
  verificatore-interno: "",
  left-signature: "",
)

// Capitoli: grassetto, senza puntini, più spazio sopra
#show outline.entry.where(level: 1): set block(above: 1.2em)
#show outline.entry.where(level: 1): set text(weight: "bold")
#show outline.entry.where(level: 1): set outline.entry(fill: none)

= *Introduzione*
== Scopo del documento
Lo scopo di questo documento è definire il Way of working#super[G] adottato dal gruppo per la gestione del progetto didattico. Il testo descrive l'insieme ordinato di attività e processi di ciclo di vita scelti per soddisfare gli obiettivi prefissati, puntando sempre alla massima efficienza ed efficacia collaborativa. 

Il documento stabilisce incrementalmente le procedure di lavoro, adattando i processi standard alle necessità del gruppo, definendo l'allocazione delle risorse e la pianificazione delle scadenze. Trattandosi di un documento incrementale, subirà aggiornamenti continui parallelamente all'avanzamento del progetto, basandosi sui risultati delle retrospettive di periodo.

== Scopo del prodotto
Il prodotto da realizzare, descritto nel #link(url-capitolato_)[Capitolato#super[G] C7], è SmartDashboard#super[G]. Consiste in una piattaforma di Business Intelligence#super[G] self-service potenziata dall'Intelligenza Artificiale.

L'obiettivo è svincolare i dati aziendali dai sistemi ERP#super[G], rendendoli direttamente fruibili per l'analisi da parte dei decisori aziendali senza richiedere il costante intervento del reparto IT. La piattaforma permetterà agli utenti di costruire dashboard interattive tramite una web app responsive. Il fulcro innovativo del sistema sarà il layer AI integrato, capace di generare visualizzazioni grafiche e fornire insight automatici elaborando richieste poste in linguaggio naturale.

== Glossario#super[G]
La stesura della documentazione e la scrittura del codice richiedono l'uso di una terminologia precisa e condivisa. Al fine di evitare incomprensioni o ambiguità di dominio, il gruppo ha raccolto i termini tecnici e gli acronimi all'interno del documento glossario. 

Per rendere immediata l'individuazione di tali termini, ogni parola afferente al glossario è contrassegnata all'interno del testo aggiungendo una lettera "G" ad apice, tramite l'apposita formattazione tipografica: parola#super[G].

== Riferimenti

=== Riferimenti normativi
- Capitolato d'appalto C7: Ergon - SmartDashboard\
  #link(url-capitolato_)

=== Riferimenti informativi
- Standard ISO/IEC 9126\
  #link(url-Standard_ISO_IEC_9126)
- Standard ISO/IEC/IEEEG 12207:1995\
  #link(url-ApprISO_IEC_IEEEG_12207_1995)
- Glossario\
  #link(url-Gloss)

= *Processi primari*
I processi primari definiti dallo standard *ISO/IEC 12207:1995* racchiudono le attività principali del Ciclo di vita#super[G] del software: acquisizione, fornitura, sviluppo, operazione e manutenzione. Il loro scopo è garantire che i prodotti realizzati rispettino i requisiti e gli obiettivi di qualità prefissati.

Nel contesto del progetto didattico, il gruppo applica i seguenti processi primari:
- #link(<processo-fornitura>)[*Fornitura*]
- #link(<processo-sviluppo>)[*Sviluppo*]

== Fornitura <processo-fornitura>
Il processo di *fornitura* comprende le attività necessarie per pianificare, realizzare e consegnare il prodotto software richiesto. Include l'analisi della domanda del cliente, la definizione degli accordi di fornitura, la pianificazione temporale ed economica delle attività, il controllo dell'avanzamento e il rilascio finale.

L'obiettivo è assicurare che la piattaforma *SmartDashboard* venga sviluppata in modo controllato, tracciabile e conforme alle aspettative dell'azienda proponente *Ergon Informatica Srl* e dei committenti.

=== Strumenti a supporto
Per la gestione interna della fornitura il gruppo utilizza:
- *GitHub#super[G]*: infrastruttura per il controllo di versione e la gestione delle repository di progetto:
  - *GitHub Issues#super[G]*: per suddividere le attività del backlog in compiti atomici assegnabili ai singoli membri e per segnalare eventuali anomalie;
  - *GitHub Projects#super[G]*: per visualizzare lo stato di avanzamento dei compiti tramite bacheca Kanban e diagrammi di Gantt;
- *WhatsApp#super[G]*: per le comunicazioni rapide e asincrone tra i componenti del gruppo;
- *Discord#super[G]*: per lo svolgimento delle riunioni interne da remoto.

Per le comunicazioni e gli incontri con l'azienda proponente vengono impiegati:
- *Gmail*: per le comunicazioni formali e l'invio di documentazione all'azienda tramite l'indirizzo del gruppo (`akmeswe@gmail.com`);
- *Microsoft Teams* / *Zoom*: per gli incontri periodici di allineamento e le sessioni di chiarimento da remoto con i referenti aziendali.
- *Telegram*: per le comunicazioni rapide con l'azienda.

=== Attività previste 
Il processo di fornitura si articola nelle seguenti attività:
- *Inizializzazione*: analisi dei requisiti esposti nel *Capitolato C7* per valutare la fattibilità tecnica ed economica del progetto e individuare i punti da approfondire con la proponente;
- *Preparazione della risposta*: elaborazione della proposta formale di candidatura, comprensiva della stima delle ore produttive necessarie e dei relativi costi;
- *Contrattazione*: confronto con la proponente e i committenti per definire gli obiettivi e giungere all'aggiudicazione dell'appalto;
- *Pianificazione*: suddivisione del tempo di calendario in una successione di periodi brevi (sprint) e individuazione a ritroso delle milestone di progetto. Per ciascun periodo viene calcolato il preventivo delle risorse necessarie, allocando i compiti ai ruoli in base alle disponibilità effettive;
- *Esecuzione e controllo*: realizzazione delle baseline previste per soddisfare le milestone fissate. L'avanzamento viene monitorato regolarmente a fine periodo tramite il consuntivo di periodo (quantitativo) e la retrospettiva (qualitativa), aggiornando di conseguenza la pianificazione futura con il preventivo a finire;
- *Revisione e valutazione*: coordinamento costante con *Ergon* attraverso incontri di allineamento ogni 15 giorni per mostrare lo stato di avanzamento, discutere le difficoltà emerse e riesaminare le priorità, affiancato dalle attività interne di verifica e validazione;
- *Consegna e completamento*: rilascio del prodotto software completo e della relativa documentazione finale nei tempi stabiliti.

=== Documentazione fornita
Di seguito viene elencata la documentazione prodotta da *Akme Group* e destinata alla proponente *Ergon Informatica Srl* e ai committenti *Prof. Tullio Vardanega* e *Prof. Riccardo Cardin*.

==== Valutazione dei capitolati
La #link(url-valutazione)[Valutazione dei capitolati] è un documento che raccoglie l'analisi effettuata dal gruppo su tutti i capitolati proposti, evidenziandone aspetti positivi, criticità e le motivazioni che hanno portato alla scelta del capitolato *C7*.

==== Preventivo#super[G] dei costi
Il #link(url-preventivo)[Preventivo dei costi] è un documento con cui il gruppo formalizza la pianificazione economica e oraria del progetto, specificando il monte ore per ciascun componente, la ripartizione dei ruoli, il criterio di rotazione adottato e il preventivo complessivo dei costi.

==== Lettera di presentazione
La #link(url-presentazione)[Lettera di presentazione]è un documento con cui *Akme Group* si candida formalmente alla realizzazione del *Capitolato C7* proposto da *Ergon Informatica Srl*.

==== Lettera di presentazione RTB
La #link(url-presentazione-RTB)[Lettera di Presentazione RTB] è un documento con cui il gruppo presenta il lavoro svolto per richiedere l'accesso alle revisioni ufficiali legate alle baseline di progetto: la *Requirements and Technology Baseline#super[G]* (RTB#super[G]) e la *Product Baseline* (PB).

==== Analisi dei Requisiti
L'#link(url-analisi_requisiti)[Analisi dei requisiti]è un documento che definisce in modo strutturato i Casi d'uso#super[G] e i requisiti (obbligatori, desiderabili e opzionali) individuati per la piattaforma *SmartDashboard*, mantenendone il tracciamento.

==== Piano di Progetto
Il #link(url-piano_progetto)[Piano di progetto] è un documento che traccia la pianificazione e l'andamento del progetto lungo i vari sprint. Contiene l'analisi dei rischi, le attività pianificate, il preventivo, il consuntivo di periodo, il preventivo a finire e gli esiti delle retrospettive.

==== Piano di Qualifica
Il #link(url-piano_qualifica)[Piano di qualifica] è un documento che raccoglie le strategie di verifica e validazione adottate dal gruppo, le soglie fissate per le metriche di processo e di prodotto, il cruscotto delle misurazioni rilevate a ogni sprint e il resoconto dei test effettuati.

==== Norme di Progetto
Il presente documento, destinato a formalizzare il Way of Working del gruppo, gli strumenti impiegati, le procedure operative e le convenzioni adottate per la stesura di codice e documentazione.

==== Glossario
Il #link(url-Gloss)[Glossario] è un documento che raccoglie e definisce i termini tecnici, di dominio e gli acronimi utilizzati nella documentazione di progetto, garantendo un riferimento univoco per evitare ambiguità.

==== Verbali interni
Resoconti formali delle riunioni svolte tra i soli componenti del gruppo, in cui vengono registrate le discussioni e le decisioni prese.
Possono essere consultati sull'appostito #link(url-sito)[sito web] del gruppo.

==== Verbali esterni 
Resoconti formali degli incontri svolti con i referenti dell'azienda proponente *Ergon*, validati e controfirmati dal referente aziendale.
Possono essere consultati sull'appostito #link(url-sito)[sito web] del gruppo.

== Sviluppo <processo-sviluppo>
Il processo di *sviluppo* comprende tutte le attività tecniche volte alla realizzazione del sistema software *SmartDashboard*. Include l'analisi dei requisiti, la progettazione architetturale e di dettaglio, la codifica, l'integrazione delle componenti e i relativi test.

=== Strumenti a supporto
- *Python#super[G]* (con librerie *Polars#super[G]* / *Pandas#super[G]*): per lo sviluppo delle procedure ETL#super[G] di estrazione e trasformazione dei dati provenienti dal gestionale ERP;
- *PostgreSQL#super[G]*: come database relazionale per il Raw Data Store#super[G], destinato a mantenere una copia fedele e storicizzata dei dati grezzi;
- *DuckDB#super[G]*: come motore analitico OLAP#super[G] colonnare per il Data Warehouse#super[G], strutturato secondo un modello dimensionale (star schema);
- *Angular#super[G]* e *TypeScript#super[G]*: per lo sviluppo della web app responsive, del costruttore di dashboard self-service e della libreria di widget;
- *Visual Studio Code#super[G]*: come ambiente di sviluppo (IDE#super[G]) per la scrittura del codice;
- *StarUML#super[G]*: per la realizzazione dei diagrammi dei casi d'uso e dei diagrammi architetturali UML#super[G].

=== Attività previste
Il processo di sviluppo prevede le seguenti attività:
- *Implementazione del processo*: definizione dell'approccio di sviluppo incrementale, articolato in fasi progressive (dalla piattaforma BI end-to-end fino all'integrazione ed estensione del layer AI);
- *Analisi dei requisiti di sistema*: individuazione delle esigenze degli utenti finali (direzione, vendite, logistica) e definizione delle funzionalità attese dal sistema complessivo;
- *Progettazione dell'architettura di sistema*: definizione dell'architettura di alto livello, mantenendo la separazione logica tra Raw Data Store, Data Warehouse e App;
- *Analisi dei requisiti software*: specifica puntuale dei requisiti funzionali, non funzionali, di dominio e di vincolo per ciascuna componente software, inclusi i controlli di coerenza e i guardrail per il layer AI;
- *Progettazione dell'architettura software*: traduzione dei requisiti in una struttura modulare che definisca componenti, schemi dati, API REST#super[G] e interfacce di comunicazione con l'LLM#super[G];
- *Progettazione dettagliata del software*: definizione di dettaglio dei singoli moduli e delle unità software prima della loro implementazione;
- *Codifica e test del software*: scrittura del codice sorgente delle singole unità software ed esecuzione dei relativi test di unità per verificarne il funzionamento in isolamento;
- *Integrazione del software*: assemblaggio progressivo dei moduli sviluppati (pipeline dati, backend, frontend e assistente AI) verificandone la corretta interazione;
- *Test di qualificazione del software*: esecuzione dei test per verificare che il software soddisfi i requisiti specificati, inclusi i test di regressione al variare dei prompt o del modello AI;
- *Integrazione di sistema*: composizione di tutte le componenti software e dei database nell'ambiente di esecuzione completo;
- *Test di qualificazione del sistema*: verifica della conformità dell'intero sistema rispetto a quanto definito nell'Analisi dei Requisiti;
- *Installazione del software*: predisposizione del prodotto software per l'esecuzione nell'ambiente operativo;
- *Supporto all'accettazione del software*: affiancamento al committente e alla proponente durante i test di accettazione finali.

In relazione alle due baseline principali del progetto didattico, il gruppo concentra nella fase *RTB* l'*analisi dei requisiti* e la realizzazione del *Proof of Concept* (PoC#super[G]) per validare la fattibilità tecnologica. Nella successiva fase *PB* vengono invece approfondite la *progettazione dell'architettura software*, la *progettazione dettagliata* e la *codifica* del prodotto finale.

=== Analisi dei Requisiti
L'attività di *analisi dei requisiti* ha l'obiettivo di raccogliere, analizzare e formalizzare le richieste dell'azienda proponente emerse dal *Capitolato C7* e dagli incontri periodici, traducendole in requisiti non ambigui e verificabili.

L'esito di questa attività è raccolto nel documento di Analisi dei Requisiti, che descrive gli attori coinvolti, i casi d'uso individuati e la tabella di tracciamento dei requisiti.

==== Casi d'uso
I casi d'uso seguono la convenzione di nomenclatura:
#align(center)[
  *`UC[Primario].[Secondario]`*
]
dove:
- *`UC`* è l'acronimo di _Use Case_ (caso d'uso);
- *`[Primario]`* è un codice numerico progressivo che identifica univocamente il caso d'uso principale;
- *`[Secondario]`* è un codice numerico progressivo opzionale che identifica un sotto-caso o uno scenario alternativo legato al caso primario.

Ogni caso d'uso è accompagnato da titolo, attori principali e secondari, precondizioni, postcondizioni, scenario principale ed eventuali estensioni o inclusioni.

==== Requisiti
I requisiti sono identificati univocamente tramite il formato:
#align(center)[
  *`R[Tipologia]-[Codice]-[Priorità]`*
]
dove:
- *`R`* indica il termine requisito;
- *`[Tipologia]`* specifica la categoria del requisito tra:
  - *`F`*: Funzionale;
  - *`NF`*: Non Funzionale (o di qualità);
  - *`D`*: di Dominio;
  - *`V`*: di Vincolo;
- *`[Codice]`* è un identificativo numerico gerarchico e progressivo all'interno della specifica tipologia;
- *`[Priorità]`* indica il livello di importanza concordato per il requisito:
  - *`Obb`*: Obbligatorio, indispensabile per il funzionamento base del sistema;
  - *`Des`*: Desiderabile, non strettamente necessario ma a valore aggiunto riconosciuto;
  - *`Opt`*: Opzionale, implementabile qualora le risorse residue lo consentano.

=== Codifica
L'attività di *codifica*, affidata ai programmatori, traduce le scelte progettuali in codice sorgente funzionante. Per garantire la manutenibilità del software e agevolare il lavoro dei verificatori, il gruppo adotta convenzioni stilistiche uniformi per i linguaggi impiegati.

==== Stile di codifica TypeScript
Per lo sviluppo del frontend e dei componenti della web app in *TypeScript*, il gruppo stabilisce le seguenti convenzioni di nomenclatura:
- *File*: formato `kebab-case`, indicando il ruolo del file nel suffisso (es. `dashboard-grid.component.ts`, `ai-assistant.service.ts`);
- *Classi, Interfacce e Tipi*: formato `PascalCase` (es. `WidgetConfig`, `KpiCardComponent`);
- *Variabili, Proprietà e Metodi*: formato `camelCase` (es. `fetchChartData`, `activeFilters`);
- *Costanti*: formato `UPPER_SNAKE_CASE` per i valori immutabili globali o di configurazione (es. `MAX_QUERY_ROWS`).

==== Stile di codifica Python
Per lo sviluppo delle pipeline ETL, del backend e dell'integrazione con *DuckDB* e il layer AI in *Python*, il gruppo fa riferimento allo standard *PEP 8*, adottando le seguenti convenzioni:
- *File, Moduli e Package*: formato `snake_case` con nomi brevi e descrittivi (es. `etl_pipeline.py`, `duckdb_connector.py`);
- *Classi ed Eccezioni*: formato `PascalCase` (es. `StarSchemaBuilder`, `QueryValidationError`);
- *Funzioni, Metodi e Variabili*: formato `snake_case` (es. `validate_sql_query`, `raw_data_df`);
- *Costanti*: formato `UPPER_SNAKE_CASE` definite a livello di modulo (es. `DEFAULT_TIMEOUT_SECONDS`).

= *Processi di supporto*
Tra i processi di supporto applicati nel progetto si distinguono:

== Documentazione
Il processo di produzione della documentazione consente di tracciare e storicizzare le decisioni prese da *Akme Group*, permettendo a tutti i membri di rimanere allineati in modalità asincrona sulle scelte architetturali, tecnologiche e sull'organizzazione del lavoro.

Una decisione viene documentata esclusivamente se si traduce in un'azione tracciabile e concreta, con un impatto sul ciclo di vita della piattaforma software.

Il processo copre la pianificazione, la progettazione, lo sviluppo e la modifica dei documenti necessari al gruppo per mantenere una metodologia condivisa, oltre a quelli richiesti dall'azienda proponente *Ergon Informatica Srl* e dai committenti per valutare regolarmente l'avanzamento dei lavori su *SmartDashboard*.

=== Strumenti a supporto 
- *Typst#super[G]*: sistema di composizione tipografica digitale adottato per redigere documenti tramite un linguaggio di markup pulito. Offre un sistema di scripting e templating nativo che semplifica la gestione della formattazione dinamica e un caricamento in tempo reale utile per accelerare la stesura dei testi.
- *GitHub*: infrastruttura centrale per il versionamento del codice sorgente della documentazione.
  - *GitHub Issues*: impiegate per assegnare i task di redazione e tracciare le necessità di aggiornamento dei documenti.
  - *GitHub Projects*: utilizzato per visualizzare tramite board Kanban lo stato di avanzamento delle attività di scrittura.
  - *GitHub Pages#super[G]*: servizio per l'hosting e la pubblicazione automatizzata della documentazione stabile tramite il sito web di progetto.
- *Discord*: per il confronto sincrono e le chiamate di allineamento organizzativo durante le fasi di scrittura collettiva.

=== Attività previste
Le attività previste per la gestione documentale si suddividono in:
- *Produzione*: copre le procedure di stesura e verifica applicate dal gruppo, descritte nella @doc-produzione;
- *Manutenzione*: stabilisce i flussi per l'aggiornamento e la correzione di un documento già rilasciato (stato *Verificato*), dettagliate nella @doc-manutenzione.

=== Caratteristiche e struttura dei documenti
Ogni tipologia di documento possiede peculiarità strutturali legate alla propria funzione. Per garantire un'identità visiva coerente ed eliminare le tempistiche di formattazione manuale, il gruppo impiega specifici template Typst.

Tutti i documenti formali (ad eccezione dei diari di bordo) dispongono di un frontespizio contenente:
- Il logo dell'Università di Padova e il logo del gruppo *Akme Group*;
- Il titolo del documento;
- L'identificativo di versione e lo stato di avanzamento (dettagliato nella @doc-stato);
- L'elenco dei destinatari all'interno della voce "Distribuzione".

Le pagine successive includono il *Registro delle modifiche*, una tabella dove ogni riga traccia:
- Il codice della *Versione* rilasciata (vd. @doc-versionamento);
- La *Data* di stesura o verifica;
- Il nome dell'*Autore* (o degli autori) delle modifiche;
- Il nome del *Verificatore#super[G]* che ha controllato il documento;
- Una sintetica *Descrizione* dei cambiamenti apportati.

A seguire figura l'indice del documento e, posizionata nell'ultima pagina, la firma del revisore interno.

==== Documenti incrementali
I documenti come le _Norme di Progetto_, il _Piano di Qualifica_ e il _Piano di Progetto_ possiedono natura *incrementale*, espandendosi parallelamente all'avanzamento tecnologico e organizzativo del progetto. Nelle fasi iniziali, alcune sezioni risultano inevitabilmente incomplete in quanto legate a concetti e metriche non ancora definiti.
Il gruppo considera una versione pubblicabile come stabile e idonea alla fase di pull request (PR) quando le sezioni effettivamente compilate risultano complete e sottoposte a verifica incrociata (vd. @doc-verifica), ignorando temporaneamente le porzioni vuote.

==== Verbali <caratteristiche-struttura-verbali>
I verbali si basano su una variante del frontespizio principale a cui viene aggiunto:
- L'orario di svolgimento della riunione.
- L'elenco formale dei *partecipanti*.
- L'*ordine del giorno*, riportato in forma di elenco numerato;

La struttura interna si suddivide in:
- *Introduzione* : riporta la data, la fascia oraria, la piattaforma e l'obiettivo generale dell'incontro;
- *Resoconto*: suddiviso in sottosezioni dedicate ciascuna a un punto specifico dell'ordine del giorno;
- *Decisioni e attività*: contiene la tabella formale degli *Action Items* assegnati per lo sprint successivo (con ID, Azione, Incaricato, Scadenza e link alla Issue#super[G] su GitHub).
Il file di riferimento per l'impaginazione è #link(url-templateVerbali)[templateVerbali] consultabile nel repository di riferimento.

==== Diari di bordo
I diari di bordo costituiscono presentazioni visive utilizzate in aula per sintetizzare lo stato del gruppo. Rinunciano alla struttura documentale classica in favore di diapositive focalizzate su:
- *Resoconto*: avanzamento delle attività svolte nello sprint appena concluso;
- *To Do*: attività da svolgere nel prossimo sprint;
- *Criticità*: ostacoli tecnici o metodologici incontrati nel periodo appena trascorso.
Il file di riferimento per l'impaginazione è #link(url-templateDiarioDiBordo)[templateDiarioDiBordo].

==== Altri documenti
I restanti elaborati, come l'Analisi dei Requisiti o il piano di progetto, presentano un'articolazione logica dettata dai contenuti. Questi vengono generati attraverso l'infrastruttura fornita dal file #link(url-templateDocumentiGenerici)[templateDocumentiGenerici], che raccoglie le macro necessarie alla formattazione.

=== Convenzioni
Per assicurare un'archiviazione strutturata e metodologica, il gruppo segue regole rigorose e condivise durante l'intero ciclo redazionale.

==== Stato di un documento <doc-stato>
Un elaborato attraversa tre fasi sequenziali:
- *Bozza*: il file è in fase di stesura iniziale o profonda riscrittura. I contenuti sono da ritenersi parziali, non stabili e in lavorazione attiva da parte dell'autore designato.
- *Da verificare*: la scrittura e le modifiche previste per il ticket assegnato sono ultimate. L'autore segnala la conclusione della propria fase e il file entra in attesa di ispezione.
- *Verificato*: l'elaborato è stato controllato da un membro distinto dall'autore (revisore). Viene garantita la fluidità concettuale, l'assenza di refusi e il pieno allineamento con gli standard fissati dal gruppo.
- *Approvato*: l'elaborato è stato controllato e approvato da un membro distinto dall'autore (responsabile). Il responsabile e incaricato di verificare che il documento sia valido e di rilasciarlo come documento x.0.0.

==== Versionamento <doc-versionamento>
La catalogazione delle modifiche segue lo standard Semantic Versioning#super[G] (SemVer), strutturato sul triplo indice *`MAJOR.MINOR.PATCH`*:
- *`MAJOR`*: indica stravolgimenti strutturali o rilasci ufficiali di fase. Vale `0` se l'elaborato è una bozza in evoluzione senza una prima validazione. Assume valore `1` in concomitanza del primo rilascio stabile approvato;
- *`MINOR`*: si incrementa per l'aggiunta di interi paragrafi o sezioni (es. un nuovo macro-requisito o un nuovo processo) che non alterano l'impalcatura preesistente del documento;
- *`PATCH`*: viene utilizzato per tracciare interventi marginali come la correzione di errori di battitura, aggiornamenti grammaticali o fix legati all'impaginazione Typst.
L'avanzamento di un livello azzera i contatori subordinati posti alla sua destra.

==== Denominazione e locazione file
Sorgenti Typst e output PDF seguono una chiara gerarchia all'interno della repository web:
#align(center, [`/output/`*`[FASE]`*`/`*`[TIPO_DOCUMENTO]`*`/`*`[NOME_DOCUMENTO]`*`.pdf`])

Dove:
- *`[FASE]`*: cartella relativa al momento progettuale (`Candidatura`, `RTB`, `PB`);
- *`[TIPO_DOCUMENTO]`*: classificazione funzionale (`VerbaliInterni`, `VerbaliEsterni`, `Generale`);
- *`[NOME_DOCUMENTO]`*: 
  - I verbali riportano la data in formato rigido `YYYY-MM-DD` (es. `2026-11-04`);
  - I documenti generici impiegano il CamelCase, con o senza preposizioni mantenute costanti (es. `PianoDiQualifica`, `NormeDiProgetto`).

==== Metadati
I template in uso dipendono dall'assegnazione corretta di metadati nel sorgente.
- `htmlId`: Questa variabile mappa l'elaborato a uno specifico ID nel codice sorgente HTML#super[G] del sito web. Un valore errato o mancante disabilita le ancore di navigazione sulla pagina pubblica.

=== Produzione <doc-produzione>
Il ciclo di vita di un documento si struttura nei tre passaggi descritti a seguire.

==== Scrittura
1. Sulla repository documentale viene aperta una issue dedicata che definisce lo scopo e il perimetro delle modifiche, assegnandole a un autore.
2. Viene staccato un nuovo branch dal ramo principale `main`, utilizzando la convezione `docs/[nome-attività]`, in modo da isolare il lavoro in corso.
3. L'autore procede con la redazione su Visual Studio Code, sfruttando l'estensione Tinymist Typst per l'anteprima in tempo reale e seguendo le linee guida stilistiche.
4. Conclusa la stesura, l'autore effettua il push sul branch e apre una pull request, designando i revisori scelti e spostando virtualmente il documento in stato "Da verificare".

==== Verifica#super[G] <doc-verifica>
Per preservare la massima qualità formale, nessun componente può ispezionare il materiale che ha redatto in prima persona.
- Il verificatore incaricato legge il documento ricercando difetti di ortografia, logica, formattazione e violazioni delle convenzioni di stile.
- Qualora riscontri criticità, richiede esplicitamente le correzioni tramite review comment sulla pull request, restituendo il carico di lavoro all'autore in modo ciclico finché ogni anomalia non risulta sanata.
- Raggiunta l'idoneità, il verificatore approva in modo definitivo la pull request, ratificando lo stato del documento a "Verificato".

==== Pubblicazione
Una volta approvata dal revisore, la pull request viene unita (merge) al branch principale `main`. Tale operazione aziona un workflow automatizzato basato su GitHub Actions#super[G] che si occupa di compilare tutti i file sorgente Typst aggiornati, estrarre i PDF corrispondenti e procedere istantaneamente con il deploy sulla pagina web ufficiale del gruppo.

=== Manutenzione <doc-manutenzione>
Ogni file approvato è da considerarsi stabile ma mai definitivo. Se un componente identifica successivamente imprecisioni formali, omissioni o informazioni divenute obsolete a seguito di nuove scelte infrastrutturali o di design (es. l'inclusione di nuovi widget su *SmartDashboard*), ha la responsabilità di aprire un ticket di segnalazione. Questo darà il via a un nuovo ciclo di manutenzione che porterà all'avanzamento della versione e a una successiva fase di ispezione.

== Gestione delle configurazioni <gestione-configurazioni>
Secondo lo standard ISO/IEC 12207:1995, la gestione delle configurazioni è il processo di applicazione di procedure tecniche e amministrative per l'intera durata del ciclo di vita del software. I suoi obiettivi principali sono:
- Identificare e definire le parti che compongono il prodotto software, associandole a specifiche baseline;
- Controllare sistematicamente le modifiche e il rilascio di tali componenti;
- Registrare lo stato di configurazione e le richieste di modifica;
- Assicurare completezza, coerenza e correttezza dei prodotti di progetto.

=== Strumenti a supporto
Il principale strumento a supporto del processo di gestione delle configurazioni è *GitHub*, che permette di gestire in modo centralizzato e sicuro il versionamento del codice di *SmartDashboard* e della relativa documentazione. Attraverso l'integrazione del sistema di *issue tracking* (*GitHub Issues*) e delle *project board* (*GitHub Projects*), il gruppo pianifica le attività, ne monitora costantemente l'avanzamento e mantiene un controllo rigoroso sulla qualità e sulla tracciabilità dell'intero ciclo di sviluppo.

=== Attività previste
Le attività previste da questo processo sono:
- *Identificazione della configurazione*
- *Controllo della configurazione*
- *Registrazione dello stato di configurazione*
- *Valutazione della configurazione*

=== Identificazione della configurazione
L'identificazione della configurazione consiste nell'individuare in modo univoco tutte le componenti documentali e di codice che formeranno il sistema software. 

È necessario stabilire per ogni prodotto software e per le sue versioni:
- La documentazione che ne sancisce la baseline;
- I riferimenti univoci alla versione;
- Altri dettagli utili all'identificazione.
Questa attività trova il suo culmine durante la progettazione architetturale, in cui vengono definiti i moduli del sistema (es. Raw Data Store, Data Warehouse, Web App e modulo AI) che i programmatori dovranno implementare.

=== Controllo della configurazione <controllo-configurazione>
Il principale strumento a supporto del processo di gestione delle configurazioni è *GitHub*, che permette di gestire in modo centralizzato e sicuro il versionamento del codice di *SmartDashboard* e della relativa documentazione. A questo scopo, il gruppo sfrutta l'ecosistema *GitHub* e i suoi moduli integrati (*GitHub Issues* per l'issue tracking e *GitHub Projects* per le board di avanzamento).
- *GitHub Issues*: utilizzate per descrivere le modifiche da apportare. Ogni issue viene assegnata a un membro specifico che ne assume la responsabilità. Una issue standard è composta da:
  - Un identificativo numerico univoco;
  - Un titolo descrittivo della modifica;
  - Una descrizione dettagliata del compito;
  - L'assegnatario (assignee);
  - Le etichette (labels) per classificare l'intervento;
  - Il collegamento a una milestone e al GitHub Project.

- *GitHub Projects*: collegato alle repository del gruppo, permette di organizzare le attività all'interno degli sprint, favorendo la parallelizzazione del lavoro. Consente la visualizzazione del backlog tramite board Kanban e diagrammi di Gantt.

- *Pull Request (PR) e branch protection*: il branch principale (`main`) di tutte le repository è protetto. L'unico modo per integrarvi delle modifiche è l'apertura di una Pull Request, che impone la revisione obbligatoria e l'approvazione del codice o del testo da parte di un verificatore indipendente (Reviewer).

=== Registrazione dello stato di configurazione
Consiste nel tracciare la cronologia e lo stato di tutte le componenti. Il gruppo adotta il Semantic Versioning (SemVer) descritto in dettaglio nella @doc-versionamento.
- Le versioni in bozza partono da `0.0.1`;
- Le prime stesure complete ma non verificate assumono la forma `0.1.0`;
- Le stesure verificate e stabili raggiungono la versione `1.0.0`;
Ogni documento è inoltre provvisto di un registro delle modifiche per storicizzare sistematicamente gli interventi effettuati.

=== Valutazione della configurazione <valutazione-configurazione>
Consiste nel verificare che il software prodotto possieda una completezza funzionale coerente con i requisiti delineati.
Nel documento di Analisi dei Requisiti è presente una matrice di tracciamento, costantemente aggiornata per garantire che il prodotto sviluppato risponda in modo accurato e verificabile alle aspettative dell'azienda proponente *Ergon Informatica Srl*.

== Accertamento della qualità <accertamento-qualita>
L'accertamento della qualità, basato sullo standard ISO/IEC 12207:1995, mira a garantire oggettivamente che i processi e i prodotti software siano conformi ai requisiti prefissati.
Per prevenire conflitti d'interesse, le attività di ispezione e validazione vengono condotte in modo indipendente dai membri che hanno sviluppato il componente o eseguito il processo sotto esame.

=== Attività previste
Il processo di accertamento della qualità comprende:
- *Implementazione del processo*: definizione di procedure di controllo su misura per le dinamiche e le tecnologie di *SmartDashboard*, al fine di assicurare che i risultati rispettino le attese della proponente.
- *Accertamento della qualità di prodotto*: verifica empirica che il software sviluppato soddisfi i requisiti tramite i test redatti dai verificatori e il calcolo periodico delle metriche di prodotto (es. code coverage, test success rate).
- *Accertamento della qualità di processo*: misurazione sistematica delle metriche di processo per assicurare che le metodologie adottate rimangano efficaci, conformi agli standard interni e rispettino il budget allocato.

I risultati di queste misurazioni e i relativi obiettivi (soglie accettabili e ottimali) sono documentati nel Piano di Qualifica. Il documento include un cruscotto di valutazione, aggiornato al termine di ogni sprint, per fornire una visione storica e oggettiva sull'andamento qualitativo del progetto.