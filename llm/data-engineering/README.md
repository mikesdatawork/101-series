# Data Engineering Cheat Sheets

Follow this **exact sequence** for a real-world data pipeline exercise: Start with orchestration mindset, then drill into tactics.

## Recommended Run Order (Production Flow)
1. **[101 Data Pipeline Commands](101-Data-Pipeline-Commands.md)** – Ingest raw data, set up orchestration (Prefect/Airflow/dbt)
2. **[101 Data Preprocessing Commands](101-Data-Preprocessing-Commands.md)** – Load/inspect raw, basic fixes (nulls, types)
3. **[101 Data Cleaning Commands](101-Data-Cleaning-Commands.md)** – Deep cleaning (strings, dates, validation)
4. **[101 Data Transformation Commands](101-Data-Transformation-Commands.md)** – Reshape/enrich for analysis (groupby, joins, features)

## Available Cheat Sheets (Alphabetical)
- [101 Data Cleaning Commands](101-Data-Cleaning-Commands.md) – Deep fixes for messy data
- [101 Data Pipeline Commands](101-Data-Pipeline-Commands.md) – Orchestration, ingestion, testing, monitoring
- [101 Data Preprocessing Commands](101-Data-Preprocessing-Commands.md) – Initial loading, imputation, scaling
- [101 Data Transformation Commands](101-Data-Transformation-Commands.md) – Reshaping, aggregation, feature engineering

## Purpose
These provide pasteable commands for end-to-end pipelines, emphasizing 2025 tools like Polars, dbt, and Prefect.
