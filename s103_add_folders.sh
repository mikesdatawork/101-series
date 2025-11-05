#!/bin/bash

# Script to add new folders and subfolder structure to the project
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

# Create new top-level folders
echo -e "${BLUE}Creating new top-level folders...${NC}"
mkdir -p ai-tools github llm python

# Create README files for new top-level folders
echo -e "${BLUE}Creating README files for new folders...${NC}"

# AI Tools README
cat > ai-tools/README.md << 'EOL'
# AI Tools Command Cheat Sheets

This directory contains cheat sheets for various AI tools, platforms, and frameworks.

## Available Cheat Sheets

- [Coming soon] 101 AI Tool Commands

## Purpose

These cheat sheets provide quick reference for the most commonly used and essential commands for AI tools. Each cheat sheet includes:

- Command syntax and usage
- Common use cases and examples
- Tips and best practices
- Additional resources for further learning

## Target Audience

- AI practitioners
- Machine learning engineers
- Data scientists
- Researchers
- Students and learners
EOL

# GitHub README
cat > github/README.md << 'EOL'
# GitHub Command Cheat Sheets

This directory contains cheat sheets for GitHub and related tools.

## Available Cheat Sheets

- [Coming soon] 101 GitHub CLI Commands
- [Coming soon] 101 Git Commands
- [Coming soon] 101 GitHub Actions Commands

## Purpose

These cheat sheets provide quick reference for the most commonly used and essential commands for GitHub. Each cheat sheet includes:

- Command syntax and usage
- Common use cases and examples
- Tips and best practices
- Additional resources for further learning

## Target Audience

- Software developers
- DevOps engineers
- Open source contributors
- Project maintainers
- Students and learners
EOL

# LLM README
cat > llm/README.md << 'EOL'
# LLM Command Cheat Sheets

This directory contains cheat sheets for Large Language Models (LLMs) and related tools.

## Available Cheat Sheets

- [Coming soon] 101 LLM Prompting Techniques
- [Coming soon] 101 Hugging Face Commands
- [Coming soon] 101 OpenAI API Commands

## Purpose

These cheat sheets provide quick reference for the most commonly used and essential commands and techniques for working with LLMs. Each cheat sheet includes:

- Command syntax and usage
- Common use cases and examples
- Tips and best practices
- Additional resources for further learning

## Target Audience

- AI engineers
- NLP specialists
- Prompt engineers
- Application developers
- Students and learners
EOL

# Python README
cat > python/README.md << 'EOL'
# Python Command Cheat Sheets

This directory contains cheat sheets for Python and related libraries.

## Available Cheat Sheets

- [Coming soon] 101 Python Data Science Commands
- [Coming soon] 101 Pandas Commands
- [Coming soon] 101 NumPy Commands
- [Coming soon] 101 Python CLI Commands

## Purpose

These cheat sheets provide quick reference for the most commonly used and essential Python commands and functions. Each cheat sheet includes:

- Command syntax and usage
- Common use cases and examples
- Tips and best practices
- Additional resources for further learning

## Target Audience

- Python developers
- Data scientists
- Machine learning engineers
- Automation specialists
- Students and learners
EOL

# Create LLM subfolder structure
echo -e "${BLUE}Creating LLM subfolder structure...${NC}"
mkdir -p llm/data-engineering
mkdir -p llm/training
mkdir -p llm/fine-tuning
mkdir -p llm/inference
mkdir -p llm/evaluation
mkdir -p llm/deployment

# Create README files for LLM subfolders
echo -e "${BLUE}Creating README files for LLM subfolders...${NC}"

# Data Engineering README
cat > llm/data-engineering/README.md << 'EOL'
# LLM Data Engineering Command Cheat Sheets

This directory contains cheat sheets for data engineering tasks related to LLMs.

## Available Cheat Sheets

- [Coming soon] 101 Data Preprocessing Commands
- [Coming soon] 101 Data Cleaning Commands
- [Coming soon] 101 Data Transformation Commands
- [Coming soon] 101 Data Pipeline Commands

## Common Data Engineering Tasks for LLMs

- Data collection and scraping
- Text extraction and cleaning
- Tokenization and normalization
- Data augmentation
- Dataset creation and formatting
- Data versioning and management
- ETL pipelines for text data
EOL

