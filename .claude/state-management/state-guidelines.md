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
- Update at session end
- Remove outdated information
- Keep only last 3 sessions
- Archive old states

### 3. **Actionability**
- What to do next is always clear
- Include exact commands
- Note specific blockers
- Provide context for decisions

## Update Triggers

### Mandatory Updates
1. **Session End** - Orchestrator updates before PR
2. **Major Milestone** - Architect notes achievement
3. **Blocking Issue** - Immediate documentation
4. **Architecture Change** - Architect updates snapshot

### Optional Updates
- Mid-session progress (if switching context)
- Before long break
- After complex debugging

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

### 1. End of Session Update
```bash
# Orchestrator runs
update-project-state() {
  # Copy template
  cp .claude/state-management/PROJECT-STATE-TEMPLATE.md .work/PROJECT-STATE.md
  
  # Fill in sections
  - Update timestamp
  - Add session accomplishments
  - Update task queue
  - Note blockers
  
  # Commit
  git add .work/PROJECT-STATE.md
  git commit -m "chore: update project state for session end"
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
"I see we're working on the auth system. Last session completed the login API (80%). 
I'll continue with the integration tests as noted in the state file."
```

### Session End
```markdown
*Orchestrator updates PROJECT-STATE.md*
"Session complete. State updated with:
- ✓ Completed integration tests
- ✓ Added rate limiting
- 🔄 Started on password reset (40%)
- 🔴 Blocked on email service config"
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