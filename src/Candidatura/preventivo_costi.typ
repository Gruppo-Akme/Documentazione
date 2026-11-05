#import "../Templates/templateDocumentiGenerici.typ": report

#show: body => report(
  titolo: "Dichiarazione degli Impegni",
  stato: "Approvato",
  versione: "1.0.0",
  distribuzione: (
    "Akme Group",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
    "Ergon Informatica S.r.l."
  ),
  htmlId: "dichiarazione-impegni-c7",
  tipo-documento: "Dichiarazione di Impegni",
  index: "1",
  verificatore-interno: "Pietro Giulio Bassi",
  left-signature: "firma-Bassi.jpeg",
  registro-modifiche: (
    (
      "1.0.0",
      "05/11/2026",
      "-",
      "Pietro Giulio Bassi",
      "Revisione finale documento"
    ),
    (
      "0.7.0",
      "05/11/2026",
      "Pietro Giulio Bassi",
      "Daxin Chen",
      "Diagramma PERT e Analisi dei rischi"
    ),
    (
      "0.6.0",
      "4/11/2026",
      "Daxin Chen",
      "Pietro Giulio Bassi",
      "Grafico distribuzione costi"
    ),
    (
      "0.5.0",
      "4/11/2026",
      "Roberto Piovesan",
      "Marco Giacon",
      "Calcoli preventivo costi e tabella corrispettiva"
    ),
    (
      "0.4.0",
      "4/11/2026",
      "Marco Giacon",
      "Roberto Piovesan",
      "Grafico suddivisione oraria e criteri rotazione ruoli"
    ),
    (
      "0.3.0",
      "4/11/2026",
      "Davide Loparco",
      "Daxin Chen ",
      "Stesura suddivisione oraria dei ruoli e tabella corrispettiva"
    ),
    (
      "0.2.0",
      "3/11/2026",
      "Mattia Cadamuro",
      "Daxin Chen",
      "Stesura analisi dei ruoli"
    ),
    (
      "0.1.0",
      "3/13/2026",
      "Pietro Giulio Bassi",
      "Davide Loparco ",
      "Versione iniziale della Dichiarazione di Impegni e Preventivo Costi per C7-SmartDashboard"
    ),
  ),
  body
)

= Introduzione

Il gruppo *Akme Group* si impegna formalmente alla realizzazione del Capitolato *C7 - SmartDashboard: piattaforma di Business Intelligence self-service potenziata da AI*, proposto dall'azienda *Ergon Informatica S.r.l.*, nell'ambito del corso di Ingegneria del Software presso l'Università degli Studi di Padova (A.A. 2026/2027).

Con la presente dichiarazione, i 6 membri del gruppo assumono l'impegno di svolgere con responsabilità, trasparenza e continuità tutte le attività necessarie alla consegna dell'MVP#super[G] (Minimum Viable Product), rispettando le scadenze concordate, le regole del Progetto Didattico e gli standard di qualità definiti.

= Analisi dei Ruoli

I ruoli all'interno del gruppo vengono definiti secondo il regolamento didattico per garantire copertura funzionale, responsabilità chiare e verifica indipendente:

- *Responsabile#super[G] (Resp):* Coordina il gruppo, gestisce la pianificazione e le risorse, pianifica le milestone e rappresenta l'interfaccia verso committente e proponente.
- *Amministratore#super[G] (Amm):* Gestisce l'infrastruttura di lavoro (repository, pipeline di CI/CD, issue tracking) e cura la manutenzione del Way of Working#super[G].
- *Analista#super[G] (Analist):* Definisce i requisiti funzionali e non funzionali specifici della SmartDashboard (pipeline ETL#super[G], Data Warehouse, modello dimensionale Star Schema, integrazione LLM#super[G]).
- *Progettista#super[G] (Progett):* Definisce l'architettura tecnica a tre livelli, la struttura del motore analitico DuckDB#super[G], le interfacce API REST#super[G] e il layer di intelligenza artificiale conversazionale.
- *Programmatore#super[G] (Programm):* Implementa il codice per la web application responsive, il costruttore drag-and-drop di dashboard, la libreria di widget e il pannello assistente AI.
- *Verificatore#super[G] (Verif):* Esegue attività di test unitari, di integrazione, di sistema e validazione delle visualizzazioni generate e dell'accuratezza delle risposte dell'assistente AI.

