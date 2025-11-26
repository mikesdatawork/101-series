# 101 Data Transformation Commands

The definitive cheat sheet for reshaping, aggregating, windowing, joining, and engineering features at scale — exactly how senior data engineers and scientists transform data in 2025.

### 1. Environment Setup — Python (imports) (8)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| import pandas as pd; import numpy as np | Core imports | Every notebook | |
| import polars as pl | High-performance | >10 GB data | pl.Config.set_tbl_rows(30) |
| pd.set_option('display.max_columns', None) | See all columns | Debugging | |
| from sklearn.preprocessing import StandardScaler, PolynomialFeatures | Feature engineering | Pipelines | |
| from scipy import stats | Statistical transforms | Z-score, etc. | |
| import warnings; warnings.filterwarnings('ignore') | Clean output | Production | |
| %load_ext memory_profiler | Memory tracking | Optimization | %memit |

### 2. Reshaping Data — pandas (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.melt(id_vars=['id'], value_vars=['2020','2021','2022']) | Wide → Long | Time series | var_name='year', value_name='sales' |
| df.pivot_table(index='customer_id', columns='year', values='revenue') | Long → Wide | Reports | aggfunc='sum', fill_value=0 |
| df.stack() | MultiIndex → long | Advanced reshaping | .reset_index() |
| df.unstack(level=0) | Long → MultiIndex columns | Grouping | |
| df.set_index(['country','year']).sort_index() | Hierarchical index | Multi-level analysis | |
| df.reset_index(drop=False) | Flatten index | After groupby | |
| pd.concat([df1, df2], axis=0) | Stack vertically | Combine datasets | ignore_index=True |
| pd.concat([df1, df2], axis=1) | Join horizontally | Feature merging | |
| df.append(df2, ignore_index=True) | Legacy concat | Pandas <2.0 | |
| df.explode('products') | List column → rows | JSON arrays | |
| df.assign(**{'new_col': lambda x: x.col1 + x.col2}) | Safe column creation | Chaining | |
| df.reindex(columns=new_order) | Reorder columns | Standardization | |

### 3. GroupBy Aggregation Mastery — pandas (14)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.groupby('category').agg({'sales': 'sum', 'profit': 'mean'}) | Multiple agg | Reports | |
| df.groupby('region')['sales'].transform('sum') | Broadcast group value | Market share | |
| df.groupby('customer_id').size() | Count per group | Activity | .reset_index(name='tx_count') |
| df.groupby('customer_id').cumcount() + 1 | Transaction number | Sequence | |
| df.groupby('category').rank(method='dense') | Rank within group | Leaderboards | |
| df.groupby('user_id')['timestamp'].diff().dt.days | Days since last event | Retention | |
| df.groupby('category').nth(0) | First row per group | Latest record | nth(-1) for last |
| df.groupby('store')['sales'].pct_change() | Period-over-period | Growth | |
| df.groupby('category').filter(lambda x: len(x) > 100) | Keep large groups | Noise reduction | |
| df.groupby('month').apply(lambda x: x.nlargest(5, 'sales')) | Top-N per group | Rankings | |
| df.groupby('category').head(3) | First N rows per group | Sampling | |
| df.groupby('region').ngroup() | Group ID number | Encoding | |
| df.groupby('category').cumsum() | Running total | Inventory | |
| df.groupby('user_id').shift(1) | Previous row per group | Lag features | |

### 4. Advanced Window Functions — pandas (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df['rolling_mean_7d'] = df.groupby('user_id')['value'].transform(lambda x: x.rolling(7, min_periods=1).mean()) | Rolling stats | Time series | |
| df['ewm_alpha'] = df.groupby('store')['sales'].transform(lambda x: x.ewm(alpha=0.1).mean()) | Exponential weighted | Smoothing | |
| df['expanding_sum'] = df.groupby('customer')['purchase'].transform(lambda x: x.expanding().sum()) | Cumulative | Lifetime value | |
| df['row_num'] = df.groupby('order_id').cumcount() + 1 | Row number per group | Dedupe | |
| df['diff_from_mean'] = df['value'] - df.groupby('category')['value'].transform('mean') | Deviation | Anomaly | |
| df['z_score'] = df.groupby('date')['value'].transform(lambda x: (x - x.mean()) / x.std()) | Daily z-score | Normalization | |
| df['pct_rank'] = df.groupby('month')['sales'].transform(lambda x: x.rank(pct=True)) | Percentile | Scoring | |
| df['lag_1'] = df.groupby('id')['value'].shift(1) | Previous value | Features | shift(-1) for lead |
| df['rolling_max_30d'] = df.groupby('user')['sessions'].transform(lambda x: x.rolling(30, min_periods=1).max()) | Peak detection | |
| df['decay_sum'] = df.groupby('user')['spend'].transform(lambda x: x[::-1].cumsum()[::-1]) | Reverse cumsum | Recent bias | |
| df.sort_values(['user','date']).groupby('user')['value'].diff() | Consecutive diff | Change detection | |
| df.groupby('category')['value'].transform('first') | First value per group | Baseline | 'last' for final |

