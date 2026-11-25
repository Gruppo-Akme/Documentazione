#import "../../Templates/templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale interno 24/11/2026",
  stato: "Bozza",
  versione: "0.1.0",
  ora-inizio: "18:00",
  ora-fine: "19:15",
  registro-modifiche: (
    ("0.1.0", "24/11/2026", "Davide Loparco", "", "Prima stesura del documento"),
  ),
  odg: (
    "Retrospettiva Sprint 1 ",
    "Chiarimenti sul ruolo del Responsabile e del Verificatore",
    "Assegnazione ruoli Sprint 2",
    "Discussione del To-Do dello Sprint 2",
    "Discussione problema issue e branch"
  ),
  partecipanti: (
    "Pietro Giulio Bassi",
    "Chen Daxin",
    "Davide Loparco",
  ),
  distribuzione: (
    "Akme Group",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
  ),
  verificatore-interno: "Pietro Giulio Bassi",
  left-signature: "",
  tipo-verbale: "Interno",
)

= Informazioni generali
Con il presente verbale si certifica che Akme Group si è riunito in data 24/11/2026 dalle 18:00 alle 19:15 con l'intento di discutere lo sprint appena concluso, decidere come agire nel secondo sprint e discutere un dubbio sorto sulla correlazione tra chiusura delle issue e merge dei branch.

= Resoconto

== Retrospettiva Sprint 1

Il gruppo si ritiene soddisfatto del lavoro svoltosi nel periodo dello sprint 1, rilevando inoltre un quantitativo di ore lavorative per il ruolo del verificatore inferiore a quanto preventivato. 

Sarà possibile visualizzare nel dettaglio la retrospettiva dello sprint all'interno del documento di Piano di Progetto, nel paragrafo dedicato.

== Chiarimenti sul ruolo del Responsabile

A seguito di alcuni dubbi sorti durante lo Sprint 1, il gruppo ha concordato le modalità di lavoro del Responsabile, concordando in particolare sui seguenti aspetti:

 - Il rilascio dei documenti avverrà esclusivamente con la versione x.0.0 a seguito dell' approvazione finale con firma da parte del Responsabile;
 - Il Responsabile di uno sprint si occupa sia della sua apertura (con assegnazione dei ruoli concordata con gli altri membri), che della sua chiusura con annessa retrospettiva riportata nel Piano di Progetto.

== Chiarimenti sul ruolo del Verificatore
Il ruolo del Verificatore è stato il più ambiguo nello Sprint passato, principalmente per la difficoltà nel definire quali fossero le attività di sua competenza durante questa fase perlopiù documentale. La riunione odierna ha portato il gruppo a riflettere e stabilire ufficialmente che il registro delle modifiche verrà aggiornato personalmente dal Verificatore (nella rispettiva colonna) nel momento in cui avrà verificato la validità di quanto prodotto.


== Assegnazione ruoli Sprint 2

Basandosi sulle disponibilità dei vari membri e cercando di assicurare varietà nella rotazione dei ruoli, l'assegnazione per lo Sprint 2 (in vigore dal 25/11/2026 al 09/12/2026) è la seguente:

#figure(
  block(
    width: auto,
    table(
      columns: (auto, auto),
      align: (left + horizon, left + horizon),
      stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
      fill: none,
      inset: (y: 7pt, x: 6pt),

      [*Ruolo*], [*Incaricato*],
      [Responsabile], [Pietro Giulio Bassi],
      [Analista], [Chen DaXin],
      [Analista], [Davide Loparco],
      [Analista], [Marco Giacon],
      [Analista], [Roberto Piovesan],
      [Verificatore], [Mattia Cadamuro],
    ),
  ),
  caption: [Ruoli assegnati per lo Sprint 2],
) <tab-ruoli>

Per approfondire le motivazioni dietro le assegnazioni dei ruoli, si invita alla lettura del paragrafo del Piano di Progetto dedicato allo Sprint 2.

== Discussione del To-Do dello Sprint 2


= Decisioni e attività
In data 24/11/2026 alle ore 18:00 è prevista una nuova riunione interna per determinare i nuovi ruoli dello sprint.
A seguire, la suddivisione dello svolgimento delle attività di questa settimana. Vengono riportare tutte le attività in corso, anche se già presenti nel precedente verbale.

#figure(
  table(
    columns: (auto, 3fr, 2fr, auto, auto),
    align: (left + horizon, left + horizon, left + horizon, center + horizon, center + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 6pt),

    [*ID*], [*Azione*], [*Incaricato*], [*Scadenza*], [*Issue#super[G]*],
    [A1], [Studio individuale tecnologie azienda e Diagrammi d'Uso], [Tutti], [20/11/2026], [-],
    [A2], [Continuazione stesura Norme di progetto (verbali e generazione PDF da Typst#super[G])], [Mattia Cadamuro, Marco Giacon], [24/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/32")[\#32]],
    [A3], [Stesura verbale interno odierno], [Pietro Giulio Bassi], [20/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/53")[\#53]],
    [A4], [Termine stesura primo sprint del Piano di Progetto], [Davide Loparco], [24/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/43")[\#54]],
    [A5], [Prima Stesura Piano di Qualifica], [Pietro Giulio Bassi], [24/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/56")[\#56]]
  ),
  caption: [Decisioni intraprese e attività conseguenti],
) <tab-decisioni>
