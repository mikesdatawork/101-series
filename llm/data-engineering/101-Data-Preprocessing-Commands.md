# 101 Data Preprocessing Commands

## Overview
Data preprocessing transforms raw data into a clean, structured format suitable for analysis and modeling. This cheat sheet covers essential pandas, NumPy, Polars, and related commands for handling missing values, scaling, encoding, feature engineering, and dataset splitting across tabular, text, and time-series data. Master these commands to build reliable, high-quality datasets that improve model accuracy and training stability.

## Target Audience
- Data engineers building pipelines
- Data scientists preparing features
- ML engineers cleaning training data
- Analysts standardizing datasets
- Anyone performing data preprocessing

### 1. Environment Setup (8)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| pip install pandas numpy scikit-learn polars | Install core libraries | Project setup | pip install pandas==2.2 |
| import pandas as pd; import numpy as np | Import with aliases | Every script | import pandas as pd |
| pd.set_option('display.max_columns', None) | Show all columns | Exploration | pd.set_option('display.width', 1000) |
| %load_ext memory_profiler | Enable memory profiling | Jupyter | %memit df.head() |
| import warnings; warnings.filterwarnings('ignore') | Suppress warnings | Clean output | warnings.filterwarnings('once') |
| pd.options.mode.chained_assignment = None | Disable SettingWithCopy warning | Legacy code | pd.options.mode.chained_assignment = 'warn' |
| import polars as pl | Import Polars | High performance | pl.Config.set_tbl_rows(20) |
| pl.Config.set_fmt_str_lengths(100) | Increase string display length | Debugging | pl.Config.set_tbl_width_chars(200) |

### 2. Loading Data (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| pd.read_csv('file.csv') | Read CSV file | Standard import | pd.read_csv('data.csv', low_memory=False) |
| pd.read_parquet('file.parquet') | Read Parquet | Columnar storage | pd.read_parquet('data.parquet') |
| pd.read_json('file.json') | Read JSON | API responses | pd.read_json('data.jsonl', lines=True) |
| pd.read_excel('file.xlsx') | Read Excel | Business data | pd.read_excel('data.xlsx', sheet_name='Sheet1') |
| pl.scan_csv('file.csv') | Lazy CSV loading (Polars) | Large files | pl.scan_csv('big.csv').filter(pl.col('age') > 18) |
| pd.read_sql(query, conn) | Read from database | SQL sources | pd.read_sql('SELECT * FROM users', engine) |
| pd.read_feather('file.feather') | Read Feather format | Fast IPC | pd.read_feather('data.feather') |
| pd.read_html(url)[0] | Scrape HTML table | Web data | pd.read_html('https://example.com/table')[0] |
| pd.read_clipboard() | Read from clipboard | Quick testing | pd.read_clipboard(sep='\s+') |
| pd.DataFrame(data) | Create from dict/list | Manual data | pd.DataFrame({'A': [1,2,3]}) |
| pl.read_database(query, conn) | Polars database read | Large queries | pl.read_database('SELECT * FROM table', conn) |
| pd.read_pickle('file.pkl') | Read pickled DataFrame | Saved objects | pd.read_pickle('df.pkl') |

### 3. Initial Data Inspection (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.head() | View first rows | Quick check | df.head(10) |
| df.tail(8) | View last rows | Check end | df.tail() |
| df.shape | Dimensions | Size check | (1000, 15) |
| df.info() | Column types and memory | Schema overview | df.info(verbose=True) |
| df.describe() | Numeric summary | Statistics | df.describe(include='all') |
| df.dtypes | Data types | Type checking | df.select_dtypes('float64') |
| df.columns | List columns | Rename prep | list(df.columns) |
| df.isnull().sum() | Count missing per column | NaN check | df.isna().mean() * 100 |
| df.duplicated().sum() | Count duplicate rows | Deduplication | df.duplicated(subset=['id']) |
| df.sample(5) | Random sample | Quick look | df.sample(frac=0.01) |