#pagebreak()

= Impegno Individuale e Rotazione Ruoli

Il gruppo è formato da 6 componenti. Ciascun componente si impegna ad erogare *93 ore produttive*, per un totale complessivo di *558 ore produttive di gruppo*.
Tenendo conto dei preziosi suggerimenti dati dal professor Vardanega, abbiamo concordato
tra noi una distribuzione delle ore che fosse maggiormente flessibile e adattata alle specifiche capacità e disponibilità di ciascun componente. Inoltre la seguente analisi 
è pensata per essere indicativa e non prescrittiva, ogni componente del gruppo si impegna infatti a riconoscere la necessità di essere eventualmente disposto a variare la rendicontazione oraria qui presentata in base alle probabili situazioni impreviste future.
Il responsabile all'inizio di ogni sprint si occupa di verificare che la suddivisione oraria sia adeguata alle necessità degli impegni ed eventualmente di ridistribuire il carico di lavoro. Questo prospetto iniziale è dunque pensato come il documento di base che il responsabile deve opportunamente tenere presente nelle sue valutazioni, così da fornirgli delle coordinate complessive che gli ricordino le specifiche attitudini particolari di ciascuno. 

== Tabella Suddivisione Ore per Componente e Ruolo

#align(center)[
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.2fr),
    align: center + horizon,
    [*Componente*], [*Resp*], [*Amm*], [*Analist*], [*Progett*], [*Programm*], [*Verif*], [*Totale*],
    [Pietro Giulio Bassi], [13h], [7h],   [5h],    [20h],     [19h],     [29h],       [93h],
    [Roberto Piovesan],    [7h],  [8h],   [5h],    [25h],     [30h],     [18h],   [93h],
    [Marco Giacon],        [9h],  [14h],  [10h],   [14h],     [36h],     [10h],     [93h],
    [DaXin Chen],          [12h], [3h],   [10h],   [11h],     [33h],     [24h], [93h],
    [Mattia Cadamuro],     [15h], [11h],  [9h],    [10h],     [28h],     [20h], [93h],
    [Davide Loparco],      [8h],  [9h],   [10h],    [25h],    [28h],     [13h], [93h],
    [*Totale Ore*],      [*64h*],  [*52h*], [*49h*], [*105h*], [*174h*],  [*114h*], [*558h*]
  )
]

== Motivazione della Ripartizione Oraria

1. *Sviluppo e Validazione (Programmatore + Verificatore):* Dedicate 288 ore complessive (174h + 114h), pari al *51.6%* del totale. Tale impegno garantisce lo sviluppo della web app responsive, del builder drag & drop, dell'integrazione delle librerie di charting e un testing rigoroso sulla generazione corretta delle visualizzazioni tramite linguaggio naturale.
2. *Progettazione (Progettista):* Destinate 105 ore (*18.8%*). L'architettura a tre livelli (Raw Data Store, Data Warehouse con DuckDB e Web App) richiede un design accurato delle API, del modello dimensionale Star Schema e dei flussi di comunicazione con il layer AI.
3. *Analisi dei Requisiti (Analista):* Destinate 49 ore (*8.8%*), necessarie per definire le specifiche della pipeline ETL (tramite Polars/pandas), strutturare i requisiti del self-service BI e mappare le funzionalità del Large Language Model.
4. *Coordinamento e Supporto (Responsabile + Amministratore):* Assegnate 116 ore (*20.7%*) per garantire la gestione della pianificazione, gli incontri di allineamento quindicinali con Ergon e la stabilità degli ambienti di integrazione.

== Grafico della Suddivisione Oraria per Ruolo

Di seguito viene illustrata la distribuzione visiva delle ore assegnate a ciascun ruolo sul monte ore complessivo ($558h$), con evidenza del *Totale: 100%*:

