# 101 R Commands

## Overview
R is a powerful programming language and environment for statistical computing, data analysis, and graphics. This cheat sheet covers essential base R and commonly used tidyverse commands for data manipulation, visualization, statistics, and reporting.

## Target Audience
- Data scientists performing analysis
- Statisticians running models
- Researchers processing data
- Data analysts creating reports
- Anyone learning R programming

### 1. Basic Operations & Help (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| <- or = | Assignment | Store values | x <- 5; name = "John" |
| <- | Preferred assignment | Readability | df <- read.csv("file.csv") |
| print() | Display object | Output | print(head(df)) |
| ? or help() | Help documentation | Learn function | ?ggplot or help(mean) |
| ?? | Search help | Find topic | ??regression |
| ls() | List objects | Workspace | ls() |
| rm() | Remove objects | Clean | rm(x) or rm(list = ls()) |
| getwd() | Current directory | Path | getwd() |
| setwd() | Set directory | Change path | setwd("/path") |
| q() | Quit R | Exit | q() |

### 2. Data Types & Structures (12)
| Type/Structure | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| vector | 1D homogeneous | Simple lists | c(1,2,3) |
| factor | Categorical | Groups | factor(c("low","high")) |
| matrix | 2D homogeneous | Arrays | matrix(1:9, nrow=3) |
| data.frame | 2D heterogeneous | Tables | data.frame(id=1:3, name=c("A","B","C")) |
| tibble | Modern data.frame | tidyverse | tibble(x=1:3, y=c("a","b","c")) |
| list | Heterogeneous collection | Complex | list(a=1, b=c("x","y")) |
| numeric | Numbers | Calculations | 3.14 |
| integer | Whole numbers | Counts | 5L |
| character | Strings | Text | "hello" |
| logical | TRUE/FALSE | Conditions | TRUE |
| Date | Date values | Time series | as.Date("2026-01-01") |
| POSIXct | Datetime | Timestamps | as.POSIXct("2026-01-01 12:00") |

### 3. Package Management (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| install.packages() | Install package | Add library | install.packages("tidyverse") |
| library() or require() | Load package | Use functions | library(ggplot2) |
| update.packages() | Update all | Maintenance | update.packages() |
| installed.packages() | List installed | Check | installed.packages() |
| remove.packages() | Uninstall | Clean | remove.packages("oldpkg") |
| BiocManager::install() | Bioconductor | Bioinformatics | BiocManager::install("DESeq2") |
| devtools::install_github() | GitHub install | Development | devtools::install_github("hadley/dplyr") |
| sessionInfo() | Environment info | Reproducibility | sessionInfo() |

### 4. Data Import/Export (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| read.csv() | Read CSV | Common format | read.csv("data.csv") |
| read.table() | Generic tabular | Flexible | read.table("file.txt", sep="\t") |
| readr::read_csv() | Fast CSV | tidyverse | read_csv("data.csv") |
| readxl::read_excel() | Excel files | XLSX | read_excel("file.xlsx") |
| haven::read_spss() | SPSS | Social science | read_spss("data.sav") |
| write.csv() | Write CSV | Export | write.csv(df, "out.csv", row.names=FALSE) |
| saveRDS() | Save single object | R format | saveRDS(df, "df.rds") |
| readRDS() | Load RDS | Restore | readRDS("df.rds") |
| fwrite() (data.table) | Fast write | Large data | fwrite(dt, "big.csv") |
| jsonlite::fromJSON() | Read JSON | API data | fromJSON("data.json") |

### 5. dplyr Data Manipulation (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| filter() | Subset rows | Conditions | filter(df, sales > 1000) |
| select() | Select columns | Choose vars | select(df, name, sales) |
| mutate() | Create/modify columns | Transform | mutate(df, log_sales = log(sales)) |
| arrange() | Sort rows | Order | arrange(df, desc(sales)) |
| summarise() | Aggregate | Summary | summarise(df, mean_sales = mean(sales)) |
| group_by() | Group data | By category | group_by(df, region) |
| count() | Count rows | Frequency | count(df, category) |
| rename() | Rename columns | Clarity | rename(df, revenue = sales) |
| distinct() | Unique rows | Dedupe | distinct(df, id) |
| slice() | Row numbers | Sample | slice(df, 1:10) |
| pull() | Extract column | Vector | df %>% pull(sales) |
| relocate() | Reorder columns | Organize | relocate(df, new_col, .before = old) |

