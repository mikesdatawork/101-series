# 101 Excel Commands

## Overview
Microsoft Excel is the leading spreadsheet application for data organization, analysis, calculation, and visualization. This cheat sheet covers essential keyboard shortcuts, formulas, functions, features, and best practices for efficient work in Excel (Windows/macOS).

## Target Audience
- Data analysts manipulating datasets
- Financial professionals building models
- Business users creating reports
- Administrators tracking information
- Anyone mastering Excel productivity

### 1. Keyboard Shortcuts - Navigation (12)
| Shortcut | Windows | macOS | Description | Examples |
| --- | --- | --- | --- | --- |
| Move Cell | Arrow Keys | Arrow Keys | Navigate | Move right/left |
| Jump to Edge | Ctrl + Arrow | Command + Arrow | Data edge | Ctrl + Down to bottom |
| Go to A1 | Ctrl + Home | Fn + Ctrl + Left | Top-left | Start of sheet |
| Go to Last Cell | Ctrl + End | Fn + Ctrl + Right | Used range end | Bottom-right |
| Select to Edge | Ctrl + Shift + Arrow | Command + Shift + Arrow | Extend selection | Select column |
| Jump Sheet | Ctrl + Page Up/Down | Fn + Ctrl + Up/Down | Next/prev sheet | Switch tabs |
| Go To Dialog | Ctrl + G or F5 | Ctrl + G | Specific cell | Go to A1000 |
| Name Box Jump | Click Name Box + Enter | Click Name Box + Enter | Named range | Go to "SalesData" |
| Scroll One Screen | Page Up/Down | Fn + Up/Down | Viewport | Scroll page |
| Select Row | Shift + Space | Shift + Space | Entire row | Highlight row |
| Select Column | Ctrl + Space | Ctrl + Space | Entire column | Highlight column |
| Select Sheet | Ctrl + Shift + Page Up/Down | Command + Shift + Fn + Up/Down | Multiple sheets | Group tabs |

### 2. Keyboard Shortcuts - Editing & Formatting (12)
| Shortcut | Windows | macOS | Description | Examples |
| --- | --- | --- | --- | --- |
| Edit Cell | F2 | Ctrl + U | Enter edit mode | Modify formula |
| Fill Down | Ctrl + D | Command + D | Copy down | Fill column |
| Fill Right | Ctrl + R | Command + R | Copy right | Fill row |
| Insert Row/Column | Ctrl + Shift + + | Ctrl + Shift + + | Add | New row |
| Delete Row/Column | Ctrl + - | Ctrl + - | Remove | Delete selection |
| Format Cells | Ctrl + 1 | Command + 1 | Dialog | Number format |
| Bold | Ctrl + B | Command + B | Bold text | Emphasize |
| Italic | Ctrl + I | Command + I | Italic | Style |
| Underline | Ctrl + U | Command + U | Underline | Headers |
| Strikethrough | Ctrl + 5 | Command + Shift + X | Cross out | Completed |
| Align Center | Alt + H, A, C | Command + E | Center | Labels |
| Wrap Text | Alt + H, W | Option + Command + W | Multi-line | Long text |

### 3. Essential Formulas & Functions - Math (10)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| SUM | =SUM(range) | Total | Add values | =SUM(B2:B10) |
| AVERAGE | =AVERAGE(range) | Mean | Central tendency | =AVERAGE(C2:C100) |
| MIN | =MIN(range) | Minimum | Lowest | =MIN(D2:D50) |
| MAX | =MAX(range) | Maximum | Highest | =MAX(D2:D50) |
| COUNT | =COUNT(range) | Numeric count | Total numbers | =COUNT(A:A) |
| COUNTA | =COUNTA(range) | Non-empty count | Filled cells | =COUNTA(B:B) |
| ROUND | =ROUND(number, digits) | Round | Precision | =ROUND(E2, 2) |
| ABS | =ABS(number) | Absolute | Positive | =ABS(F2) |
| POWER | =POWER(base, exp) | Exponent | Growth | =POWER(1.05, 10) |
| SQRT | =SQRT(number) | Square root | Distance | =SQRT(G2) |

