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
  left-signature: "blank.png",
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
Dopo una prima stesura dei vari documenti da presentare alla consegna di RTB durante il primo Sprint, il team ha deciso di concentrare le risorse di questo sprint nello studio e nell'individuazione dei casi d'uso per l'applicativo. 

In particolare, ci si aspetta di individuare un numero sufficiente di casi d'uso da portare all'incontro con Ergon (datato 01/12/2026) in modo da direzionare al meglio il lavoro nella seconda metà dello sprint.

= Decisioni e attività
In data 30/11/2026 alle ore 18:00 è prevista una nuova riunione interna per discutere l'andamento dello Sprint e allinearsi in previsione dell'incontro con Ergon il giorno seguente.
A seguire, la suddivisione dello svolgimento delle attività di questa settimana. 

#figure(
  table(
    columns: (auto, 3fr, 2fr, auto, auto),
    align: (left + horizon, left + horizon, left + horizon, center + horizon, center + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 6pt),

    [*ID*], [*Azione*], [*Incaricato*], [*Scadenza*], [*Issue#super[G]*],
    [A1], [Chiusura Sprint 1], [Davide Loparco], [27/11/2026], [],
    [A2], [Stesura verbale odierno], [Davide Loparco], [25/11/2026], [],
    [A3], [Stesura inizio Sprint 2 nel Piano di Progetto], [Pietro Giulio Bassi], [30/11/2026], [],
    [A4], [Aggiornamento Norme di Progetto (Problema issues)], [Roberto Piovesan], [30/11/2026], [],
    [A5], [Aggiornamento Norme di Progetto (Ruolo Responsabile)], [Roberto Piovesan], [30/11/2026], [],
    [A6], [Aggiornamento Norme di Progetto (Ruolo Verificatore)], [Roberto Piovesan], [30/11/2026],[],
    [A7], [Individuazione User Case per il ruolo di Amministratore], [Chen DaXin], [30/11/2026], [],
    [A8], [Individuazione User Case per il ruolo di utente viewer], [Davide Loparco], [30/11/2026], [],
    [A9], [Individuazione User Case per gli utenti con capacità di modificare la dashboard], [Marco Giacon], [30/11/2026], []
  ),
  caption: [Decisioni intraprese e attività conseguenti],
) <tab-decisioni>
