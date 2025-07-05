# Directory Quick Reference

For complete details see: **`MASTER-DIRECTORY-STRUCTURE.md`**

## 🎯 Current Work Locations

### Your Current Task
```
.work/milestones/{current}/sprint-XXX/tasks/{task-id}/
├── TASK.md         # Your assignment
├── INTERFACE.md    # Create this FIRST
├── EVIDENCE.md     # Create when done
└── artifacts/      # Screenshots, logs
```

### Current Sprint
```
.work/milestones/{current}/sprint-XXX/
├── tasks/          # All sprint tasks
├── validation-N/   # Test results (1,2,3...)
└── fixes/cycle-N/  # Fix iterations
```

## 📁 Key Paths

### Foundation (Project-Wide)
```
.work/foundation/
├── architecture/   # ARCHITECTURE.md, TECH-STACK.md
├── product/       # User stories, acceptance criteria
└── ux/           # Wireframes, design system
```

### Evidence Paths
```
Task Evidence:       .../tasks/{task-id}/EVIDENCE.md
Validation Report:   .../validation-N/test-report.md
Fix Evidence:        .../fixes/cycle-N/EVIDENCE.md
Integration Report:  .../integration/integration-report.md
```

## 🔢 Naming Patterns

### IDs and Numbers
- **Milestone**: `YYYYMMDD-{name}` → `20250704-local-development`
- **Sprint**: `sprint-XXX` → `sprint-001`, `sprint-002` (global)
- **Task**: `YYYYMMDD-HHMM-{desc}` → `20250704-1430-auth-service`
- **Validation**: `validation-N` → `validation-1`, `validation-2`
- **Fix Cycle**: `cycle-N` → `cycle-1`, `cycle-2`

### Git Branches
```
milestone/YYYYMMDD-{name}    # Main work branch
feedback/YYYYMMDD-issues     # User feedback branch
```

## ✅ Quick Rules

### DO:
- Create INTERFACE.md immediately after task assignment
- Use milestone paths for all work
- Number validations sequentially (1,2,3...)
- Keep sprint numbers global (never restart)

### DON'T:
- Create `sessions/` (use `milestones/`)
- Create `requirements/` (use `product/`)
- Create `revalidation/` (use `validation-N/`)
- Put tasks at `.work/tasks/` root level

## 🚀 Common Commands

### Navigate to Current Work
```bash
# Go to current milestone
cd .work/milestones/$(ls -t .work/milestones | head -1)

# Go to current sprint
cd .work/milestones/*/sprint-$(ls -d .work/milestones/*/sprint-* | tail -1 | grep -o '[0-9]\+')

# Find your task
find .work -name "*auth*" -type d
```

### Check Structure
```bash
# View milestone structure
tree .work/milestones/*/sprint-* -L 2

# List all validations
ls -la .work/milestones/*/sprint-*/validation-*

# Find all EVIDENCE.md files
find .work -name "EVIDENCE.md" -type f
```

## 📋 Validation Checklist

Before proceeding, verify:
- [ ] In correct milestone directory?
- [ ] Sprint number continues sequence?
- [ ] Task has INTERFACE.md?
- [ ] Evidence in right location?
- [ ] Validations numbered (not "final")?

## 🔗 References

- **Full Structure**: `MASTER-DIRECTORY-STRUCTURE.md`
- **Path Examples**: `COMMON-PATHS.md`
- **Git Workflow**: `GIT-COMMIT-STRATEGY.md`
- **Fix Process**: `fix-cycle-protocol.md`

---
*Quick reference. Full details in MASTER-DIRECTORY-STRUCTURE.md*