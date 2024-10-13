#import "template.typ": template

#show: doc => template(
  title: "Paper title",
  authors: (
    (
      name: "John Doe",
      institute: "An Institute",
      email: "john@an.com"
    ),
    (
      name: "Jane Doe",
      institute: "Another Institute",
      email: "john@another.com"
    )
  ),
  abstract: lorem(80),
  doc
)

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