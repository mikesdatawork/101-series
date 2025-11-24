# 101 Scikit-learn Commands  
*The gold standard for classical Machine Learning in Python*

### Setup & Imports
| Command                                      | Description |
|----------------------------------------------|-------------|
| import sklearn                               | Import scikit-learn |
| from sklearn import datasets                 | Built-in datasets |
| from sklearn.model_selection import train_test_split | Train/test split |
| from sklearn.preprocessing import StandardScaler | Feature scaling |
| from sklearn.metrics import accuracy_score   | Common metric |
| sklearn.__version__                          | Check version |

### Loading Datasets
| Command                                      | Description |
|----------------------------------------------|-------------|
| datasets.load_iris()                         | Classic classification dataset |
| datasets.load_digits()                       | Handwritten digits |
| datasets.load_breast_cancer()                | Binary classification |
| datasets.make_classification(n_samples=1000, n_features=20) | Synthetic data |
| datasets.make_regression(n_samples=1000, n_features=10) | Synthetic regression |
| pd.DataFrame(data.data, columns=data.feature_names) | Convert to DataFrame |

### Train/Test Split & Cross-Validation
| Command                                      | Description |
|----------------------------------------------|-------------|
| X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42) | Basic split |
| train_test_split(X, y, stratify=y)           | Stratified split |
| from sklearn.model_selection import KFold    | K-Fold CV |
| from sklearn.model_selection import StratifiedKFold | Stratified K-Fold |
| from sklearn.model_selection import cross_val_score | Cross-validation scores |

### Preprocessing – Scaling & Encoding
| Command                                      | Description |
|----------------------------------------------|-------------|
| StandardScaler().fit_transform(X_train)      | Z-score scaling |
| MinMaxScaler().fit_transform(X)              | Scale to [0,1] |
| RobustScaler().fit_transform(X)              | Robust to outliers |
| OneHotEncoder().fit_transform(df[['cat']])   | One-hot encoding |
| LabelEncoder().fit_transform(y)              | Encode target labels |
| OrdinalEncoder().fit_transform(df[['edu']])  | Ordinal categories |

### Classification Models
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.linear_model import LogisticRegression | Logistic Regression |
| from sklearn.tree import DecisionTreeClassifier | Decision Tree |
| from sklearn.ensemble import RandomForestClassifier | Random Forest |
| from sklearn.svm import SVC                  | Support Vector Machine |
| from sklearn.neighbors import KNeighborsClassifier | k-NN |
| from sklearn.naive_bayes import GaussianNB   | Naive Bayes |
| from sklearn.ensemble import GradientBoostingClassifier | XGBoost-style |
| model.fit(X_train, y_train)                  | Train model |
| model.predict(X_test)                        | Predict classes |
| model.predict_proba(X_test)                  | Prediction probabilities |

### Regression Models
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.linear_model import LinearRegression | Linear Regression |
| from sklearn.linear_model import Ridge       | L2 regularization |
| from sklearn.linear_model import Lasso       | L1 regularization |
| from sklearn.tree import DecisionTreeRegressor | Tree regression |
| from sklearn.ensemble import RandomForestRegressor | RF regression |
| from sklearn.svm import SVR                  | Support Vector Regression |

### Model Evaluation – Classification
| Command                                      | Description |
|----------------------------------------------|-------------|
| accuracy_score(y_test, y_pred)               | Accuracy |
| precision_score(y_test, y_pred, average='macro') | Precision |
| recall_score(y_test, y_pred, average='macro') | Recall |
| f1_score(y_test, y_pred, average='macro')    | F1 score |
| classification_report(y_test, y_pred)        | Full report |
| confusion_matrix(y_test, y_pred)             | Confusion matrix |
| roc_auc_score(y_test, y_proba)               | AUC score |

### Model Evaluation – Regression
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.metrics import mean_squared_error | MSE |
| mean_absolute_error(y_test, y_pred)          | MAE |
| r2_score(y_test, y_pred)                     | R² score |
| explained_variance_score(y_test, y_pred)     | Explained variance |

### Hyperparameter Tuning
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.model_selection import GridSearchCV | Grid search |
| GridSearchCV(model, param_grid, cv=5).fit(X, y) | Full grid search |
| from sklearn.model_selection import RandomizedSearchCV | Random search |
| model.best_params_                           | Best parameters |
| model.best_score_                            | Best CV score |

### Pipelines – End-to-End Workflows
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.pipeline import Pipeline        | Create pipeline |
| pipe = Pipeline([('scaler', StandardScaler()), ('rf', RandomForestClassifier())]) | Scaling + model |
| pipe.fit(X_train, y_train)                   | Fit entire pipeline |
| pipe.predict(X_test)                         | Predict with pipeline |
| from sklearn.pipeline import make_pipeline   | Shorter syntax |

### Feature Selection & Engineering
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.feature_selection import SelectKBest, f_classif | Univariate selection |
| from sklearn.feature_selection import RFE    | Recursive Feature Elimination |
| from sklearn.decomposition import PCA        | Principal Component Analysis |
| PCA(n_components=2).fit_transform(X)         | Reduce to 2D |
| from sklearn.decomposition import TruncatedSVD | SVD for sparse data |

### Clustering (Unsupervised)
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.cluster import KMeans           | K-Means clustering |
| KMeans(n_clusters=3).fit(X)                  | Fit clusters |
| model.labels_                                | Cluster assignments |
| from sklearn.cluster import DBSCAN           | Density-based clustering |
| from sklearn.cluster import AgglomerativeClustering | Hierarchical |

### Dimensionality Reduction & Visualization
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.manifold import TSNE            | t-SNE visualization |
| TSNE(n_components=2).fit_transform(X)        | 2D embedding |
| from sklearn.decomposition import NMF        | Non-negative Matrix Factorization |

### Model Persistence
| Command                                      | Description |
|----------------------------------------------|-------------|
| from joblib import dump, load                | Save/load model |
| dump(model, 'model.joblib')                  | Save to disk |
| load('model.joblib')                         | Load model |
| import pickle; pickle.dump(model, open('model.pkl','wb')) | Pickle alternative |

### Bonus ML Power Tools
| Command                                      | Description |
|----------------------------------------------|-------------|
| from sklearn.compose import ColumnTransformer | Mixed-type preprocessing |
| from sklearn.impute import SimpleImputer     | Impute missing values |
| SimpleImputer(strategy='median').fit_transform(X) | Median imputation |
| from sklearn.ensemble import VotingClassifier | Ensemble voting |
| from sklearn.calibration import CalibratedClassifierCV | Probability calibration |
| cross_val_predict(model, X, y, cv=5)         | CV predictions |
| learning_curve()                             | Plot learning curves |
| validation_curve()                           | Plot validation curves |

**Total: 101 Scikit-learn commands — everything you need for classical ML mastery**

