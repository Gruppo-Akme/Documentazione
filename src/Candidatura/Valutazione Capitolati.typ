#import "../Templates/templateDocumentiGenerici.typ": report, gloss

// Numerazione 1, 1.1, 1.1.1 (sovrascrive quella del template)
#show heading: set heading(numbering: "1.1.1")

// Indice a 3 livelli (il template lo limita a 2)
#show outline: it => if it.depth == 3 { it } else { outline(title: none, indent: auto, depth: 3) }


// Capitoli: grassetto, senza puntini, più spazio sopra
#show outline.entry.where(level: 1): set block(above: 1.2em)
#show outline.entry.where(level: 1): set text(weight: "bold")
#show outline.entry.where(level: 1): set outline.entry(fill: none)


#show: report.with(
  titolo: "Valutazione dei Capitolati d'Appalto",
  tipo-documento: "Documento interno",
  stato: "Bozza",
  registro-modifiche: (
    ("0.1", "26/10/2026", "Nome Autore", "Nome Verificatore", "Creazione e stesura documento"),
  ),
)

// Funzione per i capitolati valutati ma non scelti
#let altro-capitolato(codice, nome, proponente, descrizione, forza, criticita) = [
  == Capitolato #codice – #nome
  === Descrizione
  *Proponente:* #proponente \
  #descrizione

  === Punti di forza
  #list(..forza.map(((titolo, testo)) => [*#titolo:* #testo]))

  === Criticità riscontrate
  #list(..criticita.map(((titolo, testo)) => [*#titolo:* #testo]))
]

= Introduzione
Nel presente documento viene esposta l'analisi dei capitolati d'appalto esaminati dal gruppo *Akme Group*, al fine di individuare quello più adatto alle competenze e agli obiettivi del team.

Vengono illustrate le motivazioni che hanno portato alla candidatura per il capitolato *C2 - Concierge*, proposto da _Eggon_, insieme alle altre proposte prese in considerazione durante la valutazione.

= Capitolato Selezionato: C2 - Concierge
== Descrizione
*Proponente:* Eggon s.r.l. \
Il capitolato C2 richiede lo sviluppo di *NEXUM Concierge*, un assistente conversazionale da inserire nella PWA della piattaforma NEXUM, dedicata alla comunicazione aziendale e alla gestione dei servizi HR. Tramite una chat testuale, il personale può trovare informazioni, comprendere procedure e accedere ai servizi aziendali usando il linguaggio naturale.

Il Concierge collega la conoscenza aziendale alle funzioni operative della piattaforma. L'MVP è limitato all'area *ferie e permessi* e deve dimostrare quattro capacità:
- rispondere a domande sui regolamenti aziendali, usando fonti caricate dal backoffice;
- spiegare l'uso delle funzioni di NEXUM sulla base dei manuali del prodotto;
- recuperare e presentare i dati personali su ferie e permessi;
- preparare e registrare una richiesta, dopo riepilogo e conferma esplicita della persona.

Il progetto comprende anche un backoffice per caricare, organizzare, sostituire e ritirare le fonti, oltre a autorizzazioni, gestione degli errori e tracciabilità di fonti ed esiti.



== Dominio
Il dominio è quello della gestione HR e della comunicazione aziendale, in particolare ferie e permessi. Dal punto di vista tecnico il progetto riguarda:
- *LLM* e recupero della conoscenza (*RAG*), con citazione delle fonti e astensione quando le informazioni non bastano;
- elaborazione di documenti PDF in modo asincrono;
- integrazione con servizi applicativi tramite *gate* e abilità, con servizi NEXUM di prova o simulatori;
- una PWA come interfaccia per il personale e un backoffice per l'amministrazione.

Stack, modelli e servizi vengono concordati con Eggon.


== Motivazioni della scelta
- *Tecnologie attuali:* il progetto permette di lavorare con modelli linguistici, recupero della conoscenza e integrazione di strumenti, ambiti molto richiesti.
- *Perimetro definito:* l'MVP riguarda solo ferie e permessi, con criteri di accettazione e prove descritti in modo esplicito.
- *Supporto del proponente:* sono previsti incontri periodici, un gruppo Telegram dedicato, un referente Eggon e la fornitura di manuali, regolamenti e dati di prova.
- *Libertà nelle scelte tecniche:* il team può proporre tecnologie e architettura, motivandole rispetto ai risultati.
- *Utilità concreta:* il prodotto risolve un problema reale, ridurre le richieste ripetitive e semplificare l'accesso ai servizi HR.

