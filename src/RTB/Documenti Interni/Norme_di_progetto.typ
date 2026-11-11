#import "../../Templates/templateDocumentiGenerici.typ": report, gloss

#let url-valutazione = "https://gruppo-akme.github.io/Documentazione/output/Candidatura/Valutazione%20Capitolati.pdf"
#let url-preventivo = "https://gruppo-akme.github.io/Documentazione/output/Candidatura/preventivo_costi.pdf"
#let url-sito = "https://gruppo-akme.github.io/Documentazione/website/"
#let url-repo = "https://github.com/Gruppo-Akme/Documentazione"

#show: report.with(
  titolo: "Norme di progetto",
  tipo-documento: "RTB - Documento interno",
  stato: "Bozza",
  versione: "0.1.1",
  registro-modifiche: (
    ("0.1.1", "11/11/2026", "Marco Giacon", "", "Correzioni minori versione precedente"),
    ("0.1.0", "25/10/2026", "Mattia Cadamuro", "Marco Giacon", "Creazione e prima stesura documento"),
  ),

  verificatore-interno: "",
  left-signature: "",
)



// Capitoli: grassetto, senza puntini, più spazio sopra
#show outline.entry.where(level: 1): set block(above: 1.2em)
#show outline.entry.where(level: 1): set text(weight: "bold")
#show outline.entry.where(level: 1): set outline.entry(fill: none)


= Introduzione <introduzione>

== Scopo del documento
Lo scopo di questo documento è definire il Way of working#super[G] adottato dal gruppo per la gestione del progetto didattico. Il testo descrive l'insieme ordinato di attività e processi di ciclo di vita scelti per soddisfare gli obiettivi prefissati, puntando sempre alla massima efficienza ed efficacia collaborativa. 

Il documento stabilisce incrementalmente le procedure di lavoro, adattando i processi standard alle necessità del gruppo, definendo l'allocazione delle risorse e la pianificazione delle scadenze. Trattandosi di un documento incrementale, subirà aggiornamenti continui parallelamente all'avanzamento del progetto, basandosi sui risultati delle retrospettive di periodo.

== Scopo del prodotto
Il prodotto da realizzare, descritto nel capitolato C7, è SmartDashboard#super[G]. Consiste in una piattaforma di Business Intelligence#super[G] self-service potenziata dall'Intelligenza Artificiale. 

L'obiettivo è svincolare i dati aziendali dai sistemi ERP#super[G], rendendoli direttamente fruibili per l'analisi da parte dei decisori aziendali senza richiedere il costante intervento del reparto IT. La piattaforma permetterà agli utenti di costruire dashboard interattive tramite una web app responsive. Il fulcro innovativo del sistema sarà il layer AI integrato, capace di generare visualizzazioni grafiche e fornire insight automatici elaborando richieste poste in linguaggio naturale.

== Glossario#super[G]
La stesura della documentazione e la scrittura del codice richiedono l'uso di una terminologia precisa e condivisa. Al fine di evitare incomprensioni o ambiguità di dominio, il gruppo ha raccolto i termini tecnici e gli acronimi all'interno del documento glossario. 

Per rendere immediata l'individuazione di tali termini, ogni parola afferente al glossario è contrassegnata all'interno del testo aggiungendo una lettera "G" ad apice, tramite l'apposita formattazione tipografica: parola.

== Riferimenti

=== Riferimenti normativi
- Capitolato d'appalto C7: Ergon - SmartDashboard.

=== Riferimenti informativi
- Slide del corso di Ingegneria del Software - Gestione di progetto.
- Lezioni fornite dal docente del corso di Ingegneria del Software.