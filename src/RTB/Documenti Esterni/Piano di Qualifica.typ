#import "../../Templates/templateDocumentiGenerici.typ": report

#show: report.with(
  titolo: "Piano di Qualifica",
  stato: "In verifica",
  versione: "0.1.0",
  tipo-documento: "Documento Esterno",
  registro-modifiche: (
    ("0.1.0", "20/11/2026", "Pietro Giulio Bassi", "DaXin Chen", "Prima stesura: Introduzione, Qualità di Processo, Qualità di Prodotto e Strategie e Metriche di Testing."),
  ),
)

= Introduzione

== Scopo del documento
Il presente documento, *Piano di Qualifica*, definisce l'architettura metodologica, gli standard di riferimento e gli strumenti quantitativi adottati da *Akme Group* per assicurare, monitorare e valutare la qualità lungo l'intero ciclo di vita del progetto. 

L'obiettivo primario è stabilire un quadro oggettivo e misurabile che consenta di:
- definire i traguardi qualitativi attesi sia per i processi operativi interni sia per il prodotto software rilasciato;
- fissare metriche quantitative dotate di soglie di accettabilità e di ottimalità chiare e verificabili;
- pianificare le strategie di verifica e validazione mediante attività strutturate di analisi statica, analisi dinamica e testing;
- prevenire l'insorgenza di anomalie attraverso un monitoraggio continuo che guidi le azioni correttive e il miglioramento iterativo.

== Glossario#super[G]
Per evitare ambiguità terminologiche e garantire uniformità lessicale tra tutta la documentazione prodotta dal gruppo, i termini tecnici, gli acronimi e le locuzioni specifiche del dominio sono definiti all'interno del documento *Glossario*.

== Riferimenti

=== Riferimenti normativi
=== Riferimenti normativi
- *Capitolato d'appalto#super[G] C7 — SmartDashboard (Ergon Informatica S.r.l.)*: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Progetto/C7-SD.pdf") (Ultima consultazione: 14/11/2026)
- *Norme di Progetto* (documento interno di Akme Group, versione corrente): regolamento interno relativo al Way of Working, ai processi di ciclo di vita e alle convenzioni redazionali.
- *Regolamento del Progetto Didattico*: \
  #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/T03.pdf") (Ultima consultazione: 14/11/2026)

=== Riferimenti informativi
- #link("https://www.math.unipd.it/%7Etullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf")[*Standard ISO/IEC 12207:1995*] — _Information technology - Software life cycle processes_, modello di riferimento per la tassonomia dei processi primari, di supporto e organizzativi;
- #link("https://iso25000.com/index.php/en/iso-25000-standards/iso-25010")[*Standard ISO/IEC 25010:2011*] (evoluzione di *ISO/IEC 9126*) — _Systems and software engineering - Systems and software Quality Requirements and Evaluation (SQuaRE)_, modello di riferimento per le caratteristiche di qualità del prodotto software;
- *Dispense del corso di Ingegneria del Software* — Materiale didattico relativo alla qualità di prodotto, alla qualità di processo e alle attività di verifica e validazione.
  - #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/T07.pdf")[Qualità del prodotto]
  - Qualità di processo
  - Metriche e validazione

= Qualità di Processo

La qualità del prodotto finale è strettamente correlata all'efficacia e al rigore dei processi impiegati per realizzarlo. Monitorare costantemente i processi mediante indicatori oggettivi permette di individuare tempestivamente inefficienze organizzative o scostamenti dalla pianificazione prima che si traducano in difetti architetturali o ritardi di consegna.

In conformità con la struttura definita dallo standard *ISO/IEC 12207:1995*, le metriche di qualità di processo (identificate dal prefisso *MPR*) sono classificate in tre macro-categorie:
1. *Processi primari*: attività che generano valore diretto lungo il ciclo di vita del software;
2. *Processi di supporto*: attività trasversali che garantiscono l'integrità, la tracciabilità e la qualità degli artefatti prodotti;
3. *Processi organizzativi*: attività di gestione, coordinamento e miglioramento continuo della struttura operativa del gruppo.