### 4. Handling Missing Values (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.isnull() | Boolean mask of NaNs | Inspection | df.isnull().any() |
| df.fillna(value) | Fill with constant | Simple imputation | df.fillna(0) |
| df.fillna(method='ffill') | Forward fill | Time series | df.fillna(method='bfill') |
| df.interpolate() | Linear interpolation | Numeric series | df.interpolate(method='polynomial', order=2) |
| df.dropna() | Drop rows with any NaN | Strict cleaning | df.dropna(subset=['age']) |
| df.dropna(axis=1) | Drop columns with NaNs | Column removal | df.dropna(thresh=100) |
| SimpleImputer(strategy='median') | Scikit-learn imputer | Pipeline use | SimpleImputer(strategy='most_frequent') |
| KNNImputer(n_neighbors=5) | Nearest neighbors imputation | Advanced | KNNImputer(weights='distance') |
| IterativeImputer() | MICE imputation | High accuracy | IterativeImputer(max_iter=10) |
| df.replace('?', np.nan) | Replace sentinel values | Legacy data | df.replace(['N/A', ''], np.nan) |
| df.isnull().mean() * 100 | Percentage missing | Thresholding | df.loc[:, df.isnull().mean() > 0.5] |
| pl.DataFrame.fill_null(strategy='forward') | Polars null handling | Performance | pl.col('age').fill_null(0) |

### 5. Data Type Conversion (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.astype('category') | Convert to categorical | Memory saving | df['city'].astype('category') |
| pd.to_numeric(errors='coerce') | Safe numeric conversion | Dirty data | pd.to_numeric(df['age'], errors='ignore') |
| pd.to_datetime(df['date']) | Parse dates | Time features | pd.to_datetime(df['date'], format='%Y-%m-%d') |
| df['col'].astype('float32') | Downcast numeric | Memory optimization | df.select_dtypes('float64').astype('float32') |
| df['id'].astype(str) | Object to string | IDs as strings | df['zip'].astype(str).str.zfill(5) |
| pd.Categorical(values, ordered=True) | Create ordered categorical | Ordinal data | pd.Categorical(['low','med','high'], ordered=True) |
| df.convert_dtypes() | Auto-convert to best types | Pandas 1.0+ | df.convert_dtypes(convert_string=True) |
| pl.DataFrame.with_columns(pl.col('x').cast(pl.Int64)) | Polars casting | Type control | pl.col('date').str.strptime(pl.Date) |
| df['col'].map(dict) | Map values via dictionary | Label encoding | df['size'].map({'S':0, 'M':1, 'L':2}) |
| pd.factorize(df['col'])[0] | Integer encoding | Fast encoding | codes, uniques = pd.factorize(df['col']) |

### 6. Removing Duplicates (8)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.drop_duplicates() | Remove duplicate rows | Full dedupe | df.drop_duplicates(subset=['email']) |
| df.duplicated() | Boolean mask of duplicates | Inspection | df[df.duplicated()] |
| df.drop_duplicates(keep='last') | Keep last occurrence | Logs | df.drop_duplicates(keep=False) |
| df[~df.duplicated()] | Keep unique only | Filtering | df[~df.duplicated(subset=['id'])] |
| df.groupby('id').first() | Dedupe via groupby | Aggregation | df.groupby('id').agg('mean') |
| df.sort_values('timestamp').drop_duplicates('id', keep='last') | Latest per ID | Time-based | keep='first' for oldest |
| pl.DataFrame.unique(subset=['id']) | Polars dedupe | Performance | pl.DataFrame.drop_duplicates(subset=['email']) |
| df.set_index('id').loc[~df.set_index('id').index.duplicated()] | Index-based dedupe | Complex cases | reset_index() after |

