#import "../templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale Interno 22/10/2026",
  stato: "Approvato",
  versione: "1.0.0",
  ora-inizio: "12:00",
  ora-fine: "14:00",
  registro-modifiche: (
    ("1.0.0", "22/10/2026", "Davide Loparco", "Davide Loparco", "Revisione del documento e approvazione"),
    ("0.2.0", "22/10/2026", "Roberto Piovesan", "Davide Loparco", "Integrazione risultati test e pianificazione"),
    ("0.1.0", "22/10/2026", "Roberto Piovesan", "Davide Loparco", "Prima stesura verbale"),
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
  odg: (
    "Verifica e allineamento dei template Typst",
    "Organizzazione cartella test per i template",
    "Pianificazione prossime attività di gruppo",
  ),
  htmlId: "Candidatura-VerbaliInterni",
  verificatore-interno: "Chen Daxin",
  left-signature: "firma-Chen.png",
  tipo-verbale: "Interno",
)

= Informazioni generali
In data *22 ottobre 2026*, i membri del gruppo Akme Group si sono riuniti in via telematica per discutere e collaudare i modelli grafici della documentazione di progetto.

= Resoconto
== Allineamento dei template
Si è proceduto alla standardizzazione grafica dei file Typst in modo da garantire un layout coerente per tutti i documenti:
- Copertina istituzionale con logo UniPD e logo del gruppo;
- Header e footer con tracciamento della numerazione delle pagine;
- Registro delle modifiche e indice automatico.

== Risultati dei test
Tutti i documenti compilano correttamente senza produrre avvisi o errori di formattazione.

= Decisioni e azioni da svolgere
#figure(
  table(
    columns: (auto, 3fr, 2fr, auto, auto),
    align: (left + horizon, left + horizon, left + horizon, center + horizon, center + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 6pt),

    [*ID*], [*Azione*], [*Incaricato*], [*Scadenza*], [*Issue*],
    [A1], [Modificare la vista web su GitHub Pages], [Lorenzo Cisco], [2026-10-28], [#issue(24)],
    [A2], [Pubblicare il verbale interno del 2026-10-26], [Niccolò Bassan], [2026-10-28], [#issue(28)],
  ),
  caption: [Decisioni e azioni da svolgere],
) <tab-decisioni-azioni>

