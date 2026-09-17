#set page(
  paper: "a4",
  fill: white,
  margin: (top: 18mm, right: 18mm, bottom: 18mm, left: 18mm),
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
  #v(1pt)
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
  #heading(title, gap: 1pt)
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
  #v(5pt)
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

  #text(weight: "semibold")[Links]
  #v(1pt)
  #link("https://aybarsnazlica.github.io")[
    #underline([#text("aybarsnazlica.github.io")])
  ]
  #v(3pt)

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
    ("Backend and APIs:", ("REST API Design", "Data Modeling", "AuthN/AuthZ")),
    ("Databases:", ("PostgreSQL",)),
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
      [Owned the architecture and development of an internal data and AI platform used by 10 engineers and researchers across two teams. Evolved the original PostgreSQL-based system into an Amazon S3 lakehouse with Apache Iceberg, Spark, and Trino, managing 10+ TB of data and 5+ billion biological records.],
      [Developed the upstream next-generation sequencing pipeline with Python and Docker, reducing data preparation from days to hours, increasing throughput by 30x, and delivering standardized, analysis-ready datasets into the lakehouse.],
      [Built a Kubernetes-based data processing plane that launches ephemeral Apache Spark SQL jobs to transform raw S3 datasets into normalized, versioned Apache Iceberg tables for downstream analytics and machine learning workloads.],
      [Designed and operated the Go-based control plane and REST APIs connecting dataset discovery, metadata management, experiment tracking, model artifact browsing, and GPU inference orchestration into a unified workflow for engineers and researchers.],
      [Established shared data models and lookup tables for identity tracking, deduplication, and versioning, making datasets and experimental results reproducible across analytics and machine learning workflows; secured platform APIs with JWT, OAuth2, and password hashing.],
      [Owned AWS infrastructure and platform operations using Terraform and GitHub Actions, covering EC2 provisioning, IAM, VPC/network security, instance lifecycle management, and containerized deployments. Improved reliability with Redis caching, structured logging, live job streaming, Prometheus metrics, and Grafana dashboards.],
    ),
    gap: 0.1pt,
  )

  #v(1.5pt)
  #role([Data Scientist, MOLCURE Inc., Tokyo, Japan], [2022–2023])
  #bullets(
    (
      [Fine-tuned ESM-based protein language models using multiple sequence alignment features to predict protein solubility.],
      
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
    Platform Engineer building cloud, data, and AI infrastructure for scientific research. Experienced in designing production backend services, Kubernetes-based compute platforms, and AWS data systems processing 10+ TB and 5+ billion biological records. Brings a multidisciplinary background spanning platform engineering, bioinformatics, machine learning, and scientific computing.
  ])

  #v(10pt)
  #main-section([EXPERIENCE], [#experience])

  #v(10pt)
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