Per ciascuna metrica vengono definite due soglie di riferimento:
- *Valore accettabile*: limite minimo (o massimo) indispensabile affinché il processo sia ritenuto sotto controllo e conforme agli obiettivi di progetto;
- *Valore ottimo*: traguardo ideale verso cui il gruppo tende per massimizzare l'efficienza operativa.

== Processi primari
I processi primari governano direttamente l'acquisizione, la fornitura e lo sviluppo del software.

=== Fornitura
Le metriche del processo di fornitura monitorano l'avanzamento economico e temporale del progetto rispetto al preventivo iniziale (BAC — _Budget at Completion_), basandosi sulla metodologia dell'_Earned Value Management_.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPR-01], [Planned Value (PV)], [$>= 0$ €], [$<= "BAC"$],
  [MPR-02], [Earned Value (EV)], [$>= 0.85 dot "PV"$], [$>= "PV"$],
  [MPR-03], [Actual Cost (AC)], [$<= 1.10 dot "EV"$], [$<= "EV"$],
  [MPR-04], [Schedule Variance (SV)], [$>= -10\%$ del PV], [$>= 0$ €],
  [MPR-05], [Cost Variance (CV)], [$>= -10\%$ dell'EV], [$>= 0$ €],
  [MPR-06], [Schedule Performance Index (SPI)], [$>= 0.90$], [$>= 1.00$],
  [MPR-07], [Cost Performance Index (CPI)], [$>= 0.90$], [$>= 1.00$],
  [MPR-08], [Estimate at Completion (EAC)], [$>= 0.90 dot "BAC"$ e $<= 1.05 dot "BAC"$], [$<= "BAC"$],
  [MPR-09], [Estimate to Complete (ETC)], [$>= 0$ €], [$<= ("BAC" - "AC")$],
)

=== Sviluppo
Le metriche del processo di sviluppo valutano la stabilità dei requisiti, la puntualità nell'evasione delle attività pianificate per ciascuno sprint e la reattività nella revisione del codice.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPR-10], [Requirements Stability Index (RSI)], [$>= 80\%$], [$>= 95\%$],
  [MPR-11], [Sprint#super[G] Velocity Deviation (SVD)], [$<= 20\%$], [$<= 5\%$],
  [MPR-12], [Pull Request Lead Time (PRLT)], [$<= 48$ ore], [$<= 24$ ore],
)

- *Requirements Stability Index (RSI)*: misura la percentuale di requisiti che non subiscono variazioni (aggiunte, modifiche o rimozioni) tra due revisioni successive, calcolata come $"RSI" = (1 - (N_"mod" + N_"agg" + N_"rim") / N_"tot") dot 100$.
- *Sprint Velocity Deviation (SVD)*: esprime lo scostamento percentuale tra le issue pianificate a inizio sprint e quelle effettivamente chiuse al termine dello stesso.
- *Pull Request Lead Time (PRLT)*: indica il tempo medio intercorso tra l'apertura di una _Pull Request_ e la sua approvazione ed integrazione nel ramo principale.

== Processi di supporto
I processi di supporto affiancano i processi primari assicurando che ogni artefatto prodotto rispetti gli standard formali, sia correttamente tracciato e superi le verifiche previste.

=== Documentazione
Le metriche di documentazione valutano la chiarezza espositiva e la correttezza formale dei documenti prodotti dal gruppo.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPR-13], [Indice di Gulpease], [$>= 45$], [$>= 65$],
  [MPR-14], [Densità di Errori Ortografici (DEO)], [$0$ errori], [$0$ errori],
)

- *Indice di Gulpease*: valuta la leggibilità di un testo in lingua italiana su una scala da $0$ (leggibilità minima) a $100$ (leggibilità massima), secondo la formula:
  $ "Gulpease" = 89 + (300 dot "numero frasi" - 10 dot "numero lettere") / "numero parole" $
- *Densità di Errori Ortografici (DEO)*: conteggia i refusi ortografici e grammaticali rilevati tramite strumenti automatici di _spell-checking_ e revisione manuale prima del rilascio di qualsiasi versione.

=== Gestione della configurazione e Verifica
Le metriche seguenti monitorano l'efficacia delle attività di controllo versione, tracciamento dei difetti e superamento delle verifiche.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPR-15], [Defect Resolution Time (DRT)], [$<= 72$ ore], [$<= 24$ ore],
  [MPR-16], [Review Rejection Rate (RRR)], [$<= 25\%$], [$<= 10\%$],
)

