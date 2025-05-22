# 🤖 Step-by-Step Claude Setup and Environment Configuration

This guide walks you through the process of setting up Claude for efficient vibe coding, focusing on environment configuration to maximize productivity and code quality.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Basic Claude Configuration](#basic-claude-configuration)
- [Project Structure Setup](#project-structure-setup)
- [CLAUDE.md Configuration](#claudemd-configuration)
- [Context Management](#context-management)
- [Workflow Integration](#workflow-integration)
- [Advanced Configuration](#advanced-configuration)
- [Troubleshooting](#troubleshooting)

## 🧰 Prerequisites

Before configuring Claude for your development workflow, ensure you have:

1. **An Anthropic Account with Claude Code access**
   - Sign up for an Anthropic account at [anthropic.com](https://anthropic.com) 
   - Subscribe to a Max plan for Claude Code access

2. **System Requirements**
   - macOS 10.15 or newer
   - Ubuntu 20.04+ or Debian 10+
   - Windows via WSL (Windows Subsystem for Linux)
   - Node.js 16+ and npm installed

3. **A code repository setup**
   - Preferably Git-based
   - Well-structured project

4. **Basic knowledge of**:
   - Your project's structure and codebase
   - Your development workflow
   - Basic prompt engineering concepts

## 🏗️ Basic Claude Configuration

### Step 1: Install Node.js and npm (if not already installed)

**For macOS:**
```bash
# Using Homebrew (recommended)
brew install node

# Verify installation
node --version  # Should show v16.x.x or higher
npm --version   # Should show 8.x.x or higher
```

**For Ubuntu/Debian:**
```bash
# Install from NodeSource repository (for latest version)
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verify installation
node --version
npm --version
```

**For Windows (WSL):**
```bash
# Install NVM (Node Version Manager) for easier management
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Restart your terminal or source your profile
source ~/.bashrc

# Install and use Node.js 16 or later
nvm install 16
nvm use 16

# Verify installation
node --version
npm --version
```

### Step 2: Configure npm for User-Level Global Packages

To avoid permission issues, configure npm to use a directory in your user's home:

```bash
# Create a directory for global packages
mkdir -p ~/.npm-global

# Configure npm to use the new directory path
npm config set prefix ~/.npm-global

# Add the directory to your PATH
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc

# Apply the changes
source ~/.bashrc
```

### Step 3: Install Claude Code CLI

```bash
# Install Claude Code from npm (globally)
npm install -g @anthropic-ai/claude-code
```

> ⚠️ **Important:** Do NOT use `sudo npm install -g` as this can lead to permission issues and security risks.

### Step 4: Authentication

Navigate to your project directory and run the `claude` command. You'll need to complete a one-time OAuth process with your Anthropic account:

```bash
cd your-project
claude
```

You'll see a message like:
```
To use Claude Code, you need to connect your Anthropic account.
Please visit the following URL to authenticate:
https://console.anthropic.com/auth/cli/...
```

Follow the link to complete authentication in your browser. This will connect Claude Code to your Anthropic account with the appropriate permissions.

### Step 5: Verify Installation

```bash
# Check that Claude Code is properly installed
claude --version

# See available commands and options
claude --help
```

### Step 6: Alternative Access Methods

**Option A: Web Interface**
- Use claude.ai with your browser
- No local setup required, but fewer development-specific features

**Option B: API Integration (if needed)**
```bash
# Install Anthropic Python SDK
pip install anthropic

# Use with your API key (from Anthropic Console)
export ANTHROPIC_API_KEY=your_api_key_here
python -c "from anthropic import Anthropic; client = Anthropic(); print('Connected!')"
```

### Step 7: Basic Usage

Once installed, you can use Claude Code directly from your terminal:

```bash
# Ask questions about your codebase
claude "how does our authentication system work?"

# Create a commit with one command
claude commit

# Fix issues across multiple files
claude "fix the type errors in the auth module"
```

### Step 8: Configure Your Editor/IDE (Optional)

While Claude Code is primarily a CLI tool, you can enhance your experience with editor integrations:

**For VS Code:**
- Use the built-in terminal to run Claude Code commands
- Configure keyboard shortcuts for common Claude interactions
- Use VS Code's tasks feature to define common Claude workflows

## 📁 Project Structure Setup

### Step 1: Create Repository Metadata Structure

```bash
# Create directories for Claude-specific files
mkdir -p .claude/prompts
mkdir -p .claude/templates
mkdir -p .claude/memory
```

### Step 2: Setup Basic Files

```bash
# Create CLAUDE.md in project root
touch CLAUDE.md

# Create prompt templates
touch .claude/templates/code_review.md
touch .claude/templates/feature_implementation.md
touch .claude/templates/bug_fix.md
```

## 📝 CLAUDE.md Configuration

Create a CLAUDE.md file in your project root with these sections:

```markdown
# CLAUDE.md - AI Assistant Configuration

## Project Overview
[Brief description of your project, its purpose, and key components]

## Code Conventions
- Coding style: [e.g., PEP 8, Airbnb JavaScript Style Guide]
- Naming conventions: [e.g., camelCase for variables, PascalCase for classes]
- File organization: [Description of your project structure]
- Testing approach: [e.g., Jest for unit tests, Cypress for E2E]

## Workflow Rules
- Branch naming: [e.g., feature/*, bugfix/*, hotfix/*]
- Commit message format: [e.g., conventional commits]
- Pull request process: [Description of your PR workflow]

## Technology Stack
- Frontend: [e.g., React, Vue, Angular]
- Backend: [e.g., Node.js, Django, Ruby on Rails]
- Database: [e.g., PostgreSQL, MongoDB]
- Infrastructure: [e.g., Docker, Kubernetes, AWS]

## Important Files and Directories
- `/src`: Source code
- `/tests`: Test files
- `/docs`: Documentation
- [Other important project-specific paths]

## Instructions for Claude
- Always follow the project's coding style
- Generate comprehensive test coverage
- Document code thoroughly
- Explain your reasoning for complex implementations
- Flag potential security issues
```

## 💾 Context Management

### Step 1: Create a Context Summary File

```bash
# Create context summary file
touch .claude/context_summary.md
```

In `.claude/context_summary.md`:

```markdown
# Project Context Summary

## Key Components
[List and briefly describe the core components of your application]

## Data Flow
[Describe how data flows through your application]

## Business Logic
[Outline critical business rules and logic]

## Known Issues
[List known bugs or issues]

## Upcoming Features
[List planned features or improvements]
```

### Step 2: Setup Memory Management

Create a script to update Claude's memory with recent changes:

```bash
#!/bin/bash
# update_claude_memory.sh

# Get recent git history
git log --since="1 week ago" --pretty=format:"%h - %an, %ar : %s" > .claude/memory/recent_changes.md

# Update context summary
echo "Last updated: $(date)" >> .claude/context_summary.md
```

Make it executable:
```bash
chmod +x update_claude_memory.sh
```

## 🔄 Workflow Integration

### Step 1: Create Workflow Templates

For feature implementation in `.claude/templates/feature_implementation.md`:

```markdown
# Feature Implementation Template

## Feature Description
[Brief description of the feature]

## Requirements
[List of specific requirements]

## Affected Components
[List of components that will be affected]

## Implementation Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Testing Approach
[Description of how the feature should be tested]
```

### Step 2: Create Prompt Shorthand Scripts

```bash
#!/bin/bash
# claude_feature.sh

FEATURE_NAME=$1
FEATURE_DESC=$2

echo "# Implement feature: $FEATURE_NAME

## Description
$FEATURE_DESC

## Project Context
$(cat .claude/context_summary.md)

## Implementation Requirements
- Follow coding conventions in CLAUDE.md
- Write comprehensive tests
- Update documentation
- Explain your implementation approach

Please implement this feature based on our project structure and conventions.
" | claude-code
```

Make it executable:
```bash
chmod +x claude_feature.sh
```

## 🔧 Advanced Configuration

### Step 1: Setup Code Review Automation

Create a pre-commit hook for Claude code review:

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Get staged files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR | grep -E '\.(js|jsx|ts|tsx|py|rb)$')

if [ -n "$STAGED_FILES" ]; then
  echo "Running Claude code review on staged files..."
  
  for FILE in $STAGED_FILES; do
    # Get file content
    FILE_CONTENT=$(git show :$FILE)
    
    # Run Claude review
    REVIEW=$(echo "Review this code for issues, security vulnerabilities, and style compliance:

\`\`\`
$FILE_CONTENT
\`\`\`

Respond ONLY with issues found, or 'LGTM' if no issues." | claude-code)
    
    echo "Review for $FILE:"
    echo "$REVIEW"
    echo ""
  done
  
  # Ask if user wants to proceed
  read -p "Do you want to proceed with the commit? (y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

exit 0
```

Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

### Step 2: Claude-Powered Documentation Generation

Create a script to generate documentation:

```bash
#!/bin/bash
# generate_docs.sh

# List source files
FILES=$(find src -type f -name "*.js" -o -name "*.py" -o -name "*.ts")

for FILE in $FILES; do
  echo "Generating documentation for $FILE..."
  
  # Get file content
  FILE_CONTENT=$(cat $FILE)
  
  # Generate docs with Claude
  DOCS=$(echo "Generate comprehensive documentation for this code:

\`\`\`
$FILE_CONTENT
\`\`\`

Include:
1. Purpose of the file
2. Main functions/classes and their purpose
3. Input/output descriptions
4. Usage examples
5. Dependencies
6. Any important notes or caveats

Format as markdown." | claude-code)
  
  # Save to docs directory
  mkdir -p docs/$(dirname $FILE)
  echo "$DOCS" > docs/$FILE.md
done

echo "Documentation generation complete!"
```

Make it executable:
```bash
chmod +x generate_docs.sh
```

## 🔍 Troubleshooting

### Common Claude Code Issues

#### Installation Issues

- **Problem**: Permission errors during installation
- **Solution**: 
  - Set up a user-writable npm prefix as shown in the installation section
  - Never use sudo with npm install for Claude Code
  - If you see EACCES errors, follow the npm prefix setup in Step 2

#### Node.js Version Issues

- **Problem**: Errors about incompatible Node.js version
- **Solution**:
  - Check your Node.js version with `node --version`
  - Ensure you have Node.js 16 or later installed
  - If using nvm: `nvm install 16 && nvm use 16`
  - If using system package manager, update Node.js to a newer version

#### Windows/WSL Issues

- **Problem**: `exec: node: not found` when running claude
- **Solution**: 
  - Your WSL environment may be using a Windows installation of Node.js
  - Check with `which npm` and `which node` (should point to Linux paths starting with /usr/)
  - Install Node via your Linux distribution's package manager or via nvm

#### Context Length Exceeded
- **Problem**: Claude returns errors about context length
- **Solution**: 
  - Break down larger files into smaller chunks
  - Use the CLAUDE.md file for background context
  - Be more specific in your prompts

#### Inconsistent Code Generation
- **Problem**: Claude generates code that doesn't match project conventions
- **Solution**:
  - Update your CLAUDE.md with more specific conventions
  - Provide example code snippets in your prompts
  - Use templates for common tasks
  - Press Escape to interrupt Claude and redirect it

#### Hallucinating Project Details
- **Problem**: Claude makes incorrect assumptions about your project
- **Solution**:
  - Ask Claude to make a plan before coding
  - Be explicit in your prompts about project structure
  - Correct Claude when it makes incorrect assumptions
  - Double-tap Escape to jump back in history and edit previous prompts

## 🚀 Best Practices & Next Steps

After setting up Claude Code:

### Best Practices

1. **Active Collaboration**: While auto-accept mode (shift+tab to toggle) lets Claude work autonomously, you'll typically get better results by being an active collaborator.

2. **Start with a Plan**: Ask Claude to make a plan before coding and explicitly tell it not to code until you've confirmed its plan looks good.

3. **Course Correction**: Press Escape to interrupt Claude during any phase (thinking, tool calls, file edits), preserving context so you can redirect or expand instructions.

4. **Explore Alternatives**: Double-tap Escape to jump back in history, edit a previous prompt, and explore a different direction.

5. **Iterative Refinement**: Edit prompts and repeat until you get the result you're looking for.

### Next Steps

1. **Create task-specific templates** for your common development tasks
2. **Integrate Claude into your workflow** for routine coding tasks
3. **Setup a CLAUDE.md file** to keep Claude informed about project structure
4. **Train team members** on effective Claude prompting techniques
5. **Document your Claude configuration** for team consistency

---

By following this guide, you'll have a well-configured Claude environment optimized for productive AI-assisted development. Remember that effective vibe coding comes from a combination of good prompts, clear project context, and consistent workflows.

For more advanced topics, see:
- [Prompt Engineering Best Practices](../sections/prompt-injection-techniques.md)
- [Rules and Constraints for AI](../sections/rules-and-constraints.md)
- [GitHub CI/CD Workflows](../sections/github-cicd-workflows.md)