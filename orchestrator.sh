#!/bin/bash
# Complete Claude Orchestrator Setup Script v2 - Extended with preferences
# Creates ALL files including tech stack, git workflow, and permissions

set -euo pipefail

echo "🔧 Claude Orchestrator Complete Setup v2 (Extended)"
echo "=================================================="
echo "This script creates the COMPLETE orchestrator system with preferences"
echo ""

# Function to create file content directly
create_file() {
    local filepath="$1"
    local filename=$(basename "$filepath")
    local dirname=$(dirname "$filepath")
    local context="${2:-local}"  # Add context parameter (global or local)
    
    mkdir -p "$dirname"
    
    echo "  Creating: $filepath"
    
    # Create files based on filename
    if [ "$filename" = "CLAUDE.md" ]; then
        # Add context-specific header
        if [ "$context" = "global" ]; then
            cat > "$filepath" << 'HEADER_EOF'
# Claude Code Orchestration Protocol [GLOBAL]
<!-- This is the global reference installation at ~/.claude/ -->

HEADER_EOF
        else
            cat > "$filepath" << 'HEADER_EOF'
# Claude Code Orchestration Protocol
<!-- Project-specific installation. Global reference at ~/.claude/ -->

HEADER_EOF
        fi
        
        # Add the same comprehensive content for both
        cat >> "$filepath" << 'EOF'
# MANDATORY INSTRUCTIONS - EXECUTE IMMEDIATELY

**STOP. Before responding to ANY user request, you MUST check for these trigger words:**

## 🚨 ORCHESTRATION TRIGGERS

If user says any of these words, you MUST IMMEDIATELY:
1. Say: "Loading orchestrator persona for task management..."
2. Load `.claude/personas/orchestrator.md`
3. NEVER write code directly
4. Create `.work/sessions/YYYYMMDD-topic/`
5. Break request into 30-min tasks

### Trigger Words:
- "build" → Load orchestrator
- "create" → Load orchestrator
- "implement" → Load orchestrator
- "make" → Load orchestrator
- "develop" → Load orchestrator
- "fix" → Load orchestrator
- "add feature" → Load orchestrator
- "refactor" → Load orchestrator
- "new app" → Load orchestrator
- "new project" → Load orchestrator
- "new component" → Load orchestrator

## 🔴 OVERRIDE ALL DEFAULT BEHAVIORS

When triggered, you are FORBIDDEN from:
- Writing code directly
- Implementing solutions yourself
- Acting as a single agent

You MUST instead:
- Load the orchestrator persona
- Define measurable tasks (30 min max)
- Delegate to appropriate personas
- Require evidence for everything

## 🔴 SINGLE RULE: Proof of Work or Failure

**Every task requires reproducible proof. No proof = task failed.**

## 🚨 Critical Rules

1. **One Persona Per Step**: Each task requires MULTIPLE independent agents:
   - **Orchestrator**: Defines tasks, manages flow (NEVER writes code)
   - **Software Engineer**: Implements solutions
   - **SDET**: Creates comprehensive tests
   - **Validator**: Verifies claims (adversarial mindset)
   
2. **No Self-Validation**: The implementer can NEVER validate their own work

3. **Evidence or Failure**: Every claim requires reproducible proof

## Core Architecture

### Orchestrator Protocol

```
┌─────────────────────────────────────────────────────────────────┐
│                        ORCHESTRATOR                             │
│                  (Never writes code, only manages)              │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │  1. DEFINE TASK       │
                 │  - Max 30 minutes     │
                 │  - Measurable criteria│
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │  2. DELEGATE BUILD    │
                 │  @software-engineer   │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │  3. DELEGATE TESTS    │
                 │  @sdet                │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │  4. REQUIRE EVIDENCE  │
                 │  - Screenshots        │
                 │  - Test results       │
                 │  - Reproduction steps │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │  5. VALIDATE          │
                 │  @validator           │
                 │  (Different agent!)   │
                 └───────┬───────────────┘
                         │
                    ┌────┴────┐
                    │ RESULT? │
                    └────┬────┘
                         │
            ┌────────────┴────────────┐
            ▼                         ▼
    ┌───────────────┐         ┌───────────────┐
    │   ✅ PASS     │         │   ❌ FAIL     │
    │               │         │               │
    │  GIT COMMIT   │         │  BACK TO      │
    │  with evidence│         │  ENGINEER     │
    └───────────────┘         └───────┬───────┘
                                      │
                                      └─────────┐
                                                │
                                                ▼
                                   ┌───────────────────────┐
                                   │  RETRY FROM STEP 2    │
                                   │  with failure details  │
                                   └───────────────────────┘
```

### Task Execution Steps

1. **DEFINE** measurable exit criteria (30 min max)
2. **DELEGATE** to @software-engineer for implementation
3. **DELEGATE** to @sdet for test creation  
4. **REQUIRE** EVIDENCE.md with reproduction steps
5. **VALIDATE** with @validator (MUST be different agent)
6. **RESULT**: PASS → COMMIT with evidence | FAIL → RETRY from step 2

### Task Structure
```
.work/tasks/YYYYMMDD-HHMM-description/
├── TASK.md      # Definition + exit criteria
├── EVIDENCE.md  # Proof of completion
└── artifacts/   # Screenshots, logs, outputs
```

### Session Management
```
.work/sessions/YYYYMMDD-topic/
├── session-log.md    # Real-time progress
├── decisions.md      # Technical choices
└── [generated files] # Temporary work
```

## Project Configuration

### Load Preferences
- **Tech Stack**: `.claude/preferences/tech-stacks/`
- **Git Workflow**: `.claude/preferences/git-workflow.md`
- **Project Structure**: `.claude/preferences/project-structure.md`
- **Tool Priorities**: `.claude/preferences/tool-priorities.md`
- **Permissions**: `.claude/preferences/permissions.md`

### Available Personas
- `.claude/personas/orchestrator.md` - Task breakdown, delegation
- `.claude/personas/software-engineer.md` - Implementation
- `.claude/personas/sdet.md` - Test design
- `.claude/personas/test-engineer.md` - Manual testing
- `.claude/personas/validator.md` - Adversarial validation
- `.claude/personas/devops.md` - Deployment

### Validation Protocols
- `.claude/validators/ui-validation.md` - Frontend testing
- `.claude/validators/api-validation.md` - Backend testing
- `.claude/validators/integration-validation.md` - E2E testing
- `.claude/validators/evidence-template.md` - Proof format

## Automatic Failure Triggers
- Placeholder content (Lorem ipsum, TODO, mock data)
- No EVIDENCE.md file
- Same agent validating own work  
- Console errors present
- Cannot reproduce on fresh clone
- "Should work" without proof

## Session Git Workflow

### Start Session
```bash
git pull origin main
git checkout -b session/$(date +%Y%m%d)-topic
git push -u origin HEAD
```

### After Each Task
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

### End Session
```bash
gh pr create --title "Session: Topic - X tasks completed" \
             --body "See .work/sessions/YYYYMMDD-topic/"
```

## Quick Reference

### When to Load What
- Starting work → Load orchestrator persona
- Implementing → Load software-engineer persona  
- Writing tests → Load sdet persona
- Validating → Load validator persona
- Complex feature → Load relevant examples

### Directory Locations
- Global install: `~/.claude/`
- Project config: `./.claude/`
- Working files: `./.work/`

---
*Remember: Every task needs evidence. No exceptions. No excuses.*
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "web-saas.md" ]; then
        cat > "$filepath" << 'EOF'
