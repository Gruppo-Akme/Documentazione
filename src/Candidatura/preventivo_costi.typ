
#import "../Templates/templateDocumentiGenerici.typ": report

#show: body => report(
  titolo: "Dichiarazione degli Impegni e Preventivo Costi - Capitolato C2 (NEXUM Concierge)",
  stato: "Approvato",
  versione: "1.0.1",
  distribuzione: (
    "Akme Group",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
    "Eggon S.r.l."
  ),
  htmlId: "dichiarazione-impegni-c2",
  tipo-documento: "Dichiarazione di Impegni",
  index: "1",
  verificatore-interno: "Pietro Giulio Bassi",
  left-signature: "firma-Bassi.jpeg",
  registro-modifiche: (
    (
      "1.0.1",
      "29/10/2026",
      "Davide Loparco",
      "-",
      "Correzioni minori"
    ),
    (
      "1.0.0",
      "29/10/2026",
      "Pietro Giulio Bassi",
      "-",
      "Revisione finale documento"
    ),
    (
      "0.7.0",
      "28/10/2026",
      "Mattia Cadamuro",
      "Daxin Chen",
      "Diagramma PERT e Analisi dei rischi"

    ),
    (
      "0.6.0",
      "28/10/2026",
      "Daxin Chen",
      "Pietro Giulio Bassi",
      "Grafico distribuzione costi"

    ),
    (
      "0.5.0",
      "28/10/2026",
      "Roberto Piovesan	",
      "Daxin Chen",
      "Calcoli preventivo costi e tabella corrispettiva"

    ),
    (
      "0.4.0",
      "27/10/2026",
      "Marco Giacon",
      "Roberto Piovesan	",
      "Grafico suddivisione oraria e criteri rotazione ruoli"

    ),
    (
      "0.3.0",
      "27/10/2026",
      "Davide Loparco",
      "Marco Giacon",
      "Stesura suddivisione oraria dei ruoli e tabella corrispettiva"

    ),
    (
      "0.2.0",
      "27/10/2026",
      "Mattia Cadamuro",
      "Davide Loparco",
      "Stesura analisi dei ruoli"

    ),
    (
      "0.1.0",
      "27/10/2026",
      "Pietro Giulio Bassi",
      "Daxin Chen",
      "Versione inziale della Dichiarazione di Impegni e Preventivo Costi per C2-Concierge"

    ),
    

  ),
  body
)

= Introduzione

Il gruppo *Akme Group* si impegna formalmente alla realizzazione del Capitolato *C2 - NEXUM Concierge*, proposto dall'azienda *Eggon S.r.l.*, nell'ambito del corso di Ingegneria del Software presso l'Università degli Studi di Padova (A.A. 2026/2027).

Con la presente dichiarazione, i 6 membri del gruppo assumono l'impegno di svolgere con responsabilità, trasparenza e continuità tutte le attività necessarie alla consegna dell'MVP#super[G] (Minimum Viable Product), rispettando le scadenze concordate, le regole del Progetto Didattico e gli standard di qualità definiti.

= Analisi dei Ruoli

I ruoli all'interno del gruppo vengono definiti secondo il regolamento didattico per garantire copertura funzionale, responsabilità chiare e verifica indipendente:

