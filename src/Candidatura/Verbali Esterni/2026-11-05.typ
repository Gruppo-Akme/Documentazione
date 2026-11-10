#import "../../Templates/templateVerbali.typ": *

#show: report.with(
  titolo: "Verbale esterno 05/11/2026",
  stato: "Bozza",
  versione: "0.2.0",
  ora-inizio: "14:00",
  ora-fine: "14:15",
  registro-modifiche: (
    ("0.2.0", "05/11/2026", "-", "Pietro Giulio Bassi", "Verifica verbale prima della firma da parte del revisore esterno"),
    ("0.1.0", "05/11/2026", "Davide Loparco", "Mattia Cadamuro", "Bozza iniziale del verbale"),
  ),


odg: (
    "Chiarimenti sulle modalità di incontro con l'azienda",
    "Modalità di trattamento dei dati del cliente",
    "Risorse messe a disposizione per l'ambiente di test",
    "Criteri per la correttezza e la coerenza delle risposte dell'assistente",
    "Presenza di regole di business",
    "Versione mobile del prodotto"
  ),
partecipanti: (
  "Gianluca Carlesso (Ergon Informatica S.r.l. - Referente Aziendale Proponente)",
  "Pietro Giulio Bassi",
  "Davide Loparco",
  "Mattia Cadamuro"
  ),

distribuzione: (
    "Akme Group",
    "Prof. Cardin Riccardo",
    "Prof. Vardanega Tullio",
    "Ergon Informatica S.r.l.",
  ),
  verificatore-interno: "Pietro Giulio Bassi",
  left-signature: "firma-Bassi.jpeg",
  verificatore-esterno: "Gianluca Carlesso",
  right-signature: "firma-Carlesso.png",
  tipo-verbale: "esterno",
)

= Introduzione
Il presente verbale attesta lo svolgimento dell'incontro di chiarimento ed approfondimento tenutosi in data *5 novembre 2026*, dalle ore 14:00 alle ore 14:15, in modalità telematica via videoconferenza (Microsoft Teams). La riunione è stata organizzata per discutere dettagli di vario genere relativi al *Capitolato C7: Smart Dashboard*, proposto dall'azienda *Ergon Informatica S.r.l.* (Via per Salvatronda 21, Salvarosa TV) nell'ambito del corso di Ingegneria del Software (A.A. 2026/2027) del Corso di Laurea in Informatica presso l'Università degli Studi di Padova.

All'incontro hanno preso parte:
- *Gianluca Carlesso* (Software Developer, Ergon Informatica S.r.l.) - Referente Aziendale Proponente;
- I seguenti componenti del gruppo *Akme Group*:
  - Pietro Giulio Bassi
  - Davide Loparco
  - Roberto Piovesan
  - Marco Giacon

= Preparazione all'Incontro
In preparazione alla riunione, il gruppo di lavoro in seguito ad una lettura approfondita del capitolato, ha raccolto diverse domande per comprendere al meglio le richieste dell'azienda e le risorse messe a disposizione.

= Resoconto della Riunione
Di seguito viene fornita la rendicontazione puntuale dei quesiti trattati e dei chiarimenti emersi durante la discussione sincrona con il referente aziendale.

== Chiarimento sulle modalità di incontro
- *Quesito / Domanda Posta:* \
  _"Quali saranno le modalità di allineamento, la frequenza degli incontri e i canali di comunicazione da utilizzare con l'azienda durante lo svolgimento del progetto?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - È previsto un incontro fisso ogni 15 giorni, anche in assenza di questioni concrete da affrontare, in modo da restare sempre allineati. In base alla necessità la cadenza può essere anche settimanale o addirittura più frequente, con la possibilità inoltre di avere accesso a comunicazioni rapide quali Whatsapp e Telegram, o incontri in sede aziendale.

== Trattamento di dati sensibili
- *Quesito / Domanda Posta:*\
 _"Considerando i vincoli del GDPR, in che modo dobbiamo gestire l'invio dei dati sensibili della smart dashboard all'Intelligenza Artificiale per garantire la privacy degli utenti?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 -Il rispetto della privacy e del GDPR si garantisce attraverso un'attenta selezione e minimizzazione dei dati trasmessi all'IA. È fondamentale strutturare correttamente le query, inviando esclusivamente le informazioni strettamente necessarie all'elaborazione ed escludendo i dati sensibili superflui.