- *Defect Resolution Time (DRT)*: tempo medio necessario per analizzare, correggere e chiudere una segnalazione di non conformità (_bug_ o anomalia documentale) dal momento della sua apertura.
- *Review Rejection Rate (RRR)*: rapporto percentuale tra il numero di artefatti respinti in fase di verifica e il totale degli artefatti sottoposti a revisione.

== Processi organizzativi
I processi organizzativi governano il coordinamento interno del team, la sostenibilità del carico di lavoro e l'efficacia complessiva del sistema qualità.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPR-17], [Soddisfacimento Metriche di Qualità (SMQ)], [$>= 80\%$], [$100\%$],
  [MPR-18], [Indice di Equità del Carico (IEC)], [$<= 15\%$], [$<= 5\%$],
  [MPR-19], [Efficienza Produttiva Oraria (EPO)], [$>= 65\%$], [$>= 85\%$],
)

- *Soddisfacimento Metriche di Qualità (SMQ)*: percentuale di metriche (di processo e di prodotto) che, al termine di uno sprint, rientrano almeno nella soglia di accettabilità.
- *Indice di Equità del Carico (IEC)*: deviazione standard percentuale delle ore produttive rendicontate dai singoli membri del gruppo rispetto alla media di periodo, utile a prevenire colli di bottiglia o sovraccarichi individuali.
- *Efficienza Produttiva Oraria (EPO)*: rapporto percentuale tra le ore investite in attività direttamente produttive (sviluppo, progettazione, verifica) e le ore totali rendicontate (includendo formazione e riunioni organizzative).

---

= Qualità di Prodotto

La qualità del prodotto software rappresenta il grado con cui il sistema soddisfa le esigenze esplicite ed implicite degli utenti e rispetta i vincoli architetturali e prestazionali stabiliti. In accordo con il modello *ISO/IEC 25010*, *Akme Group* ha selezionato un insieme di metriche di prodotto (identificate dal prefisso *MPD*) suddivise nelle caratteristiche qualitative più rilevanti per il dominio applicativo.

== Adeguatezza funzionale
Valuta la capacità del prodotto di fornire funzioni che soddisfino i requisiti dichiarati e impliciti quando utilizzato nelle condizioni specificate.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPD-01], [Copertura Requisiti Obbligatori (CRO)], [$100\%$], [$100\%$],
  [MPD-02], [Copertura Requisiti Desiderabili (CRD)], [$>= 30\%$], [$100\%$],
  [MPD-03], [Copertura Requisiti Opzionali (CPO)], [$>= 0\%$], [$>= 60\%$],
  [MPD-04], [Correttezza Funzionale (CF)], [$100\%$], [$100\%$],
)

- *Copertura Requisiti (CRO, CRD, CPO)*: rapporto percentuale tra i requisiti implementati e verificati con successo e il totale dei requisiti individuati per ciascuna classe di priorità.
- *Correttezza Funzionale (CF)*: percentuale di funzionalità implementate che producono risultati conformi alle specifiche senza deviazioni logiche.

== Affidabilità
Misura la capacità del sistema di mantenere un livello di prestazioni specificato in condizioni definite per un periodo di tempo stabilito, includendo la tolleranza ai guasti e la recuperabilità.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPD-05], [Densità di Difetti Residui (DDR)], [$<= 1.5$ difetti / KLOC], [$0$ difetti / KLOC],
  [MPD-06], [Failure Rate Operativo (FRO)], [$<= 2\%$], [$0\%$],
  [MPD-07], [Copertura Gestione Eccezioni (CGE)], [$>= 85\%$], [$100\%$],
)

- *Densità di Difetti Residui (DDR)*: numero di difetti noti non ancora risolti rapportato a mille linee di codice sorgente (KLOC).
- *Failure Rate Operativo (FRO)*: percentuale di transazioni o richieste di sistema che terminano con un errore non gestito durante le sessioni di collaudo.
- *Copertura Gestione Eccezioni (CGE)*: percentuale di flussi alternativi e condizioni di errore critiche (es. perdita di connessione, input malformati) gestite esplicitamente dal codice senza degrado incontrollato.

