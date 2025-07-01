# Task Execution Protocol

## Core Contract
Every task is a 30-minute contract with measurable outcomes.

See **TASK-EXECUTION-GUIDE.md** for complete execution details.

## System Requirements

1. **Parallel by Default**
   - Sequential only when dependencies require
   - Multiple tasks per persona allowed
   
2. **Evidence Mandatory**
   - INTERFACE.md for public contracts (v3.3)
   - EVIDENCE.md with proof
   - Git commit required

3. **Validation Protocol**
   - Checkpoint after each task
   - Integration after all tasks
   - Binary PASS/FAIL only

## Integration Convergence (v3.3)

**After parallel completion:**
1. Collect all INTERFACE.md files
2. Check compatibility
3. Run integration validation
4. Fix conflicts before proceeding

**No integration PASS = No progression**

## Baseline Integrity
- Capture metrics BEFORE changes
- All personas use same baseline
- Changes require justification
- Validator confirms metrics

## Automatic Failure Conditions

**These are NOT red flags - they are INSTANT FAILURES:**
- Evidence without actual command output → FAIL
- "Tests passing" without full test suite output → FAIL
- Screenshots without visible timestamps → FAIL
- EVIDENCE.md missing reproduction steps → FAIL
- Claiming "no errors" without console proof → FAIL
- Test coverage below 80% → FAIL
- Partial or truncated outputs → FAIL
- Cannot reproduce from provided steps → FAIL

**Recovery:** Create fix task with proper evidence requirements.

---
*Contracts define work. Evidence proves completion. Integration ensures success.*