### 6. tidyr Data Reshaping (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| pivot_longer() | Wide to long | Melt | pivot_longer(df, cols = starts_with("Q"), names_to = "quarter") |
| pivot_wider() | Long to wide | Cast | pivot_wider(df, names_from = quarter, values_from = sales) |
| separate() | Split column | Parse | separate(df, name, into = c("first","last"), sep = " ") |
| unite() | Combine columns | Merge | unite(df, "full_name", first, last, sep = " ") |
| drop_na() | Remove missing | Clean | drop_na(df, sales) |
| replace_na() | Replace missing | Fill | replace_na(df, list(sales = 0)) |
| fill() | Fill missing | Carry forward | fill(df, value, .direction = "down") |
| complete() | Expand combinations | Grid | complete(df, year, region) |

### 7. ggplot2 Visualization (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ggplot() | Initialize plot | Base layer | ggplot(df, aes(x, y)) |
| geom_point() | Scatter plot | Relationships | + geom_point() |
| geom_line() | Line plot | Trends | + geom_line() |
| geom_bar() | Bar chart | Counts | + geom_bar() |
| geom_col() | Bar with values | Comparisons | + geom_col() |
| geom_histogram() | Histogram | Distribution | + geom_histogram(bins = 30) |
| geom_boxplot() | Box plot | Spread | + geom_boxplot() |
| geom_smooth() | Trend line | Regression | + geom_smooth(method = "lm") |
| facet_wrap() | Small multiples | By variable | + facet_wrap(~ category) |
| facet_grid() | Grid facets | Rows/columns | + facet_grid(rows = vars(year)) |
| labs() | Labels | Titles | + labs(title = "Sales Trend", x = "Month") |
| theme_minimal() | Clean theme | Aesthetics | + theme_minimal() |

### 8. String Manipulation (stringr) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| str_detect() | Detect pattern | Filter | str_detect(text, "error") |
| str_replace() | Replace first | Clean | str_replace(text, "old", "new") |
| str_replace_all() | Replace all | Bulk | str_replace_all(text, pattern, rep) |
| str_to_lower() | Lowercase | Normalize | str_to_lower(name) |
| str_to_upper() | Uppercase | Standardize | str_to_upper(code) |
| str_trim() | Remove spaces | Clean | str_trim(input) |
| str_sub() | Substring | Extract | str_sub(text, 1, 5) |
| str_length() | Length | Validate | str_length(password) |
| str_c() | Concatenate | Combine | str_c(first, " ", last) |
| str_glue() | Interpolate | Dynamic | str_glue("Hello {name}") |

### 9. Statistical Functions (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| mean() | Average | Central | mean(x, na.rm = TRUE) |
| median() | Median | Robust | median(x) |
| sd() | Standard deviation | Spread | sd(x) |
| var() | Variance | Variability | var(x) |
| cor() | Correlation | Relationship | cor(x, y) |
| lm() | Linear model | Regression | lm(y ~ x, data = df) |
| summary() | Model summary | Results | summary(model) |
| t.test() | T-test | Compare means | t.test(group1, group2) |
| chisq.test() | Chi-square | Association | chisq.test(table) |
| aov() | ANOVA | Group differences | aov(response ~ factor) |

### 10. Control Structures (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| if else | Conditional | Logic | if (x > 0) "positive" else "non-positive" |
| for | Loop over sequence | Iteration | for (i in 1:10) print(i) |
| while | Loop while condition | Repeat | while (x < 10) x <- x + 1 |
| apply() | Apply function to margins | Matrix | apply(mat, 1, sum) |
| lapply() | List apply | Lists | lapply(list, mean) |
| sapply() | Simplified apply | Vector | sapply(df, class) |
| tapply() | Table apply | Grouped | tapply(df$sales, df$region, sum) |
| purrr::map() | Functional | tidyverse | map(df, ~ mean(.x, na.rm = TRUE)) |

### 11. Dates & Times (lubridate) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ymd() | Parse date | Standardize | ymd("20260101") |
| mdy() | Month-day-year | US format | mdy("01/01/2026") |
| dmy() | Day-month-year | International | dmy("01-01-2026") |
| today() | Current date | Reference | today() |
| now() | Current datetime | Timestamp | now() |
| year() | Extract year | Group | year(date) |
| month() | Extract month | Filter | month(date, label = TRUE) |
| day() | Extract day | Day of month | day(date) |
| hour() | Extract hour | Time | hour(time) |
| floor_date() | Round down | Aggregate | floor_date(date, "month") |

