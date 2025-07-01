# Task Execution Protocol

## Core Contract Structure

Every task follows this contract:

```markdown
## Task: [Clear, Specific Title]
**ID**: YYYYMMDD-HHMM-[descriptor]
**Duration**: 30 minutes max
**Assigned**: @[persona]
**Dependencies**: [none | task IDs]

### Baseline Metrics (MANDATORY)
**Document BEFORE any changes:**
- Test count: [exact number from test output]
- Passing tests: [exact number]
- Build status: [passing/failing]
- Other metrics: [as relevant]

### Objective
[One sentence describing what success looks like]

### Success Criteria
- [ ] Build passes with 0 errors
- [ ] Tests remain at baseline or improve
- [ ] Feature works as specified
- [ ] Evidence documented with proof
- [ ] Changes committed to git
- [ ] Validator checkpoint PASSED

### Context
[Brief context if needed]
```

## CRITICAL: Single Source of Truth
- Baseline metrics MUST be captured at start
- All agents use SAME baseline throughout session
- Test count changes require justification
- Orchestrator verifies metrics consistency

## Execution Rules

1. **Tasks execute in parallel** unless dependencies exist
2. **Every task produces evidence** (EVIDENCE.md + git commit)
3. **30 minutes maximum** per task
4. **Clear ownership** - one persona per task
5. **Measurable outcomes** - no ambiguity

## Evidence Format

```markdown
# Task Evidence: [Task Title]

## Commands Executed
```bash
npm run build  # Exit: 0
npm test      # 45/45 passing
npm start &   # Running on port 3000
```

## Proof of Functionality
- Screenshot: [actual screenshot required]
- Server response: [curl output]
- Test results: [coverage report]

## Git Commit
- Hash: abc123def
- All changes included
- CI/CD status: passing
```

## STRUCTURAL ENFORCEMENT
The system MUST enforce:
1. Task tool requires persona parameter (no generic execution)
2. Personas auto-loaded with independence context
3. Work directories auto-created per task
4. Evidence format validated (commands + output required)

These are NOT guidelines - they are system requirements.

## Convergence Protocol

When all parallel tasks complete:
1. Collect all evidence files
2. Run @validator for phase validation
3. Verify ALL baselines maintained/improved
4. Check for integration issues
5. Only proceed if validation PASSES

## Checkpoint Protocol (NEW)

After EACH task completes:
1. Orchestrator reviews evidence
2. Checks metrics vs baseline
3. Invokes @validator for checkpoint
4. Task only "complete" if validation PASSES
5. FAIL = Create fix task immediately

Remember: Tasks are contracts. Evidence is proof. Validation is mandatory.