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
データ・AI基盤、バックエンドサービス、レイクハウスシステム、ワークフローオーケストレーションを中心に開発してきたソフトウェアエンジニア。AWS、Kubernetes、Docker、Terraformを用いたクラウド基盤上で、PostgreSQLベースのシステムをAmazon S3、Apache Iceberg、Spark、Trinoを活用したスケーラブルな分析・機械学習基盤へ発展させた経験を持つ。GoによるREST API、データ検出・取り込み、実験追跡、モデル成果物管理、GPU推論オーケストレーションの実装に加え、CI/CD、認証・認可、Redisキャッシュ、Prometheus/Grafanaによる可観測性整備にも従事。バイオインフォマティクス、医学、科学計算のバックグラウンドを活かし、研究開発を継続的に支える内部プラットフォーム構築を強みとする。

#section[活かせる経験・知識・技術]
#bullets((
  [Go、 Python、SQL],
  [AWS (EC2、 S3、IAM、VPC)、 Kubernetes、 Docker、 Terraform、 Linux],
  [PostgreSQL、Redis、Apache Iceberg、 Apache Spark、 Trino],
  [GitHub Actions、Prometheus、 Grafana],
))

#section[職務経歴]
#company-row

#project(
  period([2024年6月]),
  (
    [研究チーム向けに、データセット、実験メタデータ、モデル成果物、GPU推論を一元管理するデータ・AIプラットフォームを構築。Amazon S3、Apache Iceberg、Spark、Trino、Kubernetesを活用し、分析・機械学習・本番推論を共通基盤上で扱えるMLOps環境を整備した。],
  ),
  (
    [GoによるバックエンドサービスおよびREST APIの設計・開発（データ探索、実験追跡、モデル成果物管理）],
    [Amazon S3上のデータ検出、取り込み、Spark SQLジョブ起動を担うデータ処理マイクロサービスの実装],
    [Apache Icebergを用いたレイクハウス設計、テーブル設計、スキーマ進化、移行フローの整備],
    [Kubernetes上での分散データ処理およびDockerベースのGPU推論ジョブ実行基盤の構築・運用],
    [認証・認可、Redisキャッシュ、配列ID追跡、重複排除、バージョン管理を含む共通基盤機能の実装],
    [ユニットテスト・統合テスト、構造化ログ、Prometheus/Grafanaによる品質保証と可観測性の整備],
  ),
  (
    [データ管理と実験追跡をAPI駆動型へ移行し、実験の比較・再現・共有を容易化],
    [バッチ処理と対話的分析を単一基盤で両立し、分析・MLワークロードの運用効率を向上],
    [S3上のデータセット検出からIcebergテーブル生成までを自動化し、データ取り込み運用を効率化],
    [オンデマンドGPU推論基盤により、リソース利用効率と開発者の実験速度を改善],
  ),
  [
    #env-group([言語], ("Go", "SQL", "Bash"))
    #env-group([OS], ("Linux",))
    #env-group([サービス], ("PostgreSQL", "Redis"))
    #env-group([データ基盤], ("Apache Spark", "Apache Iceberg", "Trino", "PostgreSQL"))
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
    #env-group([クラウド], ("AWS EC2", "Amazon S3", "IAM", "VPC"))
    #env-group([OS], ("Linux",))
    #env-group([CI/CD], ("GitHub Actions",))
  ],
)

#project(
  period([2023年9月]),
  (
    [生物配列データ処理パイプラインを再設計し、並列ジョブ実行による高スループット処理基盤を構築。処理速度の向上とインフラコスト削減を両立させ、研究者の実験サイクルを短縮した。],
  ),
  (
    [生物配列データ処理フローの分析と並列実行前提での再設計],
    [高スループットなジョブ実行基盤の設計・実装],
    [並列度、実行順序、リソース利用効率を踏まえた実行方式の最適化],
  ),
  (
    [分散処理パイプラインにより処理スループットを30倍向上],
    [インフラコストを削減しつつ、研究者の実験ターンアラウンドを高速化],
    [データ準備時間を日単位から時間単位へ短縮し、研究および開発サイクルを高速化],
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
    [Transformerモデルを用いた分子特性予測およびタンパク質埋め込みの生成・可視化に従事。],
  ),
  (
    [Transformerモデルを用いた分子特性予測],
    [タンパク質埋め込みの生成および可視化],
  ),
  (
    [分子およびタンパク質表現の評価に必要な基礎検討を担当],
  ),
  [
    #env-group([言語], ("Python",))
    #env-group([OS], ("Linux",))
    #env-group([機械学習], ("Transformers",))
    #env-group([ライブラリ], ("PyTorch",))
  ],
)

#section[自己PR]
研究開発組織で継続的に使われる基盤には、機能を実装するだけでなく、データ量の増加、実験の再現性、運用のしやすさを見据えた設計が必要だと考えています。MOLCUREでは、データ・AIプラットフォームの設計と実装を担当し、PostgreSQL中心の既存システムをAmazon S3、Apache Iceberg、Spark、Trinoを活用したレイクハウスアーキテクチャへ拡張しました。これにより、バッチ処理と対話的分析を同じ基盤で扱い、分析と機械学習の双方で再利用しやすいデータ環境を整備しました。

バックエンド開発では、GoによるREST APIと制御プレーンを設計・運用し、データセット探索、メタデータ管理、実験追跡、モデル成果物閲覧、GPU推論ジョブのオーケストレーションを実装しました。Amazon S3上のデータ検出からKubernetes上での一時的なSpark SQLジョブ実行、正規化されたApache Icebergテーブル生成までを自動化し、研究者がデータと実験結果を比較・再現・共有しやすい運用フローを構築しました。認証・認可、Redisキャッシュ、ユニットテスト・統合テストの整備にも取り組み、APIの信頼性と応答性を改善しました。

インフラと運用面では、TerraformによるEC2、S3、IAM、VPC、ネットワークセキュリティ、インスタンスライフサイクル管理の自動化、GitHub ActionsによるCI/CD、構造化ログ、ライブジョブストリーミング、Prometheusメトリクス、Grafanaダッシュボードの導入を行いました。さらに、PythonとDockerを用いた次世代シーケンシングデータ処理パイプラインでは、データ準備時間を日単位から時間単位へ短縮し、処理スループットを30倍向上させました。医学・バイオインフォマティクス・科学計算の知識を背景に、要件整理からデータモデル設計、API開発、インフラ自動化、運用改善まで横断して推進できる点が強みです。
