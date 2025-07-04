# Directory Structure Pattern

## Overview
This document defines the canonical directory structure for orchestrator sessions. All personas must follow this structure exactly.

## Complete Directory Structure

```
.work/
├── PROJECT-STATE.md                    # Session continuity and status
├── discovery/                          # One-time discovery phase (if applicable)
│   ├── consolidated-questions.md       # Merged questions from all personas
│   ├── responses/
│   │   └── user-responses.md          # User's answers
│   └── assumptions.md                 # Documented assumptions
├── foundation/                         # Project-wide foundation (created once)
│   ├── architecture/
│   │   ├── ARCHITECTURE.md            # System design and patterns
│   │   ├── TECH-STACK.md             # Technology choices (MANDATORY SEPARATE FILE)
│   │   └── DEPENDENCIES.md            # Service dependency graph
│   ├── ux/
│   │   ├── WIREFRAMES.md             # ASCII wireframes
│   │   ├── DESIGN-SYSTEM.md          # Colors, typography, components
│   │   └── USER-FLOWS.md             # User journey diagrams
│   └── product/                       # Product requirements
│       ├── USER-STORIES.md           # All user stories
│       ├── ACCEPTANCE-CRITERIA.md    # Consolidated criteria
│       └── golden-paths.md           # Golden path definitions
├── sessions/YYYYMMDD-{topic}/         # Session management (MANDATORY)
│   ├── session-transcript.md          # Workflow progression log
│   └── session-completion-summary.md  # Final session summary (at end)
└── sprints/
    ├── sprint-001/                    # First sprint directory
    │   ├── README.md                 # Sprint summary
    │   ├── tasks/                    # Sprint-specific tasks
    │   │   └── YYYYMMDD-HHMM-{desc}/
    │   │       ├── TASK.md          # Task definition
    │   │       ├── INTERFACE.md     # Public contracts (MANDATORY)
    │   │       ├── EVIDENCE.md      # Proof of completion
    │   │       └── artifacts/       # Screenshots, logs
    │   ├── implementation/           # Sprint implementation work
    │   │   ├── batch-1/
    │   │   │   └── summary.md      # Batch plan and results
    │   │   └── batch-2/
    │   │       └── summary.md
    │   ├── integration/             # Sprint integration work
    │   │   └── INTEGRATION-REPORT.md
    │   ├── validation/              # Sprint validation reports
    │   │   ├── golden-paths/        # PM validation results
    │   │   ├── test-engineer-report.md
    │   │   ├── pm-report.md
    │   │   ├── performance-report.md
    │   │   └── security-report.md
    │   └── fixes/                   # Sprint fix cycles
    │       └── cycle-1/
    │           ├── tasks.md         # List of fix tasks
    │           └── evidence/        # Fix completion proof
    └── sprint-002/
        └── [same structure as sprint-001]
```

## Directory Creation Rules

### When to Create Each Directory

1. **At Session Start (Orchestrator)**:
   - `.work/sessions/YYYYMMDD-{topic}/`
   - `.work/sessions/YYYYMMDD-{topic}/session-transcript.md`

2. **During Discovery (If Triggered)**:
   - `.work/discovery/`
   - All subdirectories as content is generated

3. **At Project Start (Orchestrator - ONCE ONLY)**:
   - `.work/foundation/` (created once for the entire project)
   - `.work/foundation/architecture/`
   - `.work/foundation/product/`
   - `.work/foundation/ux/`

4. **At Sprint Start (Orchestrator)**:
   - `.work/sprints/sprint-XXX/`
   - `.work/sprints/sprint-XXX/tasks/`
   - `.work/sprints/sprint-XXX/implementation/`
   - `.work/sprints/sprint-XXX/integration/`
   - `.work/sprints/sprint-XXX/validation/`

5. **Before Task Delegation (Orchestrator)**:
   - `.work/sprints/sprint-XXX/tasks/YYYYMMDD-HHMM-{descriptor}/`
   - Create `TASK.md` in directory

6. **During Implementation Phase**:
   - `.work/sprints/sprint-XXX/implementation/batch-Y/`

7. **During Validation Phase**:
   - `.work/sprints/sprint-XXX/validation/golden-paths/`

8. **If Validation Fails**:
   - `.work/sprints/sprint-XXX/fixes/cycle-Y/`

### File Placement Rules

1. **NEVER place files in wrong directories**:
   - Tech stack goes in `TECH-STACK.md`, not embedded in ARCHITECTURE.md
   - User stories go in `product/`, not `requirements/`
   - Interfaces go in task directories, not `architecture/`

2. **Session transcripts are MANDATORY**:
   - Update after every phase transition
   - Record all major decisions
   - Track sprint progressions

3. **Sprint directories track progress**:
   - Create at sprint start, not end
   - Add README.md when sprint completes
   - Link to all sprint artifacts

## Validation Checklist

Before proceeding to next phase, verify:

- [ ] Session directory exists with transcript
- [ ] Current sprint directory created under `.work/sprints/`
- [ ] All mandatory files in correct locations
- [ ] No files in unexpected directories
- [ ] Task directories follow naming convention and are under current sprint
- [ ] Every task has INTERFACE.md
- [ ] Foundation directories exist (architecture, product, ux)

## Common Mistakes to Avoid

1. **DON'T** create `requirements/` directory - use `product/`
2. **DON'T** create directories at root of `.work/` - use sprint subdirectories
3. **DON'T** embed tech stack in architecture - create separate file
4. **DON'T** skip session directories - they're mandatory
5. **DON'T** place interfaces outside task directories
6. **DON'T** use different directory names than specified
7. **DON'T** create duplicate `architecture/` at root level

---
*Consistency in structure enables automation and tracking.*