== Conclusione
Sintesi finale: il capitolato C2 offre un buon equilibrio tra novità tecnologica e ambito circoscritto, ed è quello più coerente con le competenze e gli obiettivi del gruppo. Le principali criticità, come l'ampiezza delle quattro capacità da integrare e la dipendenza dalle API di NEXUM, sono considerate gestibili grazie al percorso in tre fasi e al supporto di Eggon.

= Capitolati di Interesse
== Capitolato C0 – AIRA
=== Descrizione
*Proponente:* San Marco SPA \
Il capitolato C0 propone lo sviluppo di *AIRA* (AI Requests Automation), un tool multimodale basato su Intelligenza Artificiale che riceve richieste da canali eterogenei (e-mail con allegati, note vocali WhatsApp, immagini, cartelle del filesystem), ne estrae il significato e le trasforma in dati strutturati, come JSON o record di database. Le informazioni vengono poi inoltrate in automatico ai sistemi aziendali (portali B2B, ERP, CRM, ticketing) tramite API REST, oppure notificate via e-mail, eliminando i passaggi manuali.

Le funzionalità richieste comprendono il monitoraggio continuo dei canali, un filtro sui dati in ingresso per evitare accessi non autorizzati o commistione di informazioni, l'elaborazione semantica con LLM, l'avvio automatico di azioni e un'interfaccia amministrativa per configurazione, log e persistenza dei dati. Sono opzionali una dashboard analitica e l'invio autonomo di risposte al mittente.


=== Dominio
Il dominio è l'automazione dei processi commerciali e di assistenza in ambito Business-to-Business: inserimento di ordini d'acquisto, apertura di ticket, prenotazione di appuntamenti, segnalazione di opportunità e richiesta di documenti contabili. Dal punto di vista tecnico il progetto riguarda:
- acquisizione multimodale: speech-to-text per l'audio e OCR / visione artificiale per immagini e documenti scansionati;
- elaborazione semantica con LLM, con identificazione di entità e intenzioni;
- integrazione con applicativi esterni tramite API REST;
- un'interfaccia web amministrativa e un database relazionale interno.

Le tecnologie consigliate sono Java con Spring Boot, LangChain4j, Angular e TypeScript, Whisper, Tesseract ed EasyOCR, con persistenza su SQLite, MariaDB o PostgreSQL.


=== Punti di forza
- *Tecnologie attuali e varie:* il progetto unisce LLM, speech-to-text, OCR e visione artificiale, un insieme di competenze molto spendibili.
- *Ambito concreto e comprensibile:* automatizzare l'inserimento di ordini e richieste è un caso d'uso chiaro, con benefici evidenti per l'azienda.
- *Stack consigliato e architettura indicata:* il capitolato propone strumenti consolidati (Java/Spring Boot, Angular) e uno schema architetturale di partenza.
- *Supporto del proponente:* San Marco affianca il gruppo con figure dedicate per supporto tecnico e setup degli ambienti, con metodologia Agile e referenti indicati.
- *Struttura modulare:* è richiesta un'architettura che permetta di aggiungere in futuro nuovi canali e funzionalità.


=== Criticità riscontrate
- *Molti canali e formati da gestire:* e-mail, WhatsApp, immagini, audio e filesystem richiedono tecnologie diverse, con il rischio di disperdere il lavoro su troppi fronti.
- *Qualità e affidabilità dell'estrazione:* l'OCR su foto di cataloghi e il riconoscimento vocale possono dare errori, e la mappatura sui codici articolo ufficiali richiede una validazione accurata.
- *Dati sensibili e isolamento:* è richiesto un filtro di sicurezza con identificazione dei tenant, che aggiunge complessità progettuale.
- *Scalabilità richiesta:* l'architettura deve sostenere elevati volumi di ordini, e la pipeline deve essere coperta da test di unità e di integrazione.
- *Integrazione con sistemi esterni:* ERP, CRM e portali B2B richiedono API di cui il gruppo dipende.

=== Conclusioni
Il capitolato C0 è stato valutato come la nostra seconda scelta: offre un ambito attuale e concreto, con un buon supporto aziendale, ma abbiamo giudicato più equilibrato il capitolato C2 – Concierge.

== Capitolato C8 – Sonar
=== Descrizione
*Proponente:* Halue S.r.l. Società Benefit \
Il capitolato C8 richiede lo sviluppo di *Sonar*, un'applicazione web che si collega a uno store Shopify di grandi dimensioni, ne interroga sistematicamente configurazioni e codice, e ricostruisce la mappa di cosa esiste, di cosa dipende da cosa e di cosa non serve più. Il problema nasce dalla stratificazione degli store nel tempo: app dimenticate ma ancora fatturate, webhook verso fornitori non più attivi, campi personalizzati (metafield) mai letti e codice di tema non più referenziato, con una conoscenza che non è scritta da nessuna parte.

