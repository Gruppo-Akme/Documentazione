#import "../../Templates/templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale esterno 22/10/2026",
  stato: "Approvato",
  versione: "1.0.0",
  registro-modifiche: (
    ("1.0.0", "24/10/2026", "Pietro Giulio Bassi", "Membro Gruppo", "Stesura iniziale del verbale esterno post-incontro con Halue"),
  ),
  odg: (
    "Gestione delle Scansioni Prolungate e Durabilità con Vercel Workflows",
    "Isolamento Multi-Tenant tramite Row Level Security (RLS) e Negoziabilità Requisiti",
    "Tolleranza nell'Analisi Statica e Parsing dei Temi Liquid/JSON",
    "Motore di Regole Deterministico ed Estendibilità Programmatica",
    "Dimensionamento e Popolamento dello Store Shopify di Test",
    "Archiviazione e Confronto (Diff) degli Snapshot del Grafo",
  ),
  partecipanti: (
    "Valentino Baraldo (Halue S.r.l. SB - Referente Aziendale Proponente)",
    "Pietro Giulio Bassi",
    "Davide Loparco",
    "Roberto Piovesan",
    "DaXin Chen",
  ),
  distribuzione: (
    "Akme Group",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
    "Halue S.r.l. SB",
  ),
  verificatore-interno: "Pietro Giulio Bassi",
  left-signature: "firma-Bassi.jpeg",
  verificatore-esterno: "Valentino Baraldo (Halue S.r.l. SB)",
  right-signature: "firma-Baraldo.jpeg",
  tipo-verbale: "Esterno",
)

= Introduzione
Il presente verbale attesta lo svolgimento dell'incontro di chiarimento ed approfondimento tenutosi in data *22 Ottobre 2026*, dalle ore 15:30 alle ore 16:15, in modalità telematica via videoconferenza (Google Meet). La riunione è stata organizzata per discutere i dettagli tecnici, architetturali e metodologici relativi al *Capitolato C8: Sonar - Documentazione vivente di uno store Shopify*, proposto dall'azienda *Halue S.r.l. Società Benefit* (Viale Mentana 41, Parma) nell'ambito del corso di Ingegneria del Software (A.A. 2026/2027) del Corso di Laurea in Informatica presso l'Università degli Studi di Padova.

All'incontro hanno preso parte:
- *Valentino Baraldo* (Amministratore e Product Owner, Halue S.r.l. SB) - Referente Aziendale Proponente;
- I seguenti componenti del gruppo *Akme Group*:
  - Pietro Giulio Bassi
  - Davide Loparco
  - Roberto Piovesan
  - DaXin Chen

= Preparazione all'Incontro
In preparazione alla riunione, il gruppo di lavoro si è riunito per analizzare nel dettaglio il documento di capitolato fornito dall'azienda e fare emergere i dubbi principali inerenti all'architettura di riferimento (Vercel Workflows, Supabase RLS), all'integrazione con le API di Shopify, al parsing dei temi Liquid/JSON e ai confini dell'Intelligenza Artificiale. Le prime 4 domande sono state formalizzate e trasmesse preventivamente all'azienda via email per consentire un confronto fluido ed efficace durante la sessione sincrona.

= Resoconto della Riunione
Di seguito viene fornita la rendicontazione puntuale di tutti i quesiti trattati durante la riunione. Le prime quattro domande corrispondono esattamente a quelle inviate preventivamente via email, mentre i quesiti 3.5 e 3.6 rappresentano gli interventi e i chiarimenti aggiuntivi emersi durante la discussione diretta con il referente aziendale.

== Gestione delle Scansioni Prolungate e Durabilità con Vercel Workflows
- *Quesito / Domanda Posta:* \
  _"Tenendo conto del modello a punti delle Admin API di Shopify[G] e della necessità di gestire scansioni lunghe senza incorrere in blocchi di throttling, in che modo l'utilizzo dei Vercel Workflows (use workflow[G], use step) garantisce la ripresa automatica in seguito a un deploy o a un errore di rete?"_
