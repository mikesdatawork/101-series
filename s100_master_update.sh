#!/bin/bash

# Master script to run all update scripts in the correct order
# Set colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Project directory
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

# Welcome message
echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}   101-Series Project Update Master Script      ${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""
echo "This script will:"
echo "1. Rename 'Common Usage' to 'Common Usage' in all files"
echo "2. Update the Linux commands with full 101 commands and mini-glossary"
echo "3. Add new folders (ai-tools, github, llm, python) with subfolder structure"
echo ""

# Get confirmation to proceed
read -p "Do you want to proceed? (y/n) " proceed
if [[ $proceed != [yY] && $proceed != [yY][eE][sS] ]]; then
  echo "Exiting..."
  exit 0
fi

# Get script locations
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RENAME_COLUMN_SCRIPT="$SCRIPT_DIR/s101_rename_column.sh"
UPDATE_LINUX_SCRIPT="$SCRIPT_DIR/s102_update_linux_commands.sh"
ADD_FOLDERS_SCRIPT="$SCRIPT_DIR/s103_add_folders.sh"

# Check if scripts exist
missing_scripts=0
if [ ! -f "$RENAME_COLUMN_SCRIPT" ]; then
  echo -e "${YELLOW}Warning: Rename column script not found at $RENAME_COLUMN_SCRIPT${NC}"
  missing_scripts=$((missing_scripts + 1))
fi

if [ ! -f "$UPDATE_LINUX_SCRIPT" ]; then
  echo -e "${YELLOW}Warning: Update Linux commands script not found at $UPDATE_LINUX_SCRIPT${NC}"
  missing_scripts=$((missing_scripts + 1))
fi

if [ ! -f "$ADD_FOLDERS_SCRIPT" ]; then
  echo -e "${YELLOW}Warning: Add folders script not found at $ADD_FOLDERS_SCRIPT${NC}"
  missing_scripts=$((missing_scripts + 1))
fi

if [ $missing_scripts -gt 0 ]; then
  echo -e "${RED}Error: One or more required scripts are missing.${NC}"
  echo "Please make sure all update scripts are in the same directory as this master script."
  exit 1
fi

# Make scripts executable
chmod +x "$RENAME_COLUMN_SCRIPT" "$UPDATE_LINUX_SCRIPT" "$ADD_FOLDERS_SCRIPT"

# Step 1: Rename 'Common Usage' to 'Common Usage'
echo -e "\n${BLUE}Step 1: Renaming 'Common Usage' to 'Common Usage' in all files...${NC}"
"$RENAME_COLUMN_SCRIPT"

# Step 2: Update Linux commands with full 101 commands and mini-glossary
echo -e "\n${BLUE}Step 2: Updating Linux commands with full 101 commands and mini-glossary...${NC}"
"$UPDATE_LINUX_SCRIPT"

# Step 3: Add new folders and subfolder structure
echo -e "\n${BLUE}Step 3: Adding new folders and subfolder structure...${NC}"
"$ADD_FOLDERS_SCRIPT"

# Final message
echo -e "\n${GREEN}================================================${NC}"
echo -e "${GREEN}   101-Series Project Update Complete!          ${NC}"
echo -e "${GREEN}================================================${NC}"
echo ""
echo "All updates have been applied to your project."
echo "Project location: $PROJECT_DIR"
echo ""
echo "Next steps:"
echo "1. Check your GitHub repository to ensure all changes have been pushed"
echo "2. Begin adding content to the new folders and cheat sheets"
echo ""
echo "Enjoy your enhanced 101-series command cheat sheets project!"