- *Responsabile (Resp):* Coordina il gruppo, gestisce la pianificazione e le risorse, pianifica le milestone e rappresenta l'interfaccia verso committente e proponente.
- *Amministratore (Amm):* Gestisce l'infrastruttura di lavoro (repository, pipeline di CI/CD, issue tracking) e cura la manutenzione del Way of Working#super[G].
- *Analista (Analist):* Definisce i requisiti funzionali e non funzionali specifici del Concierge (RAG#super[G], Integrazione API NEXUM, autorizzazioni, tracciabilità).
- *Progettista (Progett):* Definisce l'architettura tecnica del sistema, la struttura delle Knowledge Base, le interfacce verso i modelli LLM#super[G] e i Gate operativi/di lettura.
- *Programmatore (Programm):* Implementa il codice per l'interfaccia conversazionale PWA#super[G], i servizi di backoffice#super[G] per i vettori/bucket e l'integrazione delle API.
- *Verificatore (Verif):* Esegue attività di test unitari, di integrazione, di sistema e validazione delle risposte per prevenire allucinazioni e verificare i criteri d'accettazione.

#pagebreak()

= Impegno Individuale e Rotazione Ruoli

Il gruppo è formato da 6 componenti. Ciascun componente si impegna ad erogare *93 ore produttive*, per un totale complessivo di *558 ore produttive di gruppo*.

== Tabella Suddivisione Ore per Componente e Ruolo

#align(center)[
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.2fr),
    align: center + horizon,
    [*Componente*], [*Resp*], [*Amm*], [*Analist*], [*Progett*], [*Programm*], [*Verif*], [*Totale*],
    [Pietro Giulio Bassi], [8h], [7h], [10h], [20h], [24h], [24h], [93h],
    [Roberto	Piovesan], [7h], [8h], [10h], [20h], [24h], [24h], [93h],
    [Marco	Giacon], [8h], [7h], [9h], [21h], [24h], [24h], [93h],
    [DaXin	Chen], [7h], [8h], [10h], [21h], [23h], [24h], [93h],
    [Mattia	Cadamuro], [8h], [8h], [9h], [20h], [24h], [24h], [93h],
    [Davide	Loparco], [8h], [8h], [10h], [20h], [24h], [23h], [93h],
    [*Totale Ore*], [*46h*], [*46h*], [*58h*], [*122h*], [*143h*], [*143h*], [*558h*]
  )
]

== Motivazione della Ripartizione Oraria

1. *Sviluppo e Validazione (Programmatore + Verificatore):* Dedicate 286 ore complessive (143h + 143h), pari al *51.2%* del totale. Tale impegno garantisce un testing rigoroso sull'accuratezza delle risposte RAG, sulle chiamate API a NEXUM e sulla sicurezza delle autorizzazioni.
2. *Progettazione (Progettista):* Destinate 122 ore (*21.9%*). L'architettura del Concierge richiede un design accurato dei Gate di lettura/scrittura, dei prompt#super[G] per LLM e della gestione di contesto conversazionale.
3. *Analisi dei Requisiti (Analista):* Destinate 58 ore (*10.4%*), necessarie per circoscrivere l'ambito dell'MVP alle ferie e permessi e definire i requisiti di tracciabilità e astensione.
4. *Coordinamento e Supporto (Responsabile + Amministratore):* Assegnate 46 ore a testa (*16.5%* totale combinato) per garantire la gestione della pianificazione, incontri settimanali con Eggon e stabilità degli ambienti integrati.

#pagebreak()

== Grafico della Suddivisione Oraria per Ruolo

Di seguito viene illustrata la distribuzione visiva delle ore assegnate a ciascun ruolo sul monte ore complessivo ($558h$):

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
        [*Distribuzione Ore Ruoli*], [__Totale: 100%__]
      )
      #v(6pt)
      #stack(
        dir: ltr,
        rect(width: 25.6%, height: 12pt, fill: rgb("#4A90E2")), // Programmatore
        rect(width: 25.6%, height: 12pt, fill: rgb("#50E3C2")), // Verificatore
        rect(width: 21.9%, height: 12pt, fill: rgb("#F5A623")), // Progettista
        rect(width: 10.4%, height: 12pt, fill: rgb("#B8E986")), // Analista
        rect(width: 8.2%,  height: 12pt, fill: rgb("#9013FE")), // Responsabile
        rect(width: 8.3%,  height: 12pt, fill: rgb("#BD10E0")), // Amministratore
      )
      #v(10pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 15pt,
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#4A90E2"))) *Programmatore:* 143h (25.6%) \
            #box(square(size: 8pt, fill: rgb("#50E3C2"))) *Verificatore:* 143h (25.6%) \
            #box(square(size: 8pt, fill: rgb("#F5A623"))) *Progettista:* 122h (21.9%)
          ]
        ],
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#B8E986"))) *Analista:* 58h (10.4%) \
            #box(square(size: 8pt, fill: rgb("#9013FE"))) *Responsabile:* 46h (8.2%) \
            #box(square(size: 8pt, fill: rgb("#BD10E0"))) *Amministratore:* 46h (8.2%)
          ]
        ]
      )
    ]
  )
]

