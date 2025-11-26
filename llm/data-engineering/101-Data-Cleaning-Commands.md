# 101 Data Cleaning Commands

## Overview
Data cleaning is the most time-consuming yet critical step in any data pipeline. This sheet covers every common and uncommon cleaning task with battle-tested, copy-paste-ready commands from basic string fixes to advanced inconsistency detection. Master these to turn messy real-world data into reliable inputs for analysis and modeling.

## Target Audience
- Data engineers fixing pipeline inputs
- Data scientists handling dirty datasets
- Analysts standardizing reports
- ML practitioners preparing training data
- Anyone dealing with inconsistent data

### 1. Environment Setup — Python (pip + imports) (8)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| pip install pandas numpy polars rapidfuzz | Core + fuzzy matching | Project start | pip install pandas==2.2 |
| import pandas as pd; import numpy as np | Standard aliases | Every script | import pandas as pd |
| pd.set_option('display.max_columns', None) | Show all columns | Debugging | pd.set_option('display.max_rows', 100) |
| import warnings; warnings.filterwarnings('ignore') | Silence noise | Clean output | warnings.filterwarnings('once') |
| import re | Regex operations | String cleaning | re.compile(r'\d+') |
| from rapidfuzz import fuzz, process | Fast fuzzy matching | Deduplication | fuzz.ratio("New York", "new york") |
| import polars as pl | High-performance alternative | Large datasets | pl.Config.set_tbl_rows(20) |
| %load_ext memory_profiler | Memory profiling | Optimization | %memit df.head() |

### 2. Initial Data Quality Assessment — pandas (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.info() | Types + non-null counts | First look | df.info(verbose=True) |
| df.isnull().sum().sort_values(ascending=False) | Missing per column | Prioritize | df.isna().mean()*100 |
| df.describe(include='all') | Summary stats | Spot anomalies | include=[np.number] |
| df.duplicated().sum() | Exact duplicate rows | Quick check | df.duplicated(subset=['email']) |
| df.nunique() | Unique values per column | Cardinality | df.nunique() / len(df) |
| df.sample(10) | Random rows | Spot patterns | df.sample(frac=0.001) |
| df.head(20).T | Transposed view | Wide datasets | df.tail(20).T |
| df.dtypes.value_counts() | Type distribution | Schema issues | |
| df.memory_usage(deep=True).sum() / 1e6 | Memory in MB | Optimization | |
| df.columns.str.contains('unnamed', case=False) | Find junk columns | Cleanup | |
| df.select_dtypes('object').apply(lambda x: x.str.len().max()) | Max string length | Schema | |
| df.apply(lambda x: x.astype(str).str.contains(r'\?').sum()) | Find sentinel values | Legacy data | |

### 3. Handling Missing Values — pandas + scikit-learn + Polars (14)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.isnull().sum() | Count missings | Baseline | df.isna().any(axis=1) |
| df.fillna(0) | Fill with constant | Simple | df.fillna({'col': 'Unknown'}) |
| df.fillna(method='ffill', limit=2) | Forward fill | Time series | method='bfill' |
| df.interpolate(method='linear') | Numeric interpolation | Trends | method='time' |
| df.dropna(thresh=int(0.8*len(df))) | Drop nearly-empty rows | Aggressive | axis=1 for columns |
| df.replace(['', ' ', 'NULL', 'null', 'N/A'], np.nan) | Clean string missings | Messy CSVs | inplace=True |
| df.isnull().mean().sort_values(ascending=False) | % missing | Thresholding | > 0.7 → drop |
| SimpleImputer(strategy='constant', fill_value='missing') | sklearn imputer | Pipelines | strategy='most_frequent' |
| KNNImputer(n_neighbors=5) | Proximity-based fill | High accuracy | weights='distance' |
| IterativeImputer(RandomForestRegressor()) | MICE with model | Best quality | max_iter=10 |
| df.loc[df['col'].isnull(), 'col'] = df['col'].median() | Conditional fill | Domain logic | |
| pl.col('age').fill_null(strategy='median') | Polars | Performance | fill_null(0) |
| df['col_is_missing'] = df['col'].isnull().astype(int) | Missing indicator | Model input | |
| df.drop(columns=df.columns[df.isnull().all()]) | Drop 100% missing | Cleanup | |

