# Git Commit Strategy - Master Reference

This is the authoritative git strategy for the orchestration system. All other git-related documents should reference this file.

## Core Principles

1. **Task-Level Commits**: Every task commits independently upon validation PASS
2. **File Isolation**: Each commit includes ONLY files from that specific task
3. **Integration Commits**: Separate commits for cross-task integration fixes
4. **Visible Actions**: Orchestrator announces ALL git actions in chat
5. **Honest History**: Commit validation failures and fix cycles

## Orchestrator Git Responsibilities

### 1. Milestone Initialization (CRITICAL)

The orchestrator MUST announce and execute:

```markdown
🔧 INITIALIZING GIT REPOSITORY...

Checking git status...
[If no .git found]
> Initializing git repository: `git init`
> Creating .gitignore file FIRST
> Making initial commit: `git add .gitignore && git commit -m "chore: initialize repository with .gitignore"`

Creating milestone branch...
> git checkout -b milestone/20250104-local-development
> Branch created and checked out ✓

Git repository ready for milestone work.
```

### 2. Task-Level Commit Protocol

After EACH task validation PASS:

```markdown
📦 COMMITTING TASK RESULTS...

Task: 20250104-1000-auth-implementation
Status: Validation PASSED ✓
Files to commit:
  - src/services/auth.ts (created)
  - src/services/auth.test.ts (created)
  - package.json (modified)

> git add src/services/auth.ts src/services/auth.test.ts package.json
> git commit -m "feat(task-20250104-1000): implement authentication service

Task: 20250104-1000-auth-implementation
Assigned: @software-engineer
Evidence: .work/milestones/20250104-local-dev/sprint-001/tasks/20250104-1000/EVIDENCE.md
Tests: 15/15 passing
Coverage: 87%

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: Software Engineer <noreply@anthropic.com>"

✓ Task committed successfully (SHA: abc123def)
```

### 3. Validation Failure Commits

After validation failures:

```markdown
🔍 COMMITTING VALIDATION RESULTS...

Validation-1 Status: 12 failures found
> git add .work/milestones/.../sprint-001/validation-1/
> git commit -m "test(validation-1): document 12 failures in sprint-001

Failures documented for fix cycle
Evidence: .work/milestones/.../sprint-001/validation-1/test-report.md"

✓ Validation results committed (SHA: def456abc)
```

### 4. Integration Fix Commits

After integration fixes:

```markdown
🔧 COMMITTING INTEGRATION FIXES...

Integration issues resolved: 3
Files affected:
  - src/services/auth.ts (modified)
  - src/services/profile.ts (modified)
  - src/middleware/context.ts (created)

> git add src/services/auth.ts src/services/profile.ts src/middleware/context.ts
> git commit -m "fix(integration): resolve auth/profile service conflicts

Integration: sprint-001-cycle-1
Issues fixed:
- Auth context not available to profile service
- Token refresh race condition
- Middleware initialization order

Evidence: .work/milestones/.../sprint-001/fixes/cycle-1/EVIDENCE.md"

✓ Integration fixes committed (SHA: 789abcdef)
```

## Commit Message Format

### Task Commits
```
<type>(task-<id>): <description>

Task: <full-task-id>
Assigned: @<persona>
Evidence: <path-to-evidence>
<metrics>

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: <Persona> <noreply@anthropic.com>
```

### Validation Commits
```
test(validation-<n>): <status> in <sprint>

<Details of validation results>
Evidence: <path-to-validation-report>
```

### Fix Commits
```
fix(<scope>): <what-was-fixed>

<Fix details>
Evidence: <path-to-fix-evidence>
```

## File Tracking Requirements

### In EVIDENCE.md (MANDATORY)
```markdown
## Files Created
- src/auth/service.ts
- src/auth/service.test.ts
- docs/auth-api.md

## Files Modified  
- package.json (added dependencies: bcrypt, jsonwebtoken)
- src/index.ts (added auth route registration)

## Potential Conflicts
- None identified
```

### Orchestrator Tracking
The orchestrator maintains:
```javascript
const taskFileMap = {
  'task-20250104-1000': {
    created: ['src/auth/service.ts', 'src/auth/service.test.ts'],
    modified: ['package.json', 'src/index.ts'],
    persona: 'software-engineer'
  }
};
```

## Git Gate Checks

### Before Starting Development
```markdown
📋 GIT INITIALIZATION CHECKLIST:
- [ ] Git repository exists (.git directory found)
- [ ] .gitignore created and committed FIRST
- [ ] On milestone branch (not main)
- [ ] No uncommitted changes from previous work
```

### Before Task Assignment
```markdown
📋 PRE-TASK GIT CHECK:
- [ ] Current branch is milestone branch
- [ ] No uncommitted changes
- [ ] Previous task properly committed
```

### Sprint Completion
```markdown
📋 SPRINT COMPLETION GIT CHECK:
- [ ] All tasks committed
- [ ] All validation results committed
- [ ] All fix cycles committed
- [ ] Sprint summary committed
- [ ] Tag created: sprint-XXX-complete
```

## Integration with Other Systems

### Directory Structure
Task commits reference evidence in:
`.work/milestones/{milestone}/sprint-XXX/tasks/{task-id}/EVIDENCE.md`

### Validation Process
Validation includes checking:
- Files listed in EVIDENCE.md match committed files
- No files from other tasks included
- Commit message follows format

### Fix Cycles
Each fix cycle gets its own commit with clear attribution

## Common Scenarios

### Shared File Modifications
When multiple tasks modify package.json:
1. First task commits their changes
2. Later tasks rebase before committing
3. Orchestrator handles merge conflicts

### Failed Validations
```bash
# Task completes
git commit -m "feat(task-001): implement feature"

# Validation fails
git commit -m "test(validation-1): 3 failures in task-001"

# Fixes applied
git commit -m "fix(task-001): resolve validation failures"

# Validation passes
git commit -m "test(validation-2): all tests passing"
```

### Emergency Rollback
```bash
# Identify problem commit
git log --oneline

# Revert specific task
git revert <task-commit-sha>

# Or reset to last known good state
git reset --hard <good-commit-sha>
```

## Anti-Patterns to Avoid

### ❌ DON'T: Batch commits
```bash
# BAD - loses task isolation
git commit -m "Tasks 1-5 complete"
```

### ❌ DON'T: Commit partial work
```bash
# BAD - task-002 not ready
git add .
git commit -m "feat(task-001): auth done, profile WIP"
```

### ❌ DON'T: Skip validation commits
```bash
# BAD - hiding failures
# Only committing when everything passes
```

### ❌ DON'T: Silent git operations
```bash
# BAD - no user visibility
# Performing commits without announcing
```

## Quick Reference Commands

```bash
# Check current state
git status
git branch
git log --oneline -10

# Task commit
git add <specific-files>
git commit -m "feat(task-XXX): description..."

# Integration fix
git add <affected-files>
git commit -m "fix(integration): description..."

# Create sprint tag
git tag sprint-XXX-complete

# Create PR (end of milestone)
gh pr create --title "Milestone: ..." --body "..."
```

---
*Task isolation. Visible actions. Honest history.*