### 4. Essential Formulas & Functions - Logical (8)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| IF | =IF(condition, true, false) | Conditional | Logic | =IF(A2>100, "High", "Low") |
| AND | =AND(cond1, cond2) | All true | Multiple | =AND(B2>50, C2="Yes") |
| OR | =OR(cond1, cond2) | Any true | Alternatives | =OR(D2="East", D2="West") |
| NOT | =NOT(condition) | Reverse | Exclude | =NOT(E2="Closed") |
| IFERROR | =IFERROR(value, error) | Handle error | Clean | =IFERROR(F2/G2, "N/A") |
| IFS | =IFS(cond1, val1, ...) | Multi-condition | Switch | =IFS(H2>90, "A", H2>80, "B") |
| SWITCH | =SWITCH(expr, val1, res1, default) | Match | Mapping | =SWITCH(I2, 1, "Jan", "N/A") |
| XOR | =XOR(cond1, cond2) | Exclusive | Parity | =XOR(J2, K2) |

### 5. Essential Formulas & Functions - Lookup (10)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| VLOOKUP | =VLOOKUP(key, table, col, FALSE) | Vertical lookup | Exact match | =VLOOKUP(A2, Table, 2, FALSE) |
| HLOOKUP | =HLOOKUP(key, table, row, FALSE) | Horizontal | Row lookup | =HLOOKUP(B1, Range, 3) |
| XLOOKUP | =XLOOKUP(key, lookup, return) | Modern lookup | Flexible | =XLOOKUP(C2, IDs, Names) |
| INDEX | =INDEX(array, row, col) | Return value | Dynamic | =INDEX(Data, 5, 2) |
| MATCH | =MATCH(key, array, 0) | Position | Search | =MATCH(D2, List, 0) |
| INDIRECT | =INDIRECT(ref) | Dynamic reference | Sheets | =INDIRECT("Sheet"&E2&"!A1") |
| CHOOSE | =CHOOSE(index, val1, val2) | Select | Mapping | =CHOOSE(F2, "Red", "Blue") |
| OFFSET | =OFFSET(ref, rows, cols) | Shift reference | Ranges | =OFFSET(G1, 1, 0, 5, 1) |
| FILTER | =FILTER(array, condition) | Dynamic array | Spill | =FILTER(Table, Region="East") |
| SORT | =SORT(array) | Sort spill | Order | =SORT(H:H) |

### 6. Essential Formulas & Functions - Text (10)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| CONCAT / & | =CONCAT(text1, text2) or text1&text2 | Join | Full name | =A2&" "&B2 |
| TEXTJOIN | =TEXTJOIN(delimiter, ignore_empty, range) | Join array | List | =TEXTJOIN(", ", TRUE, C2:C10) |
| LEFT | =LEFT(text, n) | Left chars | Prefix | =LEFT(D2, 3) |
| RIGHT | =RIGHT(text, n) | Right chars | Suffix | =RIGHT(E2, 4) |
| MID | =MID(text, start, n) | Substring | Parse | =MID(F2, 5, 10) |
| TRIM | =TRIM(text) | Remove spaces | Clean | =TRIM(G2) |
| UPPER | =UPPER(text) | Uppercase | Standardize | =UPPER(H2) |
| LOWER | =LOWER(text) | Lowercase | Normalize | =LOWER(I2) |
| PROPER | =PROPER(text) | Title case | Names | =PROPER(J2) |
| FIND / SEARCH | =FIND(text, within) | Position | Locate | =FIND("x", K2) |

### 7. Essential Formulas & Functions - Date & Time (10)
| Function | Syntax | Description | Common Usage | Examples |
| --- | --- | --- | --- | --- |
| TODAY | =TODAY() | Current date | Timestamp | =TODAY() |
| NOW | =NOW() | Current datetime | Live time | =NOW() |
| DATE | =DATE(year, month, day) | Create date | Build | =DATE(2026,1,1) |
| EDATE | =EDATE(start, months) | Add months | Maturity | =EDATE(A2, 12) |
| EOMONTH | =EOMONTH(start, months) | End of month | Reporting | =EOMONTH(B2, 0) |
| YEAR / MONTH / DAY | =YEAR(date) | Extract part | Group | =YEAR(C2) |
| WEEKDAY | =WEEKDAY(date) | Day number | Schedule | =WEEKDAY(D2) |
| NETWORKDAYS | =NETWORKDAYS(start, end) | Workdays | Duration | =NETWORKDAYS(E2, F2) |
| DATEDIF | =DATEDIF(start, end, unit) | Difference | Age | =DATEDIF(G2, TODAY(), "Y") |
| TEXT | =TEXT(value, format) | Format date | Display | =TEXT(H2, "mmmm yyyy") |

