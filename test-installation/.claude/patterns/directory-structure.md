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
├── foundation/                         # Sprint 001 artifacts
│   ├── architecture/
│   │   ├── ARCHITECTURE.md            # System design and patterns
│   │   ├── TECH-STACK.md             # Technology choices (MANDATORY SEPARATE FILE)
│   │   └── DEPENDENCIES.md            # Service dependency graph
│   ├── ux/
│   │   ├── WIREFRAMES.md             # ASCII wireframes
│   │   ├── DESIGN-SYSTEM.md          # Colors, typography, components
│   │   └── USER-FLOWS.md             # User journey diagrams
│   └── requirements/
│       ├── USER-STORIES.md           # All user stories
│       └── ACCEPTANCE-CRITERIA.md    # Consolidated criteria (optional)
├── sessions/YYYYMMDD-{topic}/         # Session management (MANDATORY)
│   ├── session-transcript.md          # Workflow progression log
│   ├── sprint-001/
│   │   └── README.md                 # Sprint summary
│   └── sprint-002/
│       └── README.md
├── tasks/YYYYMMDD-HHMM-{descriptor}/ # Individual task evidence
│   ├── TASK.md                       # Task definition
│   ├── INTERFACE.md                  # Public contracts (MANDATORY)
│   ├── EVIDENCE.md                   # Proof of completion
│   └── artifacts/                    # Screenshots, logs
├── implementation/                    # Implementation tracking
│   ├── batch-1/
│   │   └── summary.md               # Batch plan and results
│   └── batch-2/
│       └── summary.md
├── integration/                      # Integration reports
│   └── sprint-XXX/
│       └── integration-report.md
├── validation/                       # Validation reports
│   └── sprint-XXX/
│       ├── test-engineer-report.md
│       ├── pm-report.md
│       ├── performance-report.md
│       └── security-report.md
└── fixes/                           # Fix cycles (if needed)
    └── cycle-X/
        ├── tasks.md                 # List of fix tasks
        └── evidence/                # Fix completion proof
```

## Directory Creation Rules

### When to Create Each Directory

1. **At Session Start (Orchestrator)**:
   - `.work/sessions/YYYYMMDD-{topic}/`
   - `.work/sessions/YYYYMMDD-{topic}/session-transcript.md`

2. **During Discovery (If Triggered)**:
   - `.work/discovery/`
   - All subdirectories as content is generated

3. **At Sprint Start (Orchestrator)**:
   - `.work/sessions/YYYYMMDD-{topic}/sprint-XXX/`
   - `.work/foundation/` (Sprint 001 only)
   - `.work/implementation/` (Sprint 002+)

4. **Before Task Delegation (Orchestrator)**:
   - `.work/tasks/YYYYMMDD-HHMM-{descriptor}/`
   - Create `TASK.md` in directory

5. **During Validation Phase**:
   - `.work/validation/sprint-XXX/`

6. **If Validation Fails**:
   - `.work/fixes/cycle-X/`

### File Placement Rules

1. **NEVER place files in wrong directories**:
   - Tech stack goes in `TECH-STACK.md`, not embedded in ARCHITECTURE.md
   - User stories go in `requirements/`, not `product/`
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
- [ ] Current sprint directory created
- [ ] All mandatory files in correct locations
- [ ] No files in unexpected directories
- [ ] Task directories follow naming convention
- [ ] Every task has INTERFACE.md

## Common Mistakes to Avoid

1. **DON'T** create `product/` directory - use `requirements/`
2. **DON'T** embed tech stack in architecture - create separate file
3. **DON'T** skip session directories - they're mandatory
4. **DON'T** place interfaces outside task directories
5. **DON'T** use different directory names than specified

---
*Consistency in structure enables automation and tracking.*
