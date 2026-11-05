#import "../Templates/templateLettera.typ": lettera, gloss

#let codice = "C7"
#let nome-capitolato = "SmartDashboard"
#let sottotitolo-capitolato = "Piattaforma di Business Intelligence self-service potenziata da AI"
#let azienda = "Ergon Informatica S.r.l."
#let costo = "11.130,00 €"
#let ore-totali = "558"
#let ore-individuali = "93"
#let scadenza = "30 marzo 2027"

#let url-valutazione = "https://gruppo-akme.github.io/Documentazione/output/Candidatura/Valutazione%20Capitolati.pdf"
#let url-preventivo = "https://gruppo-akme.github.io/Documentazione/output/Candidatura/preventivo_costi.pdf"
#let url-sito = "https://gruppo-akme.github.io/Documentazione/website/"
#let url-repo = "https://github.com/Gruppo-Akme/Documentazione"

#let membri = (
  ("Pietro Giulio", "Bassi", "2137999"),
  ("Mattia", "Cadamuro", "2111534"),
  ("DaXin", "Chen", "2148627"),
  ("Marco", "Giacon", "2123537"),
  ("Davide", "Loparco", "2101088"),
  ("Roberto", "Piovesan", "2101065"),
)

#show: lettera.with(
  titolo: "Lettera di Presentazione",
  data: "5 novembre 2026",
  luogo: "Padova",
  oggetto: "Candidatura per il capitolato d'appalto " + codice + " -- " + nome-capitolato + " (" + azienda + ")",
  versione: "2.0.0",
  stato: "Approvato",
  htmlId: "lettera-presentazione-c7",
  responsabile: "Pietro Giulio Bassi",
  ruolo-responsabile: "Responsabile di Progetto",
  left-signature: "firma-Bassi.jpeg",
  mostra-firma: true,
)

= Candidatura

Egregi Professori Vardanega e Cardin,

con la presente il gruppo *Akme Group* desidera formalizzare la propria candidatura ufficiale per la realizzazione del progetto didattico relativo al capitolato d'appalto *#codice: #nome-capitolato* (#sottotitolo-capitolato), proposto dall'azienda *#azienda*.

A seguito della mancata assegnazione del capitolato C2 (Concierge -- Eggon S.r.l.) nella precedente tornata di candidatura, il gruppo si è riunito tempestivamente per riorganizzare la produzione di documenti e il suo way of working facendo tesoro delle indicazioni del professor Vardanega. Ha dunque riesaminato le alternative progettuali disponibili e con delibera unanime formalizzata nel Verbale Interno del 3 novembre 2026, il team ha scelto con piena convinzione di ricandidarsi per il capitolato *C7*, riconoscendo in esso un eccellente equilibrio tra solidità ingegneristica, stimolo formativo e concreta sostenibilità delle risorse.

= Motivazioni della scelta

L'analisi approfondita svolta dal gruppo ha evidenziato le seguenti motivazioni chiave a sostegno della nostra scelta:

- *Architettura modulare e disaccoppiata:* La netta suddivisione del sistema nei tre layer (Raw Data Store per l'ingestione e storicizzazione dei dati gestionali ERP#super[G], Data Warehouse basato su modello a stella con motore analitico DuckDB#super[G], e Web App responsive con costruttore di dashboard interattivo) garantisce elevata manutenibilità, separazione delle responsabilità e una progettazione architetturale pulita.
- *Ripartizione equilibrata e parallelizzazione:* La struttura modulare regolata da chiare interfacce API REST#super[G] permette un'ottima suddivisione del lavoro tra i 6 componenti (#ore-totali ore produttive complessive, #ore-individuali#text[h] individuali), consentendo di procedere in parallelo su pipeline ETL#super[G], data warehouse, interfaccia utente e layer di intelligenza artificiale.
- *Sviluppo incrementale e sostenibilità economica:* L'approccio raccomandato dal proponente — che prevede il consolidamento e la verifica completa della pipeline di Business Intelligence prima dell'integrazione progressiva dei Large Language Model (LLM#super[G]) per il Text-to-Analytics — mitiga fortemente i rischi tecnici, assicurando il rispetto rigoroso dei tempi e del budget preventivato di #costo.
- *Stack tecnologico moderno e professionalizzante:* L'utilizzo congiunto di librerie ad alte prestazioni per il data processing (Polars), motori OLAP#super[G] colonnari (DuckDB), framework frontend all'avanguardia (React#super[G]) e API commerciali per modelli linguistici con controlli di sicurezza offre un notevole valore formativo per tutti i componenti del gruppo.
- *Supporto continuo e allineamento aziendale:* Ergon Informatica S.r.l. garantisce un costante affiancamento mediante incontri di allineamento quindicinali, referenti tecnici dedicati per il supporto metodologico e la fornitura di un dataset reale per i casi di studio e validazione.

Per una trattazione esaustiva dell'analisi comparativa tra tutti i capitolati esaminati si rimanda al documento di #link(url-valutazione)[Valutazione dei Capitolati].

= Preventivo e termini di consegna

Come analizzato e dettagliato nel documento di #link(url-preventivo)[Dichiarazione degli Impegni e Preventivo Costi], il costo complessivo preventivato per la realizzazione dell'MVP#super[G] è pari a *#costo*. L'impegno orario previsto è ripartito in *#ore-individuali ore produttive* per ciascun membro, per un totale di *#ore-totali ore di gruppo*.

Il gruppo stima la consegna del prodotto finale e la richiesta di accesso al collaudo (Product Baseline) entro il *#scadenza*, rispettando pienamente il limite didattico delle 20 settimane di lavoro.

= Documentazione di riferimento

Tutta la documentazione prodotta dal gruppo è consultabile pubblicamente sul #link(url-sito)[sito ufficiale] e all'interno della #link(url-repo)[repository GitHub#super[G]] di riferimento. In particolare, si segnalano:
- *#link(url-valutazione)[Valutazione dei Capitolati v2.0.0]:* documento di analisi e comparazione approfondita delle proposte d'appalto;
- *#link(url-preventivo)[Dichiarazione degli Impegni e Preventivo Costi v1.0.0]:* analisi dei ruoli, ripartizione oraria ed economica, diagramma PERT e piano di mitigazione dei rischi;
- *Verbali interni ed esterni:* resoconti formali e tracciati di tutti gli incontri con committente, proponenti e riunioni di coordinamento del team. Segnaliamo inoltre che l'incontro con l'azienda Ergon è stato già effettuato in data odierna, confermandoci la validità del progetto proposto. Il verbale non è ancora visibile perché non abbiamo ancora ricevuto la firma del referente.

= Componenti del gruppo

Il gruppo *Akme Group* è composto da:

#v(0.3em)

#align(center)[
  #table(
    columns: (1.5fr, 1.5fr, 1.2fr),
    align: (left + horizon, left + horizon, center + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + luma(200)) },
    fill: none,
    inset: (y: 6.5pt, x: 8pt),
    table.header([*Nome*], [*Cognome*], [*Matricola*]),
    ..membri.flatten(),
  )
]

#v(0.6em)

Rimanendo a completa disposizione per qualsiasi eventuale chiarimento o confronto, porgiamo cordiali saluti.
