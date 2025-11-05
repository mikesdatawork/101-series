# 101 Series

A comprehensive collection of the 101 most useful commands for various programming languages, tools, and technologies.

## Repository Structure

- `README.md` - This file
- `operating-systems/` - Commands for Linux, macOS, Windows
- `programming-languages/` - Commands for Python, JavaScript, etc.
- `databases/` - Commands for various database systems
- `devops/` - Commands for Docker, Kubernetes, etc.
- `web-development/` - Commands for HTML/CSS, React, etc.
- `data-science/` - Commands for data analysis, ML, etc.
- `ai-tools/` - Commands for AI-related tools
- `llm/` - Commands for Large Language Models
- `github/` - Commands for GitHub
- `templates/` - Template files for new cheat sheets

## Available Cheat Sheets

- [101 Linux Terminal Commands](operating-systems/101-Linux-Terminal-Commands.md) - Essential commands for Linux-based systems
- [101 Python Commands](python/101-Python-Commands.md) - Essential commands for Python
- [101 GitHub Commands](github/101-GitHub-Commands.md) - Essential commands for GitHub
- [101 ChromaDB Commands](databases/101-ChromaDB-Commands.md) - Essential commands for Chroma Vector Database
- [101 MongoDB Commands](databases/101-MongoDB-Commands.md) - Essential commands for MongoDB
- [101 PostgreSQL Commands](databases/101-PostgreSQL-Commands.md) - Essential commands for PostgreSQL
- [101 Pinecone Commands](databases/101-Pinecone-Commands.md) - Essential commands for Pinecone Vector Database

## Purpose

This repository provides quick reference guides for the most essential commands across various technologies. Each cheat sheet includes command syntax, common use cases, examples, and best practices.

## How to Use

Browse to the specific technology category directory and open the cheat sheet markdown file to view the commands. Each cheat sheet is designed to be comprehensive yet concise.

## Contributing

To add a new cheat sheet, use the generator script:

```bash
./scripts/generate_cheatsheet.sh -n <TechnologyName> -c <category>
```

For example:
```bash
./scripts/generate_cheatsheet.sh -n ChromaDB -c databases
```
