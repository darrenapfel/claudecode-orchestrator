# Git Hooks Guide

Git hooks for the orchestration system to enforce quality and workflow standards.

## Available Hooks

### 1. pre-commit
**Location**: `.claude/hooks/pre-commit`

**Purpose**: Validates task structure before allowing commits

**What it checks**:
- Ensures on a session/milestone branch
- Verifies TASK.md exists for each task
- Verifies EVIDENCE.md exists for each task
- Blocks commit if validation fails

**To install**:
```bash
# Copy to git hooks directory
cp .claude/hooks/pre-commit .git/hooks/
chmod +x .git/hooks/pre-commit
```

### 2. prepare-commit-msg (Recommended)
**Purpose**: Auto-formats commit messages to match standards

**Create**: `.claude/hooks/prepare-commit-msg`
```bash
#!/bin/bash
# Auto-format commit messages for task commits

COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2

# Only modify if no commit source (not amend/merge/etc)
if [ -z "$COMMIT_SOURCE" ]; then
  # Check if in task directory
  TASK_ID=$(pwd | grep -oE 'task-[0-9]{8}-[0-9]{4}' || echo "")
  
  if [ ! -z "$TASK_ID" ]; then
    # Prepend task ID to commit message
    echo "feat($TASK_ID): $(cat $COMMIT_MSG_FILE)" > $COMMIT_MSG_FILE
    echo "" >> $COMMIT_MSG_FILE
    echo "Task: $TASK_ID" >> $COMMIT_MSG_FILE
    echo "🤖 Generated with Claude Code" >> $COMMIT_MSG_FILE
  fi
fi
```

### 3. post-commit (Recommended)
**Purpose**: Updates task tracking after successful commit

**Create**: `.claude/hooks/post-commit`
```bash
#!/bin/bash
# Update task status after commit

COMMIT_SHA=$(git rev-parse HEAD)
BRANCH=$(git branch --show-current)

# Log commit to session tracking
if [[ "$BRANCH" =~ ^milestone/ ]]; then
  echo "[$COMMIT_SHA] $(git log -1 --pretty=%B)" >> .work/commits.log
fi

echo "✅ Commit $COMMIT_SHA recorded"
```

### 4. pre-push (Recommended)
**Purpose**: Final validation before pushing to remote

**Create**: `.claude/hooks/pre-push`
```bash
#!/bin/bash
# Validate all tests pass before push

echo "🔍 Running pre-push validation..."

# Run tests if test command exists
if [ -f "package.json" ] && grep -q '"test"' package.json; then
  echo "Running tests..."
  npm test || {
    echo "❌ Tests failed. Push blocked."
    exit 1
  }
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
  echo "❌ Uncommitted changes detected. Please commit or stash."
  exit 1
fi

echo "✅ Pre-push validation passed"
```

### 5. commit-msg (Optional)
**Purpose**: Validates commit message format

**Create**: `.claude/hooks/commit-msg`
```bash
#!/bin/bash
# Validate commit message format

COMMIT_MSG_FILE=$1
COMMIT_MSG=$(cat $COMMIT_MSG_FILE)

# Check for proper format
if ! echo "$COMMIT_MSG" | grep -qE '^(feat|fix|test|chore|docs)\(.*\):'; then
  echo "❌ Invalid commit message format"
  echo "Expected: type(scope): description"
  echo "Example: feat(task-001): implement authentication"
  exit 1
fi

# Check for task reference in body
if ! echo "$COMMIT_MSG" | grep -q "Task:"; then
  echo "⚠️  Warning: No task reference found"
  echo "Consider adding: Task: YYYYMMDD-HHMM-description"
fi
```

## Installation

### Install All Hooks
```bash
#!/bin/bash
# install-hooks.sh

echo "Installing git hooks..."

# Create hooks directory if needed
mkdir -p .git/hooks

# Copy all hooks
for hook in pre-commit prepare-commit-msg post-commit pre-push commit-msg; do
  if [ -f ".claude/hooks/$hook" ]; then
    cp ".claude/hooks/$hook" ".git/hooks/$hook"
    chmod +x ".git/hooks/$hook"
    echo "✅ Installed $hook"
  fi
done

echo "✅ Git hooks installation complete"
```

### Disable Hooks Temporarily
```bash
# Skip pre-commit hook
git commit --no-verify -m "emergency: fixing critical issue"

# Skip all hooks for one command
git -c core.hooksPath=/dev/null commit -m "bypass: all hooks"
```

## Hook Development Guidelines

### Best Practices
1. **Fast Execution**: Hooks should complete quickly (< 5 seconds)
2. **Clear Messages**: Tell user what's being checked and why it failed
3. **Exit Codes**: Return 0 for success, non-zero to block action
4. **Skip Options**: Allow bypassing for emergencies

### Testing Hooks
```bash
# Test pre-commit hook
.git/hooks/pre-commit
echo $?  # Should be 0 for success

# Test with specific files
git add src/test.js
.git/hooks/pre-commit
```

### Debugging Hooks
```bash
# Add debug output
#!/bin/bash
set -x  # Enable debug mode
echo "Debug: Current directory: $(pwd)"
echo "Debug: Changed files: $(git diff --cached --name-only)"
```

## Team Hooks Setup

### Shared Hooks Directory
Instead of copying to each developer's `.git/hooks/`:

```bash
# Configure git to use shared hooks
git config core.hooksPath .claude/hooks

# Verify configuration
git config --get core.hooksPath
```

### Enforcing Hooks
Add to `.claude/init-project.sh`:
```bash
# Auto-configure hooks for all developers
echo "🔧 Configuring git hooks..."
git config core.hooksPath .claude/hooks
echo "✅ Git hooks configured"
```

## Common Issues

### Hook Not Executing
```bash
# Check permissions
ls -la .git/hooks/pre-commit
# Should show: -rwxr-xr-x

# Fix permissions
chmod +x .git/hooks/pre-commit
```

### Hook Failing Incorrectly
```bash
# Run with debug
bash -x .git/hooks/pre-commit

# Check git config
git config --list | grep hooks
```

### Windows Line Endings
```bash
# Convert to Unix line endings
dos2unix .git/hooks/*

# Or in git
git config core.autocrlf input
```

## Orchestrator Integration

The orchestrator expects:
1. **pre-commit**: Validates evidence before commits
2. **Task tracking**: Maintained through commit messages
3. **Branch protection**: Enforced through hook validation

Hooks support the orchestration workflow by:
- Enforcing evidence requirements
- Maintaining commit message standards
- Preventing incomplete work from being pushed
- Automating task status updates

---
*Hooks enforce quality. Quality enables velocity.*