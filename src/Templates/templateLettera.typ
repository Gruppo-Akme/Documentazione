#let primary = rgb("#000000")
#let secondary = rgb("#1a1a1a")
#let gray-dark = rgb("#2c3e50")

#let gloss(term) = [*#term#sub[G]*]

#let resolve-img(path) = {
  if path == none or path == "" {
    none
  } else if path.starts-with("/") or path.starts-with(".") {
    path
  } else {
    "/src/shared/" + path
  }
}

#let resolve-sig(path) = {
  if path == none or path == "" {
    none
  } else if path.starts-with("/") or path.starts-with(".") {
    path
  } else {
    "/src/shared/firme/" + path
  }
}

#let lettera(
  titolo: "Lettera di Presentazione",
  data: "05/11/2026",
  luogo: "Padova",
  mittente: (
    nome: "Akme Group",
    email: "akmeswe@gmail.com",
    corso: "Corso di Ingegneria del Software - A.A. 2026/2027",
    universita: "Università degli Studi di Padova",
  ),
  destinatari: (
    "Alla cortese attenzione di:",
    [*Prof. Tullio Vardanega*],
    [*Prof. Riccardo Cardin*],
    "Dipartimento di Matematica \"Tullio Levi-Civita\"",
    "Università degli Studi di Padova",
    "Via Trieste, 63 - 35121 Padova (PD)",
  ),
  oggetto: "",
  versione: "1.0.0",
  stato: "Approvato",
  htmlId: "lettera-presentazione",
  responsabile: "Pietro Giulio Bassi",
  ruolo-responsabile: "Responsabile di Progetto",
  left-signature: "firma-Bassi.jpeg",
  logo-unipd: "/src/shared/logo_unipd_scritta.jpg",
  logo-gruppo: "/src/shared/logo-big1.png",
  logo-small: "/src/shared/logo-small1.png",
  mostra-firma: true,
  body,
) = {
  let kw = ()
  if htmlId != none { kw.push(str(htmlId)) }
  if versione != none { kw.push(str(versione)) }

  set document(
    title: if titolo != none { titolo } else { "Lettera di Presentazione" },
    author: mittente.nome,
    keywords: kw,
  )

  set text(
    font: ("Lato", "PT Sans"),
    lang: "it",
    size: 10.5pt,
  )

  show link: underline

  set par(
    justify: true,
    leading: 0.72em,
    spacing: 1.15em,
  )

  set page(
    paper: "a4",
    margin: (top: 2.2cm, bottom: 2.2cm, left: 2.5cm, right: 2.5cm),
    header: context {
      if counter(page).get().first() > 1 [
        #grid(
          columns: (auto, 1fr),
          align(left + horizon)[
            #let l-small = resolve-img(logo-small)
            #if l-small != none [
              #image(l-small, height: 1.6em)
            ]
          ],
          align(right + horizon)[
            #text(size: 9pt, fill: rgb("#555555"))[#titolo -- #mittente.nome]
          ],
        )
        #v(-0.3em)
        #line(length: 100%, stroke: 0.5pt + luma(180))
      ]
    },
    footer: context [
      #line(length: 100%, stroke: 0.5pt + luma(200))
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8.5pt, fill: luma(100))[#mittente.nome -- #link("mailto:" + mittente.email)[#mittente.email]]
        ],
        align(right)[
          #text(size: 8.5pt, fill: luma(100))[Pagina #counter(page).display() di #counter(page).final().first()]
        ],
      )
    ],
  )

  // Stile dei titoli nella lettera
  show heading.where(level: 1): it => block(above: 1.4em, below: 0.8em)[
    #text(fill: rgb("#1a2a3a"), weight: "bold", size: 11.5pt)[#it.body]
    #v(0.2em)
    #line(length: 100%, stroke: 0.5pt + rgb("#2c3e50"))
  ]

  show heading.where(level: 2): it => block(above: 1.1em, below: 0.6em)[
    #text(fill: rgb("#2c3e50"), weight: "bold", size: 10.5pt)[#it.body]
  ]

  // Testata Prima Pagina
  let l-unipd = resolve-img(logo-unipd)
  let l-gruppo = resolve-img(logo-gruppo)

  grid(
    columns: (1fr, 1fr),
    align(left + horizon)[
      #if l-unipd != none [
        #image(l-unipd, width: 65%)
      ]
    ],
    align(right + horizon)[
      #if l-gruppo != none [
        #image(l-gruppo, width: 75%)
      ]
    ],
  )

  v(0.6em)
  line(length: 100%, stroke: 0.8pt + rgb("#2c3e50"))
  v(0.6em)

  // Dati Mittente e Destinatario
  grid(
    columns: (1fr, 1fr),
    gutter: 2.5em,
    align: top,
    [
      #text(weight: "bold", size: 9pt, fill: rgb("#555555"))[MITTENTE] \
      #v(0.1em)
      #text(weight: "bold", size: 10.5pt)[#mittente.nome] \
      #if mittente.corso != "" [#text(size: 9pt)[#mittente.corso \ ]]
      #if mittente.universita != "" [#text(size: 9pt)[#mittente.universita \ ]]
      #text(size: 9pt)[Email: #link("mailto:" + mittente.email)[#mittente.email]]
    ],
    [
      #text(weight: "bold", size: 9pt, fill: rgb("#555555"))[DESTINATARI] \
      #v(0.1em)
      #for d in destinatari [
        #text(size: 9pt)[#d \ ]
      ]
    ]
  )

  v(0.8em)
  align(right)[
    #text(size: 9.5pt)[#luogo, #data]
  ]

  v(0.4em)

  // Oggetto formale
  if oggetto != "" [
    #block(
      fill: rgb("#f5f7fa"),
      stroke: (left: 3pt + rgb("#2c3e50")),
      inset: (x: 10pt, y: 7pt),
      radius: (right: 4pt),
      width: 100%,
      [
        #text(weight: "bold", size: 10pt, fill: rgb("#2c3e50"))[Oggetto:] #h(4pt) #text(size: 10pt, weight: "bold")[#oggetto]
      ]
    )
    #v(0.6em)
  ]

  // Corpo della lettera
  body

  // Firma del responsabile
  if mostra-firma and (responsabile != "" or left-signature != "") [
    #v(1.2em)
    #align(right)[
      #block(width: 48%)[
        #align(center)[
          #text(size: 10pt)[Per il gruppo *#mittente.nome*] \
          #v(0.2em)
          #text(size: 9pt, fill: rgb("#555555"))[#ruolo-responsabile] \
          #if left-signature != "" [
            #let sig = resolve-sig(left-signature)
            #v(0.2em)
            #image(sig, width: 55%)
            #v(0.2em)
          ] else [
            #v(2.5em)
          ]
          #line(length: 75%, stroke: 0.5pt + black)
          #v(0.2em)
          #text(size: 9.5pt, weight: "bold")[#responsabile]
        ]
      ]
    ]
  ]
}

#let report = lettera
