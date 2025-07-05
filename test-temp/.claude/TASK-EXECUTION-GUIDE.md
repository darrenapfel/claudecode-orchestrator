# Task Execution Guide

## Overview
Single source of truth for task execution in orchestrator mode. Consolidates all execution protocols.

## Session Initialization

### Mandatory Milestone Setup
1. **Create Milestone Directory**: `.work/milestones/YYYYMMDD-{milestone-name}/`
2. **Initialize Milestone Plan**: Create `milestone-plan.md` with goals and success criteria
3. **Update PROJECT-STATE.md**: Add milestone ID and status

For complete directory structure, see: `.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md`

### Discovery Step (Optional, ONE-TIME)
When user requests are vague ("build me a...", "create an app that..."), execute Discovery Step ONCE at session start:

1. **Parallel Question Generation**: 6 personas ask 0-3 clarifying questions each
2. **Consolidation**: Orchestrator merges and presents max 15-18 questions
3. **Storage**: Save responses in `.work/discovery/` for ALL sprints to reference
4. **Never Repeat**: Discovery runs ONCE per session, applies to all milestones

See `.claude/patterns/discovery-process.md` for detailed execution.

## Task Lifecycle

### 1. Task Creation (Orchestrator)
```markdown
## Task: [Clear Title]
**ID**: YYYYMMDD-HHMM-[descriptor]
**Sprint**: sprint-XXX
**Scope**: Single testable deliverable
**Assigned**: @[persona]
**Dependencies**: [none | task IDs]

### Baseline Metrics (MANDATORY)
- Tests: X passing of Y total (must show actual output)
- Build: [passing/failing] (with timestamp)
- Coverage: XX% (if applicable)
- [Other metrics as relevant]

### Success Criteria
- [ ] Feature implemented/fixed
- [ ] Tests pass (maintain or improve baseline)
- [ ] Evidence documented with reproducible commands
- [ ] Git commit created with evidence reference
- [ ] Checkpoint validation PASS (no falsification)
```

### 2. Task Execution (Assigned Persona)

**Folder Structure:**
See `.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md` for authoritative structure.

Task location: `.work/milestones/{current}/sprint-XXX/tasks/YYYYMMDD-HHMM-{descriptor}/`

**INTERFACE.md Requirements:**
- MUST be created for EVERY task
- Defines all public contracts exposed by the task
- Located IN the task directory (not elsewhere)
- Even if task has no public APIs, document internal interfaces

**INTERFACE.md Template (NEW for v3.3):**
```markdown
## Public APIs
- GET /api/resource → {data}
- function getData() → Promise<Data>

## Dependencies
- Database connection required
- Auth service must be running

## Environment
- PORT=3000
- DATABASE_URL required
```

**EVIDENCE.md Template:**
```markdown
# Evidence: [Task ID]

## Metrics
- Baseline: X tests passing
- Current: Y tests passing  
- Delta: +Z tests

## Files Created (MANDATORY for git commits)
- src/services/auth.ts
- src/services/auth.test.ts
- docs/api/auth-endpoints.md

## Files Modified (MANDATORY for git commits)
- package.json (added bcrypt, jsonwebtoken dependencies)
- src/index.ts (registered auth routes)
- README.md (added auth setup instructions)

## Potential Conflicts
- None identified / List any files that other tasks might also modify

## Proof (MANDATORY - Full Output Required)
\```bash
$ npm test

> project@1.0.0 test
> jest --coverage

 PASS  src/auth.test.ts
  Auth Service
    ✓ should hash passwords (23 ms)
    ✓ should validate login (15 ms)
    ✓ should reject invalid credentials (8 ms)

Test Suites: 15 passed, 15 total
Tests:       45 passed, 45 total
Snapshots:   0 total
Time:        3.241 s
Coverage: 87% statements
\```

## Artifacts
- Test output: ./artifacts/test-output-YYYYMMDD-HHMM.txt
- Screenshot: ./artifacts/feature-YYYYMMDD-HHMM.png
- Coverage report: ./artifacts/coverage/index.html

## Git Commit Info
- Will be committed by orchestrator after validation PASS
- Commit will include ONLY files listed above
- Reference: `.claude/patterns/GIT-COMMIT-STRATEGY.md`
```

### 3. Checkpoint Validation (Orchestrator + Test Engineer + PM)

