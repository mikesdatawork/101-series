# 101 Tableau Commands

## Overview
Tableau is a leading data visualization and business intelligence platform for creating interactive dashboards and reports. This cheat sheet covers essential Tableau Desktop features, shortcuts, calculated field functions, visualization types, and best practices for building effective analytics.

## Target Audience
- Data analysts exploring datasets
- Business intelligence developers creating reports
- Dashboard designers building visuals
- Managers seeking insights
- Anyone learning Tableau visualization

### 1. Keyboard Shortcuts - Managing Workbooks (10)
| Shortcut | Windows/Linux | macOS | Description | Examples |
| --- | --- | --- | --- | --- |
| New Workbook | Ctrl + N | Command + N | Open new workbook | Start fresh project |
| Open Workbook | Ctrl + O | Command + O | Load existing file | Open saved .twb |
| Save Workbook | Ctrl + S | Command + S | Save changes | Update current file |
| New Worksheet | Ctrl + M | Command + T | Add new sheet | Create view |
| Duplicate Sheet | Ctrl + D (sheet) | Command + D | Copy sheet | Reuse layout |
| Describe Sheet | Alt + Enter | Option + Enter | View sheet details | Inspect fields |
| Presentation Mode | F7 | Command + F | Full screen | Present dashboard |
| Export | Ctrl + P | Command + P | Export PDF/Image | Share view |
| Undo | Ctrl + Z | Command + Z | Revert action | Fix mistake |
| Redo | Ctrl + Y | Command + Shift + Z | Restore action | Recover change |

### 2. Keyboard Shortcuts - Views & Marks (12)
| Shortcut | Windows/Linux | macOS | Description | Examples |
| --- | --- | --- | --- | --- |
| Swap Rows/Columns | Ctrl + W | Command + W | Flip axes | Change orientation |
| Show Me | Ctrl + E | Command + E | Open Show Me panel | Auto chart |
| Fit View | Ctrl + Shift + 1 | Command + Shift + 1 | Standard fit | Normal size |
| Entire View | Ctrl + Shift + E | Command + Shift + E | Fit width/height | Full display |
| Select Marks | Drag or Ctrl + Click | Drag or Command + Click | Highlight data | Filter marks |
| Lasso Select | Hold Ctrl + Drag | Hold Command + Drag | Irregular selection | Custom group |
| Pan | Hold Space + Drag | Hold Space + Drag | Move view | Navigate map |
| Zoom | Ctrl + Scroll | Command + Scroll | Zoom in/out | Detail focus |
| Clear Sheet | Alt + Shift + Backspace | Option + Shift + Delete | Remove all | Start over |
| Run Update | F9 | F9 | Refresh data | Update extract |

### 3. Common Calculated Functions - String (10)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| CONCAT | CONCAT(string1, string2) | Combine strings | Full name | CONCAT([First], ' ', [Last]) |
| LEFT | LEFT(string, n) | Left characters | Prefix | LEFT([Code], 3) |
| RIGHT | RIGHT(string, n) | Right characters | Suffix | RIGHT([Phone], 4) |
| MID | MID(string, start, n) | Substring | Parse | MID([Text], 5, 10) |
| TRIM | TRIM(string) | Remove spaces | Clean | TRIM([Name]) |
| UPPER | UPPER(string) | Uppercase | Normalize | UPPER([City]) |
| LOWER | LOWER(string) | Lowercase | Standardize | LOWER([Email]) |
| REPLACE | REPLACE(string, old, new) | Replace text | Update | REPLACE([Desc], 'Old', 'New') |
| CONTAINS | CONTAINS(string, substr) | Check substring | Filter | CONTAINS([Comment], 'issue') |
| LEN | LEN(string) | Length | Validate | LEN([Password]) > 8 |

### 4. Common Calculated Functions - Date (10)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| DATEADD | DATEADD(part, n, date) | Add interval | Next month | DATEADD('month', 1, [Order Date]) |
| DATEDIFF | DATEDIFF(part, date1, date2) | Difference | Days between | DATEDIFF('day', [Start], [End]) |
| DATENAME | DATENAME(part, date) | Part name | Month name | DATENAME('month', [Date]) |
| DATEPART | DATEPART(part, date) | Part number | Year | DATEPART('year', [Date]) |
| DAY | DAY(date) | Day of month | Extract | DAY([Date]) |
| MONTH | MONTH(date) | Month number | Group | MONTH([Date]) |
| YEAR | YEAR(date) | Year number | Filter | YEAR([Date]) = 2025 |
| TODAY | TODAY() | Current date | Compare | [Date] = TODAY() |
| NOW | NOW() | Current datetime | Timestamp | NOW() |
| MAKEDATE | MAKEDATE(year, month, day) | Create date | Build | MAKEDATE(2025, 1, 1) |

