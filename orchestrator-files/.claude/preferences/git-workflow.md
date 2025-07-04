# Git Workflow Preferences

## Master Reference
For complete git strategy, see: **`.claude/patterns/GIT-COMMIT-STRATEGY.md`**

This file contains quick preferences and shortcuts.

## Milestone Start
```bash
git pull origin main
git checkout -b milestone/$(date +%Y%m%d)-{milestone-name}
git push -u origin HEAD
```

## Task Commit Protocol
After EACH task validation PASS:
```bash
# Only add files from this specific task
git add [files from EVIDENCE.md]
git commit -m "feat(task-YYYYMMDD-HHMM): what was done

Task: YYYYMMDD-HHMM-description
Evidence: .work/milestones/{current}/sprint-XXX/tasks/YYYYMMDD-HHMM/EVIDENCE.md
Tests: X/Y passing
Coverage: XX%

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: {Persona} <noreply@anthropic.com>"
```

## Integration Commits
```bash
git add [integration files only]
git commit -m "fix(integration): what was connected

Integration: sprint-XXX-integration-N
Evidence: .work/milestones/{current}/sprint-XXX/integration/EVIDENCE.md"
```

## Branch Naming
- `milestone/YYYYMMDD-name` - Major development phases
- `fix/issue-number` - Hotfixes
- `feature/name` - Individual features (outside orchestration)

## Quick Commands
```bash
# Check what will be committed
git status
git diff --staged

# Amend last commit (if needed)
git commit --amend

# Interactive rebase (careful!)
git rebase -i HEAD~5
```