### 4. String Cleaning & Standardization — pandas + regex (16)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df['col'].str.strip() | Remove whitespace | Universal | .str.lstrip(), .str.rstrip() |
| df['col'].str.lower() | Lowercase | Matching | .str.title(), .str.upper() |
| df['col'].str.replace(r'\s+', ' ', regex=True) | Collapse spaces | Normalization | |
| df['col'].str.replace(r'[^\w\s]', '', regex=True) | Remove punctuation | Text | keep hyphens: r'[^\w\s\-]' |
| df['col'].str.replace(r'\d+', 'NUM', regex=True) | Replace numbers | Anonymization | |
| df['col'].str.split().str.join(' ') | Re-join after clean | After token edits | |
| df['col'].str.normalize('NFKC') | Unicode normalization | Accents | import unicodedata |
| df['col'].astype(str).str.replace('nan', '') | Remove 'nan' strings | After fillna | |
| df['col'].str.contains('pattern', na=False) | Flag matches | Filtering | case=False |
| df['col'].str.extract(r'(\d{5})') | Extract zip codes | Parsing | expand=False |
| df['col'].str.slice(0, 50) | Truncate long text | Storage | |
| df['col'].apply(lambda x: x.encode('ascii', 'ignore').decode()) | Strip non-ASCII | Legacy | |
| df['col'].str.pad(width=10, fillchar='0') | Zero-pad | IDs | side='left' |
| df['col'].str.zfill(10) | Zero-fill | Simpler pad | |
| df['col'].str.removeprefix('http://') | Python 3.9+ | URLs | .removesuffix() |
| df['col'].map(str.strip).map(str.lower) | Chain cleaning | Common pattern | |

### 5. Fixing Inconsistent Categories — pandas + rapidfuzz (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df['city'].value_counts().head(20) | Spot variations | First step | |
| df['city'].str.replace(r'\bSt\.?\b', 'Saint', regex=True) | Abbreviation fix | Common | NY → New York |
| mapping = {'NY': 'New York', 'N.Y.': 'New York', 'NewYork': 'New York'} | Manual map | Known typos | df['city'].map(mapping).fillna(df['city']) |
| df['city'].replace({'California': 'CA', 'Calif.': 'CA'}, regex=True) | Regex replace | State names | |
| uniques = df['brand'].unique().tolist() | List for review | Manual audit | |
| matches = process.extract('Coca Cola', uniques, limit=5) | Fuzzy find | Dedupe prep | scorer=fuzz.token_set_ratio |
| df['brand_clean'] = df['brand'].map(lambda x: process.extractOne(x, choices, scorer=fuzz.ratio)[0]) | Fuzzy mapping | High accuracy | threshold=90 |
| df['category'].str.title().str.strip() | Title case | Names | |
| df['gender'].replace({'M': 'Male', 'F': 'Female', 'male': 'Male'}, inplace=True) | Gender fix | Common mess | |
| df['country'].apply(lambda x: 'United States' if x in ['USA', 'US', 'U.S.'] else x) | Country fix | |
| df['col'].astype('category') | Enforce known categories | After cleaning | .cat.set_categories([...]) |
| df['col'].value_counts().index[df['col'].value_counts() < 10] | Rare categories → Other | Noise reduction | |

### 6. Date Cleaning & Parsing — pandas (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| pd.to_datetime(df['date'], errors='coerce') | Safe parsing | Core command | format='%Y-%m-%d' |
| df['date'].str.replace(r'\D', '/', regex=True) | Fix separators | 2023.12.25 → 2023/12/25 |
| pd.to_datetime(df['date'], format='mixed') | Pandas 2.0+ mixed | Auto-detect | |
| df['date_parsed'] = pd.to_datetime(df['date'], infer_datetime_format=True, dayfirst=True) | Day-first | EU dates | |
| df.loc[df['date'].str.len() == 10, 'date'] | Validate length | QA | |
| df['date'].dt.date | Strip time | Reports | .dt.year |
| df['date'].between('2020-01-01', '2023-12-31') | Valid range | Filtering | |
| df['date'].diff().dt.days.abs() > 365 | Find huge gaps | Anomaly | |
| df['date'] = df['date'].where(df['date'].dt.year > 1900) | Remove impossible years | 1899 → NaT | |
| df['year'] = df['date'].dt.strftime('%Y') | String year | Grouping | |
| df.set_index('date').asfreq('D').index | Find missing dates | Time series | |
| df['date'].isna().sum() | Count failed parses | After to_datetime | |

