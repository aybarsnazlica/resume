#set page(
  paper: "a4",
  fill: white,
  margin: (top: 15mm, right: 16mm, bottom: 12mm, left: 20mm),
  numbering: "1 / 1",
  number-align: bottom + right,
)

#set text(
  font: ("YuMincho", "Hiragino Mincho ProN", "BIZ UDMincho"),
  size: 10.5pt,
  fill: black,
  lang: "ja",
  hyphenate: false,
)

#set par(
  justify: true,
  leading: 0.75em,
)

#let as-of-date = datetime.today().display("[year]年[month]月[day]日現在")
#let applicant-name = [NAZLICA SEDAT AYBARS]
#let current-label = [現在]
#let company-start = [2022年10月]
#let company-name = [株式会社MOLCURE]
#let company-business = [AIを活用した創薬プラットフォーム]
#let company-employee-count = [50人]
#let employment-type = [正社員]
#let period(start, end: current-label) = [#start～#end]
#let company-period = period(company-start)

#let section(title) = [
  #v(8pt)
  #set text(weight: "bold")
  ■#title
  #v(3pt)
]

#let bullets(items) = {
  for item in items [
    #grid(
      columns: (1em, 1fr),
      column-gutter: 0pt,
      align: (left, top),
      [・], [#item],
    )
    #v(1pt)
  ]
}

#let table-stroke = 0.5pt + black
#let table-header-fill = rgb("#eeeeee")

#let company-row = [
  #table(
    columns: (1fr, 31mm),
    stroke: table-stroke,
    inset: 4pt,
    align: (left, top),
    table.cell(colspan: 2, fill: table-header-fill)[#text(weight: "bold")[#company-period　　#company-name]],
    [
      事業内容：#company-business
      #linebreak()
      従業員数：#company-employee-count
    ],
    [
      #employment-type
      #linebreak()
      として勤務
    ],
  )
  #v(6pt)
]

#let project(date, overview, duties, results, environment) = [
  #table(
    columns: (1fr, 31mm),
    stroke: table-stroke,
    inset: 4pt,
    align: (left, top),
    table.cell(fill: table-header-fill)[#text(weight: "bold")[#date]],
    table.cell(fill: table-header-fill)[開発環境],
    [
      【プロジェクト概要】
      #bullets(overview)

      #v(3pt)
      【業務内容】
      #bullets(duties)

      #v(3pt)
      【実績・取り組み】
      #bullets(results)
    ],
    [#environment],
  )
  #v(6pt)
]

#let env-group(title, items) = [
  #v(4pt)
  【#title】
  #for item in items [
    #linebreak()
    #item
  ]
]

#align(center)[
  #set text(size: 14pt, weight: "bold")
  職 務 経 歴 書
]

#v(40pt)

#align(right)[
  #set text(weight: "bold")
  #as-of-date
]

#align(right)[
  #set text(weight: "bold")
  #underline[氏名　#applicant-name]
]

#v(10pt)
#section[職務要約]
機械学習および科学計算ワークロード向けのスケーラブルなインフラと開発者向けプラットフォームを構築するプラットフォームエンジニア。Kubernetes、分散システム、GPU推論、AWSの経験を有する。10 TB超のデータと50億件超の生物学的レコードを扱い、再現可能な機械学習ワークフローを支えるデータ・コンピュート基盤を構築・運用。

#section[活かせる経験・知識・技術]
#bullets((
  [Python、Go、TypeScript、SQL],
  [AWS（EC2、S3、IAM、VPC）、Kubernetes、Docker、Terraform、Linux、Bash],
  [PyTorch、LangGraph],
  [Apache Iceberg、Apache Spark],
  [PostgreSQL、Redis],
  [GitHub Actions、Prometheus、Grafana],
))

#section[職務経歴]
#company-row

