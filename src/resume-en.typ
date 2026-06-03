#set page(
  paper: "a4",
  fill: white,
  margin: (top: 15mm, right: 15mm, bottom: 10mm, left: 15mm),
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
  leading: 0.42em,
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
    column-gutter: 10pt,
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
      columns: (7pt, 1fr),
      column-gutter: 5pt,
      align: (left, horizon),
      [
        #set text(size: 7pt)
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
      column-gutter: 4pt,
      align: (left, horizon),
      [
        #set text(size: 9pt)
        #sym.bullet
      ],
      [#item],
    )
    #v(0.25pt)
  ]
}

#let sidebar-group(title, items) = [
  #heading(title, gap: 1pt)
  #set text(size: 9pt, fill: muted)
  #for (label, values) in items [
    #label
    #v(1.5pt)
    #sidebar-list(values)
    #v(1pt)
  ]
  #v(3pt)
]

#let header = [
  #align(center)[
    #set text(size: 24pt, weight: "bold", fill: accent)
    AYBARS NAZLICA
  ]
  #v(-10pt)
  #line(length: 100%, stroke: 3pt + rule)
]

#let sidebar-rule = [
  #line(length: 100%, stroke: 1.2pt + rule)
]

#let left-column = [
  #v(10pt)
  #set text(size: 9pt, fill: muted)
  Sapporo, Hokkaido, JAPAN
  #v(5pt)

  #link("mailto:aybarsnazlica@gmail.com")[
    #underline([#text("aybarsnazlica@gmail.com")])
  ]
  #v(5pt)

  #link("https://aybarsnazlica.github.io")[
    #underline([#text("aybarsnazlica.github.io")])
  ]
  #v(5pt)

  #link("https://github.com/aybarsnazlica")[
    #underline([#text("github.com/aybarsnazlica")])
  ]

  #sidebar-rule
  #sidebar-group(
    [SKILLS],
    (
      ("Programming Languages:", ("Python", "Java", "TypeScript")),
      (
        "Infrastructure:",
        (
          "AWS",
          "Linux",
          "Docker",
          "Kubernetes",
          "Bash",
        ),
      ),
      (
        "Backend:",
        (
          "FastAPI",
          "Spring Boot",
        ),
      ),
      (
        "Data Engineering:",
        (
          "Spark",
          "Iceberg",
          "Trino",
          "dbt",
          "Airflow",
        ),
      ),
      ("Databases:", ("SQL", "PostgreSQL")),
      ("Machine Learning:", ("PyTorch",)),
      ("CI/CD & Observability:", ("GitHub Actions", "Prometheus", "Grafana")),
    ),
  )

  #sidebar-rule
  #heading([LANGUAGES], gap: 1pt)
  #set text(size: 9pt, fill: muted)
  #sidebar-list((
    "English (CEFR C1)",
    "Japanese (JLPT N2)",
    "Turkish (Native)",
  ))
]

#let main-section(title, body) = [
  #heading(title)
  #body
]

#let experience = [
  #role([Software Engineer, MOLCURE Inc., Tokyo, Japan (Remote)], [2023 - Present])
  #bullets(
    (
      [Built a unified data and machine learning platform spanning lakehouse infrastructure, dataset and metadata management, experiment tracking, and GPU inference],
      [Architected a production-grade data lakehouse (Spark, Iceberg, Trino, dbt, S3, Kubernetes) processing hundreds of millions of records for analytics and ML workloads],
      [Reduced lakehouse query latency by 15x through partitioning strategies, storage layout, and query optimization],
      [Built Spring Boot ingestion services that discovered datasets in S3, launched ephemeral Spark SQL jobs on Kubernetes, and landed normalized Iceberg tables for downstream analytics],
      [Built backend services, APIs, and user-facing platform features with FastAPI, PostgreSQL, TypeScript, and React for dataset discovery, metadata management, and model experiment access],
      [Designed scalable data models and lookup tables for identity tracking, deduplication, and versioning across analytics and ML workflows],
      [Built MLOps workflows for experiment tracking, model artifact management, and reproducible inference, centralizing predictions and run outputs in a unified internal platform],
      [Implemented backend workflows to launch GPU inference instances on AWS, run containerized model jobs, and stream outputs, logs, and artifacts back into the platform],
      [Developed a next-generation sequencing data processing pipeline with Python, Airflow, and Docker, reducing data preparation time from days to hours and increasing throughput by 30x],
      [Automated cloud infrastructure across AWS, Docker, and Kubernetes, improving reliability and cost efficiency for data and ML services],
    ),
    gap: 0.1pt,
  )

  #v(1.5pt)
  #role([Data Scientist, MOLCURE Inc., Tokyo, Japan], [2022 - 2023])
  #bullets(
    (
      [Fine-tuned ESM-based Transformer models for sequence classification tasks],
      [Developed embedding generation and visualization workflows using fine-tuned protein language models for downstream analysis and exploration],
    ),
    gap: 0.1pt,
  )

  #v(1.5pt)
  #role([Medical Doctor, Gallipoli Hospital and COMU Hospital, Turkey], [2015 - 2017])
]

#let education = [
  #role([Western University, Canada, Graduate Studies in Bioinformatics], [2023 - 2024])
  #v(1pt)
  #role([Osaka University, Japan, PhD Coursework in Bioinformatics], [2017 - 2022])
  #v(1pt)
  #role([Zonguldak Bulent Ecevit University, Turkey, Doctor of Medicine], [2008 - 2014])
]

#let right-column = [
  #v(10pt)
  #main-section([PROFILE], [
    #set par(leading: 0.5em)
    Software engineer specializing in backend platforms, data infrastructure, and ML systems. Experienced in architecting data lakehouses, scalable APIs, orchestration workflows, and cloud-native infrastructure on AWS and Kubernetes. Proven track record of building internal platforms, improving performance by orders of magnitude, and delivering high-throughput systems for data and machine learning workloads.
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
