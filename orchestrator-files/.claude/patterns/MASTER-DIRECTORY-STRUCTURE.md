# Master Directory Structure

This is the canonical reference for all directory structures in the orchestration system. All other documents should reference this file rather than defining their own structures.

## Complete Directory Structure

```
.work/
├── PROJECT-STATE.md                      # Project continuity and status tracking
├── discovery/                            # One-time discovery phase (if needed)
│   ├── consolidated-questions.md         # Merged questions from all personas
│   ├── responses/
│   │   └── user-responses.md            # User's answers to discovery questions
│   └── assumptions.md                   # Documented assumptions if no discovery
├── foundation/                          # Project-wide foundation (created once)
│   ├── architecture/
│   │   ├── ARCHITECTURE.md              # System design and patterns
│   │   ├── TECH-STACK.md               # Technology choices (MANDATORY SEPARATE FILE)
│   │   └── DEPENDENCIES.md              # Service dependency graph
│   ├── product/                         # Product requirements (NOT "requirements")
│   │   ├── USER-STORIES.md             # All user stories
│   │   ├── ACCEPTANCE-CRITERIA.md      # Consolidated acceptance criteria
│   │   └── golden-paths.md             # Golden path definitions for validation
│   └── ux/
│       ├── WIREFRAMES.md               # ASCII wireframes for all screens
│       ├── DESIGN-SYSTEM.md            # Colors, typography, spacing, components
│       └── USER-FLOWS.md               # User journey diagrams
├── milestones/                         # Major development phases
│   └── YYYYMMDD-{milestone-name}/      # e.g., 20250104-local-development
│       ├── milestone-plan.md           # Goals and success criteria for milestone
│       ├── milestone-summary.md        # Created at milestone completion
│       └── sprint-XXX/                 # Sprints within this milestone
│           ├── tasks/                  # All tasks for this sprint
│           │   └── YYYYMMDD-HHMM-{descriptor}/
│           │       ├── TASK.md         # Task definition from orchestrator
│           │       ├── INTERFACE.md    # Public APIs/contracts (MANDATORY)
│           │       ├── EVIDENCE.md     # Proof of completion with outputs
│           │       └── artifacts/      # Screenshots, logs, test outputs
│           ├── implementation/         # Implementation work
│           │   ├── batch-1/           # First parallel batch
│           │   │   └── summary.md     # Batch results
│           │   └── batch-2/           # Second parallel batch
│           │       └── summary.md
│           ├── integration/           # Integration testing
│           │   └── integration-report.md
│           ├── validation-N/          # Validation attempts (numbered)
│           │   ├── test-report.md     # Full test results
│           │   ├── coverage-report.md # Coverage metrics
│           │   └── artifacts/         # Test outputs, screenshots
│           └── fixes/                 # Fix cycles between validations
│               ├── cycle-1/          # First fix cycle
│               │   ├── ISSUES.md     # Issues found in validation-1
│               │   ├── FIXES.md      # Solutions implemented
│               │   └── EVIDENCE.md   # Proof fixes work
│               └── cycle-2/          # Second fix cycle (if needed)
│                   └── ...
└── sprints/                             # Global sprint tracking
    └── sprint-XXX/
        └── SPRINT-SUMMARY.md            # Aggregated results across all milestones
```

## Key Concepts

### Milestones vs Sprints
- **Milestone**: Major development phase (e.g., "Local Development", "Admin Console", "Cloud Deployment")
- **Sprint**: Incremental work unit that may span multiple CLI conversations
- **Sprint Numbering**: Global and sequential (001, 002, 003...) across entire project

### Validation and Fix Cycles
- **validation-1/**: Initial validation after implementation
- **fixes/cycle-1/**: First round of fixes for issues found
- **validation-2/**: Re-validation after fixes
- **fixes/cycle-2/**: Second round of fixes (if needed)
- **validation-N/**: Continue until 100% pass rate achieved

The number of validation cycles is NOT predetermined. Some sprints may pass on validation-1, others may need validation-5 or more. This is normal and expected.

## Directory Creation Timeline

### 1. Project Initialization (Once per project)
```
.work/
├── PROJECT-STATE.md
└── foundation/
    ├── architecture/
    ├── product/
    └── ux/
```

### 2. Milestone Start
```
.work/milestones/YYYYMMDD-{milestone-name}/
└── milestone-plan.md
```

### 3. Sprint Start (Within milestone)
```
.work/milestones/YYYYMMDD-{milestone-name}/sprint-XXX/
├── tasks/
├── implementation/
└── integration/
```

### 4. Task Creation
```
.work/milestones/.../sprint-XXX/tasks/YYYYMMDD-HHMM-{descriptor}/
├── TASK.md
└── (INTERFACE.md created by assigned persona)
```

### 5. Validation Cycle
```
.work/milestones/.../sprint-XXX/
├── validation-1/        # After implementation complete
├── fixes/cycle-1/       # If validation-1 had failures
├── validation-2/        # After fixes
└── fixes/cycle-2/       # If validation-2 had failures
```

## Usage Rules

### DO:
- Reference this file from all other documents needing directory structure
- Create directories in the order shown above
- Number validations sequentially (1, 2, 3...)
- Number fix cycles sequentially (cycle-1, cycle-2...)
- Keep sprint numbers global and incrementing

### DON'T:
- Create "requirements/" directory (use "product/")
- Create "revalidation/" directories (use validation-N/)
- Skip directory creation steps
- Place files in wrong directories
- Restart sprint numbering for new milestones

## Example Progression

```
Milestone: Local Development
├── sprint-001/
│   ├── validation-1/    # 15 failures
│   ├── fixes/cycle-1/   # Fixed 12 issues
│   ├── validation-2/    # 3 failures
│   ├── fixes/cycle-2/   # Fixed remaining
│   └── validation-3/    # 0 failures ✓
└── sprint-002/
    ├── validation-1/    # 0 failures ✓
    └── (no fixes needed)

Milestone: Admin Console  
└── sprint-003/
    ├── validation-1/    # 8 failures
    ├── fixes/cycle-1/   # Fixed all issues
    └── validation-2/    # 0 failures ✓
```

## Quick Reference for Personas

When working on a task:
1. Find your task in: `.work/milestones/{current}/sprint-XXX/tasks/{task-id}/`
2. Create INTERFACE.md immediately
3. Create EVIDENCE.md when complete
4. Reference this structure: `.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md`

---
*This is the single source of truth for directory structure. All changes should be made here.*