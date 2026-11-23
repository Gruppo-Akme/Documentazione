#import "../../Templates/templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale interno 17/11/2026",
  stato: "Approvato",
  versione: "1.0.0",
  ora-inizio: "18:00",
  ora-fine: "19:15",
  registro-modifiche: (
    ("1.0.1", "23/11/2026", "Roberto Piovesan", "Marco Giacon", "Fix minori"),
    ("1.0.0", "20/11/2026", "Davide Loparco", "-", "Rilascio ufficiale del documento"),
    ("0.2.0", "20/11/2026", "Pietro Giulio Bassi", "Marco Giacon", "Correzioni ortografiche e verifica finale del documento"),
    ("0.1.0", "17/11/2026", "Pietro Giulio Bassi", "Chen DaXin", "Prima stesura del documento"),
  ),
  odg: (
    "Determinazione data di incontro con l'azienda",  
    "Discussione sull'analisi dei requisiti",
    "Dubbi sul piano di progetto",
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
  verificatore-interno: "Davide Loparco",
  left-signature: "firma-Loparco.jpeg",
  tipo-verbale: "Interno",
)

= Informazioni generali
Con il presente verbale si certifica che Akme Group si è riunito in data 17/11/2026 dalle 18:00 alle 19:15 con l'intento di discutere le difficoltà incontrate nell'affrontare i vari task del primo Sprint#super[G], concordare un giorno adeguato per l'incontro bisettimanale con l'azienda, comprendere come studiare e prepararsi adeguatamente all'Analisi dei Requisti e al Piano di Qualifica.

= Resoconto

== Determinazione data di incontro con l'azienda

Il gruppo dopo l'incontro del giorno precedente con l'azienda ha discusso quale fascia oraria convenisse a tutti i membri del gruppo tra quelle proposte dall'azienda.
Con un sondaggio sono state determinate due giorni possibili per gli incontri bisettimanali:
 - Lunedì alle 17:00 
 - Martedì alle 17:00
 Al responsabile è stato dato il compito di contattare l'azienda informandola del risultato della deliberazione.


== Discussione sull'analisi dei requisiti

Il gruppo ha discusso insieme come intraprendere lo studio dei casi d'uso, l'approfondimento dei materiali delle lezioni, l'apprendimento delle tecnologie e lo studio meticoloso del capitolato C7.

== Dubbi sul piano di progetto
Il gruppo si è interrogato su come gestire l'assegnazione delle issue e dei compiti nel caso degli icontri che non coincidono con l'inizio dello sprint.
Abbiamo deciso che non sia opportuno assegnare nuovi compiti determinati perché questo confliggerebbe con i ruoli assegnati all'inizio dello sprint, perché questo significherebbe invalidare la previsione delle ore stabilita con il responsabile.
Dunque, a meno di situazioni di grave emergenza, abbiamo deciso che le nuove issue assegnate possano essere solo utili a determinare in modo più specifico dei task già precedentemente determinati all'inizio dello sprint, in modo da consentire il mantenimento della coerenza necessaria a portare a termine lo sprint in modo adeguato.

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
