#import "../../Templates/templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale esterno 27/10/2026",
  stato: "Da approvare",
  versione: "0.1.0",
  registro-modifiche: (
    ("0.1.0", "28/10/2026", "Roberto Piovesan", "Membro Gruppo", "Stesura iniziale del verbale esterno post-incontro con Eggon"),
  ),
  odg: (
    "Chiarimenti sul monte ore e Allineamento ai vincoli CFU",
    "Configurazione dell'Infrastruttura Cloud e Definizione dell'ambiente di test",
    "Metriche di Confidence Score e Validazione delle risposte nel Sistema RAG",
    "Traccabilità delle fonti e Logging Operativo nel Backoffice dell'MVP",
    "Criteri di Segmentazione e Indicizzazione dei documenti per NEXUM",
    "Conformità GDPR e Gestione dei Dati Sensibili",
  ),
  partecipanti: (
    "Gianpaolo Ferrarin (Eggon S.r.l. - Referente Aziendale Proponente)",
    "Pietro Giulio Bassi",
    "Davide Loparco",
    "Roberto Piovesan",
    "Marco Giacon",
  ),
  distribuzione: (
    "Akme Group",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
    "Eggon S.r.l.",
  ),
  verificatore-interno: "",
  left-signature: "",
  verificatore-esterno: "",
  right-signature: "",
  tipo-verbale: "",
)

