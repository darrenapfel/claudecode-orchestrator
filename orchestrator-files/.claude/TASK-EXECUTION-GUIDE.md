# Task Execution Guide

## Overview
Single source of truth for task execution in orchestrator mode. Consolidates all execution protocols.

## Session Initialization

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
**Scope**: Single testable deliverable
**Assigned**: @[persona]
**Dependencies**: [none | task IDs]

### Baseline Metrics
- Tests: X passing of Y total
- Build: [passing/failing]
- [Other metrics as relevant]

### Success Criteria
- [ ] Feature implemented/fixed
- [ ] Tests pass (maintain baseline)
- [ ] Evidence documented
- [ ] Git commit created
- [ ] Checkpoint validation PASS
```

### 2. Task Execution (Assigned Persona)

**Folder Structure:**
```
.work/sprints/sprint-XXX/tasks/YYYYMMDD-ID/
├── INTERFACE.md    # Your public APIs/contracts (v3.3)
├── EVIDENCE.md     # Proof of completion
└── artifacts/      # Screenshots, reports
```

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

## Proof
\```bash
npm test
# 45/45 passing
\```

## Artifacts
- Screenshot: ./artifacts/feature.png

## Commit
- SHA: abc123
- Message: "feat: implement feature"
```

### 3. Checkpoint Validation (Orchestrator + Test Engineer + PM)

After EACH task:
1. Orchestrator reviews evidence
2. Checks metrics vs baseline
3. Invokes @test-engineer for technical validation
4. Invokes @product-manager for user story compliance
5. Binary PASS/FAIL decision
6. FAIL = Create fix task

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

1. **Orchestrator**: Create branch at start
2. **Each Persona**: Commit with evidence reference
3. **Format**: `feat: description\n\nTask: ID\nEvidence: path`
4. **End**: Orchestrator creates PR

## Evidence Standards

**Required for ALL tasks:**
- Command output showing success
- Metrics comparison to baseline
- Git commit SHA
- Validation confirmation

**Red Flags (require re-validation):**
- "Tests passing" without output
- Changed test counts
- Missing command results
- Vague success claims

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
- Integration validated? → Check
- User goals met? → Complete
- Goals not met? → New sprint

## Common Patterns

**Web App Tasks:**
1. Frontend → @software-engineer + @ux-designer
2. API → @software-engineer + @sdet
3. E2E Tests → @test-engineer
4. Always validate visually

**API Service:**
1. Implementation → @software-engineer
2. Tests → @sdet
3. Docs → @documentation-writer
4. Security → @security-engineer

**Bug Fix:**
1. Fix → @software-engineer
2. Tests → @sdet
3. Validation → @test-engineer + @product-manager

---
*One guide. Clear ownership. Verified execution.*