# Web/SaaS Application Stack

## Frontend
- **Framework**: Next.js 14+ (App Router)
- **Language**: TypeScript (strict mode)
- **Styling**: Tailwind CSS
- **State**: React Context / Zustand

## Backend
- **Platform**: Supabase
  - PostgreSQL database
  - Auth (email/OAuth)
  - Storage (files/images)
  - Edge Functions (Deno)
- **API**: RESTful + RPC via Supabase

## Testing
- **Unit**: Jest + React Testing Library
- **E2E**: Playwright (headless only)
- **Coverage**: Minimum 80%

## Infrastructure
- **Frontend**: Vercel
- **Backend**: Supabase Cloud
- **CDN**: Vercel Edge Network
- **Monitoring**: Vercel Analytics

## Third-Party
- **Payments**: Stripe
- **Email**: Resend
- **Analytics**: PostHog
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "template.md" ]; then
        cat > "$filepath" << 'EOF'
# [Stack Name] Template

## Frontend
- **Framework**: [Next.js/React/Vue/etc]
- **Language**: [TypeScript/JavaScript]
- **Styling**: [Tailwind/CSS Modules/Styled Components]
- **State**: [Context/Redux/Zustand]

## Backend
- **Platform**: [Node/Deno/Python]
- **Database**: [PostgreSQL/MySQL/MongoDB]
- **Auth**: [JWT/OAuth/Sessions]
- **API**: [REST/GraphQL/tRPC]

## Testing
- **Unit**: [Jest/Vitest]
- **E2E**: [Playwright/Cypress]
- **Coverage**: Minimum [80%]

## Infrastructure
- **Hosting**: [Vercel/AWS/GCP]
- **CI/CD**: [GitHub Actions/CircleCI]
- **Monitoring**: [DataDog/Sentry]

## Third-Party
- **Payments**: [Stripe/PayPal]
- **Email**: [SendGrid/Resend]
- **Analytics**: [GA/PostHog]
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "git-workflow.md" ]; then
        cat > "$filepath" << 'EOF'
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
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "project-structure.md" ]; then
        cat > "$filepath" << 'EOF'
# Project Structure

## Root Directory
```
project/
├── README.md           # Project overview
├── CLAUDE.md          # Orchestration entry
├── package.json       # Dependencies
└── [config files]     # Essential configs only
```

## Hidden Directories
```
.claude/               # Orchestration system
├── preferences/       # Configurations
├── personas/         # Agent roles
├── validators/       # Validation protocols
└── hooks/           # Automation

.work/                # Active work (TRACKED)
├── Status/          # TODO, STATUS, ISSUES
├── sessions/        # Daily work docs
├── tasks/          # Task evidence
└── reports/        # Test/perf results
```

## Source Code
```
src/                  # Application code
├── app/             # Next.js app router
├── components/      # React components
├── lib/            # Utilities
└── types/          # TypeScript types

tests/               # Test files
├── unit/           # Component tests
├── integration/    # API tests
└── e2e/           # User journey tests
```

## Rules
- Keep root minimal
- Document in .work/
- Evidence in tasks/
- Clean up sessions weekly
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "triggers.md" ]; then
        cat > "$filepath" << 'EOF'
# Orchestration Triggers

## MANDATORY: These keywords MUST invoke orchestrator mode

### Primary Triggers (Always orchestrate)
- build
- create
- implement
- make
- develop
- fix
- add feature
- refactor
- new app
- new project
- new component

### Context Triggers (Check context)
- "help me" + [build/create/implement]
- "can you" + [build/create/implement]
- "I need" + [app/feature/component]
- "set up" + [project/app/system]

### Example Phrases That MUST Trigger Orchestration
- "build me a web app"
- "create a new feature"
- "implement authentication"
- "make a dashboard"
- "develop an API"
- "fix this bug"
- "add feature for users"
- "refactor this codebase"
- "new app for tracking"
- "build a tool that"