= Introduzione
Il presente verbale attesta lo svolgimento dell'incontro di chiarimento ed approfondimento tenutosi in data *27 Ottobre 2026*, dalle ore 17:30 alle ore 18:00, in modalità telematica via videoconferenza (Google Meet). La riunione è stata organizzata per discutere i dettagli tecnici, architetturali e metodologici relativi al *Capitolato C2: Concierge*, proposto dall'azienda *Eggon S.r.l.* (Viale dell'Industria 19, Padova) nell'ambito del corso di Ingegneria del Software (A.A. 2026/2027) del Corso di Laurea in Informatica presso l'Università degli Studi di Padova.

All'incontro hanno preso parte:
- *Gianpaolo Ferrarin* (Amministratore e Software Architect, Eggon S.r.l.) - Referente Aziendale Proponente;
- I seguenti componenti del gruppo *Akme Group*:
  - Pietro Giulio Bassi
  - Davide Loparco
  - Roberto Piovesan
  - Marco Giacon

= Preparazione all'Incontro
In preparazione alla riunione, il gruppo di lavoro si è riunito per analizzare nel dettaglio la documentazione del capitolato ed evidenziare i dubbi principali riguardanti il monte ore, l'infrastruttura cloud su AWS#super[G] Bedrock#super[G], le strategie di RAG#super[G] e confidence score, la tracciabilità nel backoffice#super[G], la segmentazione dei documenti e i vincoli di privacy legati al GDPR#super[G]. I sei quesiti principali sono stati formalizzati e trasmessi preventivamente all’azienda per garantire una discussione mirata e proficua durante la sessione sincrona.

= Resoconto della Riunione
Di seguito viene fornita la rendicontazione puntuale dei quesiti trattati e dei chiarimenti emersi durante la discussione sincrona con il referente aziendale.

== Chiarimento sul Perimetro Operativo e Monte Ore
- *Quesito / Domanda Posta:* \
  _"Nella documentazione sono state indicate 485 ore individuali di lavoro, nonostante il professor Vardanega abbia stabilito un tetto massimo di 95 ore di cosiddetto "prime time" e 99 ore destinate all'autoapprendimento. In che termini dobbiamo dunque intendere le 485 ore, per gestire la documentazione e la distribuzione dei ruoli e del tempo adeguatamente alle vostre richieste?"_
- *Sintesi della Risposta (Eggon S.r.l.):*
  - *Refuso e Ricalibrazione delle ore:* L'indicazione delle 485 ore è stata chiarita come un refuso iniziale basato sul volume standard teorico di 480 ore. Le attività e la pianificazione del lavoro sono già modellate sul numero di ore effettivo previsto dall'insegnamento.
  - *Flessibilità e Negoziabilità dei Requisiti:* Le specifiche e i criteri iniziali sono stati definiti con un approccio flessibile e sono orientati a verificare il funzionamento generale del sistema. Capitolato e modalità operative sono pienamente negoziabili e definibili insieme, entro certi limiti, lungo un percorso iterativo. Il valore principale risiede nel confronto continuo e non solo nella consegna dell'MVP#super[G].

== Configurazione dell'Ambiente Cloud e Risorse di Test
- *Quesito / Domanda Posta:* \
  _"Per i test e lo sviluppo è previsto un ambiente cloud con eventuali risorse necessarie già messe a disposizione da Eggon (ad esempio Amazon Bedrock) oppure scelta e configurazione di quest'ultime rientrano nel nostro lavoro? In generale, che tipo di ambiente di test è proposto dall'azienda?"_
- *Sintesi della Risposta (Eggon S.r.l.):*
  - *Accesso ad Amazon Bedrock e Partner AWS:* Eggon, partner AWS dal 2019, mette a disposizione account Amazon Bedrock dedicati per consentire la sperimentazione libera di diversi modelli.
  - *Gestione e Controllo del Budget Cloud:* Per evitare spese impreviste derivanti dall'uso intensivo dei modelli, l'accesso agli account sarà regolato da un budget di test prestabilito e concordato con il team.
  - *Apertura ad altri Provider:* L'azienda si dichiara aperta a valutare e attivare l'accesso ad altri provider (es. Vertex, Azure Foundation, Open Router) previa valutazione congiunta, pur mantenendo una maggiore competenza interna su ambienti AWS.

== Criteri di Accettazione dell'MVP, Confidence Score e Astensione del RAG
- *Quesito / Domanda Posta:* \
  _"Nelle specifiche si richiede che il sistema si astenga dal rispondere qualora le fonti autorizzate non siano sufficienti o presentino contrasti. Quali metriche o strategie di confidence score consigliate di adottare per validare l'output del RAG prima di mostrarlo all'utente nella PWA#super[G]?"_
- *Sintesi della Risposta (Eggon S.r.l.):*
  - *Strategie di Astensione e Confidence Score:* L'azienda non impone metriche o soglie rigide di confidence score, in quanto la decisione rientra nel lavoro del team. In presenza di fonti insufficienti o in contrasto non risolvibile, il sistema deve astenersi o fornire risposte orientate all'approfondimento, escludendo rigorosamente fonti non autorizzate.
  - *Funzionalità End-to-End dell'MVP:* L'MVP dovrà dimostrare operatività end-to-end, includendo risposte su regolamenti aziendali e manuali Nexum, gestione delle richieste di ferie/permessi con previa conferma dei dati, mantenimento del contesto conversazionale e aggiornamento dinamico delle risposte in caso di sostituzione o eliminazione dei documenti.

== Tracciabilità delle Fonti e Gestione Operativa del Backoffice#super[G]
- *Quesito / Domanda Posta:* \
  _"Fino a che livello di dettaglio è richiesto di tracciare le fonti consultate e gli esiti delle operazioni all'interno del backoffice amministrativo per soddisfare i criteri di accettazione dell'MVP?"_
- *Sintesi della Risposta (Eggon S.r.l.):*
  - *Tracciamento di Prompt#super[G], Fonti ed Esiti:* Ogni risposta prodotta deve associare e mostrare chiaramente le fonti utilizzate. Il backoffice dovrà registrare i prompt inviati al modello, i documenti consultati e gli esiti restituiti, con la possibilità di raccogliere feedback da parte degli utenti.
  - *Distinzione degli Stati Operativi:* È richiesta la tracciabilità delle operazioni distinguendo tra richieste registrate e approvate, imponendo una nuova conferma dell'utente in caso di modifica dei dati inviati e garantendo un tracciato di log per la gestione degli errori.

== Segmentazione delle Fonti e Gestione dei Vettori
- *Quesito / Domanda Posta:* \
  _"Riguardo alla trasformazione dei documenti aziendali (Regolamenti PDF e manuali NEXUM) in unità di conoscenza consultabili, quali linee guida o criteri di segmentazione suggerite per evitare ambiguità tra le regole aziendali e le istruzioni d'uso del prodotto?"_
- *Sintesi della Risposta (Eggon S.r.l.):*
  - *Persistenza su PG Vector e Flessibilità Dimensionale:* I documenti verranno convertiti in vettori tramite embedding e salvati su database PostgreSQL#super[G] con estensione PG Vector. Poiché la sostituzione dei modelli LLM#super[G] può variare la dimensione dei vettori, si suggerisce di strutturare il database con campi dedicati a gestire le diverse dimensioni dei vettori, garantendo la compatibilità con futuri modelli.
  - *Separazione logica e Layer di Controllo:* È necessario separare nettamente le fonti informative aziendali dalle istruzioni operative della piattaforma. Il team dovrà progettare un livello di controllo e valutare modelli di classificazione automatica delle fonti (es. GEV) per instradare correttamente le interrogazioni.

== Conformità Privacy, Normativa GDPR e Trattamento dei Dati Sensibili
- *Quesito / Domanda Posta:* \
  _"Quali sono i criteri e limiti che dovremmo considerare in termini di rispetto della privacy visto che il progetto coinvolge dati sensibili e personali dei dipendenti? Dovremo prendere in considerazione le misure stabilite dal GDPR europeo?"_
- *Sintesi della Risposta (Eggon S.r.l.):*
  - *Utilizzo di Dati fittizi per i Test:* Per garantire la massima libertà di sperimentazione ed evitare il trattamento di dati personali reali, la fase di test e sviluppo avverrà interamente mediante l'uso di dati fittizi creati ad hoc (profili utente, buste paga, regolamenti).
  - *Conformità GDPR e Hosting su Region UE:* L'infrastruttura Nexum e la configurazione di Amazon Bedrock su Region europea garantiscono la conformità al GDPR. Soluzioni quali l'anonimizzazione preventiva o policy aziendali specifiche con consenso informato regoleranno l'eventuale passaggio in produzione.

= Conclusioni e Decisioni Prese
L'incontro ha permesso di chiarire gli aspetti chiave del capitolato e stabilire le linee guida operative per lo sviluppo dell'MVP. La collaborazione si svolgerà in modalità iterativa, supportata da incontri di allineamento periodici e da un canale di comunicazione diretta su Telegram.

#figure(
  table(
    columns: (2.2fr, 2.2fr, 1fr),
    align: (left + horizon, left + horizon, left + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 5pt),

    [*Decisione / Orientamento*], [*Note e Dettagli*], [*Stato*],
    [Ridimensionamento Monte Ore e Flessibilità], [Chiarito il refuso sulle 485 ore; concordata massima flessibilità sulle specifiche e l'approccio iterativo], [Approvato],
    [Ambiente Cloud AWS Bedrock], [Messa a disposizione di account AWS Bedrock con budget di test concordato per il controllo dei costi], [Confermato],
    [Strategia RAG e Astensione], [Autonomia del team nella definizione del confidence score e della gestione di fonti in contrasto], [Confermato],
    [Tracciabilità Backoffice], [Registrazione completa di prompt, fonti e risultati con supporto ai feedback e distinzione degli stati], [Confermato],
    [Gestione Vettori e PG Vector], [Adozione di PG Vector e predisposizione della struttura DB per la gestione di vettori a dimensione variabile], [Confermato],
    [Conformità Privacy e GDPR], [Uso esclusivo di dati sintetici nei test e configurazione delle risorse cloud su Region Europea], [Confermato],
  ),
  caption: [Principali decisioni e orientamenti emersi],
) <tab-decisioni-esterne>

Il gruppo di lavoro esprime un sincero ringraziamento all'azienda *Eggon S.r.l.* e al referente *Gianpaolo Ferrarin* per la disponibilità e la chiarezza dimostrate durante l'incontro.

#pagebreak()
#v(1cm)
#grid(
  columns: (1fr, 1fr),
  gutter: 2cm,
  [
    *Roberto Piovesan* \
    #image("/src/shared/firme/firma-Chen.png", width: 80%)
    #line(length: 80%, stroke: 0.5pt + black)
    #v(0.2cm)
    Firma del revisore interno
  ],
  [
    *Gianpaolo Ferrarin (Eggon S.r.l.)* \
    /*FIRMA FERRARIN DA INSERIRE*/
    #image("/src/shared/firme/firma-Ferrarin.jpg", width: 80%)
    #line(length: 80%, stroke: 0.5pt + black)
    #v(0.2cm)
    Firma del revisore esterno
    
  ],
)