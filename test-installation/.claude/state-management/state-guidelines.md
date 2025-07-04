# Project State Management Guidelines

## Purpose
PROJECT-STATE.md provides instant context for fresh Claude sessions, ensuring seamless continuity without verbose continuation prompts.

## Core Principles

1. **Efficiency** - Max 200 lines, bullets over paragraphs, link don't duplicate
2. **Currency** - Update at key events, keep only last 3 sessions
3. **Actionability** - Next steps always clear with exact commands

## Update Triggers

**Orchestrator** (see orchestrator.md for full list):
- Session start/end
- Task creation/completion  
- Validation results
- Sprint transitions
- Blocker discovery

**Other Personas**:
- Architect: Major architecture changes
- Any persona: Critical failures or blockers
- Validator: Test coverage updates

## Who Updates What

- **Orchestrator**: Session accomplishments, task queue, overall status
- **Architect**: Architecture snapshot, key decisions, technical debt
- **Individual Personas**: Their blocked items, specific context needs
- **Validator**: Verification of state accuracy, test coverage

## File Locations

- **Active**: `.work/PROJECT-STATE.md`
- **Archive**: `.work/state-archive/PROJECT-STATE-[DATE].md`
- **Sprint Work**: `.work/sprints/sprint-XXX/`

## Update Format

```markdown
## [TIMESTAMP] - [EVENT TYPE]
- Status: [brief status]
- Details: [what happened]
- Impact: [what this means]
- Next: [immediate action]
```

## State Section Limits

- **Quick Context**: 5 lines (project, stage, branch, milestone, next priority)
- **Architecture**: 10 lines (components, patterns, stack, link to details)
- **Recent Work**: 15 lines (last 3 sessions, task ID + description)
- **Current Status**: 20 lines (in-progress %, blocked items)
- **Task Queue**: 10 lines (top 3 priorities with rationale)
- **Key Decisions**: 10 lines (last 5 with date + rationale)
- **Known Issues**: 10 lines (active bugs + workarounds)
- **Session Context**: 20 lines (environment, flags, notes)
- **Quick Start**: 10 lines (exact commands)
- **Session Updates**: Remainder (real-time events)

**Total**: 200 lines maximum

## Anti-Patterns

❌ **Verbose**: "The authentication system has been partially implemented..."
✅ **Concise**: "AUTH: 60% done, blocked on Redis setup"

❌ **Duplicate**: Full architecture description in state file
✅ **Link**: "See: .work/architecture/SYSTEM-MAP.md"

❌ **Stale**: Tasks from weeks ago
✅ **Current**: Only this sprint's work

## Example Updates

**Session Start:**
```markdown
## [2025-07-02 09:15] - Session Start
- Status: Resuming Sprint 3, Milestone 2 (Email System)
- Details: 3 tasks for auth integration tests
- Impact: Will complete auth module today
- Next: Delegating tasks to personas
```

**Task Complete:**
```markdown
## [2025-07-02 10:30] - Task Complete
- Status: AUTH-001 integration tests PASS
- Details: 15 tests added, 100% coverage
- Impact: Ready for next implementation batch
- Next: Validation check
```

**Sprint Transition:**
```markdown
## [2025-07-02 15:45] - Sprint Complete  
- Status: Sprint 3 complete, all validators PASS
- Details: Auth ✓, Email templates ✓, Scheduler ✓
- Impact: Milestone 2 complete
- Next: Start Sprint 4 for analytics
```

## State Validation Checklist

Before committing:
- [ ] Under 200 lines total
- [ ] All sections have content
- [ ] References current sprint/milestone
- [ ] Links are valid
- [ ] Commands work
- [ ] No duplicate information
- [ ] Clear next steps

## Emergency Recovery

If PROJECT-STATE.md is corrupted:
1. Check `.work/state-archive/`
2. Use `git log` for recent commits
3. Check `.work/sessions/` for last session
4. Rebuild from `.work/sprints/sprint-XXX/`

---
*Efficient state management enables seamless context handoffs*