- *Sintesi della Risposta (Halue S.r.l. SB):*
  - *Concetto di Durable Execution e Vercel Workflows:* Valentino Baraldo spiega che l'orchestrazione delle scansioni dello store richiede la gestione di processi a lunga esecuzione e suscettibili a interruzioni, rate limiting a punti delle Admin API di Shopify o riavvii dei container. L'uso dei Vercel Workflows (ispirati a standard industriali come Temporal) garantisce la proprietà di "durabilità" (_durable execution_).
  - *Persistenza dello Stato e Resilienza:* Suddividendo il flusso di acquisizione in step atomici (`use step`), il sistema salva automaticamente lo stato al termine di ciascuna fase. In caso di errore di rete, deploy dell'applicazione o sospensione per rate limit, l'esecuzione non riparte da zero ma riprende esattamente dall'ultimo step completato, preservando la consistenza dei dati.
  - *Flessibilità di Adozione per PoC e MVP:* Il proponente evidenzia la flessibilità dell'approccio: per la prima fase di Proof of Concept[G] (PoC) il gruppo può scegliere di iniziare con job più semplici e introdurre i Vercel Workflows per l'MVP finale, o concordare insieme la struttura più idonea.

== Isolamento Multi-Tenant tramite Row Level Security (RLS) e Negoziabilità Requisiti
- *Quesito / Domanda Posta:* \
  _"Viene richiesto che l'isolamento tra organizzazioni sia imposto direttamente tramite Row Level Security[G] (RLS) di PostgreSQL. Avete particolari raccomandazioni su come strutturare le policy RLS in Supabase per gestire in modo efficiente il grafo delle entità e delle dipendenze?"_
- *Sintesi della Risposta (Halue S.r.l. SB):*
  - *Sicurezza Multi-Tenant a Livello Database:* In un'architettura SaaS condivisa, i dati di molteplici tenant risiedono in un database comune. La Row Level Security (RLS) di PostgreSQL[G] e Supabase[G] assicura che l'isolamento sia applicato a livello di singola riga dal database stesso tramite ID utente/tenant, proteggendo i dati anche in caso di bug o vulnerabilità della logica applicativa superiore.
  - *Negoziabilità e Rescoping dei Requisiti:* Il proponente fa una precisazione fondamentale: tutti i requisiti del capitolato sono pienamente *NEGOZIABILI*. L'obiettivo del progetto didattico è verificare la fattibilità dell'idea. Se l'impostazione delle RLS sul grafo dovesse risultare troppo complessa per la fase di PoC, può essere rimandata all'MVP o ridimensionata previo accordo tra le parti.

== Tolleranza nell'Analisi Statica e Parsing dei Temi Liquid/JSON
- *Quesito / Domanda Posta:* \
  _"Per l'analisi dei file Liquid/JSON dei temi Shopify e il parsing di codice non fidato all'interno di Vercel Sandbox, quale livello di tolleranza è richiesto in presenza di codice non perfettamente formato o script di terze parti offuscati?"_
- *Sintesi della Risposta (Halue S.r.l. SB):*
  - *Caratteristiche di Liquid e Script Esterni:* Liquid è un linguaggio di templating interpretabile e non compilato (M-V-C dove la vista accede a oggetti come `product.description`). Gli script JavaScript o CSS di terze parti provenienti da domini esterni sono asset già compilati e non devono essere analizzati internamente.
  - *Principio dell'Analisi Onesta:* Non si richiede un parser sintattico perfetto per ogni codice malformato od ostile. L'obiettivo è un'ispezione "onesta": il sistema deve riconoscere i riferimenti trasparenti a campi e sezioni e dichiarare esplicitamente ciò che non riesce ad analizzare, senza bloccare la scansione.

== Motore di Regole Deterministico ed Estendibilità Programmatica
- *Quesito / Domanda Posta:* \
  _"Il capitolato specifica che i modelli linguistici (tramite AI Gateway e AI SDK) possono essere usati solo per generare descrizioni in linguaggio naturale o normalizzare i nomi, ma mai per decidere se un'entità è orfana. Come strutturare il motore di regole affinché rimanga rigorosamente deterministico e indipendente dai componenti di IA?"_
