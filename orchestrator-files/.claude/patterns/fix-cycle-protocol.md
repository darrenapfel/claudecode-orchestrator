# Fix Cycle Protocol

## Overview
This document defines how to handle validation failures through structured fix cycles. Fix cycles ensure all issues are addressed systematically before progression.

## When Fix Cycles Trigger

Fix cycles are MANDATORY when:
- Any validator returns FAIL status
- Multiple validators return CONDITIONAL PASS
- Integration tests reveal cross-component issues
- Performance metrics fall below thresholds
- Security vulnerabilities discovered

## Fix Cycle Structure

```
.work/sprints/sprint-XXX/fixes/cycle-{number}/
├── tasks.md                    # List of all fix tasks
├── assignments.md              # Task-to-persona mapping
├── evidence/
│   ├── {task-id}/             # Evidence per fix task
│   │   ├── INTERFACE.md
│   │   ├── EVIDENCE.md
│   │   └── artifacts/
│   └── validation/            # Re-validation reports
└── summary.md                 # Cycle completion summary
```

## Fix Cycle Workflow

### 1. Failure Analysis (Orchestrator)
```markdown
## Fix Cycle 1 - Triggered by Validation Failures

### Failed Validations:
1. **Test Engineer**: CONDITIONAL PASS (74.5% pass rate)
   - Topics validation: 3 failures
   - Reports generation: 2 failures

2. **Security Engineer**: FAIL
   - Authentication edge cases not handled
   - Session management vulnerabilities

### Root Causes:
- Incomplete error handling
- Missing input validation
- Inadequate test coverage
```

### 2. Fix Task Creation (Orchestrator)

Create `.work/sprints/sprint-XXX/fixes/cycle-1/tasks.md`:
```markdown
# Fix Cycle 1 Tasks

## TASK-FIX-001: Fix Topics Validation
- **Assigned**: @software-engineer
- **Issues**: Required fields not validated, duplicate checks missing
- **Success Criteria**: All validation tests pass

## TASK-FIX-002: Secure Authentication Edge Cases  
- **Assigned**: @security-engineer
- **Issues**: Token refresh, session timeout, concurrent login
- **Success Criteria**: Security audit passes

## TASK-FIX-003: Increase Test Coverage
- **Assigned**: @sdet
- **Issues**: Coverage at 74.5%, need 80%+
- **Success Criteria**: Coverage > 80%, all tests green
```

### 3. Parallel Fix Execution

Each assigned persona:
1. Creates fix task directory
2. Implements fixes
3. Creates INTERFACE.md and EVIDENCE.md
4. Commits with fix cycle reference

### 4. Fix Validation (Mandatory)

After all fixes complete:
```markdown
## Fix Cycle 1 - Validation

### Re-run Original Validators:
- [ ] Test Engineer - Must achieve > 80% pass rate
- [ ] Security Engineer - Must pass all security checks
- [ ] Performance Engineer - Verify no regression
- [ ] Product Manager - Confirm fixes don't break features

### Additional Validation:
- [ ] Run full integration suite
- [ ] Verify all original features still work
- [ ] Check no new issues introduced
```

## Fix Task Naming Convention

```
TASK-FIX-{cycle}-{number}-{descriptor}

Examples:
- TASK-FIX-001-001-topics-validation
- TASK-FIX-001-002-auth-edge-cases
- TASK-FIX-002-001-performance-regression
```

## Evidence Requirements

Each fix task requires:

1. **Problem Statement**:
   ```markdown
   ## Problem
   - What failed: [specific test/validation]
   - Error message: [exact error]
   - Impact: [what this breaks]
   ```

2. **Solution Approach**:
   ```markdown
   ## Solution
   - Root cause: [why it failed]
   - Fix applied: [what was changed]
   - Prevention: [how to avoid recurrence]
   ```

3. **Verification**:
   ```markdown
   ## Verification
   Command: [test command]
   Before: [failing output]
   After: [passing output]
   ```

## Fix Cycle Completion

Create `.work/fixes/cycle-1/summary.md`:
```markdown
# Fix Cycle 1 Summary

## Issues Addressed
- Topics validation: ✅ Fixed (3/3 tests passing)
- Authentication edge cases: ✅ Secured
- Test coverage: ✅ Increased to 85.3%

## Validation Results
- Test Engineer: PASS (100% pass rate)
- Security Engineer: PASS (all vulnerabilities fixed)
- Performance Engineer: PASS (no regression)
- Product Manager: PASS (features intact)

## Commits
- fix: topics validation (hash: abc123)
- fix: auth edge cases (hash: def456)
- test: increase coverage (hash: ghi789)

## Lessons Learned
- Need better validation in initial implementation
- Security review should happen earlier
- Test coverage targets must be enforced
```

## Multiple Fix Cycles

If validation still fails after a fix cycle:

1. **Create cycle-2 directory**
2. **Analyze why fixes insufficient**
3. **Create new fix tasks**
4. **Consider architectural changes**
5. **Escalate if > 3 cycles**

## Success Criteria

Fix cycle is complete when:
- ✅ All fix tasks completed with evidence
- ✅ All original validators pass
- ✅ No regression in other areas
- ✅ Integration tests pass
- ✅ Summary documented

## Common Pitfalls

1. **Incomplete Fixes**: Address symptoms not root cause
2. **Missing Tests**: Fix code but not test coverage
3. **No Validation**: Skip re-running validators
4. **Poor Documentation**: No evidence of what was fixed
5. **Scope Creep**: Adding features during fixes

---
*Fix cycles restore system integrity. Never skip validation after fixes.*