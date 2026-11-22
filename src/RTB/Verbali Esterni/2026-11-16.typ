#import "../../Templates/templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale esterno 16/11/2026",
  stato: "Approvato",
  versione: "1.0.0",
  ora-inizio: "15:00",
  ora-fine: "15:30",
  registro-modifiche: (
    ("1.0.0", "19/11/2026", "Davide Loparco", "-", "Firma del revisore esterno, approvazione finale e pubblicazione"),
    ("0.2.0", "18/11/2026", "Roberto Piovesan", "Chen Daxin", "Correzioni minori"),
    ("0.1.0", "16/11/2026", "Roberto Piovesan", "Chen Daxin", "Prima stesura del documento"),
  ),


odg: (
    "Pianificazione degli incontri periodici e canali di comunicazione",
    "Identificazione del target di utenti e dei casi d'uso principali",
    "Scelte tecnologiche, repository GitHub e gestione dei dataset di test",
    "Modalità di interazione dell'assistente AI nella generazione dei widget della dashboard",
    "Gestione delle richieste ambigue da parte dell'assistente AI",
    "Differenziazione dei ruoli utente e permessi"
  ),
partecipanti: (
  "Gianluca Carlesso (Ergon Informatica S.r.l. - Referente Aziendale Proponente)",
  "Roberto Piovesan",
  "Davide Loparco",
  "Mattia Cadamuro"
  ),

distribuzione: (
    "Akme Group",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
    "Ergon Informatica S.r.l.",
  ),
  verificatore-interno: "Davide Loparco",
  left-signature: "firma-Loparco.jpeg",
  verificatore-esterno: "Gianluca Carlesso",
  right-signature: "firma-Carlesso.png",
  tipo-verbale: "esterno",
)

= Introduzione
Il presente verbale attesta lo svolgimento del secondo incontro di chiarimento e approfondimento tenutosi in data *16 novembre 2026*, in modalità telematica via videoconferenza (Microsoft Teams). La riunione è stata organizzata per approfondire gli aspetti funzionali, i casi d'uso e le risorse necessarie alla stesura dell'Analisi dei Requisiti.

All'incontro hanno preso parte:
- *Gianluca Carlesso* (Software Developer, Ergon Informatica S.r.l.) - Referente Aziendale Proponente;
- I seguenti componenti del gruppo *Akme Group*:
  - Roberto Piovesan
  - Davide Loparco
  - Mattia Cadamuro

= Preparazione all'Incontro
In vista dell'avvio dei lavori sull'Analisi dei Requisiti, il gruppo di lavoro ha individuato una serie di quesiti volti a definire con precisione gli attori del sistema, le logiche di funzionamento dell'assistente AI e le modalità di gestione dei dati forniti dall'azienda.

= Resoconto della Riunione
Di seguito viene fornita la rendicontazione puntuale dei quesiti trattati e dei chiarimenti emersi durante la discussione sincrona con il referente aziendale.

== Pianificazione degli incontri periodici e canali di comunicazione
- *Quesito / Domanda Posta:* \
  _"È possibile fissare fin da subito un giorno e un orario ricorrente a calendario per gli incontri quindicinali? Inoltre, confermate la creazione di un gruppo WhatsApp#super[G] o Telegram per le comunicazioni rapide?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - Si conferma la cadenza quindicinale per gli incontri di allineamento (con possibilità di infittirla in base alle necessità), indicando il venerdì come giorno preferenziale, anche in fascia pausa pranzo o tardo pomeriggio (entro le 17:30). Il team invierà all'azienda alcune finestre di disponibilità per fissare lo slot definitivo. Per le comunicazioni rapide, l'azienda approva la creazione di un gruppo WhatsApp a cura del team; il referente fornirà il proprio contatto telefonico via email.


== Identificazione del target di utenti e dei casi d'uso principali
- *Quesito / Domanda Posta:*\
 _"Chi sono gli utenti finali principali della Smart Dashboard#super[G] e quali sono i casi d'uso più rilevanti su cui concentrare l'Analisi dei Requisiti?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - Il prodotto è destinato ad aziende italiane (non è quindi richiesto il supporto multilingua) operanti prevalentemente nel settore food & beverage. Gli utenti finali non sono profili tecnici ma figure aziendali già abituate a leggere i dati provenienti dai gestionali ERP#super[G], tra cui responsabili amministrativi, area commerciale (analisi vendite e margini) e area logistica/responsabili di magazzino (monitoraggio spedizioni, tempi di sosta/percorrenza e stato del magazzino). Lo scopo del sistema è offrire una visione d'insieme immediata e semplificare l'estrazione dei dati tramite linguaggio naturale, evitando agli utenti la scrittura manuale di query SQL.