### 7. Outlier Detection and Treatment (11)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.describe(percentiles=[.01,.99]) | View extreme percentiles | Manual check | .05, .95 |
| np.percentile(df['col'], 99) | Calculate percentile | Threshold | np.clip(df['col'], 0, upper) |
| df[(df['col'] < lower) | (df['col'] > upper)] | Boolean filter | Outlier rows |
| IQR = Q3 - Q1; lower = Q1 - 1.5*IQR | IQR method | Standard rule | upper = Q3 + 1.5*IQR |
| df.clip(lower=lower, upper=upper) | Winsorize | Cap extremes | df.clip(lower=0) |
| from scipy import stats; stats.zscore(df['col']) | Z-score | Standardization | abs(z) > 3 |
| RobustScaler() | Scale using median/IQR | Robust to outliers | RobustScaler(quantile_range=(5,95)) |
| IsolationForest() | Anomaly detection model | Unsupervised | IsolationForest(contamination=0.01) |
| LocalOutlierFactor() | Density-based detection | Clustering | LocalOutlierFactor(n_neighbors=20) |
| df.quantile(0.99) | Quantile capping value | Winsorizing | df['col'].clip(upper=df['col'].quantile(0.99)) |
| df.mask(cond, value) | Replace outliers | Custom logic | df.mask(df['age'] > 120, np.nan) |

### 8. Feature Scaling and Normalization (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| StandardScaler() | Zero mean, unit variance | Most ML models | StandardScaler(with_mean=False) |
| MinMaxScaler() | Scale to [0,1] | Neural networks | MinMaxScaler(feature_range=(-1,1)) |
| RobustScaler() | Median and IQR scaling | Outlier-resistant | RobustScaler(quantile_range=(10,90)) |
| MaxAbsScaler() | Scale to [-1,1] by max abs | Sparse data | MaxAbsScaler() |
| (df - df.mean()) / df.std() | Manual standardization | Quick scripts | (df - df.min()) / (df.max() - df.min()) |
| np.log1p(df['col']) | Log transform | Skewed data | np.sqrt(df['col']) |
| PowerTransformer(method='yeo-johnson') | Gaussian-like | Box-Cox alternative | method='box-cox' requires positive |
| QuantileTransformer(output_distribution='normal') | Rank to normal | Heavy tails | n_quantiles=1000 |
| df.apply(lambda x: (x-x.mean())/x.std()) | Per-column scaling | Custom | df.transform(zscore) |
| from sklearn.preprocessing import scale | Function form | Single array | scale(X, axis=0) |

### 9. Encoding Categorical Variables (12)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| pd.get_dummies(df['col']) | One-hot encoding | Baseline | prefix='city' |
| OneHotEncoder(sparse=False) | Scikit-learn OHE | Pipelines | handle_unknown='ignore' |
| LabelEncoder() | Integer encoding | Ordinal/target | LabelEncoder().fit_transform(y) |
| OrdinalEncoder() | Map categories to integers | Ordinal features | categories=[['low','med','high']] |
| TargetEncoder() | Mean target encoding | High cardinality | from category_encoders import TargetEncoder |
| CatBoostEncoder() | Ordered target encoding | Gradient boosting | handles new categories |
| df['col'].map(mapping_dict) | Manual mapping | Known values | {'M':1, 'F':0} |
| HashingEncoder(n_components=16) | Feature hashing | Very high cardinality | collision handling |
| pd.factorize() | Fast integer encoding | Internal use | codes, uniques = pd.factorize(df['col']) |
| Frequency encoding | Replace with count | Simple baseline | df['col'].map(df['col'].value_counts()) |
| BinaryEncoder() | Binary representation | Compact | from category_encoders import BinaryEncoder |
| df.astype('category').cat.codes | Pandas categorical codes | Memory efficient | +1 to start from 1 |

