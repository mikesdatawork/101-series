# 101 Pandas Commands  
*The ultimate data manipulation toolkit for Machine Learning & AI*

### Setup & Basics
| Command                                   | Description |
|-------------------------------------------|-------------|
| import pandas as pd                       | Import with standard alias |
| pd.__version__                            | Check Pandas version |
| pd.set_option('display.max_rows', 100)    | Show more rows |
| pd.set_option('display.max_columns', 50)  | Show more columns |
| pd.option_context('mode.chained_assignment', None) | Silence warnings |

### Reading & Writing Data
| Command                                   | Description |
|-------------------------------------------|-------------|
| pd.read_csv('data.csv')                   | Load CSV |
| pd.read_csv('data.csv', index_col=0)      | First column as index |
| pd.read_parquet('data.parquet')           | Fast columnar format |
| pd.read_json('data.json')                 | Load JSON |
| pd.read_sql(query, conn)                  | Query database into DataFrame |
| df.to_csv('clean.csv', index=False)       | Save CSV without index |
| df.to_parquet('clean.parquet')            | Save as Parquet |
| df.to_excel('output.xlsx', sheet_name='Sheet1') | Save to Excel |

### Inspection & Info
| Command                                   | Description |
|-------------------------------------------|-------------|
| df.head()                                 | First 5 rows |
| df.tail(10)                               | Last 10 rows |
| df.sample(5)                              | Random 5 rows |
| df.info()                                 | Dtypes + non-null counts |
| df.describe()                             | Statistical summary |
| df.shape                                  | (rows, columns) |
| df.columns                                | Column names |
| df.dtypes                                 | Data types |
| df.isnull().sum()                         | Count missing per column |

### Selection & Indexing
| Command                                   | Description |
|-------------------------------------------|-------------|
| df['column']                              | Select one column (Series) |
| df[['col1','col2']]                       | Select multiple columns |
| df.loc[0]                                 | Label-based row |
| df.loc[0:5, 'col']                        | Slice rows + column |
| df.iloc[0]                                | Position-based row |
| df.iloc[:, 1:4]                           | All rows, columns 1–3 |
| df.at[0, 'col']                           | Fast scalar access |
| df.iat[0, 0]                              | Fast integer position |
| df.query('age > 30')                      | Query with expression |

### Filtering & Boolean Indexing
| Command                                   | Description |
|-------------------------------------------|-------------|
| df[df['age'] > 30]                        | Boolean filter |
| df[(df['age'] > 30) & (df['city'] == 'NY')] | Multiple conditions |
| df[df['category'].isin(['A','B'])]        | Value in list |
| df[df['text'].str.contains('error')]     | String contains |
| df[df['date'].between('2023-01-01', '2023-12-31')] | Date range |

### Creating & Dropping Columns
| Command                                   | Description |
|-------------------------------------------|-------------|
| df['new_col'] = 1                         | Add constant column |
| df['full_name'] = df['first'] + ' ' + df['last'] | Combine columns |
| df['age_group'] = pd.cut(df['age'], bins=[0,18,65,100], labels=['child','adult','senior']) | Binning |
| df.drop('col', axis=1, inplace=True)      | Drop column |
| df.drop(columns=['col1','col2'])          | Drop multiple |
| df.drop_duplicates(subset='email')        | Remove duplicate rows |

### Handling Missing Data
| Command                                   | Description |
|-------------------------------------------|-------------|
| df.isnull()                               | Boolean mask of NaN |
| df.notnull()                              | Opposite |
| df.dropna()                               | Drop rows with any NaN |
| df.dropna(axis=1)                         | Drop columns with NaN |
| df.fillna(0)                              | Fill with 0 |
| df.fillna({'col': 'unknown', 'age': df['age'].median()}) | Column-specific |
| df.interpolate()                          | Linear interpolation |

### Sorting & Ranking
| Command                                   | Description |
|-------------------------------------------|-------------|
| df.sort_values('salary', ascending=False) | Sort by column |
| df.sort_values(['city','salary'], ascending=[True,False]) | Multi-column sort |
| df.sort_index()                           | Sort by index |
| df.rank(method='dense')                   | Assign ranks |

### Grouping & Aggregation
| Command                                   | Description |
|-------------------------------------------|-------------|
| df.groupby('category').mean()             | Group and average |
| df.groupby('city').agg({'salary':'mean', 'age':'max'}) | Multiple aggregations |
| df.groupby('date').size()                 | Count per group |
| df.groupby('category')['value'].transform('mean') | Add group mean as column |
| df.groupby('category').filter(lambda x: len(x) > 100) | Keep large groups |

### Pivoting & Reshaping
| Command                                   | Description |
|-------------------------------------------|-------------|
| df.pivot_table(values='sales', index='month', columns='product', aggfunc='sum') | Pivot |
| df.melt(id_vars='id', value_vars=['2023','2024']) | Unpivot (wide → long) |
| pd.crosstab(df['gender'], df['city'])     | Contingency table |
| df.stack()                                | Pivot columns to rows |
| df.unstack()                              | Pivot rows to columns |

### Time Series
| Command                                   | Description |
|-------------------------------------------|-------------|
| pd.to_datetime(df['date'])                | Convert to datetime |
| df.set_index('date', inplace=True)        | Date as index |
| df.resample('M').sum()                    | Monthly aggregation |
| df.asfreq('D')                            | Change frequency |
| df.shift(1)                               | Lag by 1 period |
| df.rolling(7).mean()                      | 7-day moving average |

### Merging & Joining
| Command                                   | Description |
|-------------------------------------------|-------------|
| pd.merge(df1, df2, on='id')               | Inner join |
| pd.merge(df1, df2, on='id', how='left')   | Left join |
| pd.concat([df1, df2])                     | Stack vertically |
| pd.concat([df1, df2], axis=1)             | Stack horizontally |

### Advanced ML Prep
| Command                                   | Description |
|-------------------------------------------|-------------|
| pd.get_dummies(df, columns=['category'])  | One-hot encoding |
| df['log_income'] = np.log1p(df['income']) | Log transform |
| from sklearn.preprocessing import StandardScaler; scaler.fit_transform(df[['col']]) | Scaling (example) |
| df.sample(frac=0.8, random_state=42)      | Train split |
| df.corr()                                 | Correlation matrix |
| df.memory_usage(deep=True).sum() / 1e6    | Memory in MB |

### Bonus Power Commands
| Command                                   | Description |
|-------------------------------------------|-------------|
| df.pipe(func1).pipe(func2)                | Chain custom functions |
| df.assign(new_col=lambda x: x.col1 * x.col2) | Add column safely |
| df.eval('total = price * qty', inplace=True) | In-place calculation |
| df.query('col > @threshold')              | Use external variables |
| pd.cut() / pd.qcut()                      | Equal-width / equal-size bins |
| df.nlargest(10, 'salary')                 | Top 10 highest |
| df.nsmallest(5, 'age')                    | Bottom 5 lowest |

**Total: 101 Pandas commands — the #1 tool for real-world ML data preparation**

