#!/bin/bash

# Help function
function show_help {
  echo "Usage: $0 [options]"
  echo "Generate a new command cheat sheet based on the template."
  echo
  echo "Options:"
  echo "  -c, --category CATEGORY    Category of the commands (e.g., Python, PostgreSQL)"
  echo "  -t, --type TYPE            Type of category (programming-languages, databases, etc.)"
  echo "  -h, --help                 Display this help and exit"
  echo
  echo "Example:"
  echo "  $0 -c Python -t programming-languages"
}

# Default values
TEMPLATE_FILE="templates/cheat_sheet_template.md"
PROJECT_ROOT="$(pwd)"

# Parse arguments
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -c|--category)
      CATEGORY="$2"
      shift 2
      ;;
    -t|--type)
      TYPE="$2"
      shift 2
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      show_help
      exit 1
      ;;
  esac
done

# Check if required parameters are provided
if [ -z "$CATEGORY" ] || [ -z "$TYPE" ]; then
  echo "Error: Category and type are required."
  show_help
  exit 1
fi

# Validate type
VALID_TYPES=("operating-systems" "programming-languages" "databases" "devops" "web-development" "data-science")
VALID_TYPE=false

for valid_type in "${VALID_TYPES[@]}"; do
  if [ "$TYPE" = "$valid_type" ]; then
    VALID_TYPE=true
    break
  fi
done

if [ "$VALID_TYPE" = false ]; then
  echo "Error: Invalid type. Valid types are:"
  printf "  %s\n" "${VALID_TYPES[@]}"
  exit 1
fi

# Create filename and path
FILENAME="101-${CATEGORY}-Commands.md"
TARGET_DIR="${PROJECT_ROOT}/${TYPE}"
TARGET_FILE="${TARGET_DIR}/${FILENAME}"

# Make sure target directory exists
mkdir -p "$TARGET_DIR"

# Check if file already exists
if [ -f "$TARGET_FILE" ]; then
  echo "Error: File $TARGET_FILE already exists."
  exit 1
fi

# Copy template and replace placeholder
cp "${PROJECT_ROOT}/${TEMPLATE_FILE}" "$TARGET_FILE"
sed -i "s/\[CATEGORY\]/${CATEGORY}/g" "$TARGET_FILE"

echo "Created new cheat sheet: $TARGET_FILE"
echo "Now edit the file to add your commands!"

# Update README.md to include the new cheat sheet
README="${PROJECT_ROOT}/README.md"
if [ -f "$README" ]; then
  # Determine which section to update based on type
  case "$TYPE" in
    "operating-systems")
      SECTION="### Operating Systems"
      ;;
    "programming-languages")
      SECTION="### Programming Languages"
      ;;
    "databases")
      SECTION="### Databases"
      ;;
    "devops")
      SECTION="### DevOps"
      ;;
    "web-development")
      SECTION="### Web Development"
      ;;
    "data-science")
      SECTION="### Data Science"
      ;;
    *)
      # Default - don't update any section
      SECTION=""
      ;;
  esac
  
  if [ -n "$SECTION" ]; then
    # Check if the section exists and the entry doesn't already exist
    if grep -q "$SECTION" "$README" && ! grep -q "\[$CATEGORY\]" "$README"; then
      NEW_ENTRY="- [101 $CATEGORY Commands]($TYPE/$FILENAME)"
      sed -i "/$SECTION/a $NEW_ENTRY" "$README"
      echo "Updated README.md with the new cheat sheet."
    fi
  fi
fi
