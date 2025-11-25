# Cheat Sheet Creation Guide

## Purpose
This guide ensures consistency across all cheat sheets in the 101-series repository. Follow these guidelines precisely to maintain uniform formatting, structure, and quality across all documentation.

## File Naming Convention

### Pattern
Always use: 101-[Technology-Name]-Commands.md

### Examples
- 101-Python-Async-Commands.md
- 101-REST-API-Development-Commands.md
- 101-VS-Code-Commands.md
- 101-AWS-Commands.md

### Rules
- Always start with 101-
- Use title case for technology names
- Separate words with hyphens
- Always end with -Commands.md
- No spaces in filenames

## Directory Structure

### Categories
Organize cheat sheets into appropriate directories:

- python/ (Python-related cheat sheets)
- databases/ (Database technologies)
- web-development/ (Web APIs, REST, Swagger)
- ides/ (IDE and editor tools)
- cloud-services/ (AWS, Azure, GCP)
- operating-systems/
- programming-languages/
- machine-learning/
- github/

### Creating New Categories
- Use lowercase for directory names
- Use hyphens for multi-word directories
- Create directory only when you have content for it
- Update README.md when adding new categories

## Document Structure

### Required Sections (In Order)
1. Title (H1)
2. Overview
3. Target Audience
4. Command Categories (17 categories minimum)
5. Tips and Best Practices
6. Additional Resources
7. Mini-Glossary

## Section Formatting

### 1. Title
Format: # 101 [Technology Name] Commands

Rules:
- H1 heading only
- No subtitle or additional text

### 2. Overview
Format: 2-3 sentences total
- First sentence: what the technology is
- Second sentence: what this cheat sheet covers
- Third sentence: benefit of mastering content
- Length: 50-80 words
- No bullet points

Example:
Amazon Web Services (AWS) is a comprehensive cloud computing platform offering hundreds of services. This cheat sheet covers essential AWS CLI commands, service management, security practices, infrastructure as code, monitoring, and cost optimization across compute, storage, database, networking, and DevOps services. Master these commands to efficiently manage cloud infrastructure and applications.

### 3. Target Audience
Format: Exactly 5 bullet points
- First 4 are specific roles with context
- Last one always starts with "Anyone"
- Each bullet: 3-6 words
- No periods at end of bullets

Example:
- Cloud architects designing solutions
- DevOps engineers managing infrastructure
- Software developers deploying applications
- System administrators migrating to cloud
- Anyone working with AWS services

### 4. Command Categories

Structure:
Each category is numbered and has a count in parentheses

Example: ### 1. Category Name (10)

Rules:
- Minimum 17 categories per cheat sheet
- Each category numbered: 1., 2., etc.
- Category name followed by count in parentheses: (10), (12)
- Counts represent number of rows in the table
- Aim for 8-12 rows per table
- Total commands/concepts: 150-200+ per cheat sheet

Table Column Patterns:

Pattern 1: Standard Command Table (Most Common)
Columns: Command | Description | Common Usage | Examples

Pattern 2: Comparison/Concept Table
Columns: Concept | Description | Common Usage | Examples

Pattern 3: Configuration/Settings Table
Columns: Setting | Purpose | Example Value | Notes

Pattern 4: Tool/Extension Table
Columns: Tool/Extension | Purpose | Key Features | Usage

Pattern 5: Keyboard Shortcuts Table
Columns: Command | Windows/Linux | macOS | Description

Pattern 6: Type/Category Table
Columns: Type | Description | Usage | Examples

CRITICAL FORMATTING RULES:

NO BACKTICKS IN TABLE CELLS - This is the most important rule!

WRONG: | Command | Description |
        | `aws s3 ls` | List buckets |

CORRECT: | Command | Description |
          | aws s3 ls | List buckets |

Backticks are only allowed:
- In code blocks (fenced with triple backticks)
- In inline code within explanatory text (NOT in table cells)
- Never around commands in the Command column

Table Cell Content:
- Keep cells concise (under 100 characters)
- Use plain text, no markdown formatting
- No line breaks within cells
- Use commas to separate multiple items
- Use semicolons for sub-clauses

### 5. Tips and Best Practices

Format: 15-20 bullet points

Rules:
- Use asterisks (*), not hyphens
- Each tip: one sentence
- Focus on actionable advice
- Cover security, performance, workflow
- Mix beginner and advanced tips
- No sub-bullets

### 6. Additional Resources

Format: 5-10 links

Rules:
- Use asterisks (*), not hyphens
- Format: * [Descriptive Text](URL)
- Include official documentation first
- Add tutorials, guides, best practices
- No broken links

### 7. Mini-Glossary

Structure:
- Always starts with intro sentence
- 8-15 subsections
- Each subsection is H3
- Use 2-column tables: Term/Concept and Description
- Or use multi-column comparison tables

Required Subsections (adapt to technology):
1. Common Terms (basic vocabulary)
2. Acronyms/Abbreviations
3. Key Concepts
4. Comparison tables
5. Best practices tables
6. Command patterns
7. Configuration options
8. Tool ecosystem
9. Common patterns
10. Troubleshooting

Rules:
- 10+ terms per subsection minimum
- Keep descriptions concise (under 100 chars)
- Use consistent formatting
- Alphabetize when appropriate
- Cross-reference related terms

## Writing Style Guidelines

### Voice and Tone
- Use imperative mood for commands: "Create", "Configure", "Deploy"
- Use active voice
- Be direct and concise
- Avoid fluff and marketing language
- Use technical precision

### Forbidden Phrases
Never use these AI-giveaway phrases:
- "dive into"
- "unleash"
- "game-changing"
- "revolutionary"
- "cutting-edge" (unless genuinely warranted)
- "seamless"
- "robust" (overused)
- "leverage" (use "use")
- "utilize" (use "use")

### Preferred Language
- Simple, clear verbs
- Short sentences (under 25 words)
- Active constructions
- Specific, concrete examples
- Technical accuracy over flowery description

### Sentence Length
- Overview: 50-80 words
- Tips: 5-15 words each
- Table cells: under 100 characters
- Glossary definitions: under 100 characters

## Quality Checklist

Content:
- Minimum 17 categories
- 150-200+ total commands/concepts
- All sections present and in order
- 5 target audience bullets
- 15+ tips and best practices
- 5+ additional resources
- Comprehensive mini-glossary (8+ subsections)

Formatting:
- No backticks in table cells
- Consistent table column headers
- Proper markdown syntax
- All links working
- Numbered categories (1. 2. 3...)
- Command counts in parentheses
- Proper H1/H2/H3 hierarchy

Writing Quality:
- No AI-giveaway phrases
- Clear, concise language
- Active voice
- Technical accuracy
- Consistent terminology
- No spelling/grammar errors

Completeness:
- All categories filled
- Examples for key commands
- Glossary covers all major terms
- Tips cover security, performance, best practices
- Resources include official docs

## Common Mistakes to Avoid

1. Using backticks in table cells - Most common error
2. Inconsistent table column headers
3. Missing command counts
4. Too few commands - Aim for 150-200+ total
5. Generic tips - Be specific and actionable
6. Broken links
7. Inconsistent formatting
8. Missing glossary subsections
9. AI-giveaway language
10. Incomplete examples

## Final Notes

- This guide is the definitive reference for cheat sheet creation
- When in doubt, reference existing cheat sheets as examples
- Consistency across all cheat sheets is paramount
- Quality over quantity, but maintain the 150-200+ command target
- Update this guide if new patterns emerge