Il sistema deve produrre due risultati: una *documentazione sempre aggiornata* dello store, consultabile via web ed esportabile in Markdown o HTML, e un *rapporto di igiene tecnica* che segnala orfani e codice morto, con una motivazione esplicita per ogni segnalazione. Le funzioni principali sono la scansione durevole dello store, la costruzione di un modello a grafo delle entità e delle dipendenze, l'analisi statica del tema, un motore di regole estensibile, il confronto tra snapshot e l'esportazione della documentazione. Sonar è di sola lettura e non modifica lo store.

=== Dominio
Il dominio è l'e-commerce su piattaforma Shopify (Shopify Plus) e in particolare la documentazione e la manutenzione di store enterprise: passaggi di consegne tra agenzie, onboarding di nuovi team, audit di spesa sulle app e valutazione di migrazioni (replatforming#sub[G]). Dal punto di vista tecnico il progetto riguarda:
- acquisizione dati dalle Admin GraphQL API di Shopify, con gestione del rate limiting#sub[G] e scansioni lunghe, ripartibili e osservabili;
- normalizzazione dei dati in un grafo di entità e dipendenze, con fonte dell'evidenza e livello di confidenza (accertato, probabile, ipotizzato);
- analisi statica del codice di tema (Liquid, JSON, JavaScript, CSS);
- campionamento statistico per misurare l'uso reale dei campi personalizzati;
- tecnologie vincolanti: Next.js e Vercel (Workflows, Cron Jobs), Supabase (PostgreSQL con Row Level Security e autenticazione Google) e TypeScript.

=== Punti di forza
- *Problema reale e ben motivato:* il capitolato descrive in modo chiaro una necessità concreta di Halue, con costi e scenari d'uso precisi.
- *Requisiti e criteri di accettazione molto dettagliati:* obbligatori, desiderabili e opzionali sono elencati con identificativi, e i criteri di accettazione sono misurabili.
- *Spazio di negoziazione:* l'elenco dei requisiti obbligatori può essere ridotto con una proposta motivata, concordata per iscritto con Halue.
- *Architettura aperta:* quella proposta è solo un'ipotesi non vincolante; il gruppo può proporne una diversa se motivata.
- *Uso dell'AI incoraggiato:* gli strumenti di sviluppo basati su AI sono previsti e la complessità è calibrata assumendo che vengano usati.
- *Supporto e presidio dei consumi:* sono previsti incontri ogni due settimane, una casella di posta dedicata con risposta entro un giorno lavorativo e un controllo periodico dei limiti dei piani gratuiti.
- *Competenze spendibili:* grafi, API reali, esecuzione durevole e analisi statica sono temi formativi di alto livello.

=== Criticità riscontrate
- *Stack tecnologico vincolante:* Next.js su Vercel, Vercel Workflows, Supabase e TypeScript sono obbligatori; richiedere una deroga è possibile solo entro la fase di analisi dei requisiti.
- *Molti requisiti obbligatori:* sono previsti venti requisiti funzionali obbligatori, sette di qualità e sicurezza e sette non funzionali, e l'ambito è ampio rispetto al tempo disponibile.
- *Criteri di accettazione stringenti:* richiedono almeno il 95% di test superati, copertura di almeno il 70%, tasso di falsi positivi sulle segnalazioni ad alta severità non superiore al 10% e una documentazione giudicata utilizzabile in un passaggio di consegne reale.
- *Dominio Shopify da apprendere:* modello a punti delle API, metafield, blocchi app e Shopify Functions richiedono tempo di studio prima di poter progettare.
- *Ambiente di lavoro da costruire:* Halue non fornisce store, dati né infrastruttura; il gruppo deve creare e popolare da sé uno store di sviluppo con una stratificazione realistica.
- *Limiti dei piani gratuiti:* Supabase sospende i progetti inattivi e Vercel impone soglie mensili ridotte su Workflows, Blob, Sandbox e AI Gateway, il che incide sulle ri-scansioni pianificate.
- *Nessun incontro in presenza e nessun canale di messaggistica condiviso:* la comunicazione è affidata a videoconferenze e a una casella di posta.

