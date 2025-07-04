# Git Workflow

## Sprint Start (FIRST PRIORITY)
```bash
git pull origin main
git checkout -b sprint/$(date +%Y%m%d)-topic
git push -u origin HEAD
```

## Commit Protocol
After EVERY atomic task (30min max):
```bash
git add .
git commit -m "feat(scope): what was done

- Specific change with evidence
- Test results: X tests passing
- Performance: Xms response time

Task: TASK-XXX
Evidence: .work/sprints/sprint-XXX/tasks/YYYYMMDD-HHMM/EVIDENCE.md

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: Claude <noreply@anthropic.com>"
```

## End of Sprint
```bash
# Update sprint log
echo "Sprint complete: X tasks done" >> .work/sprints/sprint-*/sprint-log.md

# Create PR
gh pr create \
  --title "Sprint: [Topic] - X tasks completed" \
  --body "See .work/sprints/sprint-XXX/ for details"
```

## Branch Naming
- `sprint/YYYYMMDD-topic` - Work sprints
- `fix/issue-number` - Bug fixes
- `feat/feature-name` - Features

