# Git Troubleshooting Guide

For git workflow details see: **`GIT-COMMIT-STRATEGY.md`**

## Common Issues & Solutions

### 1. No Git Repository Found

**Problem**: Orchestrator can't find .git directory
```
fatal: not a git repository (or any of the parent directories): .git
```

**Solution**:
```bash
# Initialize repository
git init

# Create .gitignore FIRST
echo "node_modules/\n.env\ndist/\nbuild/" > .gitignore

# Make initial commit
git add .gitignore
git commit -m "chore: initialize repository with .gitignore"

# Create milestone branch
git checkout -b milestone/YYYYMMDD-name
```

### 2. Shared File Conflicts (package.json)

**Problem**: Multiple tasks modify the same file
```
error: Your local changes to the following files would be overwritten
```

**Solution**:
```bash
# Task 1 commits first
git add package.json src/feature1/*
git commit -m "feat(task-001): feature with dependencies"

# Task 2 rebases before committing
git pull --rebase origin milestone/current
# Resolve conflicts in editor
git add package.json
git rebase --continue

# Then commit task 2
git add src/feature2/*
git commit -m "feat(task-002): feature with additional deps"
```

### 3. Wrong Files Committed

**Problem**: Accidentally included files from other tasks
```
[task-001 commit includes task-002 files]
```

**Solution**:
```bash
# Option 1: Revert and recommit
git revert HEAD
git add [correct files only]
git commit -m "feat(task-001): description (corrected)"

# Option 2: Amend if not pushed
git reset HEAD~1
git add [correct files only]
git commit -m "feat(task-001): description"
```

### 4. Merge Conflicts During Integration

**Problem**: Integration step reveals conflicts
```
CONFLICT (content): Merge conflict in src/index.ts
```

**Solution**:
```bash
# Orchestrator announces in chat
🔧 RESOLVING INTEGRATION CONFLICT...

# Fix conflicts manually
# Look for <<<<<<< HEAD markers
# Keep both changes usually

git add src/index.ts
git commit -m "fix(integration): resolve service conflicts

Integration: sprint-XXX-integration
Resolved conflicts in index.ts between auth and profile services"
```

### 5. Validation Commit Failed

**Problem**: Can't commit validation results
```
nothing to commit, working tree clean
```

**Solution**:
```bash
# Ensure validation files exist
ls .work/milestones/*/sprint-*/validation-1/

# Force add if needed
git add -f .work/milestones/*/sprint-*/validation-1/*
git commit -m "test(validation-1): document failures"
```

### 6. Branch Diverged from Remote

**Problem**: Local and remote branches diverged
```
Your branch and 'origin/milestone/...' have diverged
```

**Solution**:
```bash
# If local changes are correct
git push --force-with-lease

# If remote is correct
git fetch origin
git reset --hard origin/milestone/current

# To merge both
git pull --rebase
# Resolve conflicts
git push
```

### 7. Lost Commits

**Problem**: Important commits seem missing
```
Can't find commit for task-XXX
```

**Solution**:
```bash
# Check reflog
git reflog | grep "task-XXX"

# Recover commit
git cherry-pick <commit-sha>

# Or check all branches
git log --all --grep="task-XXX"
```

### 8. Permission Denied on Push

**Problem**: Can't push to repository
```
Permission denied (publickey)
fatal: Could not read from remote repository
```

**Solution**:
```bash
# Check remote URL
git remote -v

# For HTTPS (recommended)
git remote set-url origin https://github.com/user/repo.git

# Authenticate with token
git config credential.helper store
# Enter username and personal access token when prompted
```

### 9. Large Files Blocking Commit

**Problem**: File too large for git
```
error: File src/data/large.json is 105.23 MB; this exceeds GitHub's file size limit
```

**Solution**:
```bash
# Add to .gitignore
echo "src/data/large.json" >> .gitignore

# Remove from tracking
git rm --cached src/data/large.json

# Consider git-lfs for large files
git lfs track "*.json"
git add .gitattributes
```

### 10. Pre-commit Hook Failures

**Problem**: Commit blocked by hooks
```
Pre-commit hook failed
```

**Solution**:
```bash
# Fix the issues reported
npm run lint:fix
npm run format

# Or temporarily bypass (NOT RECOMMENDED)
git commit --no-verify -m "message"

# Better: Fix and include in commit
npm run lint:fix
git add .
git commit -m "feat(task): implement with lint fixes"
```

## Prevention Tips

### 1. Always Check Status First
```bash
git status
git branch
git log --oneline -5
```

### 2. Use Specific File Adds
```bash
# Good
git add src/feature/* tests/feature/*

# Bad
git add .
```

### 3. Review Before Committing
```bash
git diff --staged
git status
```

### 4. Maintain Clean Working Directory
```bash
# Stash unrelated changes
git stash push -m "WIP: other feature"

# Work on current task
git add [task files]
git commit -m "feat(task): description"

# Restore stashed work
git stash pop
```

### 5. Tag Important Points
```bash
# After successful validation
git tag validation-1-pass

# After sprint completion
git tag sprint-001-complete
```

## Emergency Procedures

### Nuclear Option: Start Fresh
```bash
# ONLY if everything is broken
# Save your work first!
cp -r src /tmp/backup-src

# Reset to last known good state
git fetch origin
git reset --hard origin/main

# Reapply work carefully
cp -r /tmp/backup-src/* src/
git add [files]
git commit -m "restore: working state"
```

### Getting Help
If these solutions don't work:
1. Check git status and branch
2. Review recent commits with git log
3. Look for error messages in git output
4. Reference GIT-COMMIT-STRATEGY.md for correct workflow

---
*When in doubt, check status. When confused, check logs. When stuck, ask for help.*