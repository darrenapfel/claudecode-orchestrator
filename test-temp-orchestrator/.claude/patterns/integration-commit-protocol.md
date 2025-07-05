# Integration Commit Protocol

## Overview
Defines how to handle commits that integrate work from multiple tasks. These commits are separate from task commits and have their own evidence requirements.

## When Integration Commits Are Needed

### 1. Cross-Task Dependencies
When task A creates a service that task B needs to use:
```javascript
// Task A created auth service
// Task B created profile service
// Integration: Connect profile to use auth
```

### 2. Shared Configuration
When multiple tasks modify shared configuration:
```javascript
// Task A added auth routes
// Task B added profile routes
// Integration: Merge route configurations
```

### 3. Fix Cycles
When validation reveals integration issues:
```javascript
// Validation found auth token not passed to profile
// Integration: Add auth middleware to profile routes
```

## Integration Commit Format

### Standard Format
```bash
git commit -m "fix(integration): <what was integrated>

Integration: <sprint>-integration-<number>
Tasks integrated:
- <task-1-id>: <what it provides>
- <task-2-id>: <what it needs>

Changes:
- <specific change 1>
- <specific change 2>

Evidence: .work/milestones/{milestone}/sprint-XXX/integration/EVIDENCE.md"
```

### Example Commits

#### Connecting Services
```bash
git commit -m "fix(integration): connect auth service to profile endpoints

Integration: sprint-001-integration-1
Tasks integrated:
- task-20250104-1000-auth: Provides JWT validation
- task-20250104-1001-profile: Needs authenticated user

Changes:
- Added auth middleware to profile routes
- Passed user context from auth to profile service
- Updated profile types to include user reference

Evidence: .work/milestones/20250104-local-dev/sprint-001/integration/EVIDENCE.md"
```

#### Resolving Conflicts
```bash
git commit -m "fix(integration): resolve database connection conflicts

Integration: sprint-001-integration-2
Tasks integrated:
- task-20250104-1000-auth: Uses database for users
- task-20250104-1002-posts: Uses database for content

Changes:
- Created shared database connection pool
- Updated both services to use shared pool
- Added connection error handling

Evidence: .work/milestones/20250104-local-dev/sprint-001/integration/fix-1.md"
```

## Integration Evidence Requirements

### EVIDENCE.md for Integration
```markdown
# Integration Evidence

## Integration Scope
Connecting: [Service A] ← → [Service B]
Issue: [What wasn't working]
Solution: [How it was fixed]

## Files Modified
- src/middleware/auth.ts (added profile route handling)
- src/services/profile.ts (added auth context import)
- src/routes/index.ts (connected both route sets)

## Validation
Before integration:
\```bash
npm test -- --testNamePattern="profile"
FAIL: Cannot read property 'userId' of undefined
\```

After integration:
\```bash
npm test -- --testNamePattern="profile"
PASS: All profile tests passing with auth
\```

## Integration Tests Added
- tests/integration/auth-profile.test.ts
```

## Orchestrator Integration Workflow

### 1. Detect Integration Need
```markdown
🔍 CHECKING INTEGRATION...

Analyzing task outputs:
- task-001: Created auth service ✓
- task-002: Created profile service ✓
- task-003: Created dashboard UI ✓

Integration needs detected:
- Profile service needs auth context
- Dashboard needs both services
```

### 2. Create Integration Task
```markdown
📦 CREATING INTEGRATION TASK...

Task: 20250104-1500-integration-1
Type: Integration
Scope: Connect auth → profile → dashboard
Assigned: @integration-engineer
```

### 3. Commit Integration Work
```markdown
🔧 COMMITTING INTEGRATION FIXES...

Files modified:
- src/middleware/auth.ts
- src/services/profile.ts
- src/routes/index.ts

> git add [files above]
> git commit -m "fix(integration): connect auth to profile service..."
✓ Integration committed (SHA: abc123)
```

## Fix Cycle Integration Commits

### After Validation Failures
```bash
# Validation found 3 integration issues
git commit -m "test(validation-1): 3 integration failures in sprint-001

Failures:
1. Auth token not passed to profile
2. Profile expects different user format
3. Dashboard can't access profile data

Evidence: .work/milestones/.../validation-1/test-report.md"

# After fixes applied
git commit -m "fix(integration): resolve validation-1 integration issues

Fix-Cycle: 1
Issues resolved: 3/3
- Added token propagation
- Standardized user interface
- Connected dashboard to services

Evidence: .work/milestones/.../fixes/cycle-1/EVIDENCE.md"
```

## Integration Anti-Patterns

### ❌ DON'T: Mix Integration with Features
```bash
# BAD - Mixes new feature with integration
git commit -m "feat: add admin panel and fix auth integration"
```

### ❌ DON'T: Vague Integration Messages
```bash
# BAD - No detail about what was integrated
git commit -m "fix: integration stuff"
```

### ❌ DON'T: Skip Integration Evidence
```bash
# BAD - No evidence of what was fixed
git commit -m "fix(integration): connected services"
```

## Integration Success Metrics

Track in sprint summary:
- Number of integration issues found
- Fix cycles required
- Integration test coverage
- Cross-component test results

## Quick Reference

1. **Detect** - Orchestrator identifies integration needs
2. **Assign** - Create integration task for @integration-engineer
3. **Fix** - Make minimal changes to connect components
4. **Test** - Verify integration with specific tests
5. **Commit** - Separate commit with full evidence
6. **Validate** - Ensure all components work together

---
*Integration commits connect the pieces. Keep them isolated and documented.*