### 12. Data Cleaning (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| is.na() | Check missing | Detect | is.na(x) |
| complete.cases() | Complete rows | Filter | df[complete.cases(df), ] |
| na.omit() | Remove missing | Clean | na.omit(df) |
| unique() | Unique values | Dedupe | unique(df$category) |
| duplicated() | Find duplicates | Check | duplicated(df$id) |
| scale() | Standardize | Normalize | scale(df$numeric) |
| cut() | Bin continuous | Categories | cut(age, breaks = c(0,18,65,100)) |
| ifelse() | Vector conditional | Recode | ifelse(score > 90, "A", "B") |
| case_when() | Multi-condition | Complex | case_when(cond1 ~ val1, TRUE ~ other) |
| janitor::clean_names() | Clean column names | Standardize | clean_names(df) |

### 13. Reporting & Output (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| knitr::knit() | Render Rmd | Report | knit("report.Rmd") |
| rmarkdown::render() | HTML/PDF | Output | render("doc.Rmd", "pdf_document") |
| ggplot2::ggsave() | Save plot | Export | ggsave("plot.png", width = 10, height = 6) |
| write.csv() | Export data | Share | write.csv(df, "out.csv", row.names = FALSE) |
| flextable | Pretty tables | Reports | flextable(df) |
| gt | Modern tables | HTML | gt(df) %>% tab_header("Title") |
| bookdown | Books | Long form | bookdown::render_book() |
| shiny | Web apps | Interactive | shinyApp(ui, server) |

### 14. Modeling & Machine Learning (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| glm() | Generalized linear | Logistic | glm(y ~ x, family = binomial) |
| randomForest() | Random forest | Classification | randomForest(y ~ ., data = train) |
| caret::train() | Model training | Tuning | train(y ~ ., method = "rf") |
| tidymodels | Workflow | Modern | workflow() %>% fit(data) |
| recipe() | Preprocessing | Features | recipe(y ~ ., data) %>% step_normalize(all_numeric()) |
| glmnet | Regularized regression | Lasso/Ridge | glmnet(x, y, alpha = 0) |
| xgboost | Gradient boosting | High performance | xgboost(data = x, label = y) |
| predict() | Predictions | Inference | predict(model, newdata) |
| broom::tidy() | Model summary | Clean output | tidy(model) |
| broom::glance() | Model metrics | Evaluation | glance(model) |

### 15. Performance & Large Data (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| data.table | Fast data frame | Big data | DT[i, j, by] |
| fread() | Fast read | Large files | fread("big.csv") |
| dplyr + dbplyr | Database backend | SQL translation | dbGetQuery(con, sql) |
| arrow | Parquet/Feather | Efficient storage | write_parquet(df, "data.parquet") |
| future | Parallel | Speed | plan(multisession) |
| profvis | Profiling | Optimize | profvis({ code }) |
| bench::mark() | Benchmark | Compare | mark(func1(), func2()) |
| Rcpp | C++ integration | Speed | cppFunction('code') |

### 16. Reproducibility (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| set.seed() | Random seed | Reproducible | set.seed(123) |
| here::here() | Project paths | Portable | here("data", "file.csv") |
| renv | Project environment | Dependencies | renv::init() |
| sessionInfo() | Packages/versions | Report | sessionInfo() |
| targets | Pipeline | Workflow | targets::tar_make() |
| drake | Legacy pipeline | Rebuild | drake_plan() |
| packrat | Old isolation | Legacy | packrat::init() |
| Dockerfile | Container | Environment | FROM rocker/r-ver |

### 17. Common Packages (10)
| Package | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| tidyverse | Collection | Core workflow | library(tidyverse) |
| dplyr | Manipulation | Data wrangling | filter, mutate |
| ggplot2 | Visualization | Plots | ggplot() + geom_* |
| tidyr | Reshaping | pivot_* |
| readr | Fast import | read_csv |
| stringr | Strings | str_* |
| lubridate | Dates | ymd, month |
| purrr | Functional | map, reduce |
| forcats | Factors | fct_reorder |
| shiny | Web apps | Interactive dashboards |

## Tips and Best Practices
* Use <- for assignment in scripts
* Load tidyverse early for consistent syntax
* Use pipes (%>%) for readable code
* Name objects clearly and consistently
* Comment code especially complex sections
* Use projects for organization
* Set seed for reproducible random results
* Prefer dplyr over base for manipulation
* Use ggplot2 for publication-quality plots
* Validate data after import
* Handle missing values early
* Use factors for categorical data
* Avoid attach() for data frames
* Use here() package for paths
* Document with R Markdown
* Test functions thoroughly
* Profile slow code
* Use version control with git
* Share with renv or Dockerfile
* Keep scripts modular

