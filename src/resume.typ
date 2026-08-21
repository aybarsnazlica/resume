#set page(
  paper: "a4",
  fill: white,
  margin: (top: 15mm, right: 15mm, bottom: 15mm, left: 15mm),
)

#set text(
  font: "Open Sans",
  size: 10pt,
  fill: rgb("#3a3a3a"),
  lang: "en",
  hyphenate: false,
)

#set par(
  justify: true,
)

#let accent = rgb("#92205d")
#let rule = rgb("#676767")
#let muted = rgb("#6b6b6b")

#let heading(title, gap: 2pt) = [
  #set text(size: 11pt, weight: "bold", fill: accent)
  #title
  #v(gap)
]

#let role(title, dates) = [
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    [
      #set par(justify: false)
      #set text(weight: "semibold")
      #title
    ],
    [
      #set par(justify: false)
      #set text(weight: "semibold")
      #dates
    ],
  )
  #v(0.5pt)
]

#let bullets(items, gap: 1pt) = {
  for item in items [
    #grid(
      columns: (10pt, 1fr),
      align: (left, horizon),
      [
        #set text(size: 10pt)
        #sym.bullet
      ],
      [#item],
    )
    #v(gap)
  ]
}

#let sidebar-list(items) = {
  for item in items [
    #grid(
      columns: (10pt, 1fr),
      align: (left, horizon),
      [
        #set text(size: 9pt)
        #sym.bullet
      ],
      [
        #set par(justify: false)
        #item
      ],
    )
    #v(3pt)
  ]
}

#let sidebar-group(title, items) = [
  #heading(title, gap: 5pt)
  #set text(size: 9pt, fill: muted)
  #for (label, values) in items [
    #label
    #v(5pt)
    #sidebar-list(values)
    #v(5pt)
  ]
]

#let header = [
  #align(center)[
    #set text(size: 24pt, weight: "bold", fill: accent)
    AYBARS NAZLICA
  ]
  #v(-5pt)
  #line(length: 100%, stroke: 3pt + rule)
  #v(10pt)
]

#let sidebar-rule = [
  #line(length: 100%, stroke: 1.2pt + rule)
]

#let left-column = [
  #v(10pt)
  #set text(size: 9pt, fill: muted)
  Sapporo, Hokkaido, Japan
  #v(10pt)

  #link("mailto:aybarsnazlica@gmail.com")[
    #underline([#text("aybarsnazlica@gmail.com")])
  ]
  #v(10pt)

  #link("https://aybarsnazlica.github.io")[
    #underline([#text("aybarsnazlica.github.io")])
  ]
  #v(10pt)

  #link("https://github.com/aybarsnazlica")[
    #underline([#text("github.com/aybarsnazlica")])
  ]


  #v(10pt)
  #sidebar-rule
  #v(5pt)

  #sidebar-group(
    [SKILLS],
    (
      ("Programming Languages:", ("Go", "Python", "SQL")),
      (
        "Cloud and Infrastructure:",
        (
          "AWS (EC2, S3, IAM, VPC)",
          "Kubernetes",
          "Docker",
          "Terraform",
          "Linux",
        ),
      ),
      (
        "Backend Architecture:",
        (
          "REST API Design",
          "Data Modeling",
          "Caching",
          "AuthN/AuthZ",
        ),
      ),
      (
        "Databases and Distributed Data Systems:",
        (
          "PostgreSQL",
          "Redis",
          "Apache Iceberg",
          "Apache Spark",
          "Trino",
        ),
      ),
      ("CI/CD and Observability:", ("GitHub Actions", "Prometheus", "Grafana")),
    ),
  )
]

#let main-section(title, body) = [
  #heading(title)
  #block(width: 100%)[#body]
]

#let education-row(institution, degree, dates) = [
  #grid(
    columns: (1fr, auto),
    column-gutter: 10pt,
    align: (left, right),
    [
      #set par(justify: false)
      #set text(weight: "semibold")
      #institution, #degree
    ],
    [
      #set par(justify: false)
      #set text(weight: "semibold")
      #dates
    ],
  )
]

#let experience = [
  #role([Software Engineer, MOLCURE Inc., Tokyo, Japan (Remote)], [2023–Present])
  #bullets(
    (
      [Owned the architecture and implementation of an internal data and AI platform, evolving a PostgreSQL-based system into a scalable lakehouse on Amazon S3 with Apache Iceberg, Spark, and Trino],
      [Designed and operated Go control-plane services and REST APIs for dataset discovery, metadata management, experiment tracking, model artifact browsing, and GPU inference orchestration],
      [Built a Kubernetes-based data processing plane that launched ephemeral Apache Spark SQL jobs to transform S3 datasets into normalized Apache Iceberg tables for analytics and ML workloads],
      [Standardized data models and lookup tables for identity tracking, deduplication, and versioning across analytics, experiment tracking, and ML workflows],
      [Wrote unit and integration tests for Go services, platform APIs, and data workflows to validate ingestion, metadata, and orchestration behavior],
      [Automated AWS platform infrastructure with Terraform, including EC2 provisioning, IAM access control, VPC/network security, and instance lifecycle management],
      [Built CI/CD and release automation with GitHub Actions for containerized services, improving deployment repeatability and reducing manual operations],
      [Added production observability through structured logs, live job log streaming, Prometheus metrics, and Grafana dashboards for API latency, job execution status, resource usage, and platform health],
      [Secured platform APIs and internal services with password hashing, JWT bearer tokens, and OAuth2-based access control],
      [Introduced Redis-backed caching for high-traffic endpoints to reduce API latency and improve platform responsiveness],
      [Developed a next-generation sequencing data processing pipeline with Python and Docker, reducing data preparation time from days to hours and increasing throughput by 30x],
    ),
    gap: 0.1pt,
  )

  #v(1.5pt)
  #role([Data Scientist, MOLCURE Inc., Tokyo, Japan], [2022–2023])
  #bullets(
    (
      [Fine-tuned ESM-based transformer models for sequence classification tasks],
    ),
    gap: 0.1pt,
  )

  #v(1.5pt)
  #role([Medical Doctor, Gallipoli Hospital and COMU Hospital, Turkey], [2015–2017])
]

#let education = [
  #education-row([Osaka University, Japan], [Graduate studies in Bioinformatics], [2017–2022])
  #v(1pt)
  #education-row([Zonguldak Bulent Ecevit University, Turkey], [Doctor of Medicine], [2008–2014])
]

#let right-column = [
  #v(10pt)
  #main-section([PROFILE], [
    Platform engineer focused on data and AI infrastructure, with experience designing and operating internal platforms on AWS and Kubernetes. Technical owner of backend services, lakehouse systems, workflow orchestration, and production components for analytics, machine learning, and GPU inference workloads.
  ])

  #v(3pt)
  #main-section([EXPERIENCE], [#experience])

  #v(3pt)
  #main-section([EDUCATION], [#education])
]

#let resume = [
  #grid(
    rows: (auto, 1fr),
    row-gutter: 6pt,
    [#header],
    [
      #grid(
        columns: (112pt, 1fr),
        column-gutter: 12pt,
        align: (left, top),
        [#box(height: 100%)[#left-column]], [#box(height: 100%)[#right-column]],
      )
    ],
  )
]

#layout(size => {
  let body = block(width: size.width, resume)
  let measured = measure(body)
  let fit = if measured.height > size.height {
    size.height / measured.height
  } else {
    1.0
  }
  scale(x: fit * 100%, y: fit * 100%, reflow: true, origin: top + left, body)
})
