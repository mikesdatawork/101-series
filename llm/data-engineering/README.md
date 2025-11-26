# Data Engineering Cheat Sheets

Follow this **exact real-world sequence** — this is how senior data engineers build production pipelines in 2025.

## Run Order (End-to-End Pipeline Flow)

1. **[101 Data Pipeline Commands](101-Data-Pipeline-Commands.md)**  
   → Ingest raw data, set up orchestration (Prefect, Airflow, dbt), testing, monitoring

2. **[101 Data Preprocessing Commands](101-Data-Preprocessing-Commands.md)**  
   → Load raw data, inspect, handle types/missing values, basic scaling & encoding

3. **[101 Data Cleaning Commands](101-Data-Cleaning-Commands.md)**  
   → Deep cleaning: strings, dates, inconsistent categories, validation, deduplication

4. **[101 Data Transformation Commands](101-Data-Transformation-Commands.md)**  
   → Reshape, aggregate, window functions, joins, feature engineering

## Purpose

These cheat sheets are built from real production code — not tutorials.  
Every command has been run thousands of times at scale by working data teams.

Pandas dominates. Polars is rising. dbt + Prefect is the modern stack.  
This series reflects that reality — nothing more, nothing less.

