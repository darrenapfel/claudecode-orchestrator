# Directory Structure Pattern

## Overview
This document references the master directory structure. All personas must follow the structure defined in the master document.

## Master Structure Reference

For the complete, canonical directory structure, see:
**`.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md`**

All directory creation, file placement, and structural decisions must follow the master structure.

## Key Changes from Previous Structure

### Terminology Updates
- **sessions/** → **milestones/** (major development phases)
- **validation/** → **validation-N/** (numbered validation attempts)
- **revalidation/** → **validation-N/** (no more "re-" prefixes)

### Structural Changes
- Sprints now live under milestones, not at root level
- Validations are numbered (validation-1, validation-2, etc.)
- Fix cycles remain numbered (cycle-1, cycle-2, etc.)
- Sprint numbers are global and never reset

### File Placement Rules

1. **NEVER place files in wrong directories**:
   - Tech stack goes in `TECH-STACK.md`, not embedded in ARCHITECTURE.md
   - User stories go in `product/`, not `requirements/`
   - Interfaces go in task directories, not `architecture/`

2. **Milestone tracking is MANDATORY**:
   - Create milestone-plan.md at start
   - Track all sprints within milestone
   - Create milestone-summary.md at completion

## Quick Validation Checklist

Before proceeding, verify against MASTER-DIRECTORY-STRUCTURE.md:

- [ ] Milestone directory exists with milestone-plan.md
- [ ] Current sprint directory created under milestone
- [ ] All mandatory files in correct locations
- [ ] Validations are numbered (not named "final" or "revalidation")
- [ ] Fix cycles are numbered
- [ ] Every task has INTERFACE.md

## Common Mistakes to Avoid

1. **DON'T** create `requirements/` directory - use `product/`
2. **DON'T** create `sessions/` directory - use `milestones/`
3. **DON'T** create `revalidation/` - use `validation-N/`
4. **DON'T** embed tech stack in architecture - create separate file
5. **DON'T** place interfaces outside task directories
6. **DON'T** restart sprint numbering - keep global sequence

## References

- Master Structure: `.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md`
- Fix Cycles: `.claude/patterns/fix-cycle-structure.md`
- Task Execution: `.claude/TASK-EXECUTION-GUIDE.md`

---
*Always refer to MASTER-DIRECTORY-STRUCTURE.md for authoritative structure.*
