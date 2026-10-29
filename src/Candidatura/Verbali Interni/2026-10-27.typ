#import "../../Templates/templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale interno 27/10/2026",
  stato: "Approvato",
  versione: "1.0.0",
  registro-modifiche: (
    ("1.0.0", "29/10/2026", "Marco Giacon", "Marco Giacon", "Revisione del documento e approvazione finale"),
    ("0.1.0", "28/10/2026", "Roberto Piovesan", "Marco Giacon", "Integrazione discussione capitolati e attività"),
  ),
  odg: (
    "Scelta del giorno per la riunione settimanale", "Discussione sulla riunione con Halue S.r.l.", "Discussione sulla riunione con Eggon S.r.l.", "Conferma scelta del capitolato", "Allineamento su documentazione e glossario",
  ),
  partecipanti: (
    "Pietro Giulio Bassi",
    "Mattia Cadamuro",
    "Chen Daxin",
    "Marco Giacon",
    "Davide Loparco",
    "Roberto Piovesan",
  ),
  distribuzione: (
    "Akme Group",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
  ),
  verificatore-interno: "Marco Giacon",
  left-signature: "firma-Giacon.jpeg",
  tipo-verbale: "Interno",
)

= Informazioni generali
Con il presente verbale si certifica che Akme Group si è riunito in data 27/10/2026 dalle 18:00 alle 18:30 con l'intento di discutere sui due colloqui telematici avvenuti con le aziende Halue S.r.l. ed Eggon S.r.l., di trarre le conclusioni sulla scelta definitiva del capitolato e di chiarire il workflow#super[G] relativo alla documentazione.

= Resoconto

== Scelta del giorno per la riunione settimanale
Il gruppo ha concordato di fissare la riunione settimanale di coordinamento con cadenza regolare ogni martedì alle ore 18:00. Tale collocazione temporale si è rivelata la soluzione ideale per allineare le attività in corso e pianificare il lavoro dei giorni successivi, oltre che la soluzione migliore per venire incontro alle esigenze lavorative e organizzative di tutti i membri del team.

== Discussione sulla riunione con Halue S.r.l.
Durante l'incontro con Halue S.r.l. SB, con referente Valentino Baraldo, il gruppo ha approfondito gli aspetti tecnici legati al capitolato C8 (Sonar), focalizzandosi sull'architettura a workflow durevoli (Vercel Workflows#super[G]) e sull'isolamento multi-tenant#super[G] tramite RLS#super[G]. Il confronto si è rivelato costruttivo e ha evidenziato una buona disponibilità aziendale alla negoziabilità e al dimensionamento incrementale dei requisiti per la fase di MVP#super[G]. Nonostante l'apprezzamento per la qualità tecnica, il team ha valutato la complessità strutturale dell'infrastruttura come leggermente meno in linea con le preferenze complessive del gruppo, se comparata alle altre due proponenti.

== Discussione sulla riunione con Eggon S.r.l.
Il colloquio con Eggon S.r.l., con referente Gianpaolo Ferrarin, ha permesso di analizzare in dettaglio i requisiti del capitolato C2 (Concierge), chiarendo gli aspetti relativi al perimetro operativo, all'integrazione con Amazon Bedrock#super[G] e alla gestione dei dati tramite PG Vector. L'azienda ha dimostrato un'ottima sintonia con il team, offrendo ampie garanzie di flessibilità, un approccio fortemente iterativo e un supporto concreto con risorse di test dedicate. Il giudizio complessivo su questa proposta e sul relatore è pienamente positivo.

== Conferma scelta del capitolato
In vista dell'imminente scadenza del 30 ottobre 2026 per la consegna della candidatura, entro la quale è prevista la finalizzazione del documento di Valutazione dei Capitolati, il gruppo si è riunito per effettuare una discussione conclusiva relativa alle proposte d'interesse, nello specifico i capitolati C0, C2 e C8.
Ogni membro del team ha esposto le proprie valutazioni e preferenze individuali, maturate anche a seguito dei colloqui telematici svolti nei giorni precedenti con le relative aziende proponenti.
A valle del confronto interno e dell'analisi comparativa dei requisiti e dei colloqui sostenuti, il gruppo ha approvato all'unanimità l'ordinamento delle preferenze:

- *Prima Scelta per la Candidatura:* Capitolato C2
- _Seconda scelta:_ Capitolato C0
- _Terza scelta:_ Capitolato C8

== Allineamento su documentazione e glossario#super[G]
Il gruppo si è conformato ad un unico workflow operativo per la redazione, la verifica e la pubblicazione automatizzata della documentazione in *Typst#super[G]*.
Per qualsiasi attività di stesura di documenti, i membri devono attenersi ai seguenti passaggi: 

1. *Creazione del branch:* Si crea un nuovo branch dedicato sulla repository GitHub#super[G], nominato direttamente con il nome del documento da redigere (es. _[verbale_interno_27_10_2026]_).

2. *Stesura del documento:* L'autore redige il file sorgente in *Typst* lavorando esclusivamente sul branch creato. In questa fase *non* deve essere inserito alcun pedice relativo al glossario, né deve essere inclusa manualmente la sezione appendice per il glossario stesso.

3. *Richiesta di revisione:* Una volta ultimata la bozza, si effettua il caricamento sul branch e viene assegnato l'incaricato alla verifica tramite GitHub oppure gruppo di comunicazione interna WhatsApp#super[G].

4. *Revisione e integrazione Glossario#super[G]:* Il revisore assegnato esegue la verifica del documento, controllando correttezza ortografica, coerenza logica e qualità dei contenuti. Inoltre, è compito del revisore individuare le parole chiave rilevanti e integrarle nel file/registro del glossario presente nella repository GitHub.

5. *Merge e automazione (GitHub Actions#super[G]):* Una volta completata la revisione e chiuso il branch, viene avviata automaticamente una GitHub Action che:
- Applica in automatico la formattazione dei termini di glossario e genera la sezione appendice
- Compila il file sorgente _.typ_ convertendolo nel documento finale in formato PDF.

= Decisioni e attività
In data 29/10/2026 alle ore 17:30 è prevista una nuova riunione interna per valutare lo stato della documentazione a ridosso della candidatura, definendo eventuali dettagli da rifinire.

A seguire, la suddivisione dello svolgimento delle attività di questa settimana.

#figure(
  table(
    columns: (2.2fr, 2.2fr, 1fr),
    align: (left + horizon, left + horizon, left + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 5pt),

    [*Descrizione*], [*Responsabile*], [*Scadenza*],
    [Redazione dei due verbali odierni, interno ed esterno], [Roberto Piovesan], [28/10/2026],
    [Stesura lettera di presentazione], [Mattia Cadamuro, Marco Giacon], [29/10/2026],
    [Revisione analisi dei capitolati, aggiornamento glossario], [Davide Loparco], [29/10/2026],
    [Stesura preventivo dei costi], [Pietro Giulio Bassi, Chen Daxin], [29/10/2026],
    [Analisi e revisione verbale interno ed esterno del 27/10/2026], [Marco Gicon, Davide Loparco], [29/10/2026],
  ),
  caption: [Decisioni intraprese e attività conseguenti],
) <tab-decisioni>