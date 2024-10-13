Lets reproduce the style from the #link("https://typst.app/docs/tutorial/advanced-styling/", "Typst tutorial").

Here are the styling requirements:
- The font should be an 11pt serif font
- The title should be in 17pt and bold
- The paper contains a single-column abstract and two-column main text
- The abstract should be centered
- The main text should be justified
- First level section headings should be 13pt, centered, and rendered in small capitals
- Second level headings are run-ins, italicized and have the same size as the body text
- Finally, the pages should be US letter sized, numbered in the center of the footer and the top right corner of each page should contain the title of the paper

The first page contains the notes I'm currently taking and are using the plain, default Typst format. Setting the `page` rule (with `#set page(...)`) introduces a page break in Typst, so the new format will only be used after this page.


// Set title here
#let title = [
  Paper title
]

// General formating rules
#set page(
  paper: "us-letter",
  header: align(right+horizon)[
    #title
  ], // add title in the heared, right aligned
  numbering: "1" // use basic numbering in the footer, middle aligned
)
#set par(
  justify: true // justify paragraphs
)
#set text(
  size: 11pt, // set body text size to 11pt
  font: "New Computer Modern" // use serif font (we'll use LaTeX font!)
)

// Title formatting
#align(
  center, // center align the paper title
  text(size: 17pt)[
    *#title* // use title variable and strongly emphasize it
  ]
)

// Authors formating
#grid(
  columns: (1fr, 1fr),
  align(center)[
    John Doe \
    An Institute \
    #link("mailto:jane@an.com")
  ],
  align(center)[
    Jane Doe \
    Another Institute \
    #link("mailto:john@another.com")
  ]
)

// Abstract formatting
#align(center)[
  #set par(justify: false) // abstract is a centered paragraph in a single column (default)
  *Abstract* \
  #lorem(80) // placeholder text
]

// Rest of a the text formating: two columns
#show: rest => columns(
  2, // number of columns
  gutter: 15pt, // gutter width
  rest // content
)

// Headers formating
#show heading.where(
  level: 1 // first level headers formating
): it => block(width: 100%)[
  #set align(center) // center align 1st level headers
  #set text(13pt) // 13pt font size for 1st level headers
  #smallcaps(it.body) // use small caps
]
#show heading.where(
  level: 2 // second level headers formating
): it => text(
  size: 11pt, // body text size. This could be a variable if needed
  weight: "regular", // use body weight instead of the heavier default weight 
  style: "italic", // italicize 2nd level headers
  it.body + [.], // add a dot after the header to separate it from the section content
)


// Below is the actual content of the document, which can be written without carring about the styling since it has been already defined above.

= Introduction
#lorem(200)

= Related work
#lorem(25)

== Paper 1
#lorem(40)

== Paper 2
#lorem(30)

== Paper 3
#lorem(50)


= Method
#lorem(20)

== Subsection 1
#lorem(100)

== Subsection 2
#lorem(150)

== Subsection 3
#lorem(50)

= Conclusion
#lorem(100)