== Efficienza delle prestazioni
Valuta il rapporto tra le prestazioni fornite dal software e la quantità di risorse utilizzate in condizioni determinate.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPD-08], [Tempo Medio di Risposta (TMR)], [$<= 1.5$ secondi], [$<= 0.4$ secondi],
  [MPD-09], [Latenza al 95° Percentile ($P_"95"$)], [$<= 3.0$ secondi], [$<= 1.0$ secondo],
)

== Usabilità
Misura il grado con cui il prodotto può essere compreso, appreso, utilizzato e risultare gradevole per gli utenti in uno specifico contesto d'uso.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPD-10], [Tempo di Apprendimento (TAP)], [$<= 15$ minuti], [$<= 5$ minuti],
  [MPD-11], [Tasso di Errore Utente (TEU)], [$<= 10\%$], [$<= 2\%$],
  [MPD-12], [Conformità Accessibilità (WCAG)], [Livello A], [Livello AA],
)

- *Tempo di Apprendimento (TAP)*: tempo medio necessario a un nuovo utente, dotato del solo *Manuale Utente*, per completare autonomamente i flussi operativi principali.
- *Tasso di Errore Utente (TEU)*: percentuale di operazioni errate compiute dall'utente durante l'esecuzione dei casi d'uso principali a causa di ambiguità nell'interfaccia.
- *Conformità Accessibilità (WCAG)*: livello di aderenza delle interfacce utente alle linee guida _Web Content Accessibility Guidelines 2.1_.

== Manutenibilità
Valuta l'efficacia e l'efficienza con cui il prodotto software può essere modificato per correggerlo, migliorarlo o adattarlo a cambiamenti dell'ambiente e dei requisiti.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPD-13], [Complessità Ciclomatica di McCabe (CC)], [$<= 15$], [$<= 8$],
  [MPD-14], [Complessità Cognitiva (CogC)], [$<= 15$], [$<= 10$],
  [MPD-15], [Densità di Code Smell (DCS)], [$<= 10$ / KLOC], [$<= 3$ / KLOC],
  [MPD-16], [Duplicazione del Codice (DUP)], [$<= 5\%$], [$<= 1.5\%$],
  [MPD-17], [Indice di Manutenibilità (MI)], [$>= 65$], [$>= 85$],
)

- *Complessità Ciclomatica (CC)*: misura il numero di cammini linearmente indipendenti attraverso il grafo di controllo del flusso di ciascuna funzione o metodo ($V(G) = E - N + 2P$).
- *Complessità Cognitiva (CogC)*: valuta quanto risulta difficoltosa la comprensione del flusso logico di un blocco di codice per uno sviluppatore umano, penalizzando l'annidamento eccessivo.
- *Indice di Manutenibilità (MI)*: indice composito (normalizzato su scala $0-100$) che combina volume di Halstead, complessità ciclomatica e linee di codice per stimare la facilità di manutenzione del modulo.

== Sicurezza
Misura il grado con cui il prodotto protegge le informazioni e i dati in modo che persone o altri sistemi abbiano un livello di accesso adeguato ai rispettivi tipi e livelli di autorizzazione.

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPD-18], [Cifratura Dati Sensibili (CDS)], [$100\%$], [$100\%$],
  [MPD-19], [Vulnerabilità Critiche Note (VCN)], [$0$ vulnerabilità], [$0$ vulnerabilità],
)

---

= Strategie e Metriche di Testing

Le attività di testing costituiscono lo strumento principale dell'analisi dinamica volto a fornire evidenza oggettiva che il sistema soddisfi i requisiti specificati (verifica) e risponda alle reali esigenze dell'utente finale (validazione).

== Metodologie di testing adottate
In conformità con le pratiche di ingegneria del software e con le regole fissate nelle *Norme di Progetto*, il processo di testing è articolato su cinque livelli complementari:

