# Task Execution Protocol

## Core Contract Structure

Every task follows this contract:

```markdown
## Task: [Clear, Specific Title]
**ID**: YYYYMMDD-HHMM-[descriptor]
**Duration**: 30 minutes max
**Assigned**: @[persona]
**Dependencies**: [none | task IDs]

### Objective
[One sentence describing what success looks like]

### Success Criteria
- [ ] Build passes with 0 errors
- [ ] Tests pass with >80% coverage
- [ ] Feature works as specified
- [ ] Evidence documented with proof
- [ ] Changes committed to git

### Context
[Brief context if needed]
```

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
2. Verify success criteria met
3. Check for integration issues
4. Proceed to next phase or complete

Remember: Tasks are contracts. Evidence is proof. Commits are mandatory.