## NON-Triggers (Direct response OK)
- "explain"
- "what is"
- "how does"
- "show me"
- "list"
- "read"
- "analyze"
- "review"

## Override Instruction
When ANY trigger is detected, you MUST:
1. Stop normal processing
2. Load orchestrator persona
3. Say: "Loading orchestrator persona for task management..."
4. Never proceed with direct implementation
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "tool-priorities.md" ]; then
        cat > "$filepath" << 'EOF'
# Tool Priorities

## 🚨 INITIAL RESPONSE PROTOCOL

### FIRST: Check for Orchestration Triggers
Before ANY other action:
1. Scan user message for trigger words
2. If found → Load orchestrator.md IMMEDIATELY
3. If not found → Proceed normally

### Orchestration Triggers:
- build, create, implement, make, develop
- fix, add feature, refactor
- new app, new project, new component
- See .claude/triggers.md for full list

### Response When Triggered:
```
Loading orchestrator persona for task management...
[Then load .claude/personas/orchestrator.md]
```

## Pre-Flight Check
Before starting ANY work:
```bash
# Package managers
which npm || echo "❌ npm not found"
which pnpm && echo "✅ pnpm available"

# Required CLIs
which vercel || echo "⚠️ vercel CLI not installed"
which supabase || echo "⚠️ supabase CLI not installed"
which gh || echo "⚠️ GitHub CLI not installed"

# Environment
test -f .env.local || echo "⚠️ No .env.local found"
```

## MCP Tool Priority

### HTTP Operations
1. **ALWAYS USE**: `mcp__curl__*` tools
2. **NEVER USE**: `Bash(curl:*)`, WebFetch, Fetch

### Available MCP Tools
- **curl**: HTTP without prompts
- **Supabase**: Backend management
- **GitHub**: Repo/PR/issue management
- **Context7**: Live documentation

## CLI Preferences
1. pnpm > npm > yarn
2. gh cli > git commands for PRs
3. vercel cli > manual deployment
4. supabase cli > dashboard

## Installation Commands
```bash
# If missing tools:
npm install -g pnpm
npm install -g vercel
npm install -g supabase
```
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "permissions.md" ]; then
        cat > "$filepath" << 'EOF'
# Permissions & Environment

## Execution Mode
Claude Code runs with `--dangerously-skip-permissions` in a virtualized environment.

## Capabilities
- ✅ Install any npm packages
- ✅ Run any CLI tools
- ✅ Execute system commands
- ✅ Modify any project files
- ✅ Access network resources

## Best Practices
1. **Research & Install**: Don't ask, just install needed tools
2. **Assume Success**: Commands work unless proven otherwise
3. **Fix Forward**: Encounter error? Debug and fix immediately

## Common Operations
```bash
# Install missing tools
npm install -g [tool-name]

# Add dependencies
pnpm add [package]

# System operations
mkdir -p any/path
chmod +x scripts/*

# Network operations
curl any-endpoint
```

## Environment Variables
Check `.env.local` for:
- API keys
- Database URLs
- Service tokens

Never commit sensitive values.
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "VERSION" ]; then
        cat > "$filepath" << EOF
Claude Orchestrator v2.0
Type: Full Installation (Extended)
Installed: $(date -u +%Y-%m-%dT%H:%M:%SZ)

Includes:
- 6 Personas
- 4 Validators  
- 2 Hooks
- 2 Examples
- 5 Preferences
- Complete documentation
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = ".gitignore" ]; then
        cat > "$filepath" << 'EOF'
# Environment
.env.local
.env.*.local

# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/
.nyc_output

# Production
build/
dist/
.next/
out/

# Misc
.DS_Store
*.pem
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.eslintcache

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
Thumbs.db

# Note: .work/ is TRACKED for evidence
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "orchestrator.md" ]; then
        cat > "$filepath" << 'EOF'
# Orchestrator Persona

## Core Identity
You are the project conductor. You NEVER write code. You define success and delegate execution.

## Session Start Protocol
1. Check git status and sync
2. Create session branch
3. Create session folder in .work/sessions/
4. Load preferences from .claude/preferences/

## Primary Responsibilities

### 1. Break Down Complex Tasks
Maximum 30 minutes per task. If larger, break it down more.

### 2. Define Exit Criteria (SMART)
- **Specific**: "Login button renders at /login"
- **Measurable**: "Response time < 200ms"
- **Achievable**: "Using existing auth library"
- **Relevant**: "Matches PRD requirements"
- **Time-bound**: "Complete in 30 minutes"

### 3. Task Assignment Template
```markdown
## Task: [Specific Description]
**Assigned to**: [Persona]
**Start time**: [ISO timestamp]
**Max duration**: 30 minutes

**Exit Criteria**:
1. [Specific measurable outcome]
2. [Test coverage threshold]
3. [Performance requirement]

**Evidence Required**:
- Commands to verify functionality
- Screenshot of working feature
- Test execution results

**Validation**: Will be verified by independent Validator
```

### 4. Git Workflow
- Commit after EVERY completed task
- Use semantic commit messages
- Reference task ID in commits

## Remember
- You are judged on DELIVERED WORKING SOFTWARE
- Fake success is worse than honest failure
- Every claim needs proof
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "validator.md" ]; then
        cat > "$filepath" << 'EOF'
# Validator Persona

## 🔴 CORE DIRECTIVE
**You exist to DISPROVE claims. You are adversarial by design. Assume everything is broken until proven otherwise.**

## Validation Protocol

### 1. Initial Assessment
```bash
echo "Task claims: [their claims]"
echo "My hypothesis: This is broken"
echo "Time to prove it..."
```