#align(center)[
  #block(
    fill: rgb("#f8f9fa"),
    inset: 14pt,
    radius: 6pt,
    stroke: 0.5pt + luma(200),
    [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [*Distribuzione Ore Ruoli*], [*Totale: 100%*]
      )
      #v(6pt)
      #stack(
        dir: ltr,
        rect(width: 31.2%, height: 12pt, fill: rgb("#4A90E2")), // Programmatore (174h)
        rect(width: 20.4%, height: 12pt, fill: rgb("#50E3C2")), // Verificatore (114h)
        rect(width: 18.8%, height: 12pt, fill: rgb("#F5A623")), // Progettista (105h)
        rect(width: 11.5%, height: 12pt, fill: rgb("#9013FE")), // Responsabile (64h)
        rect(width: 9.3%,  height: 12pt, fill: rgb("#BD10E0")), // Amministratore (52h)
        rect(width: 8.8%,  height: 12pt, fill: rgb("#B8E986")), // Analista (49h)
      )
      #v(10pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 15pt,
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#4A90E2"))) *Programmatore:* 174h (31.2%) \
            #box(square(size: 8pt, fill: rgb("#50E3C2"))) *Verificatore:* 114h (20.4%) \
            #box(square(size: 8pt, fill: rgb("#F5A623"))) *Progettista:* 105h (18.8%)
          ]
        ],
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#9013FE"))) *Responsabile:* 64h (11.5%) \
            #box(square(size: 8pt, fill: rgb("#BD10E0"))) *Amministratore:* 52h (9.3%) \
            #box(square(size: 8pt, fill: rgb("#B8E986"))) *Analista:* 49h (8.8%)
          ]
        ]
      )
    ]
  )
]

== Criteri di Rotazione dei Ruoli

Il gruppo adotta un piano di rotazione periodica strutturato per massimizzare la crescita formativa di ciascun componente su tutti gli aspetti del ciclo di vita del software:
- *Frequenza:* La rotazione dei ruoli viene effettuata ogni *2 settimane* (coincidente con l'arco temporale di 2 Sprint di lavoro). Questa cadenza permette un adeguato periodo di inserimento operativo ed evita il disorientamento tipico di rotazioni settimanali troppo rapide.
- *Copertura:* Ciascun membro del gruppo, nell'arco temporale del progetto didattico, avrà l'opportunità di ricoprire tutti i ruoli previsti, garantendo piena equità formativa.
- *Gestione dei Conflitti di Interesse:* Le regole di rotazione garantiscono in modo l'assenza di conflitti d'interesse: nessun componente può ricoprire contemporaneamente il ruolo di programmatore/progettista e di verificatore sul medesimo artefatto, assicurando così l'indipendenza e l'oggettività delle attività di controllo di qualità.
- *Passaggio di Consegne:* Al termine di ogni ciclo di rotazione, ogni membro si impegna a redigere un breve resoconto e a trasferire le competenze acquisite al successore, agevolando la continuità operativa del team.

#pagebreak()

= Preventivo Costi

Il calcolo del preventivo viene effettuato applicando le tariffe orarie ufficiali dei ruoli definite dal Regolamento del Progetto Didattico.

== Tabella Preventivo Economico

#align(center)[
  #table(
    columns: (2fr, 1fr, 1.5fr, 1.5fr),
    align: (left, center, center, right),
    [*Ruolo*], [*Ore*], [*Costo Orario*], [*Totale*],
    [Responsabile], [64h], [30,00 €/h], [1.920,00 €],
    [Amministratore], [52h], [20,00 €/h], [1.040,00 €],
    [Analista], [49h], [25,00 €/h], [1.225,00 €],
    [Progettista], [105h], [25,00 €/h], [2.625,00 €],
    [Programmatore], [174h], [15,00 €/h], [2.610,00 €],
    [Verificatore], [114h], [15,00 €/h], [1.710,00 €],
    [*Totale Preventivo*], [*558h*], [-], [*11.130,00 €*]
  )
]

