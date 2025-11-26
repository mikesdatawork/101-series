# 101 Data Pipeline Commands – 2025 Production Edition

The final, senior-level cheat sheet: everything real data engineering teams actually run in production every day — orchestration, ingestion, transformation at scale, monitoring, testing, and deployment.

### 1. Environment & Project Setup — Python + Tools (10)
| Command | Description | Real-World Usage |
|---------|-------------|------------------|
| python -m venv venv && source venv/bin/activate | Isolated environment | Every project |
| pip install "pandas>=2" "polars>=1" "pyarrow" "duckdb" | Core engines | |
| pip install prefect airflow dbt-core great-expectations | Orchestration & quality | Choose one |
| pip install sqlalchemy psycopg2-binary snowflake-connector-python | DB connectors | |
| pip install "dask[dataframe]" "modin[pandas]" | Scale-up alternatives | |
| poetry init && poetry add pandas prefect | Modern dependency mgmt | Preferred 2025 |
| pre-commit install && pre-commit run --all-files | Code quality | Mandatory in pro teams |
| ruff . && mypy . | Linting + type checking | Fast + strict |
| mkdir -p {src,tests,data/raw,data/processed} | Standard layout | |
| git init && git add . && git commit -m "init" | Version everything | Always |

### 2. Ingestion & Landing — From Anywhere to Storage (14)
| Command | Description | Example |
|---------|-------------|---------|
| pd.read_sql(query, engine) | From RDBMS | |
| pd.read_parquet("s3://bucket/path/", storage_options={"anon": False}) | S3 → DataFrame | boto3 default profile |
| pl.read_database(query, connection_uri) | Polars direct | 5–10× faster |
| duckdb.connect().execute("SELECT * FROM 's3://...csv'") | Zero-copy CSV | Massive files | |
| pd.read_csv("https://...", compression='gzip') | Direct HTTP | |
| df.to_parquet("data/raw/table.parquet", partition_cols=['year','month']) | Partitioned write | |
| df.to_feather("data/raw/table.fth") | Fast local | |
| aws s3 cp local.parquet s3://... --recursive | CLI upload | |
| gsutil -m cp -r data/ gs://bucket/ | GCP | |
| dbt seed run | Load CSV seeds | |
| prefect deployment build flows/ingest.py:ingest -n prod -q default | Prefect deploy | |
| airflow tasks test dag_id task_id 2025-01-01 | Airflow dry-run | |
| curl -X POST https://api.source.com/data -H "Authorization: Bearer $TOKEN" | REST ingestion | |
| kcat -b broker -t topic -C -q | Kafka consumer check | |

### 3. Orchestration with Prefect 2/3 — Modern Standard (12)
| Command | Description | Production Note |
|---------|-------------|-----------------|
| @flow def etl_flow(): ... | Define flow | |
| @task(retries=3, retry_delay_seconds=60) | Resilience | |
| @task def extract() -> pl.DataFrame: | Typed tasks | |
| with Flow.run_log_path = "/logs" | Logging | |
| prefect deployment build flow.py:etl -n prod --cron "0 6 * * *" | Schedule 6am daily | |
| prefect deployment apply etl-deployment.yaml | Deploy | |
| prefect work-pool create "docker" --type docker | Docker execution | |
| prefect agent start -q default | Run agent | |
| prefect orion start | Local UI | |
| prefect cloud login -k $API_KEY | Cloud | |
| flow.from_source(source=GitHub(...)) | Pull code from repo | |
| @flow(log_prints=True) | Print → UI | |

### 4. Orchestration with Apache Airflow — Still Dominant (10)
| Command | Description |
|---------|-------------|
| @dag(schedule="@daily", catchup=False, default_args=args) | Modern DAG |
| PythonOperator(task_id='run', python_callable=func) | |
| BashOperator(task_id='load', bash_command="dbt run") | |
| TaskFlow API @task def extract(): | Preferred style |
| airflow tasks test dag_id task_id 2025-01-01 | No side effects |
| airflow dags list-runs -d dag_id | Check status |
| airflow configs get-value core parallelism | Tuning |
| KubernetesExecutor + CeleryExecutor | Scaling |
| airflow db init && airflow users create ... | First start |
| ExternalPythonOperator | Virtualenv isolation |