== Risorse a disposizione
- *Quesito / Domanda Posta:*\
 _"Per l'ambiente di test del layer AI, l'azienda metterà a disposizione le chiavi API e i relativi crediti, oppure gli oneri saranno a carico del team?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - L'azienda si farà carico dei costi dell'ambiente di test fornendo direttamente al team le API key provviste del credito necessario. Pertanto, non sarà richiesto l'utilizzo di account o fondi personali.

== Correttezza e coerenza delle risposte
- *Quesito / Domanda Posta:*\
 _"In merito ai "controlli sulla coerenza delle risposte", quali criteri definiscono una risposta accettabile? In caso di dubbio, è preferibile che l'IA si astenga dal rispondere o che fornisca l'esito evidenziandone il margine di incertezza?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - L'IA non deve astenersi, ma deve segnalare esplicitamente all'utente quando la risposta presenta un margine di incertezza. Inoltre, per garantire la coerenza e prevenire le allucinazioni, i prompt dovranno essere strutturati imponendo al modello di utilizzare esclusivamente i dati forniti a contesto, con il divieto di inventare informazioni.

== Modelli di business
- *Quesito / Domanda Posta:*\
 _"Per quanto riguarda i modelli specifici del dominio economico (fatti, dimensioni, misure come il fatturato netto), il modello dati sarà progettato dal team o sarete voi a fornire le regole di business? Sarà previsto un confronto con un esperto di dominio?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - Le regole di business e i modelli economici specifici saranno definiti e forniti direttamente dall'azienda. È inoltre previsto un momento di analisi congiunta, durante il quale queste logiche verranno condivise e approfondite insieme al team per assicurarne la corretta implementazione.

 == Versione mobile
- *Quesito / Domanda Posta:*\
 _"Per quanto concerne la fruibilità su dispositivi mobili, l'applicativo deve essere progettato come Progressive Web App (PWA), come applicazione nativa dedicata o tramite un approccio web responsive?"_
- *Sintesi della Risposta (Ergon Informatica S.r.l.):*
 - Il sistema dovrà essere sviluppato esclusivamente come applicazione web responsive, scartando l'ipotesi di un'app nativa.

= Conclusioni e Decisioni Prese
L'incontro ha permesso di chiarire gli aspetti chiave del progetto e stabilire le linee guida architetturali e operative. La collaborazione sarà supportata da incontri di allineamento regolari con cadenza quindicinale, integrati dall'uso di canali di comunicazione diretta (Teams, Telegram, WhatsApp, email) per la gestione tempestiva di eventuali necessità. Sono state inoltre definite con chiarezza le responsabilità in merito alla fornitura delle risorse per i test e alla definizione delle regole di business.

#figure(
  table(
    columns: (2.2fr, 2.2fr, 1fr),
    align: (left + horizon, left + horizon, left + horizon),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + black) } else { (bottom: 0.6pt + black) },
    fill: none,
    inset: (y: 7pt, x: 5pt),

    [*Decisione / Orientamento*], [*Note e Dettagli*], [*Stato*],
    [Allineamento e comunicazione], [Fissati incontri periodici quindicinali e definiti i canali diretti (Teams, Telegram, WhatsApp, mail) per supporto e necessità.], [Confermato],
    [Conformità privacy e GDPR], [Il rispetto del GDPR sarà garantito tramite la minimizzazione dei dati e una rigorosa strutturazione delle query inviate all'IA.], [Confermato],
    [Risorse per ambiente di test], [L'azienda fornirà direttamente le API key provviste del credito necessario per i test del layer AI.], [Confermato],
    [Comportamento IA], [L'assistente segnalerà l'incertezza senza astenersi; i prompt imporranno l'uso esclusivo dei dati forniti.], [Confermato],
    [Regole di business], [L'azienda definirà le regole di business e i modelli economici, che verranno poi analizzati congiuntamente al team.], [Approvato],
    [Sviluppo interfaccia mobile], [L'applicativo sarà sviluppato esclusivamente in modalità web responsive (scartate le ipotesi di PWA o App dedicata).], [Confermato],
  ),
  caption: [Principali decisioni e orientamenti emersi],
) <tab-decisioni-esterne>

Il gruppo di lavoro esprime un sincero ringraziamento all'azienda *Ergon Informatica S.r.l.* e al referente *Gianluca Carlesso* per la disponibilità e la chiarezza dimostrate durante l'incontro.