#project(
  period([2024年6月]),
  (
    [2チーム約10名の研究者・エンジニアが利用する社内データ・AIプラットフォームの設計・開発を主導。当初のPostgreSQLベースのシステムを構築した後、Amazon S3、Apache Iceberg、Sparkによるレイクハウスへ発展させ、10 TB超のデータと50億件超の生物学的レコードを管理する基盤を整備した。],
  ),
  (
    [データセット探索、メタデータ管理、実験追跡、モデル成果物閲覧、GPU推論を一つのワークフローにつなぐ、GoベースのコントロールプレーンとREST APIの設計・運用、およびTypeScript/ReactによるプラットフォームUIの開発],
    [プラットフォームへのGPU推論オーケストレーションの実装、および研究者がモデル成果物を探索し、推論ワークロードを起動・管理するためのAPIの提供],
    [Kubernetes上で一時的なApache Spark SQLジョブを起動し、S3上の生データを正規化・バージョン管理されたApache Icebergテーブルへ変換するデータ処理プレーンの構築],
    [分析・機械学習ワークフローにおけるID追跡、重複排除、バージョン管理のためのデータモデルおよびルックアップテーブルの標準化],
    [JWT、OAuth2、パスワードハッシュによる認証・認可と、高トラフィックAPI向けRedisキャッシュの実装],
    [構造化ログ、ジョブログのライブストリーミング、Prometheusメトリクス、Grafanaダッシュボードによる可観測性の整備],
  ),
  (
    [データ管理、実験追跡、モデル成果物管理、GPU推論を共通プラットフォームに統合し、2チーム約10名の研究・エンジニアリング業務を支援],
    [PostgreSQLベースのシステムからレイクハウスへ段階的に移行し、10 TB超・50億件超のデータを管理できる基盤へ拡張],
    [共通データモデルとバージョン管理により、分析・機械学習ワークフロー間でデータセットと実験結果を再現可能な形で利用できる仕組みを整備],
  ),
  [
    #env-group([言語], ("Go", "TypeScript", "SQL", "Bash"))
    #env-group([フロントエンド], ("React", "Metabase"))
    #env-group([OS], ("Linux",))
    #env-group([サービス], ("Redis",))
    #env-group([データ基盤], ("Apache Spark", "Apache Iceberg", "PostgreSQL"))
    #env-group([インフラ], ("AWS", "Docker", "Kubernetes"))
    #env-group([CI/CD], ("GitHub Actions",))
    #env-group([メトリクス収集], ("Prometheus", "Grafana"))
  ],
)

#project(
  period([2025年10月]),
  (
    [AWS上の社内データ・AIプラットフォーム運用を支えるインフラをTerraformでコード化。EC2、S3、IAM、VPC、ネットワークセキュリティ、インスタンスライフサイクル管理を標準化し、手作業に依存しない再現性の高い基盤運用を整備した。],
  ),
  (
    [TerraformによるAWSリソース定義、構成管理、変更管理の設計・実装],
    [EC2、S3、IAM、VPCを対象としたプロビジョニングおよびアクセス制御の整備],
    [ネットワークセキュリティ設定とインスタンスライフサイクル管理の自動化],
    [GitHub Actionsを用いたコンテナ化サービスのCI/CDおよびリリース自動化の整備],
  ),
  (
    [インフラ変更の再現性を高め、環境構築および変更作業の属人性を低減],
    [IAM権限、VPC、セキュリティ設定をコードとして管理し、運用時の安全性とレビュー容易性を向上],
    [デプロイ手順を自動化し、手動作業を削減してリリースの一貫性を改善],
  ),
  [
    #env-group([IaC], ("Terraform",))
    #env-group([クラウド], ("AWS EC2", "S3", "IAM", "VPC"))
    #env-group([OS], ("Linux",))
    #env-group([CI/CD], ("GitHub Actions",))
  ],
)

#project(
  [2025年9月～現在],
  (
    [研究者が社内の科学データを自然言語で検索し、再現可能な配列最適化ワークフローをセルフサービスで実行できるAIエージェントを開発した。],
  ),
  (
    [自然言語による依頼を社内データの検索・集計処理へ接続するAIエージェントの設計・実装],
    [配列最適化モデルの実行条件、モデル成果物、実行パラメータ、出力形式を標準化した再利用可能なエージェントスキルの開発],
    [コンテナ化された推論処理と構造化された結果出力を組み合わせた再現可能な実行フローの整備],
  ),
  (
    [社内科学データの検索と配列最適化ワークフローを研究者が自ら実行できる環境を整備],
    [モデル推論の実行手順を標準化し、同一条件で繰り返し実行できる仕組みを構築],
  ),
  [
    #env-group([言語], ("Python", "SQL", "Bash"))
    #env-group([AIエージェント], ("LangGraph",))
    #env-group([データ分析], ("DuckDB",))
    #env-group([インフラ], ("Docker",))
  ],
)