### 5. Common Calculated Functions - Logical (8)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| IF | IF condition THEN true ELSE false END | Conditional | Categorize | IF [Sales] > 1000 THEN 'High' ELSE 'Low' END |
| CASE | CASE expr WHEN val1 THEN res1 ELSE default END | Switch | Map | CASE [Region] WHEN 'East' THEN 'A' ELSE 'B' END |
| IIF | IIF(condition, true, false, unknown) | Inline IF | Simple | IIF([Profit] > 0, 'Profit', 'Loss') |
| AND | condition1 AND condition2 | Both true | Filter | [Sales] > 1000 AND [Profit] > 0 |
| OR | condition1 OR condition2 | Either true | Include | [Region] = 'East' OR [Region] = 'West' |
| NOT | NOT condition | Negate | Exclude | NOT [Active] |
| ISNULL | ISNULL(expr) | Check null | Default | ISNULL([Email]) THEN 'No email' |
| ZN | ZN(expr) | Zero if null | Avoid errors | ZN([Value]) |

### 6. Common Calculated Functions - Number (10)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| SUM | SUM(number) | Total | Aggregate | SUM([Sales]) |
| AVG | AVG(number) | Average | Mean | AVG([Score]) |
| MIN | MIN(number) | Minimum | Lowest | MIN([Price]) |
| MAX | MAX(number) | Maximum | Highest | MAX([Price]) |
| COUNT | COUNT(expr) | Row count | Total | COUNT([Orders]) |
| COUNTD | COUNTD(expr) | Distinct count | Unique | COUNTD([Customer ID]) |
| ROUND | ROUND(number, decimals) | Round | Format | ROUND([Value], 2) |
| ABS | ABS(number) | Absolute | Positive | ABS([Profit]) |
| POWER | POWER(number, power) | Exponent | Growth | POWER(1.05, [Years]) |
| SQRT | SQRT(number) | Square root | Distance | SQRT([X]^2 + [Y]^2) |

### 7. Level of Detail (LOD) Expressions (8)
| Expression | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| FIXED | {FIXED [Dim]: AGG([Measure])} | Fixed granularity | Cohort | {FIXED [Customer]: SUM([Sales])} |
| INCLUDE | {INCLUDE [Dim]: AGG([Measure])} | Finer detail | Subcategory | {INCLUDE [Sub-Cat]: AVG([Profit])} |
| EXCLUDE | {EXCLUDE [Dim]: AGG([Measure])} | Coarser detail | Exclude filter | {EXCLUDE [Region]: SUM([Sales])} |
| Percent of Total | [Sales] / {FIXED : SUM([Sales])} | Proportion | Share | Overall percentage |
| Rank | RANK(SUM([Sales])) | Ranking | Leaderboard | Dense rank variant |
| Window Avg | WINDOW_AVG(SUM([Sales])) | Moving average | Trend | Smoothing |
| Running Total | RUNNING_SUM(SUM([Sales])) | Cumulative | Accumulation | Year to date |
| Difference | [Sales] - LOOKUP([Sales], -1) | Change | Period over period | Growth |

### 8. Data Connections & Blending (10)
| Concept | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Live Connection | Real-time query | Up-to-date data | Database server |
| Extract | Cached snapshot | Performance | Large datasets |
| Join | Combine tables same source | Row match | Inner/Left join |
| Relationship | Logical link multiple tables | Flexible LOD | Default in new sources |
| Data Blending | Aggregate secondary source | Different sources | Primary/secondary |
| Union | Stack rows | Append data | Multiple files |
| Pivot | Columns to rows | Reshape | Wide to long |
| Custom SQL | Embedded query | Complex | Initial SQL |
| Published Source | Server data | Reuse | Centralized |
| Extract Refresh | Update cache | Schedule | Incremental/full |

### 9. Visualization Types (12)
| Type | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Bar Chart | Compare categories | Rankings | Sales by region |
| Line Chart | Trends over time | Change | Monthly revenue |
| Area Chart | Cumulative trends | Stacked totals | Filled line |
| Pie Chart | Parts of whole | Simple proportions | Market share |
| Scatter Plot | Relationships | Correlation | Sales vs profit |
| Bubble Chart | Multi-variable | Size encoding | Population/GDP |
| Heat Map | Intensity matrix | Density | Sales by month/day |
| Highlight Table | Color conditional | Comparison | Profit ratio grid |
| Tree Map | Hierarchical proportions | Space efficient | Category/subcategory |
| Symbol Map | Geographic points | Locations | Stores on map |
| Filled Map | Geographic areas | Regions | Sales by state |
| Gantt Chart | Schedules/durations | Projects | Task timelines |