# Training README
cat > llm/training/README.md << 'EOL'
# LLM Training Command Cheat Sheets

This directory contains cheat sheets for training Large Language Models.

## Available Cheat Sheets

- [Coming soon] 101 Model Training Commands
- [Coming soon] 101 Training Optimization Commands
- [Coming soon] 101 Distributed Training Commands
- [Coming soon] 101 Training Monitoring Commands

## Common Training Tasks for LLMs

- Pre-training configuration
- Hyperparameter optimization
- Distributed training setup
- Checkpoint management
- Training monitoring and visualization
- Resource management
- Error handling and debugging
EOL

# Fine-Tuning README
cat > llm/fine-tuning/README.md << 'EOL'
# LLM Fine-Tuning Command Cheat Sheets

This directory contains cheat sheets for fine-tuning Large Language Models.

## Available Cheat Sheets

- [Coming soon] 101 Fine-Tuning Commands
- [Coming soon] 101 RLHF Commands
- [Coming soon] 101 Parameter-Efficient Fine-Tuning Commands
- [Coming soon] 101 Domain Adaptation Commands

## Common Fine-Tuning Techniques

- Full fine-tuning
- LoRA and QLoRA
- Prefix tuning
- Prompt tuning
- P-tuning
- Reinforcement Learning from Human Feedback (RLHF)
- Direct Preference Optimization (DPO)
EOL

# Inference README
cat > llm/inference/README.md << 'EOL'
# LLM Inference Command Cheat Sheets

This directory contains cheat sheets for running inference with Large Language Models.

## Available Cheat Sheets

- [Coming soon] 101 Inference Optimization Commands
- [Coming soon] 101 Batch Processing Commands
- [Coming soon] 101 Inference API Commands
- [Coming soon] 101 Generation Parameter Commands

## Common Inference Tasks

- Text generation strategies
- Batch processing
- Inference optimization
- Quantization techniques
- Caching and retrieval
- Prompt engineering for inference
- Response parsing and post-processing
EOL

# Evaluation README
cat > llm/evaluation/README.md << 'EOL'
# LLM Evaluation Command Cheat Sheets

This directory contains cheat sheets for evaluating Large Language Models.

## Available Cheat Sheets

- [Coming soon] 101 Model Evaluation Commands
- [Coming soon] 101 Benchmarking Commands
- [Coming soon] 101 Testing Commands
- [Coming soon] 101 Metric Calculation Commands

## Common Evaluation Metrics and Methods

- Perplexity and cross-entropy
- BLEU, ROUGE, and other text generation metrics
- Human evaluation protocols
- Benchmark suites (MMLU, HellaSwag, etc.)
- Task-specific evaluation
- A/B testing
- Model comparison
EOL

# Deployment README
cat > llm/deployment/README.md << 'EOL'
# LLM Deployment Command Cheat Sheets

This directory contains cheat sheets for deploying Large Language Models.

## Available Cheat Sheets

- [Coming soon] 101 Model Serving Commands
- [Coming soon] 101 Containerization Commands
- [Coming soon] 101 Cloud Deployment Commands
- [Coming soon] 101 Monitoring Commands

## Common Deployment Tasks

- Model serving and API development
- Containerization with Docker
- Orchestration with Kubernetes
- Cloud deployment (AWS, Azure, GCP)
- Edge deployment
- Monitoring and observability
- Scalability and load balancing
EOL

echo -e "${GREEN}Created new folders and subfolders with README files.${NC}"

# Check if Git is available and this is a repository
if [ -d ".git" ]; then
  # Commit the changes
  git add .
  git commit -m "Add new folders (ai-tools, github, llm, python) with subfolder structure"
  
  # Push to GitHub if remote is configured
  if [ -n "$(git remote -v)" ]; then
    echo -e "${BLUE}Pushing changes to GitHub...${NC}"
    git push
  fi
  
  echo -e "${GREEN}Changes committed to Git.${NC}"
else
  echo -e "${YELLOW}This directory is not a Git repository. Changes not committed.${NC}"
fi

echo -e "\n${GREEN}Folder structure update complete!${NC}"