### 10. Text Preprocessing (11)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df['text'].str.lower() | Lowercase | Normalization | df['text'].str.strip() |
| df['text'].str.replace(r'\W', ' ', regex=True) | Remove punctuation | Cleaning | regex=False for literal |
| df['text'].str.split() | Tokenize | Word lists | expand=True |
| df['text'].apply(word_tokenize) | NLTK tokenization | Advanced | from nltk.tokenize import word_tokenize |
| df['text'].str.len() | Text length feature | Feature engineering | df['text'].str.count(' ') + 1 |
| stop_words = set(stopwords.words('english')) | Load stop words | Filtering | from nltk.corpus import stopwords |
| df['text'].apply(lambda x: ' '.join([w for w in x.split() if w not in stop_words])) | Remove stop words | Noise reduction | custom stop list |
| stemmer = PorterStemmer(); df['text'].apply(lambda x: ' '.join([stemmer.stem(w) for w in x.split()])) | Stemming | Normalization | SnowballStemmer |
| lemmatizer.lemmatize(word, pos='v') | Lemmatization | Meaning preservation | WordNetLemmatizer() |
| df['text'].apply(lambda x: re.sub(r'\d+', 'NUM', x)) | Replace numbers | Anonymization | ' ' for removal |
| TfidfVectorizer(max_features=5000) | TF-IDF encoding | Text to numeric | min_df=5, ngram_range=(1,2) |

### 11. Date and Time Feature Engineering (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|----------------|----------|
| pd.to_datetime(df['date']) | Parse date column | Base step | errors='coerce' |
| df['date'].dt.year | Extract year | Cyclical features | df['date'].dt.month |
| df['date'].dt.dayofweek | Day of week (0=Mon) | Temporal patterns | dt.weekday |
| df['date'].dt.is_month_end | Boolean flags | Business logic | dt.is_quarter_start |
| df['date'].dt.hour | Extract hour | Time of day | dt.minute, dt.second |
| (df['date'] - pd.Timestamp('1970-01-01')).dt.days | Unix timestamp days | Epoch | // 86400 |
| df『date』.diff().dt.days | Days between events | Duration | dt.total_seconds() |
| df['date'] + pd.Timedelta(days=30) | Date arithmetic | Forecasting | + pd.offsets.MonthEnd() |
| df.set_index('date').asfreq('D') | Resample frequency | Time series | .ffill() |
| np.sin(2 * np.pi * df['month']/12) | Cyclical encoding | Avoid discontinuity | hour, dayofyear |

### 12. Binning and Discretization (9)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| pd.cut(df['age'], bins=5) | Equal-width bins | Numeric to categorical | labels=['young','adult',...] |
| pd.qcut(df['income'], q=4) | Equal-frequency bins | Quantile bins | labels=['Q1','Q2','Q3','Q4'] |
| KBinsDiscretizer(n_bins=5, encode='ordinal') | Scikit-learn binner | Pipeline | strategy='quantile' |
| df['age_group'] = pd.cut(df['age'], [0,18,35,60,100], labels=['child','young','adult','senior']) | Custom bins | Domain logic | include_lowest=True |
| df['score_bin'] = pd.cut(df['score'], bins=[0, 60, 70, 80, 90, 100], labels=['F','D','C','B','A']) | Grade bins | Interpretation |
| np.digitize(value, bins) | Bin index | Manual | right=True |
| pd.cut(..., right=False) | Left-open intervals | Control inclusion | default right=True |
| df.groupby(pd.cut(df['age'], bins=5))['target'].mean() | Bin analysis | Target encoding | transform('mean') |
| Binarizer(threshold=0.5) | Binary threshold | Simple split | from sklearn.preprocessing |

### 13. Feature Creation and Interaction (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df['age_income_ratio'] = df['age'] / df['income'] | Ratio features | Domain logic | df['total_spend'] = df[['col1','col2']].sum(axis=1) |
| df['bedroom_bath_ratio'] = df['bedrooms'] / df['bathrooms'] | Interaction | Real estate | prevent division by zero |
| df['col1'] * df['col2'] | Polynomial terms | Non-linearity | df['sqft_squared'] = df['sqft'] ** 2 |
| PolynomialFeatures(degree=2, interaction_only=True) | All interactions | Feature expansion | include_bias=False |
| df['is_weekend'] = df['dayofweek'].isin([5,6]).astype(int) | Indicator | Behavior patterns | df['is_peak_hour'] = df['hour'].between(7,9) |
| df['log_income'] = np.log1p(df['income']) | Log transform | Skew correction | np.sqrt, np.cbrt |
| df['has_basement'] = (df['basement_sqft'] > 0).astype(int) | Binary flag | Sparse features | df['recently_renovated'] = (df['yr_renovated'] > 2010) |
| df.assign(new_col=lambda x: x.col1 / x.col2) | Safe creation | Chaining | multiple columns |
| df.eval('col1_col2_ratio = col1 / col2') | In-place math | Performance | inplace=True |
| FeatureUnion([('poly', PolynomialFeatures()), ('scaler', StandardScaler())]) | Combine transformers | Pipeline | advanced |

