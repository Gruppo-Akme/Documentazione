#import "../../Templates/templateDocumentiGenerici.typ": report

#set outline(depth: 3)

#show: report.with(
  titolo: "Piano di Progetto",
  stato: "Bozza",
  versione: "0.3.0",
  distribuzione: (
    "Akme Group",
    "Ergon Informatica S.r.l.",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
  ),
  tipo-documento: "Documento esterno",
  registro-modifiche: (
    ("0.3.0", "17/11/2026", "Pietro Giulio Bassi", "DaXin Chen", "Aggiunta diagramma PERT, grafici di ripartizione ore/costi e diagramma di Gantt per lo Sprint 1; estensione profondità indice"),
    ("0.2.0", "14/11/2026", "Davide Loparco", "DaXin Chen", "Assegnazione ruoli e calcolo preventivo Sprint 1"),
    ("0.1.0", "14/11/2026", "Pietro Giulio Bassi", "DaXin Chen", "Prima stesura del Piano di Progetto: Introduzione, Analisi dei Rischi, Pianificazione a lungo termine"),
  ),
  mostra-indice: true,
)

#let gantt-sprint(titolo-sprint, giorni, attivita) = {
  let num-giorni = giorni.len()
  let cols = (36%,) + (1fr,) * num-giorni
  align(center)[
    #block(
      fill: rgb("#f8f9fa"),
      inset: 12pt,
      radius: 6pt,
      stroke: 0.5pt + luma(200),
      [
        #align(left)[
          #text(weight: "bold", size: 10.5pt, fill: rgb("#1a2a3a"))[#titolo-sprint]
        ]
        #v(6pt)
        #table(
          columns: cols,
          align: (left + horizon,) + (center + horizon,) * num-giorni,
          stroke: 0.4pt + luma(210),
          inset: (x: 2pt, y: 4pt),
          fill: (x, y) => if y == 0 { rgb("#e9ecef") } else { white },
          [*Attività / Task*],
          ..giorni.map(g => text(size: 6.5pt, weight: "bold")[#g]),
          ..attivita.map(item => {
            let (nome, inizio, fine, colore) = item
            (
              text(size: 7.5pt)[#nome],
              ..range(num-giorni).map(i => {
                let giorno-corrente = i + 1
                if giorno-corrente >= inizio and giorno-corrente <= fine {
                  rect(width: 100%, height: 8pt, fill: colore, radius: 1.5pt)
                } else {
                  []
                }
              })
            )
          }).flatten()
        )
        #v(6pt)
        #grid(
          columns: (auto, auto, auto),
          column-gutter: 1.5em,
          align: horizon,
          [#box(square(size: 7pt, fill: rgb("#9013FE"), radius: 1.5pt)) #text(7.5pt)[Coordinamento / Resp.]],
          [#box(square(size: 7pt, fill: rgb("#B8E986"), radius: 1.5pt)) #text(7.5pt)[Analisi e Stesura]],
          [#box(square(size: 7pt, fill: rgb("#50E3C2"), radius: 1.5pt)) #text(7.5pt)[Verifica e Automazione]],
        )
      ]
    )
  ]
}

= Introduzione

== Scopo del documento
Il presente documento costituisce il *Piano di Progetto* redatto da *Akme Group* per la realizzazione del progetto didattico relativo al capitolato d'appalto *C7 — SmartDashboard: piattaforma di Business Intelligence#super[G] self-service potenziata da AI*, proposto dall'azienda *Ergon Informatica S.r.l.* nell'ambito del corso di Ingegneria del Software presso l'Università degli Studi di Padova (A.A. 2026/2027).

Il Piano di Progetto ha la finalità di definire in modo strutturato, trasparente e verificabile:
- l'identificazione, la valutazione e le strategie di mitigazione dei rischi di progetto;
- la pianificazione a lungo termine delle attività, delle scadenze e delle risorse umane ed economiche fino al rilascio finale;
- la pianificazione a breve termine articolata secondo un approccio iterativo e incrementale (Agile#super[G]), con dettaglio dei preventivi, dei consuntivi di periodo e delle retrospettive per ciascuno Sprint#super[G].

Essendo un documento soggetto a evoluzione continua, esso verrà aggiornato costantemente al termine di ogni ciclo di sviluppo per monitorare gli scostamenti tra stime e risultati effettivi, ricalibrare l'allocazione delle risorse e garantire il rispetto del budget complessivo.

== Glossario#super[G]
Per evitare ambiguità interpretative e garantire una terminologia condivisa tra tutti i membri del team e gli stakeholder esterni, i termini tecnici, gli acronimi e i concetti specifici di dominio sono definiti nel documento *Glossario*. All'interno del presente testo, ogni prima occorrenza rilevante di un termine presente nel Glossario viene contrassegnata automaticamente in fase di compilazione tramite apposito apice.

== Riferimenti

=== Riferimenti normativi
- *Capitolato d'appalto#super[G] C7 — SmartDashboard (Ergon Informatica S.r.l.)*: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Progetto/C7-SD.pdf") (Ultima consultazione: 14/11/2026)
- *Norme di Progetto* (documento interno di Akme Group, versione corrente): regolamento interno relativo al Way of Working, ai processi di ciclo di vita e alle convenzioni redazionali.
- *Regolamento del Progetto Didattico*: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/T03.pdf") (Ultima consultazione: 14/11/2026)

=== Riferimenti informativi
- #link("https://gruppo-akme.github.io/Documentazione/output/Candidatura/Lettera_di_presentazione.pdf")[*Lettera di Presentazione*] (documento di candidatura prodotto da Akme Group in data 05/11/2026).
- #link("https://gruppo-akme.github.io/Documentazione/output/Candidatura/preventivo_costi.pdf")[*Dichiarazione degli Impegni e Preventivo Costi*] (documento di candidatura prodotto da Akme Group in data 05/11/2026).
- #link("https://gruppo-akme.github.io/Documentazione/output/Candidatura/Valutazione%20Capitolati.pdf")[*Valutazione dei Capitolati*] (documento interno prodotto da Akme Group in data 05/11/2026).
- #link("https://gruppo-akme.github.io/Documentazione/website/glossary.html")[*Glossario*] (documento interno prodotto da Akme Group, versione corrente).
- *Slide del corso di Ingegneria del Software — Gestione di Progetto e Ciclo di Vita del Software*: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/T02.pdf") \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/T03.pdf") \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/T04.pdf")

= Analisi e gestione dei rischi

Una gestione rigorosa e proattiva dei rischi è essenziale per prevenire blocchi operativi, sforamenti di budget e ritardi rispetto alle scadenze concordate. Il processo di gestione adottato dal gruppo si articola in quattro fasi cicliche:
+ *Identificazione*: rilevamento continuo dei potenziali fattori di rischio legati all'ambito tecnologico, organizzativo e individuale;
+ *Analisi*: stima della probabilità di occorrenza e della gravità dell'impatto su una scala qualitativa a cinque livelli: *Molto basso*, *Basso*, *Medio*, *Alto*, *Molto alto*;
+ *Pianificazione della mitigazione*: definizione preventiva delle contromisure da attuare per ridurre la probabilità che l'evento si verifichi e delle azioni correttive per contenerne gli effetti;
+ *Monitoraggio e controllo*: verifica sistematica al termine di ogni Sprint durante la fase di retrospettiva.

Ciascun rischio è identificato da un codice univoco nella forma `R[Categoria][Numero]`, suddiviso nelle seguenti categorie:
- *RT (Rischi Tecnologici)*: criticità legate all'architettura a tre livelli, all'ingegneria dei dati e all'integrazione del layer di intelligenza artificiale;
- *RO (Rischi Organizzativi)*: criticità inerenti la stima dei tempi, il coordinamento interno e la comunicazione con il proponente;
- *RP (Rischi Personali)*: criticità connesse alla disponibilità individuale, agli impegni accademici e alle dinamiche interpersonali.

== Rischi tecnologici

=== RT1 — Complessità nella modellazione dimensionale e pipeline ETL#super[G]
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RT1],
  [*Nome*], [Complessità nella modellazione dimensionale e performance ETL],
  [*Descrizione*], [L'estrazione, pulizia e trasformazione dei dati grezzi provenienti dall'ERP#super[G] aziendale (es. tabelle di vendita, ordini e logistica) verso uno Star Schema ottimizzato su DuckDB#super[G] può presentare complessità strutturali e colli di bottiglia prestazionali su volumi di dati significativi.],
  [*Misure di mitigazione*], [Adottare librerie colonnari ad alte prestazioni dell'ecosistema Python#super[G] come *Polars#super[G]* per la manipolazione dei dati, sfruttare le ottimizzazioni analitiche native di DuckDB e validare precocemente la pipeline sul caso di studio reale fornito da Ergon Informatica S.r.l. durante la fase di Proof of Concept.],
  [*Probabilità*], [Media],
  [*Impatto*], [Alto],
)

=== RT2 — Affidabilità e sicurezza del Layer AI (LLM#super[G])
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RT2],
  [*Nome*], [Allucinazioni e controllo delle interrogazioni nel Layer AI],
  [*Descrizione*], [L'integrazione di un LLM per la generazione di visualizzazioni da linguaggio naturale (Text-to-Analytics#super[G]), insight automatici e spiegazioni contestuali espone al rischio di risposte imprecise, interpretazioni errate dello schema dati o generazione di query non sicure.],
  [*Misure di mitigazione*], [Utilizzare API commerciali consolidate (es. OpenAI GPT o Anthropic Claude#super[G]) con prompt strutturati arricchiti esclusivamente dai metadati del modello dimensionale. Introdurre un livello intermedio di validazione e guardrail lato backend che impedisca l'esecuzione diretta di query arbitrarie o l'esposizione di dati non autorizzati al frontend.],
  [*Probabilità*], [Alta],
  [*Impatto*], [Alto],
)

=== RT3 — Curva di apprendimento dello stack tecnologico
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RT3],
  [*Nome*], [Apprendimento delle tecnologie di progetto],
  [*Descrizione*], [L'eterogeneità dello stack richiesto dal capitolato C7 — che combina data engineering (Polars, DuckDB), backend API REST#super[G], frontend interattivo (React#super[G], librerie di charting e layout drag & drop) e orchestrazione LLM — può rallentare le fasi iniziali di prototipazione e sviluppo.],
  [*Misure di mitigazione*], [Avviare uno studio mirato e parallelo fin dai primi Sprint, allocando ore specifiche di formazione. Favorire sessioni interne di allineamento tecnico tra i membri con maggiore esperienza su ciascun ambito e sfruttare gli incontri bisettimanali con i referenti tecnici di Ergon per risolvere tempestivamente eventuali dubbi architetturali.],
  [*Probabilità*], [Alta],
  [*Impatto*], [Medio],
)

== Rischi organizzativi

=== RO1 — Errata stima dei carichi di lavoro e delle tempistiche
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RO1],
  [*Nome*], [Sottostima o sovrastima dell'impegno orario],
  [*Descrizione*], [La scarsa esperienza del team nella pianificazione di un progetto complesso può portare a stime imprecise delle ore necessarie per completare le attività, causando sforamenti di budget nello Sprint o accumulo di ritardi sulle milestone.],
  [*Misure di mitigazione*], [Scomporre le attività in task atomiche e ben definite tracciate tramite GitHub#super[G] Issues. Adottare un approccio prudenziale nei primi Sprint e ricalibrare sistematicamente le stime durante la Sprint Retrospective#super[G] sulla base dei dati storici raccolti nei consuntivi precedenti.],
  [*Probabilità*], [Media],
  [*Impatto*], [Alto],
)

=== RO2 — Incomprensione o instabilità dei requisiti
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RO2],
  [*Nome*], [Ambiguità nell'interpretazione dei requisiti di capitolato],
  [*Descrizione*], [Una comprensione non allineata delle funzionalità attese (ad esempio sulle modalità di interazione del dashboard builder, sui formati di esportazione o sulle priorità delle quattro capacità AI) può generare rilavorazioni onerose.],
  [*Misure di mitigazione*], [Seguire l'approccio incrementale consigliato dal capitolato (consolidamento della pipeline BI prima del layer AI). Mantenere un dialogo costante con il referente aziendale Gianluca Carlesso attraverso gli incontri quindicinali di allineamento e validare progressivamente i casi d'uso e i prototipi.],
  [*Probabilità*], [Media],
  [*Impatto*], [Alto],
)

=== RO3 — Squilibrio nella distribuzione dei compiti e dei ruoli
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RO3],
  [*Nome*], [Assegnazione non ottimale delle risorse nel team],
  [*Descrizione*], [Una ripartizione squilibrata delle attività tra i sei componenti può causare colli di bottiglia su singole figure (in particolare Analisti in fase RTB#super[G] o Programmatori/Verificatori in fase PB#super[G]) e rallentare il flusso di verifica.],
  [*Misure di mitigazione*], [Applicare la rotazione bisettimanale dei ruoli prevista dalla Dichiarazione degli Impegni e monitorare il monte ore residuo individuale ad ogni inizio Sprint, ridistribuendo tempestivamente i compiti in caso di sovraccarichi.],
  [*Probabilità*], [Bassa],
  [*Impatto*], [Medio],
)

== Rischi personali

=== RP1 — Concomitanza con esami e impegni accademici
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RP1],
  [*Nome*], [Impegni universitari e sessioni d'esame],
  [*Descrizione*], [Tutti i membri del gruppo devono sostenere altri insegnamenti ed esami paralleli al corso di Ingegneria del Software, con picchi di carico durante i parziali e la sessione invernale.],
  [*Misure di mitigazione*], [Rilevare in anticipo le finestre d'esame di ciascun componente, ridurre preventivamente il monte ore pianificato negli Sprint coincidenti con gli appelli e assegnare attività non bloccanti a chi affronta prove accademiche imminenti.],
  [*Probabilità*], [Alta],
  [*Impatto*], [Alto],
)

=== RP2 — Imprevisti personali o indisponibilità temporanee
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RP2],
  [*Nome*], [Imprevisti personali, familiari o di salute],
  [*Descrizione*], [Eventi imprevisti o impegni extra-universitari possono ridurre improvvisamente la disponibilità oraria di uno o più membri del team.],
  [*Misure di mitigazione*], [Obbligo di comunicazione tempestiva sui canali interni del gruppo non appena emerge l'impedimento, così da consentire al Responsabile#super[G] di riassegnare le task urgenti e assorbire l'impatto senza compromettere la chiusura dello Sprint.],
  [*Probabilità*], [Bassa],
  [*Impatto*], [Medio],
)