### 7. Numeric Cleaning & Validation — pandas + NumPy (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| pd.to_numeric(df['price'], errors='coerce') | Safe conversion | Core | downcast='float' |
| df['price'].replace('[\$,]', '', regex=True).astype(float) | Remove $ and commas | Money | |
| df['age'] = df['age'].clip(lower=0, upper=120) | Realistic bounds | People data | |
| df['quantity'] = df['quantity'].where(df['quantity'] > 0, np.nan) | Negative → missing | Inventory | |
| df.select_dtypes('number').apply(lambda x: (x < 0).sum()) | Count negatives | QA | |
| df['col'].abs() | Absolute value | Distances | |
| df['col'].round(2) | Decimal places | Money | |
| df['percentage'] = df['percentage'].div(100) | 50% → 0.5 | Common mistake | |
| df['col'].astype(int) | Force integer | After cleaning | |
| df['col'].between(0, 1) | Validate probability | Model input | |
| df['col'].mask(df['col'] == 999999, np.nan) | Remove sentinels | Legacy codes | |
| np.isfinite(df.select_dtypes('number')) | Find inf/-inf | After math | |

### 8. Structural Cleaning — pandas (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.drop_duplicates(subset=['email', 'name']) | Remove dupes | Core | keep='first' |
| df.drop(columns=['Unnamed: 0', 'index']) | Junk columns | CSVs | |
| df.rename(columns=lambda x: x.strip().lower().replace(' ', '_')) | Clean names | Standardization | |
| df.columns = df.columns.str.replace(r'\W|^(?=\d)', '_', regex=True) | Safe names | SQL-ready | |
| df.reset_index(drop=True, inplace=True) | Clean index | After filtering | |
| df = df.loc[:, ~df.columns.duplicated()] | Duplicate columns | Merged data | |
| df.melt(id_vars=['id'], value_vars=['2020','2021']) | Unpivot | Wide → long | |
| df.pivot_table(index='id', columns='year', values='sales') | Pivot | Long → wide | aggfunc='sum' |
| df.explode('items') | List column → rows | JSON data | |
| df.assign(**df.select_dtypes('object').apply(lambda x: x.str.strip())) | Bulk strip | One-liner | |

### 9. Advanced Consistency Checks — pandas (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| assert (df['end_date'] >= df['start_date']).all() | Business rule | Validation | |
| assert df['revenue'] >= df['cost'] | Profit check | Finance | |
| df.groupby('user_id')['timestamp'].is_monotonic_increasing | Session order | Events | |
| df['email'].str.contains(r'^[^@]+@[^@]+\.[^@]+$', na=False) | Valid email | QA | |
| df['phone'].str.match(r'^\d{3}-\d{3}-\d{4}$', na=False) | Phone format | |
| df['state'].isin(us.states.abbr) | Valid US state | from us import states |
| df['price'].between(df['price'].quantile(0.01), df['price'].quantile(0.99)) | Outlier flag | |
| df.duplicated(subset=['email']).sum() == 0 | No dupes | Final check | |
| df.isnull().sum().sum() == 0 | No missing | Final check | |
| df.dtypes.to_dict() | Export schema | Documentation | |

### 10. Polars-Specific High-Performance Cleaning — Polars (8)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.with_columns(pl.col('text').str.strip().str.to_lowercase()) | Chain string ops | Fast | |
| df.with_columns(pl.col(pl.Utf8).str.replace_all(r'\W+', ' ')) | Regex replace | Performance | |
| df.with_columns(pl.col('price').cast(pl.Float64, strict=False)) | Safe cast | |
| df.filter(pl.col('age').is_between(0, 120)) | Bounds | Fast filtering | |
| df.with_columns(pl.col('date').str.strptime(pl.Date, fmt=None)) | Auto date parse | |
| df.unique(subset=['email']) | Dedupe | Memory efficient | |
| df.with_columns(pl.col('category').fill_null('Unknown')) | Fill missing | |
| df.lazy().drop_nulls().collect() | Lazy cleaning | Huge data | |