### 10. Marks & Encoding (8)
| Mark Type | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Automatic | Best guess | Quick start | Default |
| Bar | Length | Comparison | Horizontal/vertical |
| Line | Path | Trends | Continuous |
| Area | Filled path | Volume | Stacked |
| Square | Size/shape | Discrete | Bubble variant |
| Circle | Position/size | Scatter | Standard points |
| Text | Labels | Annotations | Values on chart |
| Polygon | Custom shapes | Maps | Filled areas |

### 11. Filters & Parameters (10)
| Concept | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Quick Filter | Sheet level | User select | Dropdown/slider |
| Context Filter | Priority | Independent | Top N setup |
| Data Source Filter | Global | Security | Row level |
| Parameter | Dynamic value | What-if | Scenario select |
| Parameter Action | User change | Interactive | Switch measure |
| Top N Filter | Limit rows | Rankings | Top 10 customers |
| Relative Date Filter | Time range | Recent | Last 30 days |
| Condition Filter | Logic | Custom | Profit > 0 |
| Action Filter | Dashboard link | Navigation | Sheet drill |
| Set Action | Dynamic sets | Selection | Highlight group |

### 12. Dashboard Actions (8)
| Action | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Filter Action | Select filters others | Drill | Click chart filter |
| Highlight Action | Emphasize related | Focus | Hover marks |
| URL Action | Open link | External | Web integration |
| Parameter Action | Change parameter | Dynamic | Select measure |
| Set Action | Update set | Custom group | Add to set |
| Navigate Action | Sheet switch | Menu | Button navigation |
| Change Parameter | User input | Scenario | Slider control |
| Go to Sheet | Jump | Flow | Story point |

### 13. Table Calculations (10)
| Calculation | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Running Total | Cumulative | Accumulation | YTD sales |
| Percent Difference | Change | Growth | Period over period |
| Percent of Total | Contribution | Share | Category % |
| Rank | Position | Leaderboard | Sales rank |
| Moving Average | Smooth | Trend | 3-month avg |
| Year over Year Growth | Annual change | Compare | YoY % |
| Index | Position number | Sequence | Row number |
| Lookup | Offset value | Difference | Previous row |
| First/Last | Relative position | Window | Start/end |
| Window Sum | Subtotal | Partial total | Group sum |

### 14. Advanced Features (8)
| Feature | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Sets | Custom groups | Segment | Top customers set |
| Groups | Combine dimensions | Simplify | Region groups |
| Hierarchies | Drill down | Explore | Year > Quarter > Month |
| Bins | Bucket continuous | Histogram | Age groups |
| Dual Axis | Overlay charts | Compare scales | Sales & profit |
| Map Layers | Multiple maps | Detail | Background images |
| Forecasting | Predict trends | Planning | Exponential smoothing |
| Clustering | Auto groups | Discovery | K-means |

### 15. Data Preparation (8)
| Action | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Split | Auto split field | Parse | Name split |
| Custom Split | Manual | Extract | Delimiter |
| Pivot | Wide to long | Reshape | Columns to rows |
| Union | Append files | Combine | Multiple years |
| Join | Merge tables | Enrich | Customer + orders |
| Clean | Replace/trim | Standardize | Null handling |
| Aggregate | Group in source | Performance | Pre-aggregate |
| Metadata Grid | Manage fields | Organize | Rename/hide |

### 16. Publishing & Sharing (8)
| Action | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Publish Workbook | To Server/Cloud | Share | Upload .twb |
| Publish Data Source | Centralized | Reuse | Certified source |
| Embed View | Web integrate | Site | Iframe code |
| Export | PDF/Image/PowerPoint | Static | Report share |
| Schedule Refresh | Auto update | Current | Daily extract |
| Permissions | Control access | Security | User roles |
| Subscriptions | Email delivery | Notify | Weekly report |
| Version Control | Workbook history | Track | Revert changes |

### 17. Performance Optimization (8)
| Tip | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Use Extracts | Cache data | Speed | Hyper format |
| Hide Unused Fields | Reduce load | Efficiency | Clean source |
| Limit Filters | Context priority | Query | Top N |
| Aggregate Visible | Reduce rows | Dashboard | Pre-group |
| Avoid Complex Calcs | Simplify | Speed | Materialize |
| Index Data | Database side | Fast | Clustered |
| Incremental Refresh | Partial update | Large | New rows only |
| Parallel Queries | Multi-thread | Faster | Default on |

