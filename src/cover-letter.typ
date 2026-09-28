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

  I am applying for the #role role at #company. As a Software Engineer at MOLCURE, I build scalable infrastructure and developer platforms for machine learning and scientific workloads. My work spans Kubernetes workload orchestration, Go control planes, GPU inference, distributed data systems, and AWS infrastructure.

  I own the architecture and development of an internal data and AI platform used by 10 engineers and researchers across two teams. The platform unifies dataset discovery, experiment tracking, model artifacts, and compute orchestration, giving researchers a reproducible workflow from data preparation through model inference.

  I built a Kubernetes-based data processing plane that launches ephemeral Spark SQL workloads and a Go control plane with REST APIs for platform orchestration. I also built GPU inference orchestration that lets researchers discover model artifacts and launch and manage inference workloads. More recently, I built AI agents that enable researchers to query internal scientific data in natural language and run reproducible sequence optimization workflows through a self-service interface.

  Underpinning these workloads, I built an Amazon S3 lakehouse with Apache Iceberg, Spark, and Trino that manages 10+ TB of data and 5+ billion biological records as a versioned foundation for ML and analytics. I also built a data processing pipeline that reduced preparation time from days to hours and increased throughput by 30x. I own the platform's AWS operations using Terraform and GitHub Actions and support production reliability with Prometheus and Grafana.

  My background in platform engineering, machine learning, bioinformatics, and medicine helps me translate researcher needs into dependable systems. I would bring to #company hands-on experience building both the infrastructure beneath AI workloads and the platform interfaces that make those workloads accessible and reproducible.

  Thank you for your consideration. I would welcome the chance to discuss how my experience building AI and data platforms could contribute to #company.

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
