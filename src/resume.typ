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
    #v(3pt)
    #sidebar-list(values)
    #v(3pt)
  ]
]

#let header = [
  #align(center)[
    #set text(size: 24pt, weight: "bold", fill: accent)
    AYBARS NAZLICA
  ]
  #v(-5pt)
  #line(length: 100%, stroke: 3pt + rule)
  #v(3pt)
]

#let sidebar-rule = [
  #line(length: 100%, stroke: 1.2pt + rule)
]

#let left-column = [
  #set text(size: 9pt, fill: muted)
  #v(3pt)
  #text(weight: "semibold")[Location]
  #v(1pt)
  Sapporo, Hokkaido, Japan
  #v(3pt)

  #text(weight: "semibold")[Email]
  #v(1pt)
  #link("mailto:aybarsnazlica@gmail.com")[
    #underline([#text("aybarsnazlica@gmail.com")])
  ]
  #v(3pt)

  #text(weight: "semibold")[Portfolio]
  #v(1pt)
  #link("https://aybarsnazlica.github.io")[
    #underline([#text("aybarsnazlica.github.io")])
  ]
  #v(3pt)

  #text(weight: "semibold")[GitHub]
  #v(1pt)
  #link("https://github.com/aybarsnazlica")[
    #underline([#text("github.com/aybarsnazlica")])
  ]


  #v(3pt)
  #sidebar-rule
  #v(3pt)

  #sidebar-group([SKILLS], (
    ("Programming Languages:", ("Go", "Python", "SQL")),
    ("Cloud and Infrastructure:", ("AWS (EC2, S3, IAM, VPC)", "Kubernetes", "Docker", "Terraform", "Linux")),
    ("Backend & APIs:", ("REST API Design", "Data Modeling", "AuthN/AuthZ")),
    ("Databases:", ("PostgreSQL", "Redis")),
    ("Distributed Data Systems:", ("Apache Iceberg", "Apache Spark", "Trino")),
    ("CI/CD and Observability:", ("GitHub Actions", "Prometheus", "Grafana")),
  ))
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
  #role([Software Engineer, MOLCURE Inc., Japan (Remote)], [2023–Present])
  #bullets(
    (
      [Owned the architecture and implementation of a data and AI platform used by engineering and research teams. Built the original PostgreSQL-based system, then evolved it into an Amazon S3 lakehouse with Apache Iceberg, Spark, and Trino, processing 10+ TB of data and 5+ billion records.],
      [Designed and operated the platform's Go-based control plane and REST APIs for dataset discovery, metadata management, experiment tracking, model artifact browsing, and GPU inference orchestration.],
      [Built a Kubernetes-based data processing plane that runs ephemeral Apache Spark SQL jobs to transform S3 datasets into normalized Apache Iceberg tables for analytics and machine learning.],
      [Developed the upstream next-generation sequencing pipeline with Python and Docker, cutting data preparation time from days to hours, increasing throughput by 30x, and feeding processed data into the lakehouse.],
      [Standardized data models and lookup tables for identity tracking, deduplication, and versioning across analytics, experiment tracking, and machine learning workflows.],
      [Implemented authentication and authorization with JWT, OAuth2, and password hashing; introduced Redis caching for high-traffic APIs.],
      [Automated AWS infrastructure with Terraform, including EC2 provisioning, IAM, VPC/network security, and instance lifecycle management; built GitHub Actions CI/CD for containerized services.],
      [Improved platform observability and reliability with structured logging, live job streaming, Prometheus metrics, and Grafana dashboards across services and data workflows.],
    ),
    gap: 0.1pt,
  )

  #v(1.5pt)
  #role([Data Scientist, MOLCURE Inc., Tokyo, Japan], [2022–2023])
  #bullets(
    (
      [Fine-tuned ESM-based protein language models using multiple sequence alignment features to predict protein solubility.],
      [Visualized transformer-derived protein embeddings to investigate learned sequence representations.],
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
    Platform engineer specializing in backend, data, and AI infrastructure. Experienced in designing Go services, Python data pipelines, Kubernetes-based processing systems, and an AWS lakehouse platform built with S3, Iceberg, Spark, and Trino. Combines software engineering experience with a background in bioinformatics, scientific computing, and medicine.
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
