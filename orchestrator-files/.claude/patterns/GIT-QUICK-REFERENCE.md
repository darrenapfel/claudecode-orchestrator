# Git Quick Reference

For complete details see: **`GIT-COMMIT-STRATEGY.md`**

## 🚀 Quick Commands

### Repository Setup
```bash
# Check git status
git status
git branch

# Initialize (if needed)
git init
git add .gitignore
git commit -m "chore: initialize repository with .gitignore"

# Create milestone branch
git checkout -b milestone/YYYYMMDD-name
```

### Task Commits
```bash
# Stage only task files (from EVIDENCE.md)
git add src/auth/* tests/auth/*

# Commit with standard format
git commit -m "feat(task-YYYYMMDD-HHMM): description

Task: YYYYMMDD-HHMM-task-name
Evidence: .work/milestones/.../tasks/YYYYMMDD-HHMM/EVIDENCE.md
Tests: X/Y passing

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: Persona <noreply@anthropic.com>"
```

### Integration Commits
```bash
# Stage integration files only
git add src/index.ts src/router.ts

# Commit integration fixes
git commit -m "fix(integration): connect services

Integration: sprint-XXX-integration
Evidence: .work/milestones/.../integration/EVIDENCE.md"
```

### Validation Commits
```bash
# Commit validation results (pass or fail)
git add .work/milestones/.../validation-N/

# For failures
git commit -m "test(validation-N): X failures in sprint-XXX

Failures documented for fix cycle
Evidence: .work/milestones/.../validation-N/report.md"

# For passes
git commit -m "test(validation-N): all tests passing in sprint-XXX"
```

### Fix Cycle Commits
```bash
# After fixing validation failures
git add [fixed files]
git commit -m "fix(cycle-N): resolve validation failures

Fixed: X/Y failures
Evidence: .work/milestones/.../fixes/cycle-N/EVIDENCE.md"
```

## 📋 Status Checks

```bash
# View recent commits
git log --oneline -10

# Check what will be committed
git diff --staged

# Find task commits
git log --oneline --grep="Task:"

# Verify evidence links
git log --grep="Evidence:" --pretty=format:"%h %s"
```

## 🔧 Common Scenarios

### Shared File Conflict (e.g., package.json)
```bash
# First task commits
git add package.json src/feature1/*
git commit -m "feat(task-001): feature with dependencies"

# Later task rebases
git pull --rebase
# Resolve conflicts if any
git add package.json src/feature2/*
git commit -m "feat(task-002): feature with additional deps"
```

### Accidentally Committed Wrong Files
```bash
# Revert the commit
git revert HEAD

# Recommit with correct files
git add [correct files only]
git commit -m "feat(task-XXX): description (corrected)"
```

### Create Sprint Tag
```bash
git tag sprint-XXX-complete
git push --tags
```

## 🚫 Anti-Patterns

```bash
# ❌ DON'T: Commit everything
git add .

# ❌ DON'T: Batch multiple tasks
git commit -m "Tasks 1-5 complete"

# ❌ DON'T: Skip validation commits
# (hiding failures = exponential token waste)

# ❌ DON'T: Commit without announcing
# (orchestrator must announce ALL git actions)
```

## 🎯 Golden Rules

1. **One task = One commit** (upon validation PASS)
2. **Track file ownership** (no cross-contamination)
3. **Announce all actions** (visibility required)
4. **Document failures** (honesty saves tokens)
5. **Integration separate** (own commits for cross-task fixes)

---
*Quick reference. Full details in GIT-COMMIT-STRATEGY.md*