*Nota di conformità:* Il costo totale stimato è di *11.130,00 €*. Esso è perfettamente compreso nel limite invalicabile di preventivo per gruppi di 6 persone, ed è ampiamente superiore alla soglia minima ammissibile in candidatura ($12.000,00 times 6/7 approx 10.285,71 € $).

== Grafico della Distribuzione dei Costi

#align(center)[
  #block(
    fill: rgb("#f8f9fa"),
    inset: 14pt,
    radius: 6pt,
    stroke: 0.5pt + luma(200),
    [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [*Distribuzione Costi per Ruolo*], [*Totale: 100%*]
      )
      #v(6pt)
      // Barra unificata al 100% per i costi
      #stack(
        dir: ltr,
        rect(width: 23.6%, height: 12pt, fill: rgb("#F5A623")), // Progettista (2.625 €)
        rect(width: 23.5%, height: 12pt, fill: rgb("#4A90E2")), // Programmatore (2.610 €)
        rect(width: 17.2%, height: 12pt, fill: rgb("#9013FE")), // Responsabile (1.920 €)
        rect(width: 15.4%, height: 12pt, fill: rgb("#50E3C2")), // Verificatore (1.710 €)
        rect(width: 11.0%, height: 12pt, fill: rgb("#B8E986")), // Analista (1.225 €)
        rect(width: 9.3%,  height: 12pt, fill: rgb("#BD10E0")), // Amministratore (1.040 €)
      )
      #v(10pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 15pt,
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#F5A623"))) *Progettista:* 2.625,00 € (23.6%) \
            #box(square(size: 8pt, fill: rgb("#4A90E2"))) *Programmatore:* 2.610,00 € (23.5%) \
            #box(square(size: 8pt, fill: rgb("#9013FE"))) *Responsabile:* 1.920,00 € (17.2%)
          ]
        ],
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#50E3C2"))) *Verificatore:* 1.710,00 € (15.4%) \
            #box(square(size: 8pt, fill: rgb("#B8E986"))) *Analista:* 1.225,00 € (11.0%) \
            #box(square(size: 8pt, fill: rgb("#BD10E0"))) *Amministratore:* 1.040,00 € (9.3%)
          ]
        ]
      )
    ]
  )
]

#pagebreak()

= Pianificazione Temporale e Diagramma PERT

Il progetto è articolato sulle milestone principali del corso: *RTB (Requirements and Technology Baseline)* e *PB (Product Baseline)*.

== Diagramma PERT delle Attività

Di seguito viene illustrata la rete delle dipendenze logiche e temporali tra le macro-attività di progetto (in evidenza il cammino critico):

