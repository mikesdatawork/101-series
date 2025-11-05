#!/bin/bash

# Script to rename 'Common Usage' to 'Common Usage' across all files
# Set colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Project directory
PROJECT_DIR="/home/user/projects/sheets/101-series"

# Check if directory exists
if [ ! -d "$PROJECT_DIR" ]; then
  echo -e "${RED}Error: Directory $PROJECT_DIR does not exist.${NC}"
  exit 1
fi

# Navigate to project directory
cd "$PROJECT_DIR" || { echo -e "${RED}Error: Cannot change to directory $PROJECT_DIR${NC}"; exit 1; }
echo -e "${BLUE}Working directory: $(pwd)${NC}"

# Search for files containing 'Common Usage'
echo -e "${BLUE}Searching for files containing 'Common Usage'...${NC}"
files_with_pattern=$(grep -l "Common Usage" $(find . -type f -name "*.md" -o -name "*.sh"))

if [ -z "$files_with_pattern" ]; then
  echo -e "${YELLOW}No files found containing 'Common Usage'.${NC}"
else
  echo -e "${BLUE}Found the following files containing 'Common Usage':${NC}"
  echo "$files_with_pattern"
  
  # Confirm replacement
  echo -e "${YELLOW}Replace 'Common Usage' with 'Common Usage' in these files? (y/n)${NC}"
  read confirm_replace
  
  if [[ $confirm_replace == [yY] || $confirm_replace == [yY][eE][sS] ]]; then
    echo -e "${BLUE}Replacing 'Common Usage' with 'Common Usage'...${NC}"
    
    # Use find and sed to replace in all matched files
    find . -type f -name "*.md" -o -name "*.sh" -exec sed -i 's/Common Usage/Common Usage/g' {} \;
    
    # Check how many files were updated
    updated_files=$(grep -l "Common Usage" $(find . -type f -name "*.md" -o -name "*.sh"))
    update_count=$(echo "$updated_files" | wc -l)
    
    echo -e "${GREEN}Replaced 'Common Usage' with 'Common Usage' in $update_count files.${NC}"
    
    # Check if Git is available and this is a repository
    if [ -d ".git" ]; then
      # Commit the changes
      git add .
      git commit -m "Rename 'Common Usage' to 'Common Usage' across all files"
      
      # Push to GitHub if remote is configured
      if [ -n "$(git remote -v)" ]; then
        echo -e "${BLUE}Pushing changes to GitHub...${NC}"
        git push
      fi
      
      echo -e "${GREEN}Changes committed to Git.${NC}"
    else
      echo -e "${YELLOW}This directory is not a Git repository. Changes not committed.${NC}"
    fi
  else
    echo -e "${YELLOW}Operation cancelled. No files modified.${NC}"
  fi
fi

echo -e "\n${GREEN}Replacement operation complete!${NC}"
