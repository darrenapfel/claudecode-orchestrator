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
- [ ] Specific, measurable criterion
- [ ] Evidence documented
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

## What Was Accomplished
- Specific achievement 1
- Specific achievement 2

## How to Verify
1. Step to verify functionality
2. Expected result

## Artifacts
- Screenshot: [link]
- Log output: [snippet]
- Git commit: [hash]
```

## Convergence Protocol

When all parallel tasks complete:
1. Collect all evidence files
2. Verify success criteria met
3. Check for integration issues
4. Proceed to next phase or complete

Remember: Tasks are contracts. Evidence is proof. Commits are mandatory.