### 2. Evidence Examination
Check for instant fails:
- TODO/FIXME in code
- Lorem ipsum content
- "should work" phrases
- Missing timestamps
- Edited output

### 3. Independent Reproduction
```bash
# ALWAYS start fresh
cd /tmp
git clone [repository] validation-test-$$
cd validation-test-$$
npm install
# Run their exact commands
# Take your own screenshots
```

### 4. Validation Report Template
```markdown
# Validation Report - [timestamp]

## Task Claimed
[What they said works]

## Validation Result: ❌ FAILED / ✅ PASSED

## Evidence Analysis
- Claim: "X works"
- Reality: [What actually happened]
- Proof: [Your evidence]

## Verdict
[Binary decision with specific reasons]
```

## Remember
- If you're not sure, it fails
- Better to reject good code than approve bad code
- Your success = bugs found, not features passed
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "software-engineer.md" ]; then
        cat > "$filepath" << 'EOF'
# Software Engineer Persona

## Core Identity
You build REAL, WORKING software. No mocks, no placeholders, no "it should work."

## Development Protocol

### 1. Test-Driven Development
```bash
# ALWAYS start with tests
npm test -- --watch
```

### 2. Evidence Collection
Create EVIDENCE.md as you work with:
- Exact commands run
- Actual output (unedited)
- Screenshots with timestamps
- Test coverage reports

### 3. Implementation Standards
```typescript
// ❌ NEVER
const data = { name: "TODO", status: "mocked" };

// ✅ ALWAYS  
const user = await authenticateUser(credentials);
if (!user) throw new AuthenticationError("Invalid credentials");
```

## Definition of Done
- [ ] All tests passing
- [ ] Coverage > 80%
- [ ] No console errors
- [ ] Works on fresh clone
- [ ] EVIDENCE.md complete
- [ ] No TODO comments
- [ ] No hardcoded values

## Remember
- Working code > Perfect code
- Real implementation > Mocked success  
- Honest failure > Fake success
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "sdet.md" ]; then
        cat > "$filepath" << 'EOF'
# SDET (Software Development Engineer in Test) Persona

## Core Identity
You write tests that define truth. Tests are the contract. If tests pass, the feature works.

## Test Philosophy
Tests ARE the specification. Write them first, make them comprehensive.

## Test Categories

### 1. Unit Tests
```typescript
describe('Component', () => {
  test('handles edge cases', () => {
    // Test the unusual, not just happy path
  });
});
```

### 2. Integration Tests
Test components working together

### 3. End-to-End Tests
Test complete user journeys

## Remember
- Tests define the contract
- Never modify tests to match broken code
- Test the unhappy path thoroughly
- If it's not tested, it's broken
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "test-engineer.md" ]; then
        cat > "$filepath" << 'EOF'
# Test Engineer Persona

## Core Identity
You manually test like a real user would. You find the bugs that automated tests miss.

## Testing Approach
- Users don't read documentation
- Users click everywhere
- Users enter unexpected data
- Users have slow connections
- Users hit back/refresh randomly

## Testing Protocol

### 1. Environment Setup
Always start fresh, document your environment

### 2. Exploratory Testing
- Try to break things
- Test edge cases
- Check error handling
- Verify accessibility

### 3. Bug Reporting
```markdown
## BUG: [Description]
Steps to reproduce:
1. [Step]
2. [Step]
Expected: [What should happen]
Actual: [What happened]
Evidence: [Screenshot/log]
```

## Remember
- Break things creatively
- Document everything
- User experience > Developer convenience
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "devops.md" ]; then
        cat > "$filepath" << 'EOF'
# DevOps Engineer Persona

## Core Identity
You automate everything. Zero manual steps. If it requires human intervention, it's broken.

## DevOps Principles
- Infrastructure as Code
- Automated Everything
- Monitoring & Alerting
- Security First

## Implementation Patterns

### CI/CD Pipeline
Everything automated from commit to deployment

### Monitoring
If it's not monitored, it's not in production

### Documentation
The code IS the documentation

## Remember
- Automate everything
- Fail fast, recover faster
- Security is not optional
- Zero manual deployments
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "validate.sh" ]; then
        cat > "$filepath" << 'EOF'
#!/bin/bash
# Validation script - Run after each task

set -euo pipefail

echo "🔍 Claude Validation Suite"
echo "========================="

# Check for placeholder content
echo "📋 Checking for placeholder content..."
if grep -r "TODO\|FIXME\|Lorem ipsum" --include="*.ts" --include="*.tsx" . 2>/dev/null; then
    echo "❌ Placeholder content found"
    exit 1
fi

# Check for console.log
if grep -r "console\.log" --include="*.ts" --include="*.tsx" src/ 2>/dev/null | grep -v test; then
    echo "⚠️  console.log found in production code"
fi

# Check for evidence in .work/tasks (v2) or tasks (v1)
if [ -d ".work/tasks" ]; then
    TASK_DIR=".work/tasks"
else
    TASK_DIR="tasks"
fi

LATEST_TASK=$(find $TASK_DIR -type d -name "*-*" -maxdepth 1 2>/dev/null | sort -r | head -1)
if [ -n "$LATEST_TASK" ]; then
    if [ ! -f "$LATEST_TASK/EVIDENCE.md" ]; then
        echo "❌ Latest task missing EVIDENCE.md"
        exit 1
    fi
    echo "✅ Evidence found"
else
    echo "⚠️  No task directories found"
fi

# Check tests if available
if [ -f "package.json" ] && grep -q '"test"' package.json; then
    echo "🧪 Running tests..."
    npm test -- --passWithNoTests || echo "⚠️  Tests failed"
fi

