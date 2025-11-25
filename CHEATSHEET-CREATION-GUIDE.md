# Cheat Sheet Creation Guide

## Purpose
This guide ensures consistency across all cheat sheets in the 101-series repository. Follow these guidelines precisely to maintain uniform formatting, structure, and quality across all documentation.

## File Naming Convention

### Pattern
````
101-[Technology-Name]-Commands.md
````

### Examples
- `101-Python-Async-Commands.md`
- `101-REST-API-Development-Commands.md`
- `101-VS-Code-Commands.md`
- `101-AWS-Commands.md`

### Rules
- Always start with `101-`
- Use title case for technology names
- Separate words with hyphens
- Always end with `-Commands.md`
- No spaces in filenames

## Directory Structure

### Categories
Organize cheat sheets into appropriate directories:
````
101-series/
├── python/           # Python-related cheat sheets
├── databases/        # Database technologies
├── web-development/  # Web APIs, REST, Swagger
├── ides/            # IDE and editor tools
├── cloud-services/   # AWS, Azure, GCP
├── operating-systems/
├── programming-languages/
├── machine-learning/
└── github/
````

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
````markdown
# 101 [Technology Name] Commands
````

**Rules:**
- H1 heading only
- No subtitle or additional text
- Format: `# 101 [Technology Name] Commands`

### 2. Overview
````markdown
## Overview
[Technology Name] is [brief description]. This cheat sheet covers [list 6-8 major topics]. Master these [commands/concepts] to [benefit statement].
````

**Rules:**
- 2-3 sentences total
- First sentence: what the technology is
- Second sentence: what this cheat sheet covers
- Third sentence: benefit of mastering content
- Length: 50-80 words
- No bullet points

**Example:**
````markdown
## Overview
Amazon Web Services (AWS) is a comprehensive cloud computing platform offering hundreds of services. This cheat sheet covers essential AWS CLI commands, service management, security practices, infrastructure as code, monitoring, and cost optimization across compute, storage, database, networking, and DevOps services. Master these commands to efficiently manage cloud infrastructure and applications.
````

### 3. Target Audience
````markdown
## Target Audience
- [Role 1] [doing what]
- [Role 2] [doing what]
- [Role 3] [doing what]
- [Role 4] [doing what]
- Anyone [general use case]
````

**Rules:**
- Exactly 5 bullet points
- First 4 are specific roles with context
- Last one always starts with "Anyone"
- Each bullet: 3-6 words
- No periods at end of bullets

**Example:**
````markdown
## Target Audience
- Cloud architects designing solutions
- DevOps engineers managing infrastructure
- Software developers deploying applications
- System administrators migrating to cloud
- Anyone working with AWS services
````

### 4. Command Categories

#### Structure
````markdown
## Command Categories

### 1. [Category Name] (N)

| Column1 | Column2 | Column3 | Column4 |
|---------|---------|---------|---------|
| Value   | Value   | Value   | Value   |
````

**Rules:**
- Minimum 17 categories per cheat sheet
- Each category numbered: `### 1.`, `### 2.`, etc.
- Category name followed by count in parentheses: `(10)`, `(12)`
- Counts represent number of rows in the table
- Aim for 8-12 rows per table
- Total commands/concepts: 150-200+ per cheat sheet

#### Table Column Patterns

**Pattern 1: Standard Command Table (Most Common)**
````markdown
| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
````

**Pattern 2: Comparison/Concept Table**
````markdown
| Concept | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
````

**Pattern 3: Configuration/Settings Table**
````markdown
| Setting | Purpose | Example Value | Notes |
|---------|---------|---------------|-------|
````

**Pattern 4: Tool/Extension Table**
````markdown
| Tool/Extension | Purpose | Key Features | Usage |
|----------------|---------|--------------|-------|
````

**Pattern 5: Keyboard Shortcuts Table**
````markdown
| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
````

**Pattern 6: Type/Category Table**
````markdown
| Type | Description | Usage | Examples |
|------|-------------|-------|----------|
````

#### Critical Formatting Rules

**NO BACKTICKS IN COMMANDS:**
````markdown
# WRONG:
| Command | Description |
|---------|-------------|
| `aws s3 ls` | List buckets |

# CORRECT:
| Command | Description |
|---------|-------------|
| aws s3 ls | List buckets |
````

**Backticks are only allowed:**
- In code blocks (fenced with triple backticks)
- In inline code within explanatory text (NOT in table cells)
- Never around commands in the Command column

**Table Cell Content:**
- Keep cells concise (under 100 characters)
- Use plain text, no markdown formatting
- No line breaks within cells
- Use commas to separate multiple items
- Use semicolons for sub-clauses

**Examples Column:**
- Provide actual, working examples
- Show realistic use cases
- Include parameter values
- Can span multiple related commands

### 5. Tips and Best Practices
````markdown
## Tips and Best Practices
* [Tip 1]
* [Tip 2]
* [Tip 3]
...
* [Tip 15]
````

