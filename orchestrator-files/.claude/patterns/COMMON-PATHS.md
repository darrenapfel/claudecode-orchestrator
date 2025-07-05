# Common Paths Reference

This file centralizes common directory path patterns used throughout the orchestration system. All personas and patterns should reference this file for path consistency.

## Directory Structure Base

**Master Reference**: See `.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md` for complete structure.

## Standard Path Patterns

### Foundation Paths (Project-wide, created once)
```
.work/foundation/architecture/    # System design, tech stack, dependencies
.work/foundation/product/         # User stories, acceptance criteria, golden paths  
.work/foundation/ux/             # Wireframes, design system, user flows
```

### Milestone Paths
```
.work/milestones/YYYYMMDD-{milestone-name}/
├── milestone-plan.md            # Goals and success criteria
├── milestone-summary.md         # Created at completion
└── sprint-XXX/                  # Sprints within milestone
```

### Sprint Paths (Within milestone)
```
.work/milestones/YYYYMMDD-{milestone}/sprint-XXX/
├── tasks/                       # All tasks for this sprint
├── implementation/              # Implementation batches
├── integration/                 # Integration work
├── validation-N/                # Numbered validation attempts
├── fixes/cycle-N/              # Fix cycles between validations
└── completion/                  # Milestone completion materials
```

### Task Paths
```
.work/milestones/YYYYMMDD-{milestone}/sprint-XXX/tasks/YYYYMMDD-HHMM-{descriptor}/
├── TASK.md                      # Task definition from orchestrator
├── INTERFACE.md                 # Public APIs/contracts (MANDATORY)
├── EVIDENCE.md                  # Proof of completion with outputs
└── artifacts/                   # Screenshots, logs, test outputs
```

### Validation Paths
```
.work/milestones/YYYYMMDD-{milestone}/sprint-XXX/validation-N/
├── test-report.md              # Full test results
├── coverage-report.md          # Coverage metrics
├── golden-paths/               # Golden path validation results
│   └── [feature]-validation.md
├── pm-report.md                # Product manager sign-off
└── artifacts/                  # Test outputs, screenshots
```

### Fix Cycle Paths
```
.work/milestones/YYYYMMDD-{milestone}/sprint-XXX/fixes/cycle-N/
├── tasks.md                    # List of all fix tasks
├── assignments.md              # Task-to-persona mapping
├── evidence/                   # Evidence per fix task
│   └── {task-id}/
│       ├── INTERFACE.md
│       ├── EVIDENCE.md
│       └── artifacts/
└── summary.md                  # Cycle completion summary
```

### Implementation Batch Paths
```
.work/milestones/YYYYMMDD-{milestone}/sprint-XXX/implementation/
├── batch-1/                    # First parallel batch
│   └── summary.md             # Batch results and evidence
├── batch-2/                    # Second parallel batch
│   └── summary.md
└── batch-N/                    # Continue as needed
```

### Milestone Completion Paths
```
.work/milestones/YYYYMMDD-{milestone}/sprint-XXX/completion/
├── MILESTONE-COMPLETION.md      # Testing instructions and service URL
├── USER-STORIES-TESTING-GUIDE.md  # Test scenarios from foundation/product/
└── USER-FEEDBACK-FORM.md        # Pre-filled feedback collection form
```

## Path Variables

### Common Variables
- `YYYYMMDD`: Date in format like `20250704`
- `{milestone-name}`: Descriptive milestone name like `local-development`
- `{milestone}`: Full milestone directory name like `20250704-local-development`
- `sprint-XXX`: Sprint number like `sprint-001`, `sprint-002`
- `validation-N`: Validation attempt like `validation-1`, `validation-2`
- `cycle-N`: Fix cycle like `cycle-1`, `cycle-2`
- `YYYYMMDD-HHMM-{descriptor}`: Task ID like `20250704-1430-auth-service`

### Git Branch Names
```
milestone/YYYYMMDD-{milestone-name}    # Main milestone branch
feedback/YYYYMMDD-user-issues          # Feedback processing branch
```

## Evidence Path Examples

### Task Evidence
```
Evidence: .work/milestones/20250704-local-development/sprint-001/tasks/20250704-1430-auth-service/EVIDENCE.md
```

### Validation Evidence
```
Evidence: .work/milestones/20250704-local-development/sprint-001/validation-2/pm-report.md
```

### Fix Cycle Evidence
```
Evidence: .work/milestones/20250704-local-development/sprint-001/fixes/cycle-1/evidence/auth-fixes/EVIDENCE.md
```

### Integration Evidence
```
Evidence: .work/milestones/20250704-local-development/sprint-001/integration/integration-report.md
```

## Usage Rules

### DO:
- Always use the full milestone path structure
- Reference this file when creating paths in other documents
- Use numbered validations and fix cycles
- Include milestone name in all paths

### DON'T:
- Use legacy session-based paths (no longer valid)
- Use legacy sprint-only paths (no longer valid)
- Use generic paths without milestone context
- Skip milestone directory structure

## Cross-Reference

This document should be referenced by:
- All persona files
- All pattern files  
- Commit message examples
- Evidence templates
- Directory creation scripts

**Always verify paths against this reference to maintain consistency.**