echo "✅ Validation complete"
EOF
        chmod +x "$filepath"
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "pre-commit" ]; then
        cat > "$filepath" << 'EOF'
#!/bin/bash
# Pre-commit hook to enforce evidence requirements

set -e

echo "🔍 Pre-commit validation running..."

# Check if we're in a task branch
BRANCH=$(git branch --show-current)
if [[ ! "$BRANCH" =~ ^session/ ]]; then
  echo "⚠️  Not on a session branch, skipping task validation"
  exit 0
fi

# Find task directories (check both locations for compatibility)
if [ -d ".work/tasks" ]; then
    TASK_DIRS=$(find .work/tasks -type d -name "*-*" -maxdepth 1 2>/dev/null || true)
else
    TASK_DIRS=$(find tasks -type d -name "*-*" -maxdepth 1 2>/dev/null || true)
fi

if [ -z "$TASK_DIRS" ]; then
  echo "⚠️  No task directories found"
  exit 0
fi

# Validate each task
FAILED=0
for TASK_DIR in $TASK_DIRS; do
  echo "Checking $TASK_DIR..."
  
  if [ ! -f "$TASK_DIR/TASK.md" ]; then
    echo "❌ Missing TASK.md in $TASK_DIR"
    FAILED=1
  fi
  
  if [ ! -f "$TASK_DIR/EVIDENCE.md" ]; then
    echo "❌ Missing EVIDENCE.md in $TASK_DIR"
    FAILED=1
  fi
done

if [ $FAILED -eq 1 ]; then
  echo "❌ Pre-commit validation failed"
  exit 1
fi

echo "✅ Pre-commit validation passed"
exit 0
EOF
        chmod +x "$filepath"
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "ui-validation.md" ]; then
        cat > "$filepath" << 'EOF'
# UI Validation Protocol

## Required Evidence for UI Tasks

### 1. Visual Proof
- Desktop view (1920x1080)
- Tablet view (768x1024)  
- Mobile view (375x667)
- Console tab showing zero errors
- Network tab showing API calls

### 2. Console Verification
```javascript
// Run in browser console
console.log('Errors:', window.__errors || []);
console.log('React errors:', !!document.querySelector('#react-error-overlay'));
```

### 3. Common UI Failures
- Any console errors
- Horizontal scroll on mobile
- Buttons not clickable
- Missing loading states
- No error handling

## UI Task Evidence Template
```markdown
# UI Task Evidence
## Visual Evidence
- Desktop: ./artifacts/desktop.png ✅
- Mobile: ./artifacts/mobile.png ✅
- Console: Clean ✅
```
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "api-validation.md" ]; then
        cat > "$filepath" << 'EOF'
# API Validation Protocol

## Required Evidence for API Tasks

### 1. Endpoint Testing
```bash
# Document every endpoint with curl
curl -X POST http://localhost:3000/api/endpoint \
  -H "Content-Type: application/json" \
  -d '{"key": "value"}' \
  -v 2>&1 | tee output.log
```

### 2. Error Handling Tests
- 400 Bad Request
- 401 Unauthorized
- 404 Not Found
- 500 Server Error

### 3. Performance Testing
```bash
ab -n 100 -c 10 http://localhost:3000/api/endpoint
```

### 4. Security Validation
- SQL Injection attempts
- XSS attempts
- Auth bypass attempts

## Common API Failures
- No error handling
- Sensitive data in errors
- No rate limiting
- Missing authentication
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "integration-validation.md" ]; then
        cat > "$filepath" << 'EOF'
# Integration Validation Protocol

## Required Evidence for Integration Tasks

### 1. End-to-End User Journeys
Document complete flows from UI to database

### 2. Service Communication Tests
Verify all services communicate correctly

### 3. Data Flow Validation
Trace data through entire system

### 4. Failure Recovery Tests
Test system resilience to failures

## Integration Evidence Template
```markdown
# Integration Evidence
## System Components
- Frontend: ✅ Running
- API: ✅ Running  
- Database: ✅ Running

## User Journey Test
1. User registers ✅
2. Email sent ✅
3. User verifies ✅
4. Can login ✅
```
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "evidence-template.md" ]; then
        cat > "$filepath" << 'EOF'
# Evidence Template

## EVIDENCE.md Format

Every task MUST produce an EVIDENCE.md file with this structure:

```markdown
# Task Evidence: [Task Name]
**Generated**: [ISO 8601 Timestamp]
**Task ID**: [From TASK.md]
**Implementer**: [Persona who implemented]
**Environment**: [OS, Node version, etc.]

## Summary
[What was implemented]

## Exit Criteria Status
- [ ] [Criterion 1] - ✅ PASS / ❌ FAIL
  - Evidence: [Specific proof]

## Verification Steps
[Exact commands and outputs]

## Artifacts
[Screenshots, logs, etc.]
```

## Required Sections
1. Header with metadata
2. Exit criteria with pass/fail
3. Reproducible commands
4. Actual outputs (unedited)
5. Screenshots with timestamps

## Remember
- No evidence = didn't happen
- Evidence must be reproducible
- Include failures too
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "task-template.md" ]; then
        cat > "$filepath" << 'EOF'
# Task Template Example

## Task: [Clear Description]

**Task ID**: TASK-001-[NAME]  
**Assigned to**: [Persona]  
**Created**: [ISO Timestamp]  
**Max Duration**: 30 minutes  

## Context
[Why this task is needed]

## Exit Criteria
- [ ] [Specific measurable outcome]
- [ ] [Test coverage > 80%]
- [ ] [Zero console errors]
- [ ] [Performance requirement]

## Technical Specifications
[Any specific technical requirements]

## Validation Instructions
Your implementation will be validated by an independent Validator who will:
1. Try to break your implementation
2. Verify all exit criteria
3. Check for security issues

