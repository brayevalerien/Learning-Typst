#let template(
  title: none,
  authors: (),
  abstract: [],
  content
) = {
  set page(
    paper: "us-letter",
    header: align(right+horizon, title),
    numbering: "1"
  )
  set par(justify: true)
  set text(font: "New Computer Modern", size: 11pt)

  // Title
  align(center, text(size: 17pt)[*#title*])

  // Authors
  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => align(center)[
      #author.name \
      #author.institute \
      #link("mailto:" + author.email)
    ]),
  )

  // Abstract
  align(
    center,
    [
      #set par(justify: false)
      *Abstract* \
      #abstract
    ] 
  )

  // Define show rules for the rest of the document 
  show: rest => columns(2, gutter: 15pt, rest)
  show heading.where(
    level: 1
  ): it => block(width: 100%)[
    #set align(center)
    #set text(13pt)
    #smallcaps(it.body)
  ]
  show heading.where(
    level: 2
  ): it => text(
    size: 11pt,
    weight: "regular",
    style: "italic",
    it.body + [.],
  )
  
  // Content
  content
}