== Criteri di Rotazione dei Ruoli

Il gruppo adotta un piano di rotazione periodica strutturato per massimizzare la crescita formativa di ciascun componente su tutti gli aspetti del ciclo di vita del software:
- *Frequenza:* La rotazione dei ruoli viene effettuata ogni **2 settimane** (coincidente con l'arco temporale di 2 Sprint di lavoro). Questa cadenza permette un adeguato periodo di inserimento operativo ed evita il disorientamento tipico di rotazioni settimanali troppo rapide.
- *Copertura:* Ciascun membro del gruppo, nell'arco temporale del progetto didattico, avrà l'opportunità di ricoprire tutti i ruoli previsti, garantendo piena equità formativa.
- *Gestione dei Conflitti di Interesse:* Le regole di rotazione garantiscono in modo rigoroso l'assenza di conflitti d'interesse: nessun componente può ricoprire contemporaneamente il ruolo di programmatore/progettista e di verificatore sul medesimo artefatto, assicurando così l'indipendenza e l'oggettività delle attività di controllo di qualità.
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
    [Responsabile], [46h], [30,00 €/h], [1.380,00 €],
    [Amministratore], [46h], [20,00 €/h], [920,00 €],
    [Analista], [58h], [25,00 €/h], [1.450,00 €],
    [Progettista], [122h], [25,00 €/h], [3.050,00 €],
    [Programmatore], [143h], [15,00 €/h], [2.145,00 €],
    [Verificatore], [143h], [15,00 €/h], [2.145,00 €],
    [*Totale Preventivo*], [*558h*], [-], [*11.160,00 €*]
  )
]

*Nota di conformità:* Il costo totale stimato è di *11.160,00 €*. Esso è perfettamente compreso nel limite invalicabile di preventivo per gruppi di 6 persone, ed è superiore alla soglia minima ammissibile in candidatura ($12.000,00 times 6/7 approx 10.285,71 € $).

== Grafico della Distribuzione dei Costi

