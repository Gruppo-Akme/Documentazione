#import "../Templates/templateDocumentiGenerici.typ": report, gloss

#let codice = "C2"
#let nome-capitolato = "Concierge"
#let azienda = "Eggon S.r.l."
#let costo = "XX.XXX€"
#let scadenza = "GG MM AAAA"

#let url-valutazione = "https://gruppo-akme.github.io/Documentazione/output/Candidatura/Valutazione%20Capitolati.pdf"
#let url-preventivo = "https://example.com/Preventivo_Costi.pdf"
#let url-sito = "https://gruppo-akme.github.io/Documentazione/website/"
#let url-repo = "https://github.com/Gruppo-Akme/Documentazione"

#let membri = (
  ("Pietro Giulio", "Bassi", "2137999"),
  ("Mattia", "Cadamuro", "2111534"),
  ("DaXin", "Chen", "2148627"),
  ("Marco", "Giacon", "2123537"),
  ("Davide", "Loparco", "2101088"),
  ("Roberto", "Piovesan", "2101065"),
)

#show: report.with(
  titolo: "Candidatura Capitolato " + codice,
  tipo-documento: "Lettera di presentazione",
  stato: "Bozza",
  versione: 0.1,
)

= Candidatura

Egregi Professori Vardanega e Cardin,

con il presente documento il team *"Akme Group"* desidera formalizzare la propria candidatura per la realizzazione del capitolato del progetto *#codice*: *#nome-capitolato*,
proposto dall'azienda *#azienda*.

= Motivazioni della scelta

Le principali motivazioni che ci hanno portato a scegliere il presente capitolato sono le seguenti:

- *Tecnologie attuali:* il progetto permette di lavorare con modelli linguistici, recupero della conoscenza e integrazione di strumenti, ambiti molto richiesti.
- *Perimetro definito:* l'MVP riguarda solo ferie e permessi, con criteri di accettazione e prove descritti in modo esplicito.
- *Supporto del proponente:* sono previsti incontri periodici, un referente dedicato e la fornitura di manuali, regolamenti e dati di prova.
- *Libertà nelle scelte tecniche:* il team può proporre tecnologie e architettura, motivandole rispetto ai risultati.
- *Utilità concreta:* il prodotto risolve un problema reale, ridurre le richieste ripetitive e semplificare l’accesso ai servizi HR.

Per maggiori dettagli si rimanda al documento di #link(url-valutazione)[Valutazione dei Capitolati].

= Preventivo e termine di consegna

Come discusso nel documento di #link(url-preventivo)[Preventivo Costi] abbiamo preventivato un costo complessivo per la realizzazione del progetto di *#costo*, fissando come termine ultimo per il completamento il *#scadenza*.

= Documentazione

Tutta la documentazione redatta dal gruppo è pubblicamente disponibile nel seguente #link(url-sito)[sito ufficiale] e nella #link(url-repo)[repository] dedicata.

= Membri del gruppo

Akme Group è composto dai seguenti membri:

#v(0.5em)

#table(
  columns: (1fr, 1fr, 1fr),
  align: left,
  inset: 6pt,
  stroke: 0.5pt,
  fill: (x, y) => if y == 0 { rgb("#d9d9f2") },
  [*Nome*], [*Cognome*], [*Matricola*],
  ..membri.flatten(),
)

#v(1cm)

Cordiali saluti, \
Akme Group.