=== RP3 — Divergenze organizzative o comunicative interne
#table(
  columns: (28%, 72%),
  align: (left, left),
  [*Codice*], [RP3],
  [*Nome*], [Incomprensioni operative o dissidi interni],
  [*Descrizione*], [Differenze di vedute sulle scelte progettuali o ambiguità nella descrizione delle task possono rallentare il processo decisionale o generare tensioni nel gruppo.],
  [*Misure di mitigazione*], [Adottare template standardizzati per le issue e verbali interni dettagliati per ogni riunione. In caso di disaccordo tecnico o organizzativo, favorire un confronto aperto e costruttivo mediato dal Responsabile di periodo, ricorrendo a votazione a maggioranza o al parere del proponente ove necessario.],
  [*Probabilità*], [Bassa],
  [*Impatto*], [Basso],
)

= Pianificazione nel lungo termine

== Impegno orario e preventivo economico
Come formalizzato nella *Dichiarazione degli Impegni e Preventivo Costi v1.0.0*, Akme Group è composto da 6 membri. Ciascun componente si impegna a erogare *93 ore produttive*, per un monte ore complessivo di *558 ore* e un costo totale preventivato pari a *11.130,00 €*, valore pienamente conforme al vincolo economico massimo previsto dal regolamento didattico per gruppi di sei persone.