## Additional Resources
* [R for Data Science (2e)](https://r4ds.had.co.nz/)
* [Advanced R](https://adv-r.hadley.nz/)
* [ggplot2 Book](https://ggplot2-book.org/)
* [Tidyverse Documentation](https://www.tidyverse.org/)
* [CRAN Task Views](https://cran.r-project.org/web/views/)
* [RStudio Cheat Sheets](https://rstudio.com/resources/cheatsheets/)
* [Stack Overflow R Tag](https://stackoverflow.com/questions/tagged/r)
* [R-bloggers](https://www.r-bloggers.com/)

## Mini-Glossary

### 1. Common Terms
| Term | Description |
|------|-------------|
| Vector | 1D data structure |
| Data frame | Tabular data |
| Tibble | Modern data frame |
| Pipe | %>% operator |
| Function | Reusable code block |
| Package | Library of functions |
| Environment | Scope for objects |
| Workspace | Current objects |

### 2. Acronyms
| Acronym | Full Form |
|---------|-----------|
| CRAN | Comprehensive R Archive Network |
| RMD | R Markdown |
| HTML | HyperText Markup Language |
| PDF | Portable Document Format |
| CSV | Comma Separated Values |
| API | Application Programming Interface |
| IDE | Integrated Development Environment |
| REPL | Read Eval Print Loop |

### 3. Key Concepts
| Concept | Description |
|---------|-------------|
| Tidy data | Each variable column, observation row |
| Lazy evaluation | Arguments evaluated when used |
| Copy-on-modify | Vectors copied when changed |
| Functional programming | Functions as first-class |
| S3/S4 | Object systems |
| Non-standard evaluation | dplyr quoting |
| Metaprogramming | Code that writes code |
| Vectorized operations | Element-wise without loops |

### 4. Data Structures
| Structure | Description |
|-----------|-------------|
| Atomic vector | Homogeneous 1D |
| List | Heterogeneous 1D |
| Matrix | 2D homogeneous |
| Array | Multi-dimensional |
| Data frame | 2D heterogeneous columns |
| Factor | Categorical with levels |
| Date/POSIXct | Time classes |

### 5. Best Practices
| Practice | Description |
|----------|-------------|
| Use pipes | Readable flow |
| Prefer tidyverse | Consistent syntax |
| Explicit returns | Clear functions |
| Avoid $ partial matching | Safety |
| Use tibble | Better printing |
| Set stringsAsFactors=FALSE | Control |
| Use here package | Portable paths |
| Project-oriented workflow | Organization |

### 6. Package Ecosystem
| Category | Key Packages |
|----------|--------------|
| Visualization | ggplot2, plotly, lattice |
| Modeling | caret, tidymodels, randomForest |
| Time Series | forecast, prophet, tsibble |
| Spatial | sf, tmap, leaflet |
| Text | tidytext, quanteda |
| Web | shiny, plumber |
| Reporting | rmarkdown, bookdown |
| Database | DBI, dbplyr |

### 7. Common Functions
| Function | Package | Purpose |
|----------|---------|---------|
| %>% | magrittr | Pipe |
| summarise | dplyr | Aggregate |
| mutate | dplyr | Transform |
| filter | dplyr | Subset |
| arrange | dplyr | Sort |
| group_by | dplyr | Group |
| pivot_longer | tidyr | Reshape |
| ggplot | ggplot2 | Plot |

### 8. Tool Ecosystem
| Tool | Purpose |
|------|---------|
| RStudio | IDE |
| Posit Workbench | Enterprise |
| Quarto | Publishing |
| GitHub Actions | CI/CD |
| Connect | Deployment |
| Shiny Server | Hosting |
| Jupyter | Notebooks |
| VS Code | Alternative IDE |

### 9. Common Patterns
| Pattern | Description |
|---------|-------------|
| Split-apply-combine | group_by + summarise |
| Functional mapping | purrr::map |
| Nested data | nest + map |
| Many models | broom + nest |
| Cross-validation | rsample |
| Parameter tuning | tune |
| Pipeline | targets/drake |
| Reproducible report | Rmd/Quarto |

### 10. Troubleshooting
| Issue | Common Fix |
|-------|------------|
| Package not found | install.packages() |
| Object not found | Check spelling/environment |
| Missing values | na.omit or complete.cases |
| Wrong class | as.numeric() or factor() |
| Memory error | Use data.table or chunking |
| Plot not showing | print(ggplot) in loops |
| Function masked | package::function |
| Encoding issues | stringsAsFactors=FALSE |