#align(center)[
  #block(
    fill: rgb("#f8f9fa"),
    inset: 14pt,
    radius: 6pt,
    stroke: 0.5pt + luma(200),
    [
      // Barra unificata al 100% per i costi
      #stack(
        dir: ltr,
        rect(width: 27.3%, height: 12pt, fill: rgb("#F5A623")), // Progettista
        rect(width: 19.2%, height: 12pt, fill: rgb("#4A90E2")), // Programmatore
        rect(width: 19.2%, height: 12pt, fill: rgb("#50E3C2")), // Verificatore
        rect(width: 13.0%, height: 12pt, fill: rgb("#B8E986")), // Analista
        rect(width: 12.4%, height: 12pt, fill: rgb("#9013FE")), // Responsabile
        rect(width: 8.9%,  height: 12pt, fill: rgb("#BD10E0")), // Amministratore
      )
      #v(10pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 15pt,
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#F5A623"))) *Progettista:* 3.050,00 € (27.3%) \
            #box(square(size: 8pt, fill: rgb("#4A90E2"))) *Programmatore:* 2.145,00 € (19.2%) \
            #box(square(size: 8pt, fill: rgb("#50E3C2"))) *Verificatore:* 2.145,00 € (19.2%)
          ]
        ],
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#B8E986"))) *Analista:* 1.450,00 € (13.0%) \
            #box(square(size: 8pt, fill: rgb("#9013FE"))) *Responsabile:* 1.380,00 € (12.4%) \
            #box(square(size: 8pt, fill: rgb("#BD10E0"))) *Amministratore:* 920,00 € (8.9%)
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
      #text(weight: "bold", size: 12pt, fill: rgb("#1a2a3a"))[Diagramma PERT delle Attività - Capitolato C2]
      #v(0.8em)
      
      // Funzioni per la grafica dei nodi stile PERT
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
        
        // Fase RTB
        nodeTask("01", "Avvio & WoW Setup"), [#text(12pt)[$-->$]], nodeTask("02", "Analisi Requisiti"), [#text(12pt)[$-->$]], nodeTask("03", "Studio Tech RAG"),
        grid.cell(colspan: 5)[#v(-0.2em)],
        nodeTask("04", "Progettazione PoC#super[G]"), [#text(12pt)[$-->$]], nodeTask("05", "Sviluppo PoC"), [#text(12pt)[$-->$]], nodeMilestone("RTB", "Milestone RTB"),
        
        grid.cell(colspan: 5)[#v(0.5em) #line(length: 80%, stroke: 0.5pt + luma(200)) #v(0.5em)],
        
        // Fase PB
        nodeTask("06", "Design Architetturale"), [#text(12pt)[$-->$]], nodeTask("07", "Gate & Backoffice"), [#text(12pt)[$-->$]], nodeTask("09", "Testing MVP"),
        grid.cell(colspan: 5)[#v(-0.2em)],
        nodeTask("08", "Integrazione API"), [#text(12pt)[$-->$]], nodeTask("09", "Validazione Finale"), [#text(12pt)[$-->$]], nodeMilestone("PB", "MVP Finale")
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

1. *Analisi dei Requisiti & PoC (Fase RTB):* L'analisi dettagliata dei flussi di ferie/permessi e dei vincoli sulle fonti (regolamenti aziendali vs manuali NEXUM) costituisce il collo di bottiglia principale prima dello sviluppo del Proof of Concept.
2. *Design dei Gate e Validazione MVP (Fase PB):* La corretta definizione delle interfacce dei Gate di lettura e operativi precede la codifica e il collaudo del flusso conversazionale end-to-end con conferma utente.

= Analisi dei Rischi

Il gruppo ha condotto un'attenta analisi dei rischi potenziali legati allo sviluppo del capitolato *C2 - NEXUM Concierge*, definendo le relative strategie di mitigazione:

1. *Inesperienza con le tecnologie LLM e RAG:* L'utilizzo di modelli linguistici e tecniche di recupero documentale rappresenta una sfida tecnica complessa per il team.
   - *Mitigazione:* Sviluppo preventivo di un Proof of Concept (PoC) durante la fase RTB per testare la fattibilità e l'interoperabilità dei componenti con il supporto dei manuali forniti da Eggon.
2. *Errata interpretazione dei requisiti e dei vincoli aziendali:* Possibili incomprensioni sui confini dell'MVP (limitato a ferie e permessi) e sulla distinzione tra regole aziendali e istruzioni di prodotto.
   - *Mitigazione:* Mantenere un canale di comunicazione diretto e costante con il proponente Eggon (tramite call periodiche e gruppo di supporto dedicato) e una rigorosa validazione dei documenti di analisi dei requisiti.
3. *Superamento del budget orario disponibile:* Rischio di sovrastima o sottostima dell'impegno richiesto per le attività di integrazione delle API NEXUM e dei test.
   - *Mitigazione:* Monitoraggio costante dell'avanzamento tramite il cruscotto di qualità, consuntivi di periodo rigorosi e riallocazione tempestiva delle risorse durante le riunioni di retrospettiva.
4. *Potenziali rallentamenti dovuti a periodi critici: * durante le vacanze natalizie e la
sessione invernale gli impegni dei membri del gruppo potrebbero influire negativamente sulle
tempistiche concordate.
  - *Mitigazione:* tenere conto preventivamente dei periodi critici organizzando di conseguenza le attività, rispettando nei tempi prestabiliti le deadline senza procastinare e rimandare i task

= Data di Consegna Prevista

Il gruppo *Akme Group* prevede il completamento delle attività e la richiesta di accesso al collaudo finale entro il *30 marzo 2027*, rispettando il limite delle 20 settimane d'impegno previste dal regolamento didattico.