### 8. Data Validation & Conditional Formatting (8)
| Feature | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Data Validation | Restrict input | List/Date/Number | Dropdown from range |
| List Validation | Dropdown | Choices | Source = Categories |
| Custom Formula | Logic rule | Conditional | =AND(A2>0, A2<100) |
| Whole Number | Integer limit | Counts | Between 1 and 100 |
| Conditional Formatting | Visual rules | Highlight | Color scale on sales |
| Data Bars | In-cell bars | Progress | Fill based on value |
| Icon Sets | Icons | KPI | Arrows for trend |
| Highlight Duplicates | Find repeats | Cleanup | Unique values only |

### 9. PivotTables (10)
| Command/Step | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Create PivotTable | Insert > PivotTable | Summarize | From table/range |
| Add Field to Rows | Drag to Rows | Categories | Region |
| Add Field to Columns | Drag to Columns | Headers | Year |
| Add Field to Values | Drag to Values | Metrics | Sum of Sales |
| Value Field Settings | Change aggregation | Count/Avg | Average instead of Sum |
| Group Dates | Group by month/year | Time series | Quarterly |
| Slicer | Visual filter | Interactive | Click to filter |
| PivotChart | Chart from Pivot | Visualize | Bar chart |
| Refresh | Update data | New rows | Right-click > Refresh |
| Calculated Field | Custom metric | Profit % | =Sales-Cost |

### 10. Charts & Visualization (12)
| Type | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Column/Bar | Compare categories | Rankings | Sales by region |
| Line | Trends over time | Change | Monthly revenue |
| Pie | Parts of whole | Proportions | Market share |
| Scatter | Relationships | Correlation | Price vs demand |
| Area | Cumulative | Stacked totals | Running total |
| Combo | Dual axis | Mixed scales | Revenue & margin |
| Waterfall | Incremental change | Bridge | Profit drivers |
| Sparkline | In-cell mini chart | Trend | Cell trend line |
| Treemap | Hierarchical | Space fill | Category breakdown |
| Sunburst | Multi-level hierarchy | Drill | Org structure |
| Histogram | Distribution | Frequency | Age groups |
| Box & Whisker | Statistical spread | Outliers | Test scores |

### 11. Tables & Structured References (8)
| Feature | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Format as Table | Ctrl + T | Structured | Auto filter/sort |
| Table Name | Design tab | Reference | Table1 |
| Structured Reference | Table[column] | Dynamic | Table1[Sales] |
| Total Row | Toggle | Subtotals | Sum column |
| Resize Table | Drag handle | Add rows | Expand range |
| Remove Duplicates | Data tab | Clean | Unique records |
| Convert to Range | Break table | Normal | Remove structure |
| Slicer for Table | Visual filter | Interactive | Filter table |

### 12. Data Tools (10)
| Tool | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Sort | A to Z / Custom | Order | Sales descending |
| Filter | AutoFilter | Subset | Region = "East" |
| Text to Columns | Split | Parse | Delimited names |
| Remove Duplicates | Cleanup | Unique | By ID |
| Consolidate | Combine | Summary | Multiple sheets |
| What-If Analysis | Scenarios/Goal Seek | Modeling | Target profit |
| Data Validation | Input rules | Control | Dropdown list |
| Flash Fill | Auto pattern | Transform | Extract email |
| Power Query | Get & Transform | ETL | Import/clean |
| Power Pivot | Data model | Relationships | Large data |

