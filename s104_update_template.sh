#!/bin/bash

# Script to update the cheat sheet template with a mini-glossary section
# Set colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Project directory (default value)
PROJECT_DIR="/home/user/projects/sheets/101-series"

# Check if an alternate directory was provided
if [ $# -eq 1 ]; then
  PROJECT_DIR="$1"
  echo -e "${BLUE}Using provided project directory: $PROJECT_DIR${NC}"
fi

# Check if directory exists
if [ ! -d "$PROJECT_DIR" ]; then
  echo -e "${RED}Error: Directory $PROJECT_DIR does not exist.${NC}"
  exit 1
fi

# Navigate to project directory
cd "$PROJECT_DIR" || { echo -e "${RED}Error: Cannot change to directory $PROJECT_DIR${NC}"; exit 1; }
echo -e "${BLUE}Working directory: $(pwd)${NC}"

# Template file path
TEMPLATE_FILE="templates/cheat_sheet_template.md"

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo -e "${RED}Error: Template file not found at $TEMPLATE_FILE.${NC}"
  exit 1
fi

echo -e "${BLUE}Updating the cheat sheet template with a mini-glossary section...${NC}"

# First, check if the template already has a glossary section
if grep -q "## Mini-Glossary" "$TEMPLATE_FILE"; then
  echo -e "${YELLOW}Template already has a mini-glossary section. Skipping update.${NC}"
else
  # Create a backup of the original template
  cp "$TEMPLATE_FILE" "${TEMPLATE_FILE}.bak"
  
  # Add the mini-glossary section to the template
  cat >> "$TEMPLATE_FILE" << 'EOL'

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to [CATEGORY].

### Common Terms

| Term | Description |
|------|-------------|
| `term1` | Description of term1 |
| `term2` | Description of term2 |
| `term3` | Description of term3 |
| `term4` | Description of term4 |
| `term5` | Description of term5 |

### Common Flags/Options

| Flag/Option | Common Meaning | Example Usage |
|-------------|----------------|--------------|
| `flag1` | Description of flag1 | `example command flag1` |
| `flag2` | Description of flag2 | `example command flag2` |
| `flag3` | Description of flag3 | `example command flag3` |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| `ACR1` | Full form of acronym1 | Brief description |
| `ACR2` | Full form of acronym2 | Brief description |
| `ACR3` | Full form of acronym3 | Brief description |

### Special Characters/Syntax

| Symbol/Syntax | Name | Usage |
|---------------|------|-------|
| `symbol1` | Name of symbol1 | How and when to use symbol1 |
| `symbol2` | Name of symbol2 | How and when to use symbol2 |
| `pattern1` | Name of pattern1 | How and when to use pattern1 |

### Command/Function Syntax

Basic syntax pattern for [CATEGORY] commands/functions:
```
command [options] [arguments]
```

* **Command/Function**: Description of the command/function component
* **Options**: Description of the options component
* **Arguments**: Description of the arguments component

Example with breakdown:
```
example_command -option argument
```
* `example_command` is the command
* `-option` is the option
* `argument` is the argument
EOL

  echo -e "${GREEN}Template updated with mini-glossary section.${NC}"
  
  # Check if Git is available and this is a repository
  if [ -d ".git" ]; then
    # Commit the changes
    git add "$TEMPLATE_FILE"
    git commit -m "Add mini-glossary section to cheat sheet template"
    
    # Push to GitHub if remote is configured
    if [ -n "$(git remote -v)" ]; then
      echo -e "${BLUE}Pushing changes to GitHub...${NC}"
      git push
    fi
    
    echo -e "${GREEN}Changes committed to Git.${NC}"
  else
    echo -e "${YELLOW}This directory is not a Git repository. Changes not committed.${NC}"
  fi
fi

echo -e "\n${GREEN}Template update complete!${NC}"