### 14. Train-Test Splitting (9)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| train_test_split(X, y, test_size=0.2) | Random split | Baseline | stratify=y |
| train_test_split(..., random_state=42) | Reproducible | Experiments | shuffle=False for time series |
| StratifiedShuffleSplit(n_splits=5) | Stratified CV | Imbalanced classes | for train_idx, test_idx |
| TimeSeriesSplit(n_splits=5) | Time-aware split | Forecasting | expanding window |
| df.sample(frac=0.8, random_state=42) | Manual split | Simple | index-based |
| GroupShuffleSplit(n_splits=1, test_size=0.2) | By group | User-level split | group by user_id |
| X_train, X_val, y_train, y_val = train_test_split(X, y, test_size=0.3, stratify=y) | Train/val | Two-way | then split train again |
| from sklearn.model_selection import KFold | K-fold | Cross-validation | kf.split(X) |
| train_idx, test_idx = next(iter(split)) | Get indices | Custom logic | X.iloc[train_idx] |

### 15. Memory Optimization (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.astype('float32') | Downcast floats | Save memory | 'int32', 'int16' |
| df.select_dtypes('float64').columns | List float64 columns | Target downcast | then astype('float32') |
| df['category_col'].astype('category') | Categorical type | Huge savings | memory_usage: 10x reduction |
| pd.to_numeric(df['col'], downcast='integer') | Auto downcast | Smart | downcast='float' |
| df.memory_usage(deep=True) / 1e6 | Memory in MB | Profiling | .sum() for total |
| df = df.astype({col: 'category' for col in categorical_cols}) | Bulk convert | Setup | list comprehension |
| pl.DataFrame(df).with_columns([pl.col(col).cast(pl.Categorical) for col in cats]) | Polars categoricals | Faster | better compression |
| chunk = pd.read_csv('big.csv', chunksize=100000) | Chunked reading | Out-of-core | for chunk in chunk: process |
| df.to_feather('df.feather') | Fast compressed format | Storage | arrow-based |
| gc.collect() | Force garbage collection | After deletion | import gc |

### 16. Validation and Sanity Checks (9)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| assert df.isnull().sum().sum() == 0 | No missing values | Pipeline check | custom message |
| assert X_train.shape[0] == y_train.shape[0] | Shape alignment | Safety | lengths match |
| df.describe().loc['min':'max'] | Range check | Domain validation | age > 0 |
| pd.testing.assert_frame_equal(df1, df2) | Exact equality | Testing | check_like=True |
| np.allclose(a, b, atol=1e-6) | Floating point compare | Numerical | rtol=1e-5 |
| df.select_dtypes('object').apply(lambda x: x.str.len().max()) | String length check | Schema | prevent overflow |
| df['target'].value_counts(normalize=True) | Class balance | Imbalanced data | after split |
| X_train.dtypes.value_counts() | Type consistency | Debugging | compare with X_test |
| df.nunique() | Cardinality check | Feature quality | high cardinality warning |