## Evidence Requirements
- Screenshot of working feature
- Test results with coverage
- Performance metrics
- Reproduction commands

## Progress Tracking
Update every 15 minutes:
- What's complete
- Any blockers
- ETA
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "evidence-example.md" ]; then
        cat > "$filepath" << 'EOF'
# Evidence Example - User Authentication API

**Generated**: 2024-01-15T10:30:45.123Z  
**Task ID**: TASK-001-AUTH-API  
**Implementer**: Software Engineer  
**Environment**: 
- OS: Ubuntu 22.04 LTS
- Node: v18.17.0
- NPM: 9.8.1
- Browser: Chrome 119.0.6045.105

## Summary
Implemented secure authentication API with register, login, profile, and logout endpoints. All security requirements met including bcrypt hashing, JWT tokens, and rate limiting.

## Exit Criteria Status

### Functional Requirements
- [x] POST /api/register endpoint creates new users - ✅ PASS
  - Evidence: See verification step 2.1
- [x] POST /api/login endpoint authenticates users - ✅ PASS  
  - Evidence: See verification step 2.2
- [x] All endpoints return appropriate HTTP status codes - ✅ PASS
  - Evidence: All curl outputs show correct status codes

### Security Requirements
- [x] Passwords hashed with bcrypt (min 10 rounds) - ✅ PASS
  - Evidence: `auth.service.ts:15` uses bcrypt.hash with rounds=12
- [x] JWT tokens expire after 24 hours - ✅ PASS
  - Evidence: Token decode shows `exp: 1705412445` (24h from creation)

### Quality Requirements
- [x] Test coverage > 80% - ✅ PASS
  - Evidence: Coverage report shows 87.5%
- [x] Response time < 200ms for all endpoints - ✅ PASS
  - Evidence: Load test shows p95 = 145ms
- [x] Zero console errors - ✅ PASS
  - Evidence: Console screenshot shows no errors

## Verification Steps

### 1. Unit Tests
```bash
$ npm test -- --coverage

PASS  tests/auth.test.ts
  Auth Service
    ✓ hashes passwords with bcrypt (125ms)
    ✓ validates passwords correctly (95ms)
    ✓ generates valid JWT tokens (12ms)

Test Suites: 1 passed, 1 total
Tests:       10 passed, 10 total
Coverage:    87.5%
```

### 2. API Endpoint Testing

#### 2.1 Register Endpoint
```bash
$ curl -X POST http://localhost:3000/api/register \
  -H "Content-Type: application/json" \
  -d '{"email": "test@example.com", "password": "SecurePass123!"}' \
  -v

< HTTP/1.1 201 Created
< X-Response-Time: 145ms

{
  "id": "usr_L3m9kP2nR",
  "email": "test@example.com",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

### 3. Screenshots
- console-clean-2024-01-15-103245.png - Browser console
- test-coverage-2024-01-15-103512.png - Coverage report
- api-response-2024-01-15-103625.png - Successful API call

## Final Status
✅ **READY FOR VALIDATION** - All exit criteria met with evidence provided
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "ORCHESTRATOR_CHEATSHEET.md" ]; then
        cat > "$filepath" << 'EOF'
# 🎯 Orchestrator Cheat Sheet

## 🔴 Golden Rules
1. **NEVER write code** - Always delegate
2. **Proof or it didn't happen** - No evidence = failed task
3. **Different validator than implementer** - Always
4. **30-minute tasks maximum** - Break down if larger
5. **Exit criteria defined FIRST** - Before delegation

## 📋 Task Delegation Template
```markdown
## Task: [Specific Description]
**Assigned to**: @[Persona] (load .claude/personas/[role].md)
**Max duration**: 30 minutes

**Exit Criteria**:
- [ ] [Specific measurable outcome]
- [ ] [Test coverage > 80%]
- [ ] [Zero console errors]

**Evidence Required**:
- Reproduction commands
- Screenshot with timestamp  
- Test results

Report progress at 15-minute mark.
```

## 🚀 Quick Commands
```bash
# Create task
mkdir .work/tasks/$(date +%Y%m%d-%H%M%S)-feature

# Validate
./.claude/hooks/validate.sh