### 5. Multi-Table Joins & Merges — pandas (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df1.merge(df2, on='id', how='left') | SQL-style join | Core operation | validate='1:1' |
| df1.merge(df2, on=['id','date'], how='inner') | Composite key | Time series | |
| pd.merge(df1, df2, left_on='id1', right_on='id2') | Different names | Real data | |
| df1.join(df2.set_index('id'), on='id') | Index join | Faster | how='left' |
| df1.merge(df2, how='outer', indicator=True) | Full outer + source | Data quality | |
| df1.merge(df2, on='id', suffixes=('_base','_new')) | Column conflicts | Updates | |
| df.set_index('id').combine_first(lookup.set_index('id')) | Fill missing | Master data | |
| df1.merge(df2.drop_duplicates('id'), on='id') | Dedupe before join | Prevent explosion | |
| df1.merge(df2, on='id', how='left').query('_merge == "left_only"') | Anti-join | Missing keys | |
| pd.concat([df1, df2]).drop_duplicates(subset='id', keep='last') | Upsert pattern | Incremental load | |

### 6. Feature Crossing & Interaction — pandas + sklearn (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df['age_income'] = df['age'] * df['income'] | Simple interaction | Tree models | |
| df['city_state'] = df['city'] + '_' + df['state'] | String cross | Grouping | |
| df['hour_dayofweek'] = df['hour'].astype(str) + '_' + df['dayofweek'].astype(str) | Time cross | Patterns | |
| PolynomialFeatures(degree=2, interaction_only=True) | All pairwise | Linear models | include_bias=False |
| df['log_income'] = np.log1p(df['income']) | Non-linear | Skewed data | |
| df['income_per_age'] = df['income'] / (df['age'] + 1) | Ratio | Domain logic | |
| df['is_peak_hour'] = df['hour'].between(7,9).astype(int) | Indicator | Behavior | |
| df['high_value'] = (df['spend'] > df['spend'].quantile(0.9)).astype(int) | Segmentation | Targeting | |
| df['age_bin'] = pd.qcut(df['age'], q=5, labels=False) | Quantile bin | Discretization | |
| df.assign(**{f'poly_{i}': df['x']**i for i in range(2,5)}) | Higher-order | Regression | |

### 7. Advanced Time-Based Transformations — pandas (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df['date'] = pd.to_datetime(df['date']) | Base step | Always | |
| df['month'] = df['date'].dt.to_period('M') | Monthly bucket | Aggregation | |
| df['dow'] = df['date'].dt.dayofweek | Day of week | Cyclical | |
| df['hour'] = df['date'].dt.hour | Hour of day | Patterns | |
| df['days_since_first'] = (df['date'] - df.groupby('user_id')['date'].transform('min')).dt.days | Cohort age | |
| df['is_weekend'] = df['date'].dt.weekday >= 5 | Weekend flag | Behavior | |
| df['sin_hour'] = np.sin(2 * np.pi * df['hour']/24) | Cyclical encoding | ML models | cos_hour too |
| df.resample('7D', on='date').sum() | Weekly aggregation | Time series | closed='left' |
| df.set_index('date').asfreq('D', method='ffill') | Fill missing dates | Regular grid | |
| df['time_since_event'] = df.groupby('user_id')['date'].diff().dt.days | Recency | Churn models | |

### 8. Polars High-Performance Transformations — Polars (8)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.group_by('category').agg(pl.col('sales').sum()) | Fast groupby | 10x faster | |
| df.with_columns(pl.col('value').rolling_mean(window_size=7)) | Rolling | Lazy | |
| df.with_columns((pl.col('sales') / pl.col('sales').sum()).over('region')) | Group percentage | |
| df.join(other, on='id', how='left') | Fast merge | Memory efficient | |
| df.with_columns(pl.col('date').dt.ordinal_day()) | Date parts | |
| df.pivot(index='id', columns='year', values='sales') | Pivot | Built-in | |
| df.sort('date').with_columns(pl.col('value').diff().over('user')) | Lag/diff | |
| df.lazy().group_by('category').agg(...).collect() | Lazy execution | Huge data | |

### 9. Production Transformation Patterns — pandas + best practices (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.pipe(clean_columns).pipe(add_features).pipe(validate) | Function chaining | Readable pipelines | |
| @pd.api.extensions.register_dataframe_accessor('tfm') | Custom methods | Team reuse | |
| df.transform({'log_sales': lambda x: np.log1p(x.sales)}) | Multiple transforms | Clean syntax | |
| df.assign(temp=lambda x: x.a + x.b).drop(columns='temp') | Safe intermediate | |
| df.eval('total = price * quantity', inplace=True) | Fast in-place math | Performance | |
| df.query('age > 18 and country == "US"') | Readable filtering | |
| df.loc[mask, 'flag'] = 1 | Vectorized assignment | Speed | |
| df.memory_usage(deep=True).sum() / 1e9 | GB check | Before/after | |
| df.sample(frac=0.1, random_state=42) | Test on subset | Fast iteration | |
| df.to_parquet('cleaned.parquet', compression='zstd') | Save optimized | Production | |

## Tips from Senior Engineers
- Never use .apply(axis=1) for simple math — use vectorized ops
- Always groupby → transform, not merge, when broadcasting group stats
- Use .pipe() for readable, reusable transformation chains
- Rolling/expanding on grouped data is the #1 feature engineering trick
- Cyclical encoding (sin/cos) beats one-hot for hour/day/month
- Polars is now default for >15 GB datasets at most modern companies
- Always validate shape and nulls after every major transform
- Use indicator=True on merges to catch join issues early
- Prefer qcut over cut for balanced bins
- Store intermediate parquet — never re-run expensive transforms

## Resources
- Pandas User Guide: https://pandas.pydata.org/docs/
- Polars Book: https://pola-rs.github.io/polars-book/
- Feature Engineering for ML: https://github.com/alicezheng/feature-engineering-book