**Rules:**
- 15-20 bullet points
- Use asterisks (*), not hyphens
- Each tip: one sentence
- Focus on actionable advice
- Cover security, performance, workflow
- Mix beginner and advanced tips
- No sub-bullets

**Example Tips:**
````markdown
* Always use HTTPS in production
* Version your API from the start
* Use proper HTTP status codes
* Implement comprehensive error handling
* Document your API thoroughly
````

### 6. Additional Resources
````markdown
## Additional Resources
* [Link text](URL)
* [Link text](URL)
* [Link text](URL)
...
````

**Rules:**
- 5-10 links
- Use asterisks (*), not hyphens
- Format: `* [Descriptive Text](URL)`
- Include official documentation first
- Add tutorials, guides, best practices
- No broken links

**Example:**
````markdown
## Additional Resources
* [AWS CLI Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/index.html)
* [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
* [AWS Documentation](https://docs.aws.amazon.com/)
````

### 7. Mini-Glossary
````markdown
## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to [Technology Name].

### Common Terms

| Term | Description |
|------|-------------|
| Term1 | Definition |
| Term2 | Definition |
````

**Structure:**
- Always starts with intro sentence
- 8-15 subsections
- Each subsection is H3: `### [Subsection Name]`
- Use 2-column tables: Term/Concept and Description
- Or use multi-column comparison tables

**Required Subsections (adapt to technology):**
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

**Glossary Table Patterns:**

**Simple Definition Table:**
````markdown
| Term | Description |
|------|-------------|
| REST | Representational State Transfer |
| API | Application Programming Interface |
````

**Comparison Table:**
````markdown
| Feature | Option A | Option B | Option C |
|---------|----------|----------|----------|
| Speed | Fast | Medium | Slow |
| Cost | High | Medium | Low |
````

**Category Table:**
````markdown
| Category | Examples | Use Cases |
|----------|----------|-----------|
| Compute | EC2, Lambda | Running apps |
| Storage | S3, EBS | Data storage |
````

**Rules:**
- 10+ terms per subsection minimum
- Keep descriptions concise (under 100 chars)
- Use consistent formatting
- Alphabetize when appropriate
- Cross-reference related terms

## Writing Style Guidelines

### Voice and Tone
- Use imperative mood for commands: "Create", "Configure", "Deploy"
- Use active voice: "The service processes requests" not "Requests are processed"
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

## Command/Code Formatting

### In Tables: NO BACKTICKS
````markdown
# CORRECT:
| Command | Example |
|---------|---------|
| aws s3 ls | aws s3 ls s3://my-bucket |
| git commit | git commit -m "message" |

# WRONG:
| Command | Example |
|---------|---------|
| `aws s3 ls` | `aws s3 ls s3://my-bucket` |
````

### In Running Text: Use Backticks
````markdown
The `aws s3 ls` command lists all S3 buckets.
````

### In Code Blocks: Use Triple Backticks
````markdown
```bash
aws s3 ls
aws s3 mb s3://my-bucket
```
````

### Command Examples
- Provide realistic, working examples
- Include necessary parameters
- Show actual values, not placeholders when possible
- Use placeholder format: `<value>` or `value` (no angle brackets in tables)

## Quality Checklist

Before considering a cheat sheet complete, verify:

### Content
- [ ] Minimum 17 categories
- [ ] 150-200+ total commands/concepts
- [ ] All sections present and in order
- [ ] 5 target audience bullets
- [ ] 15+ tips and best practices
- [ ] 5+ additional resources
- [ ] Comprehensive mini-glossary (8+ subsections)

### Formatting
- [ ] No backticks in table cells
- [ ] Consistent table column headers
- [ ] Proper markdown syntax
- [ ] All links working
- [ ] Numbered categories (1. 2. 3...)
- [ ] Command counts in parentheses
- [ ] Proper H1/H2/H3 hierarchy

### Writing Quality
- [ ] No AI-giveaway phrases
- [ ] Clear, concise language
- [ ] Active voice
- [ ] Technical accuracy
- [ ] Consistent terminology
- [ ] No spelling/grammar errors

### Completeness
- [ ] All categories filled
- [ ] Examples for key commands
- [ ] Glossary covers all major terms
- [ ] Tips cover security, performance, best practices
- [ ] Resources include official docs

## Script Template

Use this template for creating cheat sheet scripts:
````bash
#!/bin/bash

REPO_PATH="/tmp/101-series"
TARGET_DIR="$REPO_PATH/[category]"
FILE_NAME="101-[Technology-Name]-Commands.md"
FILE_PATH="$TARGET_DIR/$FILE_NAME"

echo "=========================================="
echo "Creating 101 [Technology Name] Commands"
echo "=========================================="
echo ""

cd "$REPO_PATH" || { echo "Error: Repository not found at $REPO_PATH"; exit 1; }

# Create directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating [category] directory..."
    mkdir -p "$TARGET_DIR"
fi

# Create the new cheat sheet
cat > "$FILE_PATH" << 'EOF'
[CONTENT HERE]
