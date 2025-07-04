# Git Workflow Pattern

## Overview
This document defines the git workflow for orchestrator sessions. Every task must follow this workflow to ensure traceability and evidence linking.

## Branch Strategy

### Session Branch Creation (Orchestrator)
```bash
git checkout -b session/YYYYMMDD-{topic}
```

### Commit After Every Task (All Personas)
```bash
git add .
git commit -m "feat: {task description}

Task: {task-id}
Evidence: .work/tasks/{task-id}/EVIDENCE.md
Implements: {feature/fix description}

[Optional extended description]"
```

## Commit Message Format

### Standard Format
```
{type}: {description}

Task: {YYYYMMDD-HHMM-descriptor}
Evidence: {path to EVIDENCE.md}
{Additional context}
```

### Types
- `feat`: New feature implementation
- `fix`: Bug fix
- `docs`: Documentation only
- `test`: Test additions/modifications
- `refactor`: Code restructuring
- `chore`: Infrastructure/build changes

### Examples

**Feature Implementation**:
```
feat: implement user authentication service

Task: 20250703-1430-auth-service
Evidence: .work/tasks/20250703-1430-auth-service/EVIDENCE.md
Implements: Email-based authentication with JWT tokens
```

**Bug Fix**:
```
fix: resolve validation error in topic creation

Task: 20250703-1630-fix-topic-validation
Evidence: .work/sprints/sprint-XXX/tasks/20250703-1630-fix-topic-validation/EVIDENCE.md
Fixes: Required fields not being validated correctly
```

## Task Completion Protocol

1. **Before Committing**:
   - Verify all task files created (TASK.md, INTERFACE.md, EVIDENCE.md)
   - Run tests to ensure nothing broken
   - Check that evidence is complete

2. **Commit Command**:
   ```bash
   # Stage all changes
   git add .
   
   # Commit with proper message
   git commit -m "feat: implement topics CRUD operations
   
   Task: 20250703-1500-topics-crud
   Evidence: .work/sprints/sprint-XXX/tasks/20250703-1500-topics-crud/EVIDENCE.md
   Implements: Create, read, update, delete operations for topics"
   ```

3. **After Committing**:
   - Update task status in PROJECT-STATE.md
   - Note commit hash in session transcript

## Integration Commits

After integration validation:
```bash
git commit -m "chore: integrate sprint-002 services

Integration: Batch 1 services verified
Evidence: .work/sprints/sprint-002/integration/integration-report.md
Components: auth, topics, reports services"
```

## Fix Cycle Commits

When fixing validation failures:
```bash
git commit -m "fix: address security validation failures

Fix-Cycle: 1
Evidence: .work/sprints/sprint-XXX/fixes/cycle-1/evidence/
Addresses: Authentication edge cases from security report"
```

## Pull Request Creation

At session end (if requested):
```bash
# Create PR with comprehensive description
gh pr create --title "feat: {session topic}" --body "$(cat <<'EOF'
## Summary
{Brief description of what was accomplished}

## Session Details
- Session: YYYYMMDD-{topic}
- Branch: session/YYYYMMDD-{topic}
- Transcript: .work/sessions/YYYYMMDD-{topic}/session-transcript.md

## Completed Sprints
- Sprint 001: Foundation ✅
- Sprint 002: Core Services ✅

## Evidence
All task evidence available in `.work/tasks/`

## Validation Results
- Test Engineer: PASS
- Product Manager: PASS
- Performance Engineer: PASS
- Security Engineer: PASS

Generated with Claude Code Orchestrator
EOF
)"
```

## Automation Requirements

### Orchestrator Responsibilities
1. Create session branch at start
2. Remind personas to commit after tasks
3. Verify commits include evidence links
4. Create PR at session end (if requested)

### Persona Responsibilities
1. Commit after EVERY task completion
2. Include task ID and evidence path
3. Use appropriate commit type
4. Never skip commits

## Common Mistakes to Avoid

1. **DON'T** batch multiple tasks in one commit
2. **DON'T** commit without evidence links
3. **DON'T** use generic commit messages
4. **DON'T** forget to stage all changes
5. **DON'T** commit broken code

## Verification Commands

Check commit history:
```bash
git log --oneline --grep="Task:"
```

Verify evidence links:
```bash
git log --grep="Evidence:" --pretty=format:"%h %s" | head -20
```

---
*Every task leaves a traceable commit. Every commit links to evidence.*