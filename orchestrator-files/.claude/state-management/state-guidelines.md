# Project State Management Guidelines

## Purpose
PROJECT-STATE.md provides instant context for fresh Claude sessions, ensuring seamless continuity without verbose continuation prompts.

## Core Principles

### 1. **Efficiency First**
- Maximum 200 lines
- Bullet points over paragraphs
- Links to details, don't duplicate
- One-line summaries

### 2. **Currency**
- Update throughout session at key events
- Remove outdated information
- Keep only last 3 sessions
- Archive old states

### 3. **Actionability**
- What to do next is always clear
- Include exact commands
- Note specific blockers
- Provide context for decisions

## Update Triggers

### Mandatory Updates (Orchestrator)
1. **Session Start** - Current status, planned work
2. **After Task Creation** - List all tasks with IDs and assignments  
3. **After Each Task Completion** - Mark complete, note results
4. **After Validation** - Record PASS/FAIL, any issues found
5. **After Integration Check** - Record compatibility results
6. **When Blockers Discovered** - Document blockers clearly
7. **When Creating New Phase** - Explain why, list new tasks
8. **Session End** - Summarize progress, next steps

### Other Mandatory Updates
1. **Major Milestone** - Architect notes achievement
2. **Architecture Change** - Architect updates snapshot
3. **Critical Failure** - Immediate documentation by discovering persona

### Optional Updates
- Before long break
- After complex debugging
- When switching context mid-session

## Who Updates What

### Orchestrator
- Session accomplishments
- Task queue management
- Overall status
- Quick start commands

### Architect
- Architecture snapshot
- Key decisions
- Technical debt items
- Pattern changes

### Individual Personas
- Their blocked items
- Specific context needs
- Known issues in their domain

### Validator
- Verification that state is accurate
- Test coverage updates
- Deployment status

## State File Location

### Primary Location
```
.work/PROJECT-STATE.md
```

### Archive Location
```
.work/state-archive/
├── PROJECT-STATE-20250628.md
├── PROJECT-STATE-20250627.md
└── PROJECT-STATE-20250626.md
```

## Update Process

### 1. Real-time Updates Throughout Session
```bash
# Orchestrator updates at each trigger point
update-project-state() {
  # Read existing state
  current_state=.work/PROJECT-STATE.md
  
  # Append timestamped update
  echo -e "\n## [$(date +%Y-%m-%d %H:%M)] - $EVENT_TYPE" >> $current_state
  echo "- Status: $STATUS" >> $current_state
  echo "- Details: $DETAILS" >> $current_state
  echo "- Impact: $IMPACT" >> $current_state
  echo "- Next: $NEXT_ACTION" >> $current_state
  
  # Keep under 200 lines
  if [ $(wc -l < $current_state) -gt 200 ]; then
    # Archive old sections
    archive-old-state-sections
  fi
  
  # No commit - will be included in next task/phase commit
}
```

### 2. Session Start Check
```markdown
# First thing orchestrator does
1. Check .work/PROJECT-STATE.md exists
2. If exists: "I see we're continuing from [DATE]. Last session accomplished [X]."
3. If missing: "No previous state found. Starting fresh."
```

## Efficient Formatting

### Good Example
```markdown
## 🔄 Current Status
### In Progress
- 🟡 AUTH-001: User login API
  - Status: 80% (tests remaining)
  - Next: Write integration tests
```

### Bad Example
```markdown
## Current Status
The authentication system is currently being implemented. We have completed the user login API endpoint but still need to write tests. The implementation includes JWT token generation and validation...
```

## State Sections Guide

### Quick Context (5 lines max)
- Project name and stage
- One-line last session summary
- Immediate next priority
- Current branch
- Active PR if any

### Architecture Snapshot (10 lines max)
- Component list (comma separated)
- Pattern list (comma separated)
- Tech stack (comma separated)
- Link to full architecture docs

### Recent Accomplishments (15 lines max)
- Last 3 sessions only
- Task ID + one-line description
- Commit SHA for reference

### Current Status (20 lines max)
- In-progress tasks with percentage
- Blocked tasks with specific reason
- What unblocks each item

### Task Queue (10 lines max)
- Top 3 priorities only
- Why each is important
- Dependencies noted

### Key Decisions (10 lines max)
- Last 5 decisions only
- Date + decision + rationale
- Link to ADRs

### Known Issues (10 lines max)
- Active bugs only
- Workaround for each
- When fix is planned

### Session Context (20 lines max)
- Environment specifics
- Active feature flags
- Special notes for next session

### Quick Start (10 lines max)
- Exact commands to resume
- Task-specific setup

## Anti-Patterns to Avoid

### ❌ Verbose Descriptions
```markdown
The authentication system has been partially implemented with a focus on security...
```

### ✅ Concise Status
```markdown
- AUTH: 60% done, blocked on Redis setup
```

### ❌ Duplicating Documentation
```markdown
## Architecture
The system uses a microservices architecture with the following services...
```

### ✅ Linking to Documentation
```markdown
## Architecture
Services: auth, api, web | Pattern: microservices | See: .work/architecture/
```

### ❌ Stale Information
```markdown
## Tasks from January
- Old task nobody remembers
```

### ✅ Current Information
```markdown
## This Week's Tasks
- Current relevant work
```

## State Validation

Before committing state updates, ensure:
- [ ] Under 200 lines total
- [ ] All sections have content
- [ ] Timestamps are current
- [ ] Links are valid
- [ ] Commands work
- [ ] No duplicate information
- [ ] Actionable next steps

## Example State Transition

### Session Start
```markdown
*Claude reads PROJECT-STATE.md*
"I see we're working on the auth system. Last update shows login API complete, integration tests pending. 
I'll start by creating tasks for the remaining work."

*Updates PROJECT-STATE.md*
## [2025-07-02 09:15] - Session Start
- Status: Resuming auth implementation
- Details: 3 tasks created for integration tests, rate limiting, password reset
- Impact: Will complete auth module today
- Next: Delegating tasks to personas
```

### During Session
```markdown
*After task completion*
## [2025-07-02 10:30] - Task Complete
- Status: AUTH-001 integration tests PASS
- Details: 15 tests added, 100% coverage on auth endpoints
- Impact: Ready for rate limiting implementation
- Next: Validating with @test-engineer

*After validation failure*
## [2025-07-02 11:00] - Validation Failed
- Status: AUTH-002 rate limiting has edge case bug
- Details: Fails under concurrent requests > 1000/sec
- Impact: Creating fix task AUTH-002-FIX
- Next: @software-engineer to address concurrency issue
```

### Session End
```markdown
*Final update before PR*
## [2025-07-02 15:45] - Session End
- Status: Auth module 95% complete
- Details: Integration tests ✓, Rate limiting ✓, Password reset blocked
- Impact: Email service config needed from DevOps
- Next: Resume with password reset after email config
```

## Emergency State Recovery

If PROJECT-STATE.md is corrupted or missing:

1. Check state archive
2. Use git log for recent commits
3. Check .work/sessions/ for last session
4. Rebuild from architecture docs
5. Start minimal state and build up

---

*Efficient state management enables seamless context handoffs between sessions*