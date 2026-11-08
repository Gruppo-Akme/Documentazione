#import "../../Templates/templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale interno 03/11/2026",
  stato: "Approvato",
  versione: "1.0.0",
  ora-inizio: "18:00",
  ora-fine: "19:30",
  registro-modifiche: (
    ("1.0.0", "04/11/2026", "-", "Pietro Giulio Bassi", "Verifica finale"),
    ("0.1.0", "03/11/2026", "Roberto Piovesan", "Marco Giacon", "Prima stesura del documento"),
  ),
  odg: (
    "Scelta del nuovo capitolato", "Allineamento sui versionamenti", "Correzione template verbali", "Aggiornamento documentazione", 
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
  verificatore-interno: "Pietro Giulio Bassi",
  left-signature: "firma-Bassi.jpeg",
  tipo-verbale: "Interno",
)

= Informazioni generali
Con il presente verbale si certifica che Akme Group si è riunito in data 03/11/2026 dalle 18:00 alle 19:30 con l'intento di discutere sulla scelta del nuovo capitolato e di aggiornare la documentazione per la nuova candidatura, inoltre sono state discusse alcune procedure divenute standard per il versionamento dei documenti e i template dei verbali.

= Resoconto

== Scelta del nuovo capitolato
A seguito di una discussione sulle proposte C7 SmartDashboard e C8 Sonar, il gruppo ha deciso all'unanimità di presentare la nuova candidatura per il *capitolato C7*.

Fattore determinante nella scelta di escludere il capitolato C8 è stato la forte dipendenza dalle frequenti limitazioni di rate limiting e di gestione dei consumi sui piani gratuiti delle tecnologie proposte, fattore che avrebbe richiesto un impegno notevole nella gestione dei margini d'errore dell'orchestrazione. Al contrario, la struttura del progetto C7 consente un approccio di sviluppo incrementale più chiaro, garantendo un miglior controllo dei rischi e delle tempistiche complessive.   Inoltre, i vincoli tecnologici richiesti da C8 risultano più stringenti rispetto al margine di scelta più ampio e modulare garantito da C7, e il dominio applicativo di quest'ultimo (incentrato sulla Business Intelligence e sulle analisi guidate da IA) è stato ritenuto dal gruppo in linea generale maggiormente stimolante.

== Allineamento sui versionamenti
A seguito delle osservazioni ricevute in sede di revisione, il gruppo ha uniformato la gestione e la tracciabilità delle modifiche all'interno della documentazione. In particolare, sono stati definiti e implementati i seguenti punti chiave:

1. *Gestione delle correzioni minori:* È stata recepita la correzione del docente riguardante l'obbligatorietà della figura del verificatore anche in presenza di modifiche minori o formali. La singola occorrenza pregressa caratterizzata dalla sola figura dell'editore e dall'oggetto "Correzioni minori" è stata correttamente sanata e allineata allo standard.

2. *Convenzione per la versione definitiva:* Il gruppo ha stabilito che l'ultima riga di versione definitiva di ciascun documento, qualora non siano presenti correzioni ortografiche o strutturali da fare e in linea generale il documento sia corretto, debba presentare il campo dell'"editore" vuoto e il campo del "verificatore" recante il nome del membro del gruppo che ha effettuato il controllo, accompagnato dall'oggetto "Verifica del documento".

3. *Firma del revisore e ruoli:* È stato ribadito che la firma e l'indicazione del revisore/responsabile interno debbano essere rigorosamente conformi a chi ricopre effettivamente il ruolo di Responsabile#super[G] alla data di stesura del documento.

4. *Risoluzione bug di versionamento:* È stato inoltre individuato e risolto un bug nel sistema di generazione che causava l'aggiunta indesiderata di una riga di versionamento extra in occasione di ogni nuova iterazione.

== Correzione template verbali
In seguito ai rilievi emersi durante la revisione con il docente, sono state apportate alcune modifiche migliorative e correttive alla struttura del template dei verbali (sia interni che esterni):

1. *Aggiunta dell'orario della riunione:* Nella prima pagina di ciascun verbale è stato integrato l'orario di svolgimento dell'incontro (ora inizio e ora fine), andando a completare la sezione dei metadati generali che già comprendeva la data, l'ordine del giorno e la lista dei partecipanti.

2. *Revisione della tabella di tracciamento attività:* È stata aggiornata la struttura della tabella finale relativa alle decisioni e attività conseguenti. La nuova conformazione include un identificativo univoco ("ID") per ciascuna azione e il collegamento diretto con il repository di progetto tramite link ipertestuale alla relativa *issue* di GitHub#super[G], garantendo così la piena tracciabilità tra le delibere e la loro esecuzione.

== Aggiornamento documentazione
A seguito della riconsiderazione delle proposte di capitolato e dei rilievi emersi in sede di revisione, il gruppo ha ravvisato la necessità di aggiornare e redigere daccapo la documentazione essenziale per presentare la nuova candidatura ufficiale. 

In particolare, i documenti interessati da questo intervento sono la Lettera di Candidatura e la Dichiarazione degli Impegni (assegnate rispettivamente a Marco Giacon e Pietro Giulio Bassi per la stesura formale, come indicato nella tabella delle attività). È opportuno sottolineare che, sebbene la stesura ufficiale e la pulizia finale del testo siano state affidate a un singolo membro per efficienza, l'elaborazione dei contenuti della Dichiarazione degli Impegni è stata il frutto di un lavoro collettivo e partecipato: l'intero gruppo si è confrontato attivamente attraverso approfondite discussioni preliminari per definire ogni aspetto, prima di procedere con la formalizzazione definitiva e la successiva verifica interna.

In aggiunta a ciò, il gruppo ha deciso di compiere un ulteriore passo avanti nella strutturazione della documentazione di progetto, avviando la stesura di una prima bozza del documento relativo alle Norme di progetto, un testo fondamentale destinato ad accompagnare e regolamentare l'intero ciclo di vita dello sviluppo.

= Decisioni e attività
In data 10/11/2026 alle ore 18:00 è prevista una nuova riunione interna per valutare i passi successivi alla candidatura.

A seguire, la suddivisione dello svolgimento delle attività di questa settimana.

#figure(
  table(
    columns: (auto, 3fr, 2fr, auto, auto),
    align: (left + horizon, left + horizon, left + horizon, center + horizon, center + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 6pt),

    [*ID*], [*Azione*], [*Incaricato*], [*Scadenza*], [*Issue#super[G]*],
    [A1], [Standardizzazione registro delle modifiche nei verbali], [Davide Loparco], [04/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/26")[\#26]],
    [A2], [Stesura nuova lettera di Candidatura], [Marco Giacon], [04/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/27")[\#27]],
    [A3], [Stesura nuova Analisi degli Impegni], [Pietro Giulio Bassi], [04/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/28")[\#28]],
    [A4], [Correzione bug nel registro delle modifiche], [Chen Daxin], [04/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/29")[\#29]],
    [A5], [Aggiornamento template verbali], [Chen Daxin], [04/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/30")[\#30]],
    [A6], [Stesura verbale interno odierno], [Roberto Piovesan], [04/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/31")[\#31]],
    [A7], [Creare una prima bozza delle Norme di progetto], [Mattia Cadamuro], [04/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/32")[\#32]],
    [A8], [Link delle issue nei verbali], [Davide Loparco], [04/11/2026], [#link("https://github.com/Gruppo-Akme/Documentazione/issues/33")[\#33]],
  ),
  caption: [Decisioni intraprese e attività conseguenti],
) <tab-decisioni>