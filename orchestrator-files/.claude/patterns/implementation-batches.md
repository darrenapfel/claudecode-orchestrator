# Implementation Batches Pattern

## Overview
This document defines how the orchestrator plans and manages implementation batches. Batches enable parallel execution while respecting dependencies.

## Batch Planning Process

### 1. Dependency Analysis (Orchestrator)
After receiving DEPENDENCIES.md from architect:

```markdown
## Dependency Analysis for Implementation

### Tier 1 - No Dependencies (Batch 1):
- Environment setup
- Database schema
- Mock services
- Shared utilities

### Tier 2 - Basic Dependencies (Batch 2):
- Authentication (needs: database)
- Topics (needs: database)
- Reports (needs: database, mocks)

### Tier 3 - Complex Dependencies (Batch 3):
- Admin panel (needs: auth, topics)
- Analytics (needs: reports, topics)
- Notifications (needs: auth, events)
```

### 2. Batch Creation (Orchestrator)

Create `.work/sprints/sprint-XXX/implementation/batch-1/summary.md` BEFORE delegation:

```markdown
# Implementation Batch 1 Summary

## Batch Objectives
Establish foundational infrastructure and services with no dependencies.

## Planned Tasks

### TASK-001: Environment Setup
- **Assigned**: @software-engineer-1
- **Deliverables**: .env setup, docker config, scripts
- **Dependencies**: None

### TASK-002: Database Schema  
- **Assigned**: @software-engineer-2
- **Deliverables**: Prisma schema, migrations, seed data
- **Dependencies**: None

### TASK-003: Mock Services
- **Assigned**: @software-engineer-3
- **Deliverables**: AI service mocks, payment mocks
- **Dependencies**: None

## Success Criteria
- [ ] All services can run independently
- [ ] Database migrations execute cleanly
- [ ] Mock services return expected data
- [ ] No import cycles between components

## Timeline
- Start: HH:MM
- Expected Completion: HH:MM+30
- Integration Check: HH:MM+35
```

### 3. Post-Batch Update (Orchestrator)

After all tasks complete, UPDATE the summary:

```markdown
# Implementation Batch 1 Summary

## Batch Objectives
✅ Establish foundational infrastructure and services with no dependencies.

## Completed Tasks

### TASK-001: Environment Setup ✅
- **Assigned**: @software-engineer-1
- **Status**: COMPLETE
- **Evidence**: .work/tasks/20250703-1400-env-setup/EVIDENCE.md
- **Commit**: abc123

### TASK-002: Database Schema ✅
- **Assigned**: @software-engineer-2
- **Status**: COMPLETE
- **Evidence**: .work/tasks/20250703-1400-db-schema/EVIDENCE.md
- **Commit**: def456

### TASK-003: Mock Services ✅
- **Assigned**: @software-engineer-3
- **Status**: COMPLETE
- **Evidence**: .work/tasks/20250703-1400-mock-services/EVIDENCE.md
- **Commit**: ghi789

## Integration Results
- ✅ All services run independently
- ✅ Database migrations successful
- ✅ Mock services responding correctly
- ✅ No circular dependencies

## Next Batch Dependencies Unlocked
- Authentication service (can now use database)
- Topics module (can now use database)
- Reports service (can now use database + mocks)
```

## Batch Sizing Guidelines

### Optimal Batch Size: 3-5 Tasks
- Enables meaningful parallelism
- Manageable integration complexity
- 30-minute execution window
- Clear success criteria

### When to Split Batches
- More than 5 independent tasks
- Different dependency tiers
- Distinct functional areas
- Risk isolation needed

### When to Combine Tasks
- Tight coupling between components
- Shared state requirements
- Less than 3 total tasks
- Sequential dependencies

## Integration Between Batches

After each batch completes:

1. **Collect Interfaces**:
   ```bash
   find .work/tasks -name "INTERFACE.md" -path "*/batch-1/*"
   ```

2. **Run Integration Tests**:
   ```bash
   npm run test:integration -- --batch=1
   ```

3. **Verify No Conflicts**:
   - API compatibility
   - Database schema alignment
   - Shared type definitions
   - Configuration consistency

4. **Document Results**:
   Create `.work/integration/batch-1/report.md`

## Batch Naming Convention

```
batch-{number}/
├── summary.md          # Pre and post execution summary
├── tasks/             # Symlinks to actual task directories
└── integration.md     # Integration verification results

Examples:
- batch-1/  # Foundation services
- batch-2/  # Core features
- batch-3/  # Advanced features
```

## Common Patterns

### Pattern 1: Foundation First
```
Batch 1: Infrastructure, database, mocks
Batch 2: Core services (auth, data models)
Batch 3: Business features
Batch 4: UI/API layer
```

### Pattern 2: Vertical Slices
```
Batch 1: User feature (model, service, API)
Batch 2: Admin feature (model, service, API)
Batch 3: Reports feature (model, service, API)
```

### Pattern 3: Risk-Based
```
Batch 1: Low-risk utilities
Batch 2: Medium-risk core features
Batch 3: High-risk integrations
```

## Orchestrator Checklist

Before creating batch:
- [ ] Read DEPENDENCIES.md thoroughly
- [ ] Group by dependency tier
- [ ] Verify no circular dependencies
- [ ] Create batch summary BEFORE delegation
- [ ] Assign diverse tasks per persona

After batch completes:
- [ ] Update summary with results
- [ ] Verify all evidence present
- [ ] Run integration checks
- [ ] Document what's unlocked
- [ ] Plan next batch

## Anti-Patterns to Avoid

1. **Over-batching**: 10+ tasks in parallel (chaos)
2. **Under-batching**: 1 task at a time (slow)
3. **Ignoring Dependencies**: Parallel tasks that conflict
4. **No Documentation**: Missing batch summaries
5. **Skip Integration**: Moving to next batch without verification

---
*Batches maximize parallelism while respecting dependencies. Plan carefully, execute in parallel, integrate thoroughly.*