After EACH task:
1. Orchestrator reviews evidence (MUST include full command output)
2. Checks metrics vs baseline (regression = automatic FAIL)
3. Invokes @test-engineer for technical validation
   - Test engineer MUST re-run tests independently
   - Compare output character-by-character
4. Invokes @product-manager for user story compliance
5. Binary PASS/FAIL decision (no "partial" success)
6. FAIL = Create fix task immediately in `.work/milestones/YYYYMMDD-{milestone}/sprint-XXX/fixes/cycle-N/`

### 4. Integration Convergence (NEW v3.3)

After ALL parallel tasks:
1. Collect all INTERFACE.md files
2. Create integration validation task
3. Assign to @test-engineer
4. Verify cross-component compatibility
5. MUST PASS before proceeding

## Who Does What

| Role | Creates | Validates |
|------|---------|-----------|
| Orchestrator | Tasks, .work structure | Checkpoints |
| Personas | INTERFACE.md, EVIDENCE.md | Own work |
| Product-Manager | User stories, golden path validation | User experience |
| Test-Engineer | Integration tests | System integration |

## Git Protocol

1. **Orchestrator**: Initialize repo and create milestone branch
2. **Orchestrator**: Announce ALL git actions in chat
3. **Each Task**: Commit immediately after validation PASS
4. **File Isolation**: Only commit files listed in EVIDENCE.md
5. **Validation Failures**: Commit validation reports
6. **Fix Cycles**: Separate commits for each fix cycle
7. **End of Milestone**: Create PR for review

**See**: `.claude/patterns/GIT-COMMIT-STRATEGY.md` for detailed protocol

## Evidence Standards

**Required for ALL tasks:**
- Command output showing success
- Metrics comparison to baseline
- Git commit SHA
- Validation confirmation

**Red Flags (AUTOMATIC REJECTION):**
- "Tests passing" without showing full output
- Test count changes without explanation
- Missing command results or truncated output
- Vague success claims ("works as expected")
- Screenshots without timestamps
- Coverage drops without justification
- "No errors" without console output
- Skipped validation steps to "save time"

## Integration Requirements (v3.3)

**Every parallel stream MUST provide:**
- INTERFACE.md with public contracts
- Compatible API definitions
- No conflicting routes/namespaces
- Clear dependency declarations

**Integration validation checks:**
- Cross-component API calls work
- No namespace collisions
- Auth/security integrated
- Data flows correctly
- E2E scenarios pass

## Quick Decision Tree

**Task Complete?**
- Evidence provided? → Check
- Metrics match baseline? → Check  
- Git commit created? → Check
- Validation PASS? → Continue
- Any FAIL? → Create fix task

**All Tasks Complete?**
- Integration validated? → Check (with full test output)
- Fix cycles completed? → Check (normal and expected)
- User goals met? → Complete
- Goals not met? → New sprint

**Fix Cycle Protocol:**
```
Fix Cycle 1: 8 failures → Fix → 3 failures
Fix Cycle 2: 3 failures → Fix → 0 failures ✓
DOCUMENT BOTH CYCLES - This is honest development
```

## Common Patterns

**Web App Tasks:**
1. Frontend → @software-engineer + @ux-designer
2. API → @software-engineer + @sdet
3. E2E Tests → @test-engineer
4. Integration → @integration-engineer (expects failures)
5. Fix cycles → @software-engineer (1-3 cycles normal)
6. Final validation → @test-engineer (must show passing)

**API Service:**
1. Implementation → @software-engineer
2. Tests → @sdet (with coverage report)
3. Docs → @documentation-writer
4. Security → @security-engineer (with scan output)
5. Integration → @integration-engineer

**Bug Fix:**
1. Reproduce → @sdet (show failing test)
2. Fix → @software-engineer
3. Verify → @sdet (show passing test)
4. Validation → @test-engineer + @product-manager

## Sprint-Based Evidence Tracking

**Sprint Structure:**
See `.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md` for complete structure.

Key points:
- Sprints live under milestones
- Validations are numbered (validation-1, validation-2...)
- Fix cycles between validations (cycle-1, cycle-2...)

**Honest Metrics Example:**
```
Sprint 001 Summary:
- Tasks: 12 completed
- Initial failures: 23
- Fix cycles: 2
- Final state: All tests passing
- Token cost: SAVED by fixing early
```

---
*Honesty in validation. Evidence in execution. Quality through truth.*