1. *Test di Unità (TU)*: verificano in isolamento il comportamento delle singole unità software (funzioni, metodi, componenti UI), utilizzando tecniche di _mocking_ e _stubbing_ per simulare le dipendenze esterne.
2. *Test di Integrazione (TI)*: verificano la corretta interoperabilità, i contratti d'interfaccia e il flusso dei dati tra moduli e sottosistemi aggregati (es. comunicazione tra livelli architetturali, persistenza su database e chiamate API).
3. *Test di Sistema (TS)*: verificano il comportamento complessivo del sistema integrato in un ambiente rappresentativo di quello operativo, accertando la piena copertura di tutti i requisiti funzionali e non funzionali.
4. *Test di Regressione (TR)*: consistono nella riesecuzione automatizzata delle suite di test esistenti (tramite pipeline di Continuous Integration) a seguito di ogni modifica al codice, al fine di garantire che l'introduzione di nuove funzionalità o il refactoring non compromettano comportamenti già validati.
5. *Test di Accettazione (TA)*: costituiscono il collaudo finale condotto congiuntamente con il proponente per validare l'aderenza del prodotto alle aspettative d'uso e decretarne il rilascio.

Per tracciare lo stato di avanzamento di ciascun caso di test pianificato, viene adottata la seguente codifica:
- *NP (Non Pianificato / Non Implementato)*: test individuato a livello concettuale ma non ancora codificato;
- *IE (Implementato, non Eseguito)*: test codificato ma in attesa di esecuzione o relativo a funzionalità in fase di completamento;
- *SU (Superato)*: test eseguito con esito conforme ai risultati attesi;
- *FA (Fallito)*: test eseguito con esito difforme dalle attese, che richiede l'apertura di un'anomalia e un intervento correttivo.

== Metriche di testing
Per valutare quantitativamente l'efficacia e la profondità delle suite di test sviluppate, *Akme Group* definisce le seguenti metriche di testing (identificate dal prefisso *MPT*), collegate direttamente alle caratteristiche di affidabilità e manutenibilità del prodotto:

#table(
  columns: (0.16fr, 0.34fr, 0.25fr, 0.25fr),
  align: (left, left, center, center),
  stroke: 0.6pt + black,
  inset: 7pt,
  table.header([*Codice*], [*Nome Metrica*], [*Valore Accettabile*], [*Valore Ottimo*]),
  [MPT-01], [Statement Coverage (SC)], [$>= 75\%$], [$>= 90\%$],
  [MPT-02], [Branch Coverage (BC)], [$>= 65\%$], [$>= 85\%$],
  [MPT-03], [Function / Method Coverage (FMC)], [$>= 80\%$], [$>= 95\%$],
  [MPT-04], [Test Pass Rate (TPR)], [$100\%$], [$100\%$],
  [MPT-05], [Copertura Test di Sistema (CTS)], [$100\%$ dei req. obb.], [$100\%$ di tutti i req.],
  [MPT-06], [Defect Detection Efficiency (DDE)], [$>= 85\%$], [$>= 95\%$],
)

- *Statement Coverage (SC)*: percentuale di istruzioni eseguibili del codice sorgente attraversate almeno una volta durante l'esecuzione dei test automatici.
- *Branch Coverage (BC)*: percentuale di rami decisionali (esiti _vero_ e _falso_ di strutture condizionali e cicli) valutati durante l'esecuzione dei test.
- *Function / Method Coverage (FMC)*: rapporto percentuale tra il numero di funzioni o metodi invocati almeno una volta dai test e il numero totale di funzioni definite nel progetto.
- *Test Pass Rate (TPR)*: percentuale di test eseguiti che terminano con stato *SU* (Superato) sul totale dei test eseguiti in una determinata build ($"TPR" = (N_"SU" / N_"eseguiti") dot 100$). In fase di rilascio la soglia accettabile coincide con l'ottimo ($100\%$).
- *Copertura Test di Sistema (CTS)*: rapporto percentuale tra i requisiti coperti da almeno un caso di test di sistema superato e il totale dei requisiti individuati nell'*Analisi dei Requisiti*.
- *Defect Detection Efficiency (DDE)*: misura l'efficacia delle attività interne di verifica e testing nell'intercettare i difetti prima del rilascio, calcolata come $"DDE" = (D_"interni" / (D_"interni" + D_"esterni")) dot 100$, dove $D_"interni"$ sono i difetti rilevati dal team e $D_"esterni"$ quelli segnalati in fase di revisione o collaudo esterno.