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
#let company = sys.inputs.at("company", default: "<Placeholder Company Name>")
#let role = sys.inputs.at("role", default: "<Placeholder Role Name>")

#let contact-link(url, label) = link(url)[#underline([#label])]

#let header = [
  #set align(left)
  #text(size: 20pt, weight: "bold", fill: accent)[AYBARS NAZLICA]
  #v(5pt)
  #grid(
    columns: (1fr, auto, 1fr),
    align: (left, center, right),
    text(size: 9pt, fill: muted)[
      #text(weight: "semibold")[Location:] Sapporo, Hokkaido, Japan
    ],
    text(size: 9pt, fill: muted)[
      #text(weight: "semibold")[Email:] #contact-link("mailto:aybarsnazlica@gmail.com", text("aybarsnazlica@gmail.com"))
    ],
    text(size: 9pt, fill: muted)[
      #text(weight: "semibold")[Portfolio:] #contact-link(
        "https://aybarsnazlica.github.io",
        text("aybarsnazlica.github.io"),
      )
    ],
  )
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

  I am applying for the #role role at #company. I am currently a Software Engineer at MOLCURE, specializing in backend, data, and AI infrastructure. My work focuses on Go services, Python data pipelines, Kubernetes-based processing systems, and AWS lakehouse platforms for analytics, machine learning, and GPU inference workloads.

  My recent work maps closely to platform engineering for data and AI systems. At MOLCURE, I owned the architecture and implementation of a platform used by engineering and research teams, first building a PostgreSQL-based system and then evolving it into an Amazon S3 lakehouse with Apache Iceberg, Spark, and Trino. The platform processes 10+ TB of data and 5+ billion records, with Go control-plane services for dataset discovery, metadata management, experiment tracking, model artifact browsing, and GPU inference orchestration.

  I also built the data processing and production engineering foundations around that platform: Kubernetes workflows that run ephemeral Spark SQL jobs, an upstream next-generation sequencing pipeline in Python and Docker that increased throughput by 30x, Terraform-based AWS infrastructure, GitHub Actions CI/CD, structured logging, live job streaming, Prometheus metrics, Grafana dashboards, Redis-backed caching, and API security with JWT and OAuth2-based access control.

  I also bring an ownership-oriented approach shaped by my background in medicine, bioinformatics, and scientific computing. Before moving fully into software and platform engineering, I trained and worked as a medical doctor and later pursued graduate studies in bioinformatics, which made me comfortable operating in research-heavy environments and staying rigorous when systems have real-world consequences.

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
