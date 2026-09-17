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

  I am applying for the #role role at #company. As a Software Engineer at MOLCURE, I build and operate the backend, data, and cloud infrastructure behind an internal data and AI platform. My work spans Go services, Python data pipelines, Kubernetes-based processing, and AWS systems supporting analytics, machine learning, and GPU inference.

  I owned the architecture and development of this platform, which is used by 10 engineers and researchers across two teams. After building the original PostgreSQL-based system, I evolved it into an Amazon S3 lakehouse with Apache Iceberg, Spark, and Trino that manages 10+ TB of data and 5+ billion biological records. I also established shared models for identity, deduplication, and versioning so datasets and experimental results remain reproducible across analytics and machine learning workflows.

  The platform connects the full data lifecycle. I developed an upstream next-generation sequencing pipeline in Python and Docker that reduced data preparation from days to hours and increased throughput by 30x. Kubernetes then launches ephemeral Spark SQL jobs to convert raw S3 data into normalized, versioned Iceberg tables, while a Go-based control plane and REST APIs provide dataset discovery, metadata management, experiment tracking, model artifact browsing, and GPU inference orchestration.

  Beyond application development, I own the platform's AWS infrastructure and cloud operations. I use Terraform and GitHub Actions to manage provisioning, networking, IAM, instance lifecycles, and containerized deployments, and I support production reliability through API security, structured logging, live job streaming, Prometheus metrics, and Grafana dashboards. My earlier work in medicine, bioinformatics, and machine learning helps me translate scientific needs into dependable engineering systems.

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