== Scelte tecnologiche, repository GitHub#super[G] e gestione dei dataset di test
- *Quesito / Domanda Posta:*\
 _"Ci sono vincoli specifici sulle tecnologie da adottare per frontend e backend? Inoltre, come dobbiamo gestire la condivisione del repository GitHub e la sicurezza dei dataset e delle chiavi API che ci fornirete?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - Il team ha libertà di scelta sullo stack tecnologico; per il backend e le API viene suggerito l'uso di Python#super[G] con FastAPI, appoggiandosi a un database relazionale (es. PostgreSQL#super[G]) per ospitare i dati grezzi. L'azienda fornirà un dataset di esempio anonimizzato con relativi casi d'uso e le chiavi API per i test. È necessario condividere l'accesso al repository GitHub con il referente aziendale, assicurandosi però di non caricare mai pubblicamente né il dataset né le chiavi API (mantenendo il repository privato o escludendo tali file dal tracciamento).

== Modalità di interazione dell'assistente AI nella generazione dei widget della dashboard
- *Quesito / Domanda Posta:*\
 _"In che modo l'assistente AI modifica la dashboard? Aggiorna la vista in autonomia oppure genera dei widget che l'utente deve poi trascinare manualmente?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - L'aggiunta dei contenuti avviene direttamente tramite l'assistente (agente AI) senza richiedere operazioni manuali di drag-and-drop da parte dell'utente. Il flusso ideale prevede che l'assistente mostri un'anteprima del risultato all'interno della chat e, previa conferma dell'utente, provveda ad aggiungerlo automaticamente alla dashboard.

== Gestione delle richieste ambigue da parte dell'assistente AI
- *Quesito / Domanda Posta:*\
 _"Nel caso in cui l'utente formuli una richiesta generica o ambigua (ad esempio 'mostrami le vendite' senza ulteriori dettagli), l'assistente deve generare una visualizzazione standard oppure chiedere maggiori informazioni?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - In presenza di richieste ambigue o incomplete, l'assistente deve evitare di applicare filtri arbitrari e deve invece porre domande di chiarimento all'utente per circoscrivere esattamente il dato desiderato.

 == Differenziazione dei ruoli utente e permessi
- *Quesito / Domanda Posta:*\
 _"Tutti gli utenti autenticati hanno gli stessi permessi sulla dashboard oppure è prevista una distinzione tra chi può solo visualizzare e chi può creare o amministrare il sistema?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - È preferibile prevedere una separazione dei ruoli su tre livelli: utenti con permessi di sola visualizzazione (viewer), utenti abilitati anche alla creazione e modifica delle dashboard, e un profilo amministratore incaricato della gestione tecnica del sistema (es. reset delle password e configurazione delle chiavi API per l'IA).

= Conclusioni e Decisioni Prese
L'incontro ha fornito gli elementi necessari per avviare la stesura dell'Analisi dei Requisiti, delineando con chiarezza il dominio applicativo, gli attori coinvolti e il comportamento atteso dall'assistente conversazionale.

#figure(
  table(
    columns: (2.2fr, 2.2fr, 1fr),
    align: (left + horizon, left + horizon, left + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 5pt),

    [*Decisione / Orientamento*], [*Note e Dettagli*], [*Stato*],
    [Pianificazione incontri e comunicazione], [Il team invierà via email le proprie disponibilità per fissare lo slot quindicinale fisso e creerà il gruppo WhatsApp appena ricevuto il contatto del referente.], [Confermato],
    [Dominio e target applicativo], [Applicativo destinato ad aziende italiane del settore food & beverage (no multilingua), rivolto a utenti non tecnici (amministrazione, commerciale, logistica).], [Confermato],
    [Sicurezza dati e repository], [Condivisione del repository GitHub con l'azienda; divieto assoluto di esporre pubblicamente le chiavi API e il dataset anonimizzato fornito da Ergon.], [Confermato],
    [Flusso di creazione widget via AI], [L'assistente mostra un'anteprima in chat e, dopo conferma dell'utente, inserisce direttamente il widget nella dashboard.], [Approvato],
    [Gestione ambiguità], [L'assistente AI deve chiedere chiarimenti all'utente di fronte a prompt generici anziché generare grafici arbitrari.], [Approvato],
    [Ruoli utente], [Implementazione di tre profili distinti: visualizzatore (sola lettura), creatore (lettura e modifica dashboard) e amministratore (gestione utenti e chiavi API).], [Approvato],
  ),
  caption: [Principali decisioni e orientamenti emersi],
) <tab-decisioni-esterne>

Il gruppo di lavoro ringrazia nuovamente *Ergon Informatica S.r.l.* e il referente *Gianluca Carlesso* per la disponibilità e il supporto forniti nella definizione dei requisiti di progetto.