### 17. Pipeline Integration (11)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| make_pipeline(SimpleImputer(), StandardScaler(), Model()) | Simple pipeline | Quick prototyping | make_column_transformer |
| ColumnTransformer([('num', num_pipe, num_cols), ('cat', cat_pipe, cat_cols)]) | Mixed types | Real data | remainder='passthrough' |
| Pipeline([('imputer', KNNImputer()), ('scaler', RobustScaler()), ('model', RandomForest())]) | Full pipeline | Production | .fit(X_train, y_train) |
| make_column_selector(dtype_include='number') | Auto select columns | Convenience | dtype_exclude |
| FeatureUnion([('pca', PCA()), ('svd', TruncatedSVD())]) | Combine features | Advanced | deprecated in favor of ColumnTransformer |
| pipe.fit(X_train, y_train); pipe.predict(X_test) | End-to-end | Standard flow | pipe.score() |
| pipe.named_steps['imputer'] | Access step | Inspection | .statistics_ |
| from sklearn import set_config; set_config(display='diagram') | Visualize pipeline | Debugging | Jupyter |
| pipe[:-1].transform(X) | Get transformed features | Analysis | intermediate output |
| from sklearn.compose import TransformedTargetRegressor | Target transform | Regression | log transform y |
| pipe.get_params() | View all parameters | Tuning | set_params() |

### 18. Polars-Specific Preprocessing (9)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| df.with_columns(pl.col('age').fill_null(pl.median('age'))) | Median imputation | Performance | fill_null(strategy='mean') |
| df.with_columns(pl.col('cat').cast(pl.Categorical)) | Categorical type | Memory | faster joins |
| df.with_columns((pl.col('num') - pl.col('num').mean()) / pl.col('num').std()) | Standardize | Lazy | .over('group') for group-wise |
| df.group_by('category').agg(pl.col('value').mean()) | Group aggregation | Fast | .sort('category') |
| df.filter(pl.col('age') > 18) | Filtering | Lazy execution | .is_not_null() |
| df.select([pl.col('^prefix_.*$')]) | Regex selection | Dynamic | exclude |
| df.with_columns(pl.col('text').str.to_lowercase()) | Text cleaning | Built-in | .str.replace_all() |
| df.lazy().with_columns(...).collect() | Lazy API | Huge datasets | streaming |
| df.upsample(time_column='date', every='1d') | Time resampling | Time series | .interpolate() |

## Tips and Best Practices
* Always inspect df.info() and df.describe() before preprocessing
* Use .copy() when modifying DataFrames to avoid SettingWithCopy warnings
* Prefer scikit-learn transformers inside pipelines over manual operations
* Handle missing values before scaling to prevent data leakage
* Use categorical dtype for high-cardinality string columns to save memory
* Set random_state for all splits and models for reproducibility
* Validate that train and test distributions match after splitting
* Use ColumnTransformer to handle numeric and categorical columns separately
* Downcast numeric types early to reduce memory usage by 60-80%
* Never use future data in time-series preprocessing
* Use Polars for datasets larger than 5-10 GB
* Chain operations with .pipe() for readable preprocessing functions
* Log preprocessing steps and parameters for experiment tracking
* Test preprocessing pipeline on a small sample first
* Use assert statements to validate assumptions at each step
* Store preprocessing pipeline with fitted model for inference
* Avoid one-hot encoding high-cardinality categoricals without hashing
* Use QuantileTransformer for features with heavy tails
* Profile memory usage before and after optimization
* Separate feature engineering from modeling code for reusability

