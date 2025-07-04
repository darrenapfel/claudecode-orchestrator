# Milestone Structure Migration Tracking

## Overview
Migrating from session-based to milestone-based directory structure with numbered validations.

## Key Changes
1. **sessions/** → **milestones/**
2. **validation/** → **validation-N/** (numbered)
3. **revalidation/** → Removed (use validation-N)
4. Sprint directories now under milestones
5. All references point to MASTER-DIRECTORY-STRUCTURE.md

## Files Updated

### ✅ Completed
1. `/orchestrator-files/.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md` - Created as master reference
2. `/orchestrator-files/.claude/patterns/directory-structure.md` - Updated to reference master
3. `/orchestrator-files/.claude/patterns/fix-cycle-structure.md` - Created for fix cycle guidance
4. `/orchestrator-files/CLAUDE.md` - Updated to reference master structure
5. `/orchestrator-files/.claude/TASK-EXECUTION-GUIDE.md` - Updated to reference master
6. `/orchestrator-files/.claude/personas/orchestrator.md` - Updated initialization steps
7. `/orchestrator-files/.claude/examples/git-workflow-example.md` - Updated paths and validation approach
8. `/orchestrator-files/.work/` - Recreated with new structure
9. `/build-orchestrator.js` - Updated to v4.7.0 with new directory creation

### 🔄 Files Needing Simple Path Updates
These files need `.work/sessions/` → `.work/milestones/` and similar updates:

1. `.claude/patterns/standard-workflow.md`
2. `.claude/patterns/git-workflow.md`
3. `.claude/patterns/implementation-batches.md`
4. `.claude/patterns/fix-cycle-protocol.md`
5. `.claude/patterns/infrastructure-setup.md`
6. `.claude/patterns/discovery-process.md`
7. `.claude/personas/product-manager.md`
8. `.claude/personas/software-engineer.md`
9. `.claude/personas/integration-engineer.md`
10. `.claude/personas/architect.md`
11. `.claude/personas/ux-designer.md`
12. `.claude/personas/sdet.md`
13. `.claude/validators/validation-overview.md`
14. `.claude/validators/evidence-template.md`
15. `.claude/state-management/state-guidelines.md`
16. `.claude/state-management/PROJECT-STATE-TEMPLATE.md`
17. `.claude/preferences/git-workflow.md`
18. `.claude/preferences/project-structure.md`
19. `.claude/git-workflow.md`
20. `.claude/devops-workflow.md`
21. `.claude/examples/parallel-task-example.md`
22. `.claude/examples/orchestrator-example.md`
23. `.claude/examples/discovery-example.md`
24. `.claude/examples/dependency-aware-example.md`
25. `.claude/hooks/validate.sh`
26. `.claude/hooks/pre-commit`
27. `.claude/init-project.sh`
28. `.claude/aliases.sh`
29. `README.md`

## Update Strategy

For most files, the update is straightforward:
1. Replace `.work/sessions/` with `.work/milestones/`
2. Replace `.work/sprints/sprint-XXX/` with `.work/milestones/{current}/sprint-XXX/`
3. Replace `validation/` with `validation-N/`
4. Add reference to MASTER-DIRECTORY-STRUCTURE.md where appropriate
5. Update any session-related terminology to milestone-related

## Validation
After all updates:
1. Rebuild orchestrator.sh
2. Test installation in temp directory
3. Verify all paths resolve correctly
4. Check that personas can find their work directories

---
*Track progress here as files are updated*