### 13. Advanced Functions (10)
| Function | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| SUMIFS | Multi-condition sum | Filter | =SUMIFS(Sales, Region, "East", Year, 2025) |
| COUNTIFS | Multi-condition count | Frequency | =COUNTIFS(Status, "Open", Priority, "High") |
| AVERAGEIFS | Conditional average | Mean | =AVERAGEIFS(Score, Group, "A") |
| AGGREGATE | Ignore errors/hidden | Robust | =AGGREGATE(14, 6, Range) |
| FORECAST.LINEAR | Predict trend | Forecasting | =FORECAST.LINEAR(x, known_y, known_x) |
| TREND | Array trend | Multiple | =TREND(y, x, new_x) |
| UNIQUE | Distinct spill | List | =UNIQUE(Category) |
| SEQUENCE | Number sequence | Dynamic | =SEQUENCE(10) |
| RANDARRAY | Random numbers | Simulation | =RANDARRAY(5,3) |
| LAMBDA | Custom function | Reuse | =LAMBDA(x, x^2) |

### 14. File & Workbook Management (8)
| Shortcut/Command | Windows | macOS | Description | Examples |
| --- | --- | --- | --- | --- |
| New Workbook | Ctrl + N | Command + N | Blank file | Start new |
| Open | Ctrl + O | Command + O | Existing | Load file |
| Save As | F12 | Fn + F12 | New name/format | Export PDF |
| Print | Ctrl + P | Command + P | Print | Layout |
| Close | Ctrl + W | Command + W | Current workbook | Keep Excel open |
| Switch Workbook | Ctrl + Tab | Ctrl + Tab | Next file | Multi-file |
| Protect Sheet | Review tab | Review tab | Lock | Prevent edits |
| Protect Workbook | Review tab | Review tab | Structure | No sheet delete |

### 15. Collaboration & Review (8)
| Feature | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Comments | Add note | Feedback | Right-click > New Comment |
| Track Changes | Review | Audit | Legacy feature |
| Share | File > Share | File > Share | Co-authoring |
| Co-authoring | Real-time | Team edit | Multiple users |
| Version History | File > Info | File > Info | Recover | Previous versions |
| Protect Shared | Password | Security | Read-only |
| Compare Files | Inquire add-in | Diff | Changes |
| Inspect Document | Remove metadata | Privacy | Before share |

### 16. Performance & Large Data (8)
| Tip | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Use Tables | Structured refs | Dynamic | Ctrl + T |
| Avoid Volatile | OFFSET/INDIRECT | Speed | Use INDEX |
| Limit Whole Column | A:A slow | Efficiency | A2:A1000 |
| Turn Off AutoCalc | Manual mode | Large files | Formulas > Manual |
| Use Power Query | Import/clean | ETL | Transform data |
| Data Model | Relationships | Pivot large | Power Pivot |
| Compress Images | Reduce size | File size | Picture Format |
| 64-bit Excel | More memory | Big datasets | Default modern |

### 17. Add-ins & Automation (8)
| Tool | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Power Query | Get & Transform | Data import | Clean/merge |
| Power Pivot | Data modeling | DAX | Relationships |
| Power BI Publisher | Export to BI | Reporting | Publish |
| Solver | Optimization | Goal seek advanced | Constraints |
| Analysis ToolPak | Stats | Regression | Add-in |
| VBA Macros | Automation | Repetitive | Record macro |
| Office Scripts | TypeScript | Cloud automate | Automate web |
| Get Data | External sources | Live | Stock/API |

## Tips and Best Practices
* Use tables (Ctrl + T) for dynamic ranges
* Keep raw data separate from analysis
* Name ranges for readable formulas
* Use consistent formatting and colors
* Avoid merged cells in data areas
* Use F4 to toggle absolute references
* Validate data entry with validation rules
* Protect sheets when sharing
* Use PivotTables for summaries
* Prefer XLOOKUP over VLOOKUP
* Document assumptions and sources
* Use version control via OneDrive/SharePoint
* Freeze panes for headers
* Hide gridlines for clean print
* Use conditional formatting sparingly
* Backup important files regularly
* Learn keyboard shortcuts for speed
* Use slicers for interactive filters
* Test formulas on small data first
* Comment complex formulas