## Additional Resources
* [Pandas Official Documentation](https://pandas.pydata.org/docs/)
* [Polars User Guide](https://pola-rs.github.io/polars-book/)
* [Scikit-learn Preprocessing Guide](https://scikit-learn.org/stable/modules/preprocessing.html)
* [Feature Engineering for Machine Learning](https://github.com/alicezheng/feature-engineering-book)
* [Kaggle Data Cleaning Guide](https://www.kaggle.com/learn/data-cleaning)
* [Category Encoders Documentation](https://contrib.scikit-learn.org/category_encoders/)
* [Practical Lessons from Facebook's Data Preprocessing](https://research.fb.com/blog/2019/03/practical-lessons-from-facebooks-data-preprocessing/)

## Mini-Glossary

The following tables define key terminology and concepts used in data preprocessing.

### Common Terms
| Term | Description |
|------|-------------|
| Imputation | Filling missing values with estimated ones |
| Scaling | Transforming features to similar ranges |
| Encoding | Converting categorical data to numeric |
| Normalization | Rescaling to [0,1] range |
| Standardization | Zero mean and unit variance |
| Winsorizing | Capping extreme values at thresholds |
| Discretization | Converting continuous to discrete bins |
| Feature Cross | Combining two or more features |
| Leakage | Using future/test information in training |
| Train-test split | Dividing data for model evaluation |

### Key Preprocessing Techniques
| Technique | Description | When to Use |
|----------|-------------|-------------|
| Mean imputation | Replace NaN with column mean | Symmetric data, few missing |
| Median imputation | Use median value | Skewed data, outliers |
| Most frequent | Works on categorical | Categorical missing |
| KNN imputation | Use nearest neighbors | Complex patterns |
| Iterative imputation | Model each feature with others | High accuracy needed |
| One-hot encoding | Create binary columns per category | Low cardinality |
| Target encoding | Replace category with target mean | High cardinality |
| Frequency encoding | Replace with count or percentage | Tree models |
| Log transform | Apply np.log1p | Right-skewed features |
| Yeo-Johnson | Make data more Gaussian-like | Any numeric data |
| Cyclical encoding | Sin/cos for time features | Hours, months, weekdays |

### Scaling Methods Comparison
| Method | Centers | Scales By | Robust to Outliers | Preserves Sparsity |
|--------|---------|-----------|--------------------|---------------------|
| StandardScaler | Yes | Std deviation | No | No |
| MinMaxScaler | No | Range | No | No |
| MaxAbsScaler | No | Max absolute | Somewhat | Yes |
| RobustScaler | Yes (median) | IQR | Yes | No |
| QuantileTransformer | No | Rank | Very | No |

### Imputation Strategies
| Strategy | Pros | Cons | Best For |
|----------|------|------|----------|
| Mean | Fast, simple | Sensitive to outliers | Normal distributions |
| Median | Robust to outliers | Ignores relationships | Skewed data |
| Most frequent | Works on categorical | Can create bias | Categorical missing |
| KNN | Uses similarity | Slow, memory heavy | Small-medium data |
| Iterative (MICE) | Models relationships | Very slow | High-quality needs |

### Encoding Methods Comparison
| Method | Output Type | Handles New Cats | Cardinality Impact |
|--------|-------------|------------------|--------------------|
| One-Hot | Sparse/Dense | No | Increases dimensions |
| Label/Ordinal | Integer | Yes | Minimal |
| Target | Float | Yes | Low |
| CatBoost | Float | Yes | Low |
| Hashing | Sparse | Yes | Fixed size |
| Frequency | Float | Yes | Low |

### Common Pipeline Patterns
| Pattern | Structure | Use Case |
|---------|-----------|----------|
| Simple | Impute → Scale → Model | Baseline |
| Mixed types | ColumnTransformer(num, cat) → Model | Real-world data |
| Advanced | Impute → Encode → Poly → Select → Model | Competition |
| Time series | Lag features → Scale → Model | Forecasting |
| Text + Tabular | FeatureUnion(text_pipe, tabular_pipe) | Multimodal |

### Memory Optimization Targets
| Data Type | Original | Optimized | Reduction |
|-----------|----------|-----------|-----------|
| float64 | 8 bytes | float32 | 50% |
| int64 | 8 bytes | int32/16/8 | 50-87% |
| object (strings) | 50+ bytes | category | 70-95% |
| bool | 1 byte | bit-packed | minimal |

### Troubleshooting Common Issues
| Issue | Likely Cause | Fix |
|------|--------------|-----|
| SettingWithCopyWarning | Chained assignment | Use .loc or .copy() |
| Data leakage | Using test data in fit | Fit only on train |
| NaNs after scaling | Imputer not fitted | Fit imputer on train only |
| High memory usage | Object dtype strings | Convert to category |
| Poor model performance | No scaling for SVM/NN | Add StandardScaler |
| Different feature count | OHE on train/test mismatch | Use handle_unknown='ignore' |
| Skewed predictions | No log transform on target | TransformedTargetRegressor |

