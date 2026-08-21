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
  #v(5pt)
  #text(size: 9pt, fill: muted)[
    Sapporo, Hokkaido, Japan \
    #v(2pt)
    #contact-link("mailto:aybarsnazlica@gmail.com", text("aybarsnazlica@gmail.com")) \
    #v(2pt)
    #contact-link("https://aybarsnazlica.github.io", text("aybarsnazlica.github.io")) \
  ]
  #v(10pt)
  #line(length: 100%, stroke: 1.2pt + accent)
]

#let letter = [
  #header

  #v(20pt)

  #align(right)[#datetime.today().display("[year]-[month padding:zero]-[day padding:zero]")]

  #v(10pt)

  Hiring Manager \
  #company \

  #v(30pt)

  Dear Hiring Manager,

  #v(20pt)

  I am applying for the #role role at #company. I am currently a Software Engineer at MOLCURE, where I design, build, and operate internal data and AI infrastructure on AWS and Kubernetes. My work focuses on turning data-intensive analytics, machine learning, and GPU inference workloads into reliable platform services that teams can use safely and at scale.

  My recent work maps closely to platform engineering for data and AI systems. At MOLCURE, I owned the architecture and implementation of an internal data and AI platform, evolving a PostgreSQL-based system into a lakehouse on Amazon S3 with Apache Iceberg, Spark, and Trino. I designed and operated Go control-plane services for dataset discovery, metadata management, experiment tracking, model artifact browsing, and GPU inference orchestration, and built Kubernetes workflows that launch ephemeral Spark SQL jobs to generate normalized Iceberg tables for analytics and ML workloads.

  I also bring production engineering experience around the systems that keep platforms maintainable: Terraform-based AWS infrastructure, GitHub Actions release automation, unit and integration testing, structured logs, live job log streaming, Prometheus metrics, Grafana dashboards, Redis-backed caching, and API security with JWT bearer tokens and OAuth2-based access control. That combination of backend engineering, data infrastructure, and operational ownership is the core of how I work.

  I also bring an ownership-oriented approach shaped by an unusual background. Before moving fully into software and platform engineering, I trained and worked as a medical doctor and later pursued graduate studies in bioinformatics. That path has made me comfortable operating in research-heavy environments, learning quickly across disciplines, and staying rigorous when systems have real-world consequences.

  Thank you for your consideration. I would welcome the chance to discuss how my experience in backend systems, data platforms, and ML infrastructure could contribute to #company.

  #v(30pt)

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