## Additional Resources
* [Microsoft Excel Help](https://support.microsoft.com/en-us/excel)
* [Excel Keyboard Shortcuts](https://support.microsoft.com/en-us/office/keyboard-shortcuts-in-excel-1798d9d5-842a-42b8-9c99-9b7213f007c8)
* [Excel Functions by Category](https://support.microsoft.com/en-us/office/excel-functions-by-category-5f91f4e9-7b42-46d2-9bd1-63f26a86c0eb)
* [ExcelJet Formulas](https://exceljet.net/formulas)
* [Chandoo Excel Tips](https://chandoo.org/)
* [MrExcel Forum](https://www.mrexcel.com/)
* [Contextures Excel Tutorials](https://www.contextures.com/)
* [Excel Campus Blog](https://www.excelcampus.com/)

## Mini-Glossary

### 1. Common Terms
| Term | Description |
|------|-------------|
| Workbook | Excel file (.xlsx) |
| Worksheet | Single tab/sheet |
| Cell | Intersection row/column |
| Range | Group of cells |
| Formula | Calculation starting = |
| Function | Built-in formula |
| PivotTable | Dynamic summary |
| Slicer | Visual filter |

### 2. Acronyms
| Acronym | Full Form |
|---------|-----------|
| CSV | Comma Separated Values |
| XLSX | Excel Open XML |
| VBA | Visual Basic for Applications |
| DAX | Data Analysis Expressions |
| ETL | Extract Transform Load |
| KPI | Key Performance Indicator |

### 3. Key Features
| Feature | Description |
|---------|-------------|
| Conditional Formatting | Visual rules |
| Data Validation | Input control |
| Named Range | Friendly reference |
| Table | Structured data |
| Chart | Visualization |
| Sparkline | Mini chart |
| Flash Fill | Pattern fill |
| Power Query | Data transformation |

### 4. Formula Types
| Type | Description |
|------|-------------|
| Absolute | $A$1 fixed |
| Relative | A1 adjusts |
| Mixed | $A1 or A$1 |
| Array | Ctrl+Shift+Enter legacy |
| Dynamic Array | Spill automatic |

### 5. Best Practices
| Practice | Description |
|----------|-------------|
| Separate data | Raw vs analysis |
| Use tables | Dynamic ranges |
| Name ranges | Readability |
| Consistent layout | Easy navigation |
| Document | Comments/assumptions |
| Backup | Version history |
| Validate | Data integrity |
| Optimize | Performance |

### 6. Data Tools
| Tool | Purpose |
|------|---------|
| Sort & Filter | Organize |
| Text to Columns | Parse |
| Remove Duplicates | Clean |
| Consolidate | Combine |
| Goal Seek | What-if |
| Scenario Manager | Alternatives |
| Data Model | Relationships |
| Power Pivot | Advanced |

### 7. Common Errors
| Error | Meaning | Fix |
|-------|---------|-----|
| #DIV/0! | Divide by zero | IFERROR or check denominator |
| #N/A | Not available | XLOOKUP or default |
| #NAME? | Unknown name | Check spelling |
| #REF! | Invalid reference | Fix deleted cells |
| #VALUE! | Wrong type | Convert text/number |
| #NUM! | Invalid number | Check inputs |
| #NULL! | Wrong range | Space vs comma |

### 8. Tool Ecosystem
| Tool | Purpose |
|------|---------|
| Power Query | Import/clean |
| Power Pivot | Modeling |
| Power BI | Dashboards |
| VBA | Macros |
| Office Scripts | Automation |
| Add-ins | Extensions |
| OneDrive | Cloud sync |
| Teams | Collaboration |

### 9. Common Patterns
| Pattern | Description |
|---------|-------------|
| Index-Match | Flexible lookup |
| SUMIFS | Conditional sum |
| Dynamic named range | OFFSET/INDEX |
| Dashboard | Interactive sheet |
| Template | Reusable format |
| Budget model | Scenarios |
| Inventory tracker | Tables |
| Gantt chart | Timeline |

### 10. Troubleshooting
| Issue | Common Fix |
|-------|------------|
| Formula not calculating | Check manual mode |
| Slow workbook | Optimize ranges |
| #REF error | Restore deleted |
| Print issues | Page layout |
| File won't open | Repair |
| Macro security | Enable content |
| Links broken | Edit links |
| Filter not working | Clear filters |

