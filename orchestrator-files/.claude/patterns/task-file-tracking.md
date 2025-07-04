# Task File Tracking Pattern

## Overview
Ensures proper file isolation for task-level git commits. Each task must track its files to prevent cross-contamination in commits.

## File Tracking Requirements

### 1. Persona Responsibilities

Each persona MUST document in EVIDENCE.md:

```markdown
## Files Created
- src/auth/service.ts
- src/auth/types.ts
- tests/auth.test.ts

## Files Modified
- package.json (line 23: added bcrypt dependency)
- src/index.ts (lines 45-47: registered auth routes)
- tsconfig.json (line 12: added auth path alias)

## Files Read (Not Modified)
- src/config/database.ts
- src/types/user.ts
```

### 2. Orchestrator Tracking

The orchestrator maintains a map during execution:

```javascript
const taskFileTracking = {
  'task-20250104-1000-auth': {
    persona: '@software-engineer',
    created: [
      'src/auth/service.ts',
      'src/auth/types.ts',
      'tests/auth.test.ts'
    ],
    modified: [
      'package.json',
      'src/index.ts',
      'tsconfig.json'
    ],
    status: 'in-progress'
  },
  'task-20250104-1001-profile': {
    persona: '@software-engineer',
    created: ['src/profile/service.ts'],
    modified: ['package.json'], // Potential conflict!
    status: 'in-progress'
  }
};
```

### 3. Conflict Detection

Before committing, orchestrator checks for conflicts:

```javascript
function detectConflicts(taskFiles) {
  const allModified = {};
  const conflicts = [];
  
  for (const [taskId, files] of Object.entries(taskFiles)) {
    for (const file of files.modified) {
      if (allModified[file]) {
        conflicts.push({
          file,
          tasks: [allModified[file], taskId]
        });
      }
      allModified[file] = taskId;
    }
  }
  
  return conflicts;
}
```

## Handling Shared Files

### Package.json Conflicts

Most common shared file. Resolution strategy:

1. **First task commits their changes**
   ```bash
   git add package.json src/auth/*
   git commit -m "feat(task-001): auth with bcrypt dependency"
   ```

2. **Later tasks rebase before committing**
   ```bash
   git pull --rebase
   # Resolve any conflicts
   git add package.json src/profile/*
   git commit -m "feat(task-002): profile with uuid dependency"
   ```

3. **Orchestrator announces conflicts**
   ```
   ⚠️ SHARED FILE CONFLICT DETECTED:
   
   File: package.json
   Modified by: task-001-auth (committed)
   Also needs: task-002-profile (pending)
   
   Resolution: Will rebase task-002 changes after task-001 commit
   ```

### Configuration Files

For files like `tsconfig.json`, `.env.example`:

1. Group related changes in a single task when possible
2. If multiple tasks need changes, create an integration task
3. Document the specific lines changed

## File Categories

### 1. Task-Owned Files (Safe to Commit)
- Files created by the task
- Files only this task modifies
- Task-specific directories

### 2. Shared Project Files (Require Coordination)
- package.json
- tsconfig.json
- .env.example
- Root configuration files

### 3. Integration Files (Commit Separately)
- Files that connect multiple features
- Shared interfaces
- Central routers/registries

## Commit Isolation Rules

### DO:
```bash
# Commit only task-specific files
git add src/auth/* tests/auth/*
git commit -m "feat(task-001): authentication service"
```

### DON'T:
```bash
# Don't commit unrelated changes
git add . # BAD - includes files from other tasks
git commit -m "feat(task-001): auth and other stuff"
```

## Integration Commit Pattern

When multiple tasks need integration:

```bash
# After all tasks complete
git add src/index.ts src/router.ts
git commit -m "fix(integration): connect auth and profile services

Integration: sprint-001-integration
Connected services:
- Auth service to main router
- Profile service to auth middleware
Evidence: .work/milestones/.../integration/EVIDENCE.md"
```

## Validation Requirements

Test-engineer validates:
1. Each commit contains only files listed in EVIDENCE.md
2. No partial work from other tasks included
3. Shared files handled properly
4. Integration commits separate from feature commits

## Emergency Procedures

### Accidentally Committed Wrong Files

```bash
# Create a revert commit
git revert HEAD

# Re-commit with correct files
git add [correct files only]
git commit -m "feat(task-001): auth service (corrected)"
```

### Merge Conflicts During Rebase

```bash
# Orchestrator announces
🔧 RESOLVING MERGE CONFLICT...

Conflict in: package.json
Between: task-001 (bcrypt) and task-002 (uuid)
Resolution: Keeping both dependencies

# Fix and continue
git add package.json
git rebase --continue
```

---
*Track every file. Isolate every commit. Document every change.*