## Tips and Best Practices
* Start with df.info() and df.describe(include='all') to spot 80% of issues
* Always create a copy: df_clean = df.copy() before aggressive changes
* Use .loc for conditional assignments to avoid warnings
* Validate business rules with asserts early in pipelines
* For fuzzy matching, set threshold >85 to avoid false positives
* Downcast types after cleaning: df['int_col'] = df['int_col'].astype('int32')
* Document cleaning steps in a Jupyter notebook or script comments
* Test cleaning on a sample: df_sample = df.sample(1000)
* Handle dates with dayfirst=True for international data
* Use regex sparingly—test patterns on real samples first
* After string cleaning, re-check nunique() for consistency
* For large data, switch to Polars after initial assessment
* Export cleaned schema: df.dtypes.to_dict() for team sharing
* Never drop data without logging what/why (e.g., print counts)
* Chain operations: df.pipe(clean_strings).pipe(fill_missing)
* Profile memory before/after: df.memory_usage(deep=True)
* Use value_counts() on categoricals to catch rare outliers
* For production, wrap cleaning in a function with parameters
* Always re-run quality checks after each major cleaning step

## Additional Resources
* [Pandas Cleaning Guide](https://pandas.pydata.org/docs/user_guide/missing_data.html)
* [RapidFuzz Documentation](https://github.com/rapidfuzz/RapidFuzz)
* [Polars String Operations](https://pola-rs.github.io/polars/py-polars/html/reference/expressions/api/polars.Expr.str.html)
* [Kaggle Messy Data Tutorial](https://www.kaggle.com/learn/data-cleaning)
* [Real-World Data Cleaning Examples](https://towardsdatascience.com/data-cleaning-challenges-choices-and-best-practices-2ff1c4d45f0a)

## Mini-Glossary

This section defines key cleaning terms and patterns.

### Common Terms
| Term | Description |
|------|-------------|
| Imputation | Filling missing values strategically |
| Deduplication | Removing exact or fuzzy duplicates |
| Normalization | Standardizing formats (e.g., casing) |
| Sentinel Value | Placeholder like '?' or -999 for missing |
| Cardinality | Number of unique values in a column |
| Fuzzy Matching | Similarity-based string comparison |
| Schema Drift | Changes in data structure over time |
| Business Rule | Domain-specific validation (e.g., age > 0) |

### Cleaning Strategies Comparison
| Strategy | Pros | Cons | Best For |
|----------|------|------|----------|
| Drop NaN | Simple, no bias | Data loss | <5% missing |
| Mean/Median Fill | Fast, preserves stats | Introduces bias | Numeric, low missing |
| Forward Fill | Good for sequences | Propagates errors | Time series |
| KNN Impute | Uses relationships | Computationally expensive | Structured data |
| Fuzzy Dedupe | Handles typos | Requires tuning | Names, addresses |

### Regex Patterns for Common Fixes
| Pattern | Purpose | Example Match |
|---------|---------|---------------|
| r'\s+' | Collapse whitespace | Multiple spaces → single |
| r'[^\w\s]' | Remove punctuation | !@# → empty |
| r'\d{3}-\d{3}-\d{4}' | US phone | 123-456-7890 |
| r'^[^@]+@[^@]+\.[^@]+$' | Email validation | user@example.com |
| r'\bSt\.?\b' | Abbreviation expand | St. → Saint |

### Validation Checks
| Check | Command Snippet | Purpose |
|-------|-----------------|---------|
| No negatives | (df[num_cols] < 0).sum().sum() == 0 | Data quality |
| Unique IDs | df['id'].is_unique | Integrity |
| Date order | (df['date'].diff() > pd.Timedelta(0)).all() | Chronology |
| Email count | df['email'].str.contains('@').sum() == len(df) | Completeness |

### Troubleshooting
| Issue | Cause | Fix |
|-------|-------|-----|
| SettingWithCopyWarning | Chained indexing | Use .loc[:, col] |
| Failed date parse | Mixed formats | errors='coerce', then inspect NaT |
| Memory explosion | Large strings | Convert to category early |
| Fuzzy false positives | Low threshold | Raise to 90+, review samples |
| Lost data after drop | Aggressive thresh | Log before/after counts |
| Regex not matching | Escaping | Test with re.search(pattern, text) |

