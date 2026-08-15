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
      [Built a unified data and machine learning platform by redesigning a PostgreSQL-based system into a scalable lakehouse architecture on Amazon S3 using Apache Iceberg, Spark, and Trino, spanning dataset and metadata management, experiment tracking, and GPU inference, while reducing infrastructure overhead and better aligning the platform with data growth],
      [Developed scalable Go microservices for data ingestion and processing, with unit and integration tests, that discovered datasets in Amazon S3 and launched ephemeral Apache Spark SQL jobs on Kubernetes to generate normalized Apache Iceberg tables for downstream analytics],
      [Created data models and lookup tables for identity tracking, deduplication, and versioning across analytics and ML workflows],
      [Introduced Redis-based caching to reduce API latency and improve platform performance],
      [Implemented authentication and authorization using password hashing, JWT bearer tokens, and OAuth2 to secure access to platform services],
      [Automated Terraform-based AWS infrastructure for EC2 instance provisioning, access control, network security, and instance lifecycle management],
      [Orchestrated platform workflows for provisioning GPU inference workloads on AWS, running containerized model jobs, and streaming logs, outputs, and artifacts back into the platform],
      [Built Go backend services, REST APIs, and supporting React (TypeScript) interfaces for dataset discovery, metadata management, model artifact browsing, experiment metric visualization, and GPU inference orchestration with live log streaming],
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
    Software engineer with experience building data platforms, backend services, and ML infrastructure. Experienced in designing lakehouse architectures, scalable data services, orchestration workflows, and cloud-native applications on AWS and Kubernetes. Proven track record of delivering internal platforms that improve performance, support high-throughput analytics and machine learning workloads, and power data and AI products.
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
