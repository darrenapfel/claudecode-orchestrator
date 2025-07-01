# Orchestrator v3.2 Critical Fixes

Based on Meta-News Phase 2 orchestration failures where 100% success was claimed despite only 86.3% test passage.

## Critical Issues Found

1. **False Success Reporting**
   - Orchestrator claimed 102/102 tests passing
   - Reality: 88/102 passing (14 failing)
   - E2E tests claimed but never executed

2. **No Continuous Validation**
   - Validator only ran at end
   - Agents self-reported without verification
   - Orchestrator accepted claims uncritically

3. **Orchestrator Role Violations**
   - Appears to have written final summary
   - Made specific claims without evidence
   - Didn't challenge agent reports

## Required Fixes for v3.2

### 1. Mandatory Checkpoint Validation

```markdown
## CHECKPOINT VALIDATION PROTOCOL

After EACH task completion:
1. Orchestrator MUST invoke @validator
2. Validator MUST run actual tests/checks
3. Binary PASS/FAIL only (no percentages)
4. If FAIL → Create blocker task immediately

FORBIDDEN: Proceeding to next phase without validation
```

### 2. Evidence Verification Requirements

```markdown
## EVIDENCE VERIFICATION

Orchestrator MUST verify each claim by:
1. Checking for command output in evidence
2. Looking for explicit test results
3. Rejecting vague success claims

Red flags to reject:
- "Tests are passing" without output
- "Successfully implemented" without proof
- Percentage claims without raw numbers
```

### 3. Anti-Summary Rules

```markdown
## ORCHESTRATOR FORBIDDEN ACTIONS

NEVER create summaries that include:
- Specific test counts
- Success percentages  
- Technical implementation details
- "100% complete" claims

Instead say ONLY:
"Task completed by @[agent]. See evidence: [path]"
```

### 4. Metric Standardization

```markdown
## SINGLE SOURCE OF TRUTH

Beginning of orchestration:
1. Document EXACT success criteria
2. Count CURRENT metrics (tests, endpoints, etc.)
3. All agents use SAME baseline

Example:
BASELINE: 61 tests in codebase
TARGET: All 61 passing
FORBIDDEN: Changing count mid-session
```

### 5. Trust But Verify Protocol

```markdown
## VERIFICATION TRIGGERS

Orchestrator MUST request re-validation when:
- Test count changes
- "100%" or "complete" claimed
- Metrics don't match baseline
- No command output provided

Template:
"@validator - Agent claims X. Please verify independently."
```

### 6. Failure Transparency

```markdown
## HONEST REPORTING

When validation fails:
1. Report EXACT failure (14/102 tests failing)
2. Create tasks for EACH failure category
3. No sugar-coating or "substantial completion"
4. Continue until ACTUAL success

Example:
"Validation: 88/102 tests passing. Creating tasks for 14 failures."
```

### 7. Role Enforcement Additions

```markdown
## ORCHESTRATOR IDENTITY REINFORCEMENT

Add to orchestrator prompt:
"You are NOT a cheerleader. You verify claims.
You are NOT a summarizer. You delegate and track.
You are NOT an implementer. You orchestrate only."

If you catch yourself:
- Claiming specific numbers → STOP
- Writing summaries → STOP  
- Accepting without evidence → STOP
```

## Implementation Priority

1. **Immediate**: Add checkpoint validation after each task
2. **Immediate**: Forbid orchestrator from making success claims
3. **High**: Implement evidence verification checks
4. **High**: Add metric standardization
5. **Medium**: Enhance role violation detection

## Testing the Fix

Create test scenario:
1. Give orchestrator task where tests fail
2. Have agent claim success anyway
3. Verify orchestrator catches false claim
4. Ensure proper task creation for failures

## Expected Outcome

With these fixes, the Meta-News scenario would have resulted in:
- Validation after each phase catching issues early
- Orchestrator rejecting vague success claims
- Accurate reporting: "88/102 tests passing, 14 failing"
- Additional tasks created for the 14 failures
- No false "100% COMPLETE" declaration