=== Conclusioni
Il capitolato C8 è stato valutato come la nostra terza scelta: è ben strutturato e offre un buon margine di negoziazione, ma lo stack vincolante, l'ampiezza dei requisiti obbligatori e la necessità di costruire autonomamente l'ambiente di lavoro ci hanno portato a preferire i capitolati C2 e C0.

= Altri Capitolati Valutati
== Capitolato C1 – AURA
=== Descrizione
*Proponente:* Vimar S.p.A. \
Il capitolato C1, proposto dall'Area Ricerca e Sviluppo Elettronica di Vimar, richiede di progettare e realizzare *AURA* (_AI for Understanding, Reasoning and Automation_), un dimostratore IoT + AI per il settore residenziale. Il cuore del progetto è un *server MCP* (Model Context Protocol) e un client MCP che rendono le KNX IoT 3rd party API di Vimar utilizzabili da servizi di intelligenza artificiale generativa commerciali, come Claude, ChatGPT, Copilot e Gemini. In questo modo l'utente può interrogare e comandare il proprio impianto domotico View Wireless in linguaggio naturale, autenticandosi con il proprio account MyVimar.

Il progetto comprende tre componenti obbligatori: un'infrastruttura Cloud-ready basata su container e Infrastructure as Code, il server e il client MCP, e il collegamento con un agente o modello AI esterno che gestisca casi d'uso base e avanzati (selezione dell'impianto, lettura e scrittura dello stato dei dispositivi, richieste ambigue o implicite, conferme per comandi estesi). Sono previsti come opzionali o nice-to-have il supporto al multi-impianto, allo storico, agli scenari composti e ai trigger.

=== Punti di forza
- *Tecnologia attuale e di interesse:* il protocollo MCP e l'integrazione con LLM commerciali sono un ambito molto recente, con competenze spendibili sul mercato.
- *Kit fisico fornito da Vimar:* ogni gruppo riceve un kit portatile con gateway, attuatori per luci e porta, comando tapparelle, sensori di presenza, termostato e pulsante allarme, oltre all'accesso alle API KNX IoT.
- *Supporto del proponente:* sono previsti SAL bisettimanali, referenti Vimar contattabili via e-mail e incontri di approfondimento su Docker, KNX IoT, MCP e sviluppo con strumenti di AI.
- *Risorse Cloud messe a disposizione:* Vimar fornisce, se richiesto, servizi e spazio su AWS, compresi i servizi AI e LLM.
- *Libertà sullo stack:* i vincoli tecnologici sono pochi (Docker, KNX IoT, OAuth2, Git e licenza open source); è consigliato Python con FastMCP, ma sono ammessi anche TypeScript e Java.
- *Casi d'uso chiari:* il capitolato elenca esempi concreti di interazione, base e avanzati, con le risposte attese, e distingue requisiti obbligatori, opzionali e nice-to-have.
- *Nessuna interfaccia AI da sviluppare:* l'assistente è un servizio esterno già esistente, quindi il lavoro si concentra sull'integrazione e non sulla costruzione di un chatbot.

=== Criticità riscontrate
- *Dipendenza da servizi e hardware esterni:* il progetto si appoggia al kit fisico, alle API KNX IoT e ai servizi AI di terzi; limiti, indisponibilità o cambiamenti di questi servizi sono fuori dal controllo del gruppo.
- *Accesso alla documentazione soggetto a registrazione:* la documentazione KNX IoT è scaricabile solo dopo la registrazione sul sito Vimar e la firma di un documento d'uso.
- *Comportamento dell'AI non completamente controllabile:* i casi d'uso dipendono da come il modello esterno interpreta richieste ambigue o implicite, e rendere i risultati verificabili con i test non è semplice.
- *Vincolo sull'aggiornamento tramite Subscription:* il polling non è ammesso, quindi le notifiche di impianto vanno gestite con il meccanismo push dello standard, più complesso da realizzare e da testare.
- *Requisiti di test elevati:* sono richiesti test di unità, integrazione ed end-to-end, con copertura minima del 75% per unità e integrazione e dell'80% per gli end-to-end.
- *Molti prodotti attesi:* oltre al codice sono richiesti documentazione con modello C4, analisi tecnica con stima dei costi AWS, documentazione del server e del client, manuale di installazione, video dimostrativo e report dei test.
- *Ambito meno incentrato sull'AI:* la parte di intelligenza artificiale è affidata a servizi esterni commerciali, quindi il gruppo lavora più sull'integrazione che sull'AI stessa.
- *Incontri in presenza obbligatori:* sono richiesti almeno due incontri in presenza presso la sede di Padova.