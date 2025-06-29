# Git Workflow

## Session Start (FIRST PRIORITY)
```bash
git pull origin main
git checkout -b session/$(date +%Y%m%d)-topic
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
Evidence: .work/tasks/YYYYMMDD-HHMM/EVIDENCE.md

🤖 Generated with Claude Code
Co-authored-by: Claude <noreply@anthropic.com>"
```

## End of Session
```bash
# Update session log
echo "Session complete: X tasks done" >> .work/sessions/*/session-log.md

# Create PR
gh pr create \
  --title "Session: [Topic] - X tasks completed" \
  --body "See .work/sessions/YYYYMMDD-topic/ for details"
```

## Branch Naming
- `session/YYYYMMDD-topic` - Work sessions
- `fix/issue-number` - Bug fixes
- `feat/feature-name` - Features
