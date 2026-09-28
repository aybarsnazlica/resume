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
  #v(5pt)
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


  #v(5pt)
  #sidebar-rule
  #v(5pt)

  #sidebar-group([SKILLS AND TOOLS], (
    ("Programming Languages:", ("Go", "Python", "SQL")),
    ("Cloud and Infrastructure:", ("AWS (EC2, S3, IAM, VPC)", "Kubernetes", "Docker", "Terraform", "Linux")),
    ("Machine Learning and AI:", ("PyTorch", "LangGraph",)),
    ("Databases:", ("PostgreSQL", "DuckDB")),
    ("Data Platforms:", ("Apache Iceberg", "Apache Spark", "Trino", "dbt")),
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
      [Owned the architecture and development of an internal data and AI platform used by 10 engineers and researchers across two teams, unifying dataset discovery, experiment tracking, model artifacts, and compute orchestration across the ML lifecycle.],
      [Built a Kubernetes-based data processing plane that launches ephemeral Apache Spark SQL workloads to transform raw S3 data into normalized, versioned Apache Iceberg tables for analytics and machine learning.],
      [Designed, implemented, and operated a Go control plane with REST APIs for platform orchestration.],
      [Built GPU inference orchestration into the platform, providing APIs for researchers to discover model artifacts and launch and manage inference workloads.],
      [Built an Amazon S3 lakehouse with Apache Iceberg, Spark, and Trino, managing 10+ TB and 5+ billion biological records as a versioned, reproducible data foundation for ML and analytics.],
      [Built AI agents that enabled researchers to query internal scientific data in natural language and run reproducible sequence optimization workflows through a self-service interface.],
      [Owned AWS infrastructure and platform operations with Terraform and GitHub Actions, covering EC2, IAM, VPC networking, instance lifecycle, and containerized deployments; implemented observability with Prometheus and Grafana.],
      [Built a data processing pipeline that reduced data preparation from days to hours and increased throughput by 30x, producing standardized datasets for downstream ML workflows.],
    ),
    gap: 0.1pt,
  )

  #v(1.5pt)
  #role([Data Scientist, MOLCURE Inc., Tokyo, Japan], [2022–2023])
  #bullets(
    (
      [Built a protein solubility prediction pipeline using MSA Transformer to extract evolutionary sequence representations and a downstream classifier to predict binary solubility from learned protein embeddings.],
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
  #v(5pt)
  #main-section([PROFILE], [
    Platform Engineer building scalable infrastructure and developer platforms for machine learning and scientific workloads. Experienced in Kubernetes, distributed systems, GPU inference, and AWS. Built and operated data and compute platforms supporting reproducible ML workflows across 10+ TB of data and 5+ billion biological records.
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