- *Sintesi della Risposta (Halue S.r.l. SB):*
  - *Decisioni Deterministiche vs IA:* La determinazione di un'entità orfana o codice morto deve basarsi *ESCLUSIVAMENTE* su regole statiche certe (es. assenza di riferimenti nel manifest o nel grafo delle dipendenze). L'IA non interviene mai nel processo decisionale.
  - *Design Semplice ed Estendibile:* Non è richiesto un complesso Rule Engine[G] di letteratura (es. Drools/ruine). L'estendibilità del motore di regole può essere realizzata programmaticamente definendo un'interfaccia comune (es. `Rule`) e implementandola in file/classi separate per ogni regola. Per aggiungere una nuova regola sarà sufficiente creare un nuovo file estendendo tale interfaccia.

== Dimensionamento e Popolamento dello Store Shopify di Test
- *Quesito / Domanda Posta:* \
  _"Riguardo all'ambiente di test e allo store Shopify di sviluppo, qual è il volume di dati raccomandato? La quantità di informazioni nello store deve essere incrementata gradualmente nel tempo o occorre generare subito un dataset molto corposo?"_
- *Sintesi della Risposta (Halue S.r.l. SB):*
  - *Dimensionamento dell'Ambiente di Test:* Non occorre creare uno store con volumi esagerati. Un dataset di circa 1000 prodotti (intesi come combinazioni modelli/colori/varianti, es. 200 modelli in 5 colori ciascuno) è ampiamente sufficiente per simulare un catalogo aziendale reale e testare Sonar.
  - *Generazione Automatizzata:* La popolazione dello store stratificato può essere agevolmente eseguita tramite script e strumenti generativi (LLM/Claude) per caricare prodotti, metafield, app e configurazioni di prova.

== Archiviazione e Confronto (Diff) degli Snapshot del Grafo
- *Quesito / Domanda Posta:* \
  _"In merito alla gestione degli snapshot per garantire la documentazione vivente e il confronto (diff) nel tempo, è necessario implementare una struttura di tracciamento continuo (log delle variazioni) o è preferibile salvare l'intero grafo per ogni snapshot e confrontare i blocchi completi?"_
- *Sintesi della Risposta (Halue S.r.l. SB):*
  - *Salvataggio e Serializzazione degli Snapshot:* Il database relazionale (Supabase) mantiene il grafo dello stato "vivo" corrente. Gli snapshot storici possono essere serializzati come file completi in un formato di markup portabile per grafi (es. XML/JSON esteso) e archiviati in un data store (es. Vercel Blob).
  - *Esecuzione del Diff:* Per confrontare due scansioni, l'applicazione recupera le due rappresentazioni complete e calcola la differenza (_diff_) individuando entità aggiunte, rimosse o modificate.

= Conclusioni e Decisioni Prese
L'incontro si è rivelato estremamente proficuo ed illuminante per il gruppo di lavoro. Le spiegazioni fornite da Valentino Baraldo hanno chiarito in modo esaustivo la vision del Capitolato C8 (Sonar), confermando il valore strategico della documentazione vivente per gli store Shopify enterprise e la fattibilità tecnica dello stack Vercel + Supabase.

#figure(
  table(
    columns: (2.2fr, 2.2fr, 1fr),
    align: (left + horizon, left + horizon, left + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 5pt),

    [*Decisione / Orientamento*], [*Note e Dettagli*], [*Stato*],
    [Approccio Flessibile e Incrementale], [Massima disponibilità dell'azienda al rescoping dei requisiti obbligatori qualora emergessero complessità tecniche], [Approvato],
    [Architettura Vercel Workflows], [Confermata l'adozione dei Vercel Workflows per l'orchestrazione durevole della scansione in vista dell'MVP], [Confermato],
    [Motore di Regole Deterministico], [Definizione del motore tramite pattern programmatico (`Rule` interface) svincolato da componenti di IA], [Confermato],
    [Ambiente di Test Shopify], [Realizzazione dello store di sviluppo con circa 1000 prodotti mediante script e strumenti generativi], [In corso],
  ),
  caption: [Principali decisioni e orientamenti emersi],
) <tab-decisioni-esterne>

Il gruppo di lavoro esprime un sincero ringraziamento all'azienda *Halue S.r.l. Società Benefit* e al referente *Valentino Baraldo* per la grande disponibilità, chiarezza e professionalità dimostrate.