#align(center)[
  #block(
    fill: rgb("#f8f9fa"),
    inset: 16pt,
    radius: 8pt,
    stroke: 0.5pt + luma(180),
    [
      #text(weight: "bold", size: 12pt, fill: rgb("#1a2a3a"))[Diagramma PERT delle Attività - Capitolato C7]
      #v(0.8em)
      
      #let nodeTask(num, textLabel) = block(
        fill: rgb("#4A90E2"),
        inset: (x: 8pt, y: 6pt),
        radius: 6pt,
        stroke: 1pt + rgb("#2A52BE"),
        align(center)[#text(fill: white, weight: "bold", size: 9pt)[#num] \ #text(fill: white, size: 8pt)[#textLabel]]
      )
      
      #let nodeMilestone(num, textLabel) = block(
        fill: rgb("#E94B3C"),
        inset: (x: 8pt, y: 6pt),
        radius: 12pt,
        stroke: 1pt + rgb("#B22222"),
        align(center)[#text(fill: white, weight: "bold", size: 9pt)[#num] \ #text(fill: white, size: 8pt)[#textLabel]]
      )

      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr),
        align: center + horizon,
        row-gutter: 1.2em,
        
        nodeTask("01", "Avvio & WoW Setup"), [#text(12pt)[$-->$]], nodeTask("02", "Analisi ETL & DWH"), [#text(12pt)[$-->$]], nodeTask("03", "Studio Tech DuckDB"),
        grid.cell(colspan: 5)[#v(-0.2em)],
        nodeTask("04", "Progettazione P.o.C."), [#text(12pt)[$-->$]], nodeTask("05", "Sviluppo Pipeline BI"), [#text(12pt)[$-->$]], nodeMilestone("RTB", "Milestone RTB"),
        
        grid.cell(colspan: 5)[#v(0.5em) #line(length: 80%, stroke: 0.5pt + luma(200)) #v(0.5em)],
        
        nodeTask("06", "Design Web App & UI"), [#text(12pt)[$-->$]], nodeTask("07", "Drag & Drop Builder"), [#text(12pt)[$-->$]], nodeTask("08", "Testing BI & Widget"),
        grid.cell(colspan: 5)[#v(-0.2em)],
        nodeTask("09", "Integrazione LLM/AI"), [#text(12pt)[$-->$]], nodeTask("10", "Validazione Finale"), [#text(12pt)[$-->$]], nodeMilestone("PB", "MVP Finale")
      )
      
      #v(0.8em)
      #grid(
        columns: (auto, auto),
        column-gutter: 1.5em,
        align: horizon,
        [#box(square(size: 8pt, fill: rgb("#4A90E2"), radius: 2pt)) #text(8pt)[Attività Progetto]],
        [#box(square(size: 8pt, fill: rgb("#E94B3C"), radius: 4pt)) #text(8pt)[Milestone di Rilascio]]
      )
    ]
  )
]

== Descrizione del Cammino Critico

1. *Pipeline BI & PoC#super[G] (Fase RTB):* L'implementazione del flusso di ingestione dei dati grezzi dall'ERP#super[G], la strutturazione del data warehouse con DuckDB e la validazione del modello dimensionale costituiscono il collo di bottiglia principale prima dello sviluppo della web app.
2. *Integrazione AI e Validazione MVP (Fase PB):* La configurazione dell'assistente basato su LLM e la connessione sicura con il modello dati precedono il collaudo end-to-end della piattaforma di Business Intelligence.

= Analisi dei Rischi

Il gruppo ha condotto un'attenta analisi dei rischi potenziali legati allo sviluppo del capitolato *C7 - SmartDashboard*, definendo le relative strategie di mitigazione:

1. *Complessità nella modellazione dimensionale e performance ETL:* La trasformazione dei dati grezzi in Star Schema eseguita su grandi volumi possono presentare criticità di prestazioni.
   - *Mitigazione:* Utilizzo di librerie di manipolazione performanti come Polars e sfruttamento delle ottimizzazioni colonnari di DuckDB.
2. *Integrazione e affidabilità del Layer AI (LLM):* Gestione delle richieste in linguaggio naturale (Text-to-SQL/Analytics) evitando allucinazioni e garantendo che l'AI operi esclusivamente sui metadati autorizzati.
   - *Mitigazione:* Adozione di API commerciali stabili (GPT/Claude) e introduzione di un rigoroso livello di astrazione e controllo sulle query generate.
3. *Superamento del budget orario disponibile:* Rischio di sovrastima o sottostima dell'impegno richiesto per lo sviluppo congiunto della parte BI e delle funzionalità avanzate di intelligenza artificiale.
   - *Mitigazione:* Monitoraggio costante dell'avanzamento tramite consuntivi periodici e adozione di un approccio incrementale (prima la BI end-to-end, poi l'introduzione progressiva delle capacità AI).
4. *Potenziali rallentamenti dovuti a periodi critici:* Durante le vacanze natalizie e la sessione invernale gli impegni dei membri del gruppo potrebbero influire negativamente sulle tempistiche concordate.
  - *Mitigazione:* Tenere conto preventivamente dei periodi critici organizzando di conseguenza le attività, rispettando nei tempi prestabiliti le deadline senza procrastinare e rimandare i task.

= Data di Consegna Prevista

Il gruppo *Akme Group* prevede il completamento delle attività e la richiesta di accesso al collaudo finale entro il *30 marzo 2027*, rispettando il limite delle 20 settimane d'impegno previste dal regolamento didattico.