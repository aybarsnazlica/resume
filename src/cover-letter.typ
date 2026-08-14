#set page(
  paper: "a4",
  fill: white,
  margin: (top: 18mm, right: 18mm, bottom: 18mm, left: 18mm),
)

#set text(
  font: "Open Sans",
  size: 10.5pt,
  fill: rgb("#2f2f2f"),
  lang: "en",
  hyphenate: false,
)

#set par(
  justify: true,
)

#let accent = rgb("#92205d")
#let muted = rgb("#666666")
#let company = "<Placeholder Company Name>"
#let role = "<Placeholder Role Name>"

#let contact-link(url, label) = link(url)[#underline([#label])]

#let header = [
  #set align(left)
  #text(size: 20pt, weight: "bold", fill: accent)[AYBARS NAZLICA]
  #v(4pt)
  #text(size: 9pt, fill: muted)[
    Sapporo, Hokkaido, Japan \
    #v(2pt)
    #contact-link("mailto:aybarsnazlica@gmail.com", text("aybarsnazlica@gmail.com")) \
    #v(2pt)
    #contact-link("https://aybarsnazlica.github.io", text("aybarsnazlica.github.io")) \
  ]
  #v(6pt)
  #line(length: 100%, stroke: 1.2pt + accent)
]

#let letter = [
  #header

  #v(10pt)

  #align(right)[#datetime.today().display("[year]-[month padding:zero]-[day padding:zero]")]

  #v(10pt)

  Hiring Manager \
  #company \

  #v(20pt)

  Dear Hiring Manager,

  #v(10pt)

  I am applying for the #role role at #company. I am currently a Software Engineer at MOLCURE, where I build production systems at the intersection of data infrastructure, machine learning workflows, and cloud platform engineering. My work has focused on turning demanding data and ML workloads into reliable systems that teams can use safely and at scale.

  My recent work maps closely to the platform challenges in this role. At MOLCURE, I helped redesign a PostgreSQL-based internal system into a scalable lakehouse platform on Amazon S3 using Apache Iceberg, Spark, and Trino, covering dataset discovery, metadata management, experiment tracking, and downstream analytics. I also built Go microservices that discover data in S3 and launch ephemeral Spark SQL workloads on Kubernetes, created identity and versioning data models, introduced Redis-based caching to reduce API latency, and implemented authentication and authorization using password hashing, JWT bearer tokens, and OAuth2. That combination of data engineering, backend design, and operational ownership is the core of how I work.

  I am particularly interested in #company because the role is about building the infrastructure that makes advanced AI systems dependable in high-stakes environments. The mission of bridging frontier models and autonomous agents into secure enterprise and government settings is compelling to me. I have already worked on orchestration workflows for GPU inference on AWS, containerized model execution, and systems that move artifacts, logs, and metadata back into a platform for downstream use. I would be excited to apply that experience to agent infrastructure, evaluation pipelines, and the data interfaces needed to make deployed AI systems observable, governable, and continuously improvable.

  I also bring an ownership-oriented approach shaped by an unusual background. Before moving fully into software and platform engineering, I trained and worked as a medical doctor and later pursued graduate studies in bioinformatics. That path has made me comfortable operating in research-heavy environments, learning quickly across disciplines, and staying rigorous when systems have real-world consequences.

  Thank you for your consideration. I would welcome the chance to discuss how my experience in backend systems, data platforms, and ML infrastructure could contribute to #company.

  #v(20pt)

  Sincerely, \
  Aybars Nazlica
]

#layout(size => {
  let body = block(width: size.width, letter)
  let measured = measure(body)
  let fit = if measured.height > size.height {
    size.height / measured.height
  } else {
    1.0
  }
  scale(x: fit * 100%, y: fit * 100%, reflow: true, origin: top + left, body)
})