#project(
  period([2023年9月]),
  (
    [PythonとDockerで次世代シーケンシングデータ処理パイプラインを開発。レイクハウスの上流処理として、生データを後続の分析・機械学習に利用できる形式へ変換する高スループット処理基盤を構築した。],
  ),
  (
    [次世代シーケンシングデータ処理フローの分析と並列実行を前提とした再設計],
    [高スループットなジョブ実行基盤の設計・実装とレイクハウスへの処理済みデータ連携],
    [並列度、実行順序、リソース利用効率を踏まえた実行方式の最適化],
  ),
  (
    [処理スループットを30倍に向上],
    [データ準備時間を日単位から時間単位へ短縮],
    [処理済みデータをレイクハウスへ連携し、分析・機械学習ワークロードでの再利用を可能化],
  ),
  [
    #env-group([言語], ("Python",))
    #env-group([OS], ("Linux",))
    #env-group([インフラ], ("AWS", "Docker"))
    #env-group([CI/CD], ("Github Actions",))
  ],
)

#project(
  [2022年10月～2023年8月],
  (
    [MSA Transformerを用いて進化的な配列表現を抽出し、学習済みタンパク質埋め込みから二値の溶解性を予測するパイプラインを開発した。],
  ),
  (
    [MSA Transformerによるタンパク質配列の特徴抽出],
    [学習済みタンパク質埋め込みを入力とする下流分類器の構築],
  ),
  (
    [タンパク質配列から溶解性を二値予測する一連のパイプラインを構築],
  ),
  [
    #env-group([言語], ("Python",))
    #env-group([OS], ("Linux",))
    #env-group([機械学習], ("Transformers",))
    #env-group([ライブラリ], ("PyTorch",))
  ],
)

#table(
  columns: (1fr, 31mm),
  stroke: table-stroke,
  inset: 4pt,
  align: (left, top),
  table.cell(colspan: 2, fill: table-header-fill)[#text(
    weight: "bold",
  )[2015年3月～2017年9月　Gallipoli Hospital / COMU Hospital（トルコ）]],
  [医師として勤務],
  [職種：医師],
)

#pagebreak()
#section[自己PR]
研究開発組織で継続的に使われる基盤には、機能を実装するだけでなく、データ量の増加、実験の再現性、運用のしやすさを見据えた設計が必要だと考えています。MOLCUREでは、2チーム約10名の研究者・エンジニアが利用する社内データ・AIプラットフォームの設計と開発を主導しました。当初のPostgreSQLベースのシステムから、Amazon S3、Apache Iceberg、Sparkによるレイクハウスへ段階的に発展させ、10 TB超のデータと50億件超の生物学的レコードを管理できる基盤を構築しました。

プラットフォーム開発では、GoによるコントロールプレーンとREST APIを設計・運用し、データ探索、メタデータ管理、実験追跡、モデル成果物閲覧、GPU推論オーケストレーションを一つのワークフローに統合しました。また、プラットフォームUIをTypeScript/Reactで開発しました。加えて、Kubernetes上で一時的なSpark SQLジョブを実行するデータ処理プレーンを構築し、S3上の生データを正規化・バージョン管理されたIcebergテーブルへ変換する処理を自動化しました。さらに、研究者が自然言語で社内の科学データを検索し、再現可能な配列最適化ワークフローをセルフサービスで実行できるAIエージェントを開発しました。共通のデータモデルとルックアップテーブルを整備することで、分析・機械学習ワークフロー間でデータセットと実験結果を再現可能な形で利用できるようにしました。

インフラと運用面では、TerraformでEC2、IAM、VPC、ネットワークセキュリティ、インスタンスライフサイクルを管理し、GitHub Actionsでコンテナ化サービスのCI/CDを構築しました。認証・認可、Redisキャッシュ、構造化ログ、ジョブログのライブストリーミング、Prometheusメトリクス、Grafanaダッシュボードも整備し、継続運用に必要な信頼性と可観測性を高めました。さらに、PythonとDockerによる次世代シーケンシングデータ処理パイプラインをレイクハウスの上流に構築し、データ準備時間を日単位から時間単位へ短縮するとともに、処理スループットを30倍に向上させました。医学・バイオインフォマティクス・科学計算の知識を背景に、研究現場の課題を理解しながら、データモデル設計、API開発、データ処理、インフラ自動化、運用改善まで横断して推進できる点が強みです。