La ripartizione iniziale delle ore produttive tra i sei ruoli di progetto per ciascun componente è riportata nella tabella seguente:

#table(
  columns: (28%, 10%, 10%, 10%, 10%, 11%, 10%, 11%),
  align: (left, center, center, center, center, center, center, center),
  table.header([*Componente*], [*Resp.*], [*Amm.*], [*Anal.*], [*Prog.*], [*Progr.*], [*Verif.*], [*Totale*]),
  [Pietro Giulio Bassi], [13], [7], [5], [20], [19], [29], [93],
  [Roberto Piovesan], [7], [8], [5], [25], [30], [18], [93],
  [Marco Giacon], [9], [14], [10], [14], [36], [10], [93],
  [DaXin Chen], [12], [3], [10], [11], [33], [24], [93],
  [Mattia Cadamuro], [15], [11], [9], [10], [28], [20], [93],
  [Davide Loparco], [8], [9], [10], [25], [28], [13], [93],
  [*Totale Ore*], [*64*], [*52*], [*49*], [*105*], [*174*], [*114*], [*558*],
)

Applicando i costi orari ufficiali previsti dal regolamento del corso, il preventivo economico complessivo risulta così strutturato:

#table(
  columns: (34%, 22%, 22%, 22%),
  align: (left, center, center, right),
  table.header([*Ruolo*], [*Ore Totali*], [*Costo Orario*], [*Costo Totale*]),
  [Responsabile], [64], [30,00 €/h], [1.920,00 €],
  [Amministratore#super[G]], [52], [20,00 €/h], [1.040,00 €],
  [Analista#super[G]], [49], [25,00 €/h], [1.225,00 €],
  [Progettista#super[G]], [105], [25,00 €/h], [2.625,00 €],
  [Programmatore#super[G]], [174], [15,00 €/h], [2.610,00 €],
  [Verificatore#super[G]], [114], [15,00 €/h], [1.710,00 €],
  [*Totale Preventivo*], [*558*], [—], [*11.130,00 €*],
)

== Calendario, milestone e Diagramma PERT
Il percorso di sviluppo è scandito dalle due revisioni di avanzamento principali previste dal corso di Ingegneria del Software:
- *Requirements and Technology Baseline (RTB)* — consegna prevista entro il *20/01/2027*: consolidamento dell'analisi dei requisiti, definizione completa delle norme e delle metriche di qualità, e realizzazione di un Proof of Concept (PoC#super[G]) volto a dimostrare la fattibilità tecnica dell'integrazione tra ingestion/ETL (Polars), motore analitico (DuckDB), web application (React) e layer AI;
- *Product Baseline (PB)* — consegna finale prevista entro il *30/03/2027*: completamento della progettazione architetturale, implementazione del Minimum Viable Product (MVP#super[G]) comprensivo di pipeline BI end-to-end, dashboard builder drag & drop e assistente AI conversazionale, validato tramite suite di test automatizzati e corredato dalla documentazione completa.

Di seguito viene illustrata la rete delle dipendenze logiche e temporali tra le macro-attività di progetto tramite il Diagramma PERT definito in fase di pianificazione:

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
        nodeTask("04", "Progettazione P.o.C."), [#text(12pt)[$-->$]], nodeTask("05", "Sviluppo Pipeline BI"), [#text(12pt)[$-->$]], nodeMilestone("RTB", "Milestone#super[G] RTB"),
        
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

== Attività previste per la RTB
Nella fase di *Requirements and Technology Baseline*, gli sforzi del team si concentrano sulla definizione metodologica, sull'analisi puntuale del dominio SmartDashboard e sulla validazione tecnologica:

#table(
  columns: (30%, 70%),
  align: (left, left),
  table.header([*Attività / Artefatto*], [*Descrizione e obiettivi*]),
  [*Norme di Progetto*], [Documento interno che formalizza il Way of Working del gruppo: gestione delle configurazioni, flussi Git#super[G], convenzioni di codifica e scrittura in Typst#super[G], processi di verifica e metriche organizzative.],
  [*Analisi dei Requisiti*], [Documento esterno che identifica gli attori, modella i casi d'uso e classifica i requisiti funzionali, non funzionali e di vincolo (obbligatori, desiderabili, facoltativi) della piattaforma SmartDashboard.],
  [*Piano di Progetto*], [Documento esterno aggiornato incrementalmente ad ogni Sprint per rendicontare rischi, preventivi, consuntivi di periodo e avanzamento delle risorse.],
  [*Piano di Qualifica*], [Documento esterno che definisce le strategie di verifica e validazione, gli obiettivi di qualità di processo e prodotto, le metriche e la specifica dei test di sistema.],
  [*Glossario*], [Documento interno continuamente aggiornato contenente le definizioni univoche dei termini tecnici e di dominio adottati dal gruppo.],
  [*Proof of Concept (PoC)*], [Prototipo eseguibile volto a verificare l'integrazione concreta tra il modello dimensionale Star Schema#super[G] su DuckDB, la trasformazione dati con Polars, l'interfaccia React con widget interattivi e le chiamate API verso il modello linguistico.],
)

== Attività previste per la PB
Nella fase di *Product Baseline*, il gruppo consoliderà l'architettura del sistema e svilupperà il prodotto finale pronto per il collaudo:

#table(
  columns: (30%, 70%),
  align: (left, left),
  table.header([*Attività / Artefatto*], [*Descrizione e obiettivi*]),
  [*Specifica Tecnica*], [Documento che descrive l'architettura a tre livelli della piattaforma (Raw Data Store, Data Warehouse#super[G], Web App), i design pattern adottati, lo schema del database relazionale e dimensionale e le interfacce API REST.],
  [*Minimum Viable Product (MVP)*], [Applicazione completa e funzionante comprendente la pipeline ETL, il data warehouse analitico, il costruttore self-service di dashboard con libreria di widget e filtri trasversali, l'esportazione e il pannello assistente AI.],
  [*Manuale Utente*], [Guida operativa destinata agli utilizzatori finali (direzione, vendite, logistica) per la consultazione e creazione delle dashboard e l'utilizzo dell'assistente AI.],
  [*Consolidamento Documentale e Qualità*], [Aggiornamento finale di Analisi dei Requisiti, Piano di Progetto, Piano di Qualifica (con esecuzione completa dei test di unità, integrazione e sistema e relativo cruscotto metriche), Norme di Progetto e Glossario.],
)

= Pianificazione a breve termine

== Metodologia e organizzazione degli Sprint
Akme Group adotta una metodologia di lavoro iterativa e incrementale ispirata al framework Scrum#super[G]. Le iterazioni (*Sprint*) hanno una durata standard di *due settimane*, scelta che bilancia la necessità di frequenti momenti di sincronizzazione e revisione con gli impegni accademici dei singoli componenti.

All'inizio di ciascuno Sprint si tiene una riunione di *Sprint Planning#super[G]* in cui vengono assegnati i ruoli (secondo una rotazione bisettimanale che previene conflitti d'interesse tra chi produce un artefatto e chi lo verifica), definite le task su GitHub Issues e stimato il preventivo orario. Al termine dell'iterazione si svolge la *Sprint Retrospective*, durante la quale si redige il consuntivo di periodo, si analizzano eventuali rischi occorsi e si aggiorna il preventivo a finire. Il coordinamento con l'azienda proponente *Ergon Informatica S.r.l.* avviene tramite incontri di allineamento quindicinali con il referente tecnico Gianluca Carlesso.

== Requirements and Technology Baseline

=== Sprint 1

==== Informazioni generali e attività da svolgere
#table(
  columns: (35%, 65%),
  align: (left, left),
  [*Data di inizio*], [10/11/2026],
  [*Data di fine prevista*], [24/11/2026],
  [*Data di fine reale*], [In corso],
  [*Giorni di ritardo*], [0],
)

Questo primo Sprint inaugura formalmente le attività operative del gruppo per la fase di *Requirements and Technology Baseline* a seguito dell'aggiudicazione del capitolato C7. La riunione di pianificazione iniziale si è svolta in data 10/11/2026, stabilendo una cadenza bisettimanale per la rotazione degli incarichi e fissando un incontro intermedio di verifica dell'avanzamento per il 17/11/2026.

Nel dettaglio, le attività pianificate per lo Sprint 1 sono:
- contatto via mail con l'azienda proponente *Ergon Informatica S.r.l.* per fissare il primo incontro conoscitivo e tecnico, definire i canali di comunicazione e la cadenza degli appuntamenti periodici (Issue#super[G] #link("https://github.com/Gruppo-Akme/Documentazione/issues/45")[\#45]);
- preparazione teorica e studio individuale delle tecnologie proposte nel capitolato C7 e dei diagrammi dei casi d'uso, accompagnata dalla creazione di un documento condiviso per raccogliere quesiti e informazioni in vista del colloquio con il proponente;
- avvio della prima stesura delle *Norme di Progetto*, con focus sul Way of Working, sui canali di comunicazione, sull'organizzazione della repository automatizzata, sulle GitHub Actions#super[G], sulle linee guida per la compilazione locale dei PDF tramite Typst in VS Code e sulle regole di gestione dei registri delle modifiche secondo le indicazioni del Prof. Vardanega (Issue #link("https://github.com/Gruppo-Akme/Documentazione/issues/32")[\#32]);
- avvio della prima stesura del *Piano di Progetto* e definizione della suddivisione dei ruoli e della pianificazione degli Sprint (Issue #link("https://github.com/Gruppo-Akme/Documentazione/issues/43")[\#43]);
- avvio dell'*Analisi dei Requisiti*, fungendo da palestra formativa per la formalizzazione dei casi d'uso da approfondire poi con Ergon;
- aggiornamento del sito web di riferimento della repository automatizzata per il passaggio alla fase RTB, rendendo disponibili i nuovi documenti e oscurando quelli obsoleti della candidatura (Issue #link("https://github.com/Gruppo-Akme/Documentazione/issues/44")[\#44]), oltre alla stesura e verifica dei verbali interni (Issue #link("https://github.com/Gruppo-Akme/Documentazione/issues/42")[\#42]).

==== Diagramma di Gantt — Sprint 1
Di seguito viene riportata la pianificazione temporale delle attività previste lungo le due settimane dello Sprint 1 (dal 10/11/2026 al 24/11/2026):

#gantt-sprint(
  "Diagramma di Gantt — Sprint 1 (10/11/2026 – 24/11/2026)",
  ("10/11", "11/11", "12/11", "13/11", "14/11", "15/11", "16/11", "17/11", "18/11", "19/11", "20/11", "21/11", "22/11", "23/11", "24/11"),
  (
    ("Contatto Ergon e org. colloquio (#45)", 1, 4, rgb("#9013FE")),
    ("Studio tech C7 e diagrammi casi d'uso", 1, 5, rgb("#B8E986")),
    ("Stesura verbale interno 10/11 (#42)", 1, 4, rgb("#B8E986")),
    ("Prima stesura Norme di Progetto (#32)", 2, 12, rgb("#B8E986")),
    ("Prima stesura Piano di Progetto (#43)", 2, 12, rgb("#B8E986")),
    ("Avvio Analisi dei Requisiti", 5, 13, rgb("#B8E986")),
    ("Aggiornamento sito passaggio RTB (#44)", 3, 8, rgb("#50E3C2")),
    ("Riunione intermedia di allineamento", 8, 8, rgb("#9013FE")),
    ("Verifica documenti e chiusura Sprint", 11, 15, rgb("#50E3C2")),
  )
)

==== Rischi attesi
Per questo primo periodo di lavoro si ritengono particolarmente rilevanti i seguenti rischi:
- *RO1 (Sottostima o sovrastima dell'impegno orario)*: trattandosi del primo Sprint operativo della fase RTB, la taratura delle ore produttive necessarie per lo studio delle tecnologie e l'impostazione dei nuovi documenti può presentare margini di incertezza;
- *RO2 (Ambiguità nell'interpretazione dei requisiti)*: la formalizzazione iniziale dei casi d'uso nell'Analisi dei Requisiti richiede un confronto diretto con Ergon Informatica S.r.l. per chiarire le aspettative progettuali prima di consolidare le specifiche;
- *RP1 (Impegni universitari)*: la preparazione individuale delle tecnologie di capitolato e la stesura dei documenti devono conciliarsi con gli impegni accademici paralleli dei singoli membri del team;
- *RP3 (Incomprensioni operative)*: l'adozione di un flusso di lavoro prevalentemente asincrono per la redazione simultanea di più documenti in Typst richiede il rigoroso rispetto delle nuove convenzioni sulle Norme di Progetto per evitare sovrapposizioni sui file e difformità nei registri delle modifiche.

==== Preventivo
Come stabilito durante la riunione di pianificazione del 10/11/2026, per lo Sprint 1 i ruoli sono stati assegnati concentrando le risorse sulle figure di *Responsabile* (Davide Loparco), *Analista* (Pietro Giulio Bassi, Roberto Piovesan, Mattia Cadamuro) e *Verificatore* (Marco Giacon, DaXin Chen). Nessuna ora è allocata ai ruoli di Amministratore, Progettista e Programmatore, in quanto l'impegno del periodo è interamente rivolto all'impostazione documentale, allo studio preliminare e al coordinamento con il proponente.

#table(
  columns: (28%, 10%, 10%, 10%, 10%, 11%, 10%, 11%),
  align: (left, center, center, center, center, center, center, center),
  table.header([*Componente*], [*Resp.*], [*Amm.*], [*Anal.*], [*Prog.*], [*Progr.*], [*Verif.*], [*Totale*]),
  [Pietro Giulio Bassi], [—], [—], [5], [—], [—], [—], [5],
  [Roberto Piovesan], [—], [—], [5], [—], [—], [—], [5],
  [Marco Giacon], [—], [—], [—], [—], [—], [5], [5],
  [DaXin Chen], [—], [—], [—], [—], [—], [5], [5],
  [Mattia Cadamuro], [—], [—], [5], [—], [—], [—], [5],
  [Davide Loparco], [5], [—], [—], [—], [—], [—], [5],
  [*Totale Ore*], [*5*], [*0*], [*15*], [*0*], [*0*], [*10*], [*30*],
)

Il costo totale preventivato per lo Sprint 1 ammonta a *675,00 €*, così ripartito per ruolo:
- *Responsabile*: 5 ore × 30,00 €/h = 150,00 €
- *Amministratore*: 0 ore × 20,00 €/h = 0,00 €
- *Analista*: 15 ore × 25,00 €/h = 375,00 €
- *Progettista*: 0 ore × 25,00 €/h = 0,00 €
- *Programmatore*: 0 ore × 15,00 €/h = 0,00 €
- *Verificatore*: 10 ore × 15,00 €/h = 150,00 €

===== Grafico della Suddivisione Oraria per Ruolo — Sprint 1
Di seguito viene illustrata la distribuzione visiva delle ore preventivate per lo Sprint 1 ($30h$ complessive):

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
        [*Distribuzione Ore Ruoli — Sprint 1*], [*Totale: 100%*]
      )
      #v(6pt)
      #stack(
        dir: ltr,
        rect(width: 50.0%, height: 12pt, fill: rgb("#B8E986")), // Analista (15h)
        rect(width: 33.3%, height: 12pt, fill: rgb("#50E3C2")), // Verificatore (10h)
        rect(width: 16.7%, height: 12pt, fill: rgb("#9013FE")), // Responsabile (5h)
      )
      #v(10pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 15pt,
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#B8E986"))) *Analista:* 15h (50.0%) \
            #box(square(size: 8pt, fill: rgb("#50E3C2"))) *Verificatore:* 10h (33.3%) \
            #box(square(size: 8pt, fill: rgb("#9013FE"))) *Responsabile:* 5h (16.7%)
          ]
        ],
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#BD10E0"))) *Amministratore:* 0h (0.0%) \
            #box(square(size: 8pt, fill: rgb("#F5A623"))) *Progettista:* 0h (0.0%) \
            #box(square(size: 8pt, fill: rgb("#4A90E2"))) *Programmatore:* 0h (0.0%)
          ]
        ]
      )
    ]
  )
]