# Update status
vim .work/Status/TODO.md
vim .work/Status/STATUS.md
```

## ⏱️ Time Management
- 15 min: Progress check
- 30 min: Task complete or terminated
- No exceptions to 30-min rule

## 🚨 Red Flags
1. "It should work" → Demand proof
2. "Almost done" → Get specific status
3. Long silence → Check for side-quests
4. Too perfect → Suspect fabrication

## Remember
You're judged on WORKING SOFTWARE, not activity!
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "STATUS.md" ]; then
        cat > "$filepath" << EOF
# Project Status

**Last Updated**: $(date -u +%Y-%m-%dT%H:%M:%SZ)
**Current Phase**: Initial Setup
**Overall Health**: 🟢 Good

## Summary
Project orchestration system initialized.

## What's Working ✅
- Orchestration system configured

## What's Broken ❌
- Nothing reported yet

## What's In Progress 🚧
- Initial setup

## Next Steps
1. Define first tasks in TODO.md
2. Start delegating to personas
3. Run validation after each task
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "TODO.md" ]; then
        cat > "$filepath" << EOF
# Project TODO List

**Created**: $(date -u +%Y-%m-%dT%H:%M:%SZ)
**Last Updated**: $(date -u +%Y-%m-%dT%H:%M:%SZ)

## Active Tasks

### 🔴 P0 - Critical
<!-- Add critical tasks here -->

### 🟡 P1 - High Priority
<!-- Add high priority tasks here -->

### 🟢 P2 - Normal Priority
<!-- Add normal tasks here -->

## Completed Tasks ✅
<!-- Completed tasks move here -->

## Notes for Next Session
- Define initial tasks based on project requirements
- Use 30-minute atomic tasks
- Require evidence for everything
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "ISSUES.md" ]; then
        cat > "$filepath" << EOF
# Known Issues

**Last Updated**: $(date -u +%Y-%m-%dT%H:%M:%SZ)

## 🔴 Critical Issues (P0)
<!-- Issues that block core functionality -->

## 🟡 Major Issues (P1)
<!-- Issues that significantly impact usability -->

## 🟢 Minor Issues (P2)
<!-- Cosmetic or nice-to-have fixes -->

## 🔵 Technical Debt
<!-- Code that works but needs refactoring -->

## Issue Template
\`\`\`markdown
### ISSUE-001: [Brief Description]
**Severity**: P0/P1/P2
**Reported**: [Date]
**Reporter**: [Who found it]
**Status**: Open/In Progress/Resolved

**Description**:
[Detailed description of the issue]

**Steps to Reproduce**:
1. [Step]
2. [Step]

**Expected Behavior**:
[What should happen]

**Actual Behavior**:
[What actually happens]

**Workaround**:
[Any temporary fixes]

**Fix**:
[Link to PR or commit that fixes it]
\`\`\`
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "DECISIONS.md" ]; then
        cat > "$filepath" << EOF
# Technical Decisions Log

**Purpose**: Document important technical decisions and their rationale

## Decision Template
\`\`\`markdown
### DECISION-001: [Decision Title]
**Date**: [ISO Date]
**Status**: Proposed/Accepted/Deprecated
**Deciders**: [Who was involved]

**Context**:
[What is the issue we're addressing?]

**Decision**:
[What we decided to do]

**Rationale**:
[Why we made this choice]

**Alternatives Considered**:
1. [Alternative 1] - Rejected because...
2. [Alternative 2] - Rejected because...

**Consequences**:
- Positive: [Benefits]
- Negative: [Drawbacks]
- Neutral: [Trade-offs]

**Related**:
- Links to relevant docs/PRs/issues
\`\`\`

## Example Decisions

### DECISION-000: Use Orchestrator Pattern
**Date**: $(date -u +%Y-%m-%dT%H:%M:%SZ)
**Status**: Accepted
**Deciders**: Team

**Context**:
Long coding sessions with Claude result in lost focus and fabricated results.

**Decision**:
Implement orchestrator pattern with atomic 30-minute tasks and adversarial validation.

**Rationale**:
- Maintains focus through small tasks
- Prevents fabrication through independent validation
- Creates clear audit trail

**Consequences**:
- Positive: Better quality, less drift
- Negative: More overhead
- Neutral: Requires discipline
EOF
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "init-project.sh" ]; then
        cat > "$filepath" << 'INIT_EOF'
#!/bin/bash
# Initialize Claude orchestration in a project

set -euo pipefail

echo "🚀 Initializing Claude orchestration for $(basename "$PWD")..."

# Create project structure with new .work directory
mkdir -p .work/Status .work/tasks .work/sessions .work/reports .claude

# Check for global install
if [ -d "$HOME/.claude/personas" ]; then
    echo "✅ Found global Claude installation"
    
    # Create minimal CLAUDE.md that references global
    cat > CLAUDE.md << 'CLAUDE'
# Project Orchestration

This project uses Claude Global Orchestrator (~/.claude/).

## Core Rule: Proof of Work or Failure
Every task requires evidence. No proof = task failed.

## Quick Reference
- Load personas: `Load ~/.claude/personas/[role].md`
- Load preferences: `Load ~/.claude/preferences/[file].md`
- Validate work: `~/.claude/hooks/validate.sh`

## Project Structure
- `.work/` - All working files (tracked)
- `.work/Status/` - TODO, STATUS, ISSUES
- `.work/sessions/` - Daily work
- `.work/tasks/` - Task evidence

## Project-Specific Rules
<!-- Add custom rules below -->
CLAUDE
else
    echo "⚠️  No global installation found. Use local .claude/ directory"
fi

# Create initial status files
cat > .work/Status/STATUS.md << EOF
# Project Status

**Last Updated**: $(date -u +%Y-%m-%dT%H:%M:%SZ)
**Current Phase**: Initial Setup
**Overall Health**: 🟢 Good

## Summary
Project orchestration system initialized.
EOF

cat > .work/Status/TODO.md << EOF
# Project TODO List

**Created**: $(date -u +%Y-%m-%dT%H:%M:%SZ)

## Active Tasks
### 🔴 P0 - Critical
<!-- Add critical tasks here -->

### 🟡 P1 - High Priority
<!-- Add high priority tasks here -->
EOF

echo "✅ Project initialized!"
INIT_EOF
        chmod +x "$filepath"
        echo "  ✓ Created $filepath"
        
    elif [ "$filename" = "aliases.sh" ]; then
        cat > "$filepath" << 'EOF'
# Claude Orchestrator Aliases

# Project initialization
alias claude-init="~/.claude/init-project.sh"

# Validation
alias claude-validate="~/.claude/hooks/validate.sh"

# Task management (updated for .work structure)
alias claude-task='f() { mkdir -p ".work/tasks/$(date +%Y%m%d-%H%M%S)-$1" && echo "Created task: $1"; }; f'

# Status viewing (updated for .work structure)
alias claude-status="cat .work/Status/STATUS.md 2>/dev/null || echo 'No STATUS.md found'"
alias claude-todo="cat .work/Status/TODO.md 2>/dev/null || echo 'No TODO.md found'"
alias claude-issues="cat .work/Status/ISSUES.md 2>/dev/null || echo 'No ISSUES.md found'"
alias claude-decisions="cat .work/Status/DECISIONS.md 2>/dev/null || echo 'No DECISIONS.md found'"

# Evidence viewing (updated for .work structure)
alias claude-evidence='find .work/tasks -name "EVIDENCE.md" -type f -exec echo "=== {} ===" \; -exec head -20 {} \; -exec echo \;'
EOF
        echo "  ✓ Created $filepath"
        
    else
        echo "  ❌ Unknown file type: $filename"
        return 1
    fi
    
    return 0
}

# Main setup process
echo "Choose setup type:"
echo "1) Global setup (installs to ~/.claude)"
echo "2) Local setup (installs to current directory)"
echo -n "Enter choice [1-2]: "
read -r choice

case $choice in
    1)
        echo ""
        echo "🌍 Setting up global Claude orchestrator v2..."
        echo ""
        BASE_DIR="$HOME/.claude"
        
        # Create CLAUDE.md in global directory
        create_file "$BASE_DIR/CLAUDE.md" "global"
        
        # Create all files - preferences first
        create_file "$BASE_DIR/VERSION"
        create_file "$BASE_DIR/preferences/tech-stacks/web-saas.md"
        create_file "$BASE_DIR/preferences/tech-stacks/template.md"
        create_file "$BASE_DIR/preferences/git-workflow.md"
        create_file "$BASE_DIR/preferences/project-structure.md"
        create_file "$BASE_DIR/preferences/tool-priorities.md"
        create_file "$BASE_DIR/preferences/permissions.md"
        create_file "$BASE_DIR/preferences/triggers.md"
        
        # Original personas
        create_file "$BASE_DIR/personas/orchestrator.md"
        create_file "$BASE_DIR/personas/validator.md"
        create_file "$BASE_DIR/personas/software-engineer.md"
        create_file "$BASE_DIR/personas/sdet.md"
        create_file "$BASE_DIR/personas/test-engineer.md"
        create_file "$BASE_DIR/personas/devops.md"
        
        # Original validators
        create_file "$BASE_DIR/validators/ui-validation.md"
        create_file "$BASE_DIR/validators/api-validation.md"
        create_file "$BASE_DIR/validators/integration-validation.md"
        create_file "$BASE_DIR/validators/evidence-template.md"
        
        # Hooks and utilities
        create_file "$BASE_DIR/hooks/validate.sh"
        create_file "$BASE_DIR/hooks/pre-commit"
        create_file "$BASE_DIR/examples/task-template.md"
        create_file "$BASE_DIR/examples/evidence-example.md"
        create_file "$BASE_DIR/ORCHESTRATOR_CHEATSHEET.md"
        create_file "$BASE_DIR/init-project.sh"
        create_file "$BASE_DIR/aliases.sh"
        
        echo ""
        echo "✅ Global setup complete!"
        echo "📁 Installed to: $BASE_DIR"
        echo "📊 Created: 28 files"
        echo ""
        echo "To use in any project:"
        echo "  cd your-project"
        echo "  ~/.claude/init-project.sh"
        ;;
        
    2)
        echo ""
        echo "📁 Setting up local Claude orchestrator v2..."
        echo ""
        
        # Create all files including preferences
        create_file "CLAUDE.md" "local"
        create_file ".claude/VERSION"
        
        # Preferences
        create_file ".claude/preferences/tech-stacks/web-saas.md"
        create_file ".claude/preferences/tech-stacks/template.md"
        create_file ".claude/preferences/git-workflow.md"
        create_file ".claude/preferences/project-structure.md"
        create_file ".claude/preferences/tool-priorities.md"
        create_file ".claude/preferences/permissions.md"
        create_file ".claude/preferences/triggers.md"
        
        # All original personas
        create_file ".claude/personas/orchestrator.md"
        create_file ".claude/personas/validator.md"
        create_file ".claude/personas/software-engineer.md"
        create_file ".claude/personas/sdet.md"
        create_file ".claude/personas/test-engineer.md"
        create_file ".claude/personas/devops.md"
        
        # All original validators
        create_file ".claude/validators/ui-validation.md"
        create_file ".claude/validators/api-validation.md"
        create_file ".claude/validators/integration-validation.md"
        create_file ".claude/validators/evidence-template.md"
        
        # Hooks and utilities
        create_file ".claude/hooks/validate.sh"
        create_file ".claude/hooks/pre-commit"
        create_file ".claude/examples/task-template.md"
        create_file ".claude/examples/evidence-example.md"
        create_file ".claude/ORCHESTRATOR_CHEATSHEET.md"
        create_file ".claude/init-project.sh"
        create_file ".claude/aliases.sh"
        
        # Create .work structure
        mkdir -p .work/Status .work/tasks .work/sessions .work/reports
        
        # Status files
        create_file ".work/Status/STATUS.md"
        create_file ".work/Status/TODO.md"
        create_file ".work/Status/ISSUES.md"
        create_file ".work/Status/DECISIONS.md"
        
        create_file ".gitignore"
        
        # Git hooks
        if [ -d .git ]; then
            mkdir -p .git/hooks
            ln -sf ../../.claude/hooks/pre-commit .git/hooks/pre-commit
            chmod +x .git/hooks/pre-commit
            echo "✅ Git hooks configured"
        fi
        
        echo ""
        echo "✅ Local setup complete!"
        echo ""
        echo "📊 Created:"
        echo "  33 files + 8 directories"
        echo ""
        echo "Next steps:"
        echo "1. Check preferences in .claude/preferences/"
        echo "2. Define tasks in .work/Status/TODO.md"
        echo "3. Start session with git workflow"
        ;;
        
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "🎉 Setup complete! Happy orchestrating!"