## Tips and Best Practices
* Start with clear objective before building
* Use appropriate chart type for data story
* Keep dashboards simple and focused
* Apply consistent color palette
* Use tooltips for additional details
* Add context with titles and captions
* Optimize performance with extracts
* Use parameters for user flexibility
* Test on target devices
* Provide training or instructions
* Use white space effectively
* Highlight key insights
* Avoid chart junk
* Use filters sparingly
* Label axes clearly
* Sort data meaningfully
* Use hierarchies for drill-down
* Validate data accuracy
* Document calculations
* Iterate based on feedback

## Additional Resources
* [Official Tableau Help](https://help.tableau.com/current/pro/desktop/en-us/default.htm)
* [Tableau Public Gallery](https://public.tableau.com/)
* [Tableau Community Forums](https://community.tableau.com/)
* [Tableau Training Videos](https://www.tableau.com/learn/training)
* [Visual Analysis Best Practices](https://www.tableau.com/learn/whitepapers/tableau-visual-guidebook)
* [Which Chart is Right](https://www.tableau.com/whitepapers/which-chart-or-graph-is-right-for-you)
* [Tableau Keyboard Shortcuts](https://help.tableau.com/current/pro/desktop/en-us/shortcut.htm)
* [Functions Reference](https://help.tableau.com/current/pro/desktop/en-us/functions_all_alphabetical.htm)

## Mini-Glossary

### 1. Common Terms
| Term | Description |
|------|-------------|
| Worksheet | Single view/chart |
| Dashboard | Collection of views |
| Story | Sequence of dashboards |
| Mark | Data point in view |
| Shelf | Rows/Columns/Marks |
| Pill | Field on shelf |
| Dimension | Categorical field |
| Measure | Numeric field |
| Extract | Cached data |
| Live | Real-time connection |

### 2. Acronyms
| Acronym | Full Form |
|---------|-----------|
| LOD | Level of Detail |
| KPI | Key Performance Indicator |
| BI | Business Intelligence |
| ETL | Extract Transform Load |
| VIZ | Visualization |

### 3. Key Concepts
| Concept | Description |
|---------|-------------|
| Show Me | Auto chart suggestions |
| Dual Axis | Overlay measures |
| Quick Filter | Interactive control |
| Parameter | User input value |
| Set | Custom data group |
| Hierarchy | Drill levels |
| Context Filter | Priority filter |
| Table Calculation | View level compute |

### 4. Visualization Types
| Type | Best For |
|------|----------|
| Bar | Comparisons |
| Line | Trends |
| Pie | Simple proportions |
| Scatter | Correlations |
| Map | Geographic |
| Heatmap | Density |
| Treemap | Hierarchy |
| Gantt | Timelines |

### 5. Best Practices
| Practice | Description |
|----------|-------------|
| Simplicity | Avoid clutter |
| Color Use | Meaningful palette |
| Accessibility | Color blind safe |
| Mobile Ready | Device layouts |
| Performance | Optimize extracts |
| Interactivity | Actions/filters |
| Storytelling | Guided analytics |
| Consistency | Standard templates |

### 6. Data Model
| Concept | Description |
|---------|-------------|
| Relationship | Logical link |
| Join | Physical combine |
| Blend | Post-aggregate |
| Union | Row append |
| Pivot | Reshape data |

### 7. Calculated Types
| Type | Description |
|------|-------------|
| Row Level | Per row |
| Aggregate | Grouped |
| Table Calc | View compute |
| LOD | Fixed granularity |

### 8. Tool Ecosystem
| Tool | Purpose |
|------|---------|
| Tableau Desktop | Authoring |
| Tableau Server | Hosting |
| Tableau Cloud | SaaS |
| Tableau Prep | Data flow |
| Tableau Public | Free sharing |
| Tableau Reader | View .twbx |
| Tableau Mobile | App viewing |
| Tableau Bridge | Extract refresh |

### 9. Common Patterns
| Pattern | Description |
|---------|-------------|
| Top N + Others | Rankings |
| Bullet Chart | KPI gauge |
| Small Multiples | Grid comparison |
| Sparkline | Mini trend |
| Ban Chart | Proportions |
| Waterfall | Cumulative change |
| Pareto | 80/20 |
| Funnel | Stages |

### 10. Troubleshooting
| Issue | Common Fix |
|-------|------------|
| Slow Load | Use extract |
| Wrong Aggregation | Edit calc |
| Null Values | Filter or default |
| Join Duplicates | Check keys |
| Filter Order | Context |
| Color Legend | Edit colors |
| Axis Range | Fix range |
| Data Type | Convert |