===== Grafico della Distribuzione dei Costi — Sprint 1
Di seguito viene illustrata la ripartizione percentuale dei costi preventivati per lo Sprint 1 ($675,00€$ complessivi):

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
        [*Distribuzione Costi per Ruolo — Sprint 1*], [*Totale: 100%*]
      )
      #v(6pt)
      #stack(
        dir: ltr,
        rect(width: 55.6%, height: 12pt, fill: rgb("#B8E986")), // Analista (375,00 €)
        rect(width: 22.2%, height: 12pt, fill: rgb("#9013FE")), // Responsabile (150,00 €)
        rect(width: 22.2%, height: 12pt, fill: rgb("#50E3C2")), // Verificatore (150,00 €)
      )
      #v(10pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 15pt,
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#B8E986"))) *Analista:* 375,00 € (55.6%) \
            #box(square(size: 8pt, fill: rgb("#9013FE"))) *Responsabile:* 150,00 € (22.2%) \
            #box(square(size: 8pt, fill: rgb("#50E3C2"))) *Verificatore:* 150,00 € (22.2%)
          ]
        ],
        [
          #align(left)[
            #box(square(size: 8pt, fill: rgb("#BD10E0"))) *Amministratore:* 0,00 € (0.0%) \
            #box(square(size: 8pt, fill: rgb("#F5A623"))) *Progettista:* 0,00 € (0.0%) \
            #box(square(size: 8pt, fill: rgb("#4A90E2"))) *Programmatore:* 0,00 € (0.0%)
          ]
        ]
      )
    ]
  )
]

