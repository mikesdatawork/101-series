#!/bin/bash

# Script to update column headers in all markdown files from "Common Use Cases" to "Common Uses"
# Set colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Project directory
PROJECT_DIR="$HOME/101-series"

# Check if directory exists
if [ ! -d "$PROJECT_DIR" ]; then
  echo -e "${YELLOW}Directory $PROJECT_DIR does not exist.${NC}"
  echo "Please run the setup script first or specify the correct path."
  exit 1
fi

echo -e "${BLUE}Updating column headers in all markdown files...${NC}"

# Navigate to project directory
cd "$PROJECT_DIR"

# Update all markdown files
find . -name "*.md" -exec sed -i 's/Common Use Cases/Common Uses/g' {} \;

# Check how many files were updated
UPDATED_FILES=$(grep -l "Common Uses" $(find . -name "*.md"))
COUNT=$(echo "$UPDATED_FILES" | wc -l)

echo -e "${GREEN}Updated column headers in $COUNT markdown files.${NC}"

# List the updated files
if [ $COUNT -gt 0 ]; then
  echo "Updated files:"
  echo "$UPDATED_FILES"
fi

# Check if any files still have the old column header
MISSED_FILES=$(grep -l "Common Use Cases" $(find . -name "*.md"))
MISSED_COUNT=$(echo "$MISSED_FILES" | wc -w)

if [ $MISSED_COUNT -gt 0 ]; then
  echo -e "${YELLOW}Warning: $MISSED_COUNT files still contain 'Common Use Cases':${NC}"
  echo "$MISSED_FILES"
  echo "You may need to update these files manually."
fi

# If Git is initialized, commit the changes
if [ -d ".git" ]; then
  git add .
  git commit -m "Update column headers from 'Common Use Cases' to 'Common Uses'"
  echo "Changes committed to Git."
fi