### 5. Transformation at Scale — dbt, Spark, DuckDB, Polars (16)
| Command | Description | When Used |
|---------|-------------|-----------|
| dbt run --models +customers | Incremental | Warehouse (Snowflake, BigQuery, Redshift) |
| dbt test --models customers | Data quality | |
| {{ config(materialized='incremental', unique_key='id') }} | Incremental model | |
| {{ ref('stg_orders') }} | Dependency | |
| spark.read.parquet("s3a://...").createOrReplaceTempView("table") | Spark SQL | |
| spark.sql("SELECT ...").write.mode("overwrite").partitionBy("date").parquet(path) | |
| duckdb.sql("SELECT * FROM 's3://...parquet'") | 200GB+ on laptop | |
| pl.scan_parquet("s3://.../*.parquet").filter(...).sink_parquet("out/") | Lazy Polars | |
| dask.dataframe.read_parquet("s3://...") | Multi-core pandas | |
| df.repartition(200).write.mode("overwrite").parquet(path) | Spark tuning | |
| {{ config(materialized='table') }} vs {{ config(materialized='view') }} | Storage choice | |
| dbt run --full-refresh | Rebuild | |
| dbt deps && dbt seed && dbt run && dbt test | Full cycle | |
| 
| dbt docs generate && dbt docs serve | Documentation | |
| --select tag:nightly | Tagged runs | |
| dbt build | Run + test together | 2024+ |

### 6. Data Quality & Testing — Great Expectations & dbt Tests (12)
| Command | Description |
|---------|-------------|
| great_expectations init | Scaffold |
| great_expectations checkpoint new my_checkpoint | Create |
| expect_column_values_to_not_be_null | Basic test |
| expect_column_values_to_be_between | Range |
| expect_column_values_to_match_regex | Format |
| expect_table_row_count_to_be_between | Cardinality |
| great_expectations checkpoint run my_checkpoint | Execute |
| dbt test --models stg_customers | Built-in |
| {{ config(severity='warn') }} | Soft fail |
| tests: - unique: - column_name: id | YAML test |
| tests: - relationships: to: ref('orders'), field: customer_id | Referential integrity |
| great_expectations docs build && great_expectations docs serve | HTML report |

### 7. Monitoring, Alerting & Observability (10)
| Command | Description |
|---------|-------------|
| prefect deployment set-concurrency-limit prod 5 | Prevent overload |
| @flow(on_failure=send_slack) | Alerting |
| airflow dags trigger dag_id --conf '{"alert": true}' | |
| dbt run --profiles-dir . --project-dir . --notify | Slack on failure |
| prometheus + grafana dashboards for Prefect | Metrics | |
| sentry.io integration | Error tracking |
| datadog agent + ddtrace | Distributed tracing |
| loguru or structlog | Structured logging |
| df.shape before/after logging | Data drift detection |
| elementary dbt package | Lineage + freshness monitoring |

### 8. CI/CD & Deployment — GitHub Actions Example (8)
| Command | Description |
|---------|-------------|
| name: CI on: [push] | |
| run: poetry install && poetry run pytest | |
| run: dbt deps && dbt build --profiles-dir . | |
| run: prefect deployment apply ... | |
| uses: actions/upload-artifact@v3 | Save reports |
| if: failure() run: curl webhook slack | Alert |
| schedule: - cron: '0 7 * * *' | Daily run |
| permissions: contents: write, deployments: write | Prefect Cloud deploy |

### 9. Production Best Practices Checklist
- [ ] All pipelines are version-controlled (git + dbt models)
- [ ] Every table has primary-key tests
- [ ] Incremental models where possible
- [ ] Partitions by date (year/month/day)
- [ ] Data encrypted at rest & in transit
- [ ] Secrets via environment variables or vault
- [ ] Monitoring + alerting on failure and freshness
- [ ] Documentation auto-generated (dbt docs / Prefect UI)
- [ ] CI/CD runs tests on every PR
- [ ] Separate dev / staging / prod profiles

## Resources You Actually Use in 2025
- Prefect Docs – https://docs.prefect.io
- dbt Labs – https://docs.getdbt.com
- Great Expectations – https://greatexpectations.io
- DuckDB – https://duckdb.org
- Polars User Guide – https://pola.rs
- Elementary (dbt monitoring) – https://www.elementary-data.com

