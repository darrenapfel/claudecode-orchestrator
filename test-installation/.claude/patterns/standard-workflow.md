# Standard Orchestration Workflow Pattern

## Workflow Diagram
```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         ORCHESTRATION WORKFLOW                              │
└─────────────────────────────────────────────────────────────────────────────┘

REQUIREMENTS STEP
┌──────────────────┐
│ @product-manager │
│ User Stories     │
│ Acceptance Crit. │
│ Golden Paths     │
└──────────────────┘
         │
    GATE CHECK
         │
         ▼
FOUNDATION DESIGN STEP
┌──────────────────┐     ┌──────────────────┐
│   @architect     │ ║   │  @ux-designer    │
│ System Design    │ ║   │ User Flows & UX  │
│ API Contracts    │ ║   │ Wireframes       │
│ Feature Bounds   │ ║   │ UI Components    │
│ Dependency Graph │ ║   │ Design System    │
│ ARCHITECTURE.md  │ ║   │ WIREFRAMES.md    │
└──────────────────┘ ║   └──────────────────┘
         │            ║            │
         └─────── GATE CHECK ──────┘
                      ║
                   ALL PASS
                      ║
                      ▼
IMPLEMENTATION STEP (Batch 1)
┌─────────────────────┐ ┌─────────────────────┐ ┌─────────────────────┐ ┌─────────────────────┐
│ @fullstack-eng #1  │ │ @sdet #1            │ │ @fullstack-eng #2  │ │ @sdet #2            │
│ Feature A Complete  │ │ Feature A Tests     │ │ Feature B Complete  │ │ Feature B Tests     │
│ Per ARCHITECTURE.md │ │ (Written, not run)  │ │ Per ARCHITECTURE.md │ │ (Written, not run)  │
│ - API Endpoints     │ │ - Unit Tests        │ │ - API Endpoints     │ │ - Unit Tests        │
│ - UI Components     │ │ - Integration Tests │ │ - UI Components     │ │ - Integration Tests │
│ - Data Layer        │ │ - Contract Tests    │ │ - Data Layer        │ │ - Contract Tests    │
│ Report Deviations   │ │ - Edge Cases        │ │ Report Deviations   │ │ - Edge Cases        │
└─────────────────────┘ └─────────────────────┘ └─────────────────────┘ └─────────────────────┘
         ║                      ║                      ║                      ║
         ║              [Additional features...]       ║                      ║
         ║                                            ║                      ║
         └─────────────────────── ALL COMPLETE ──────────────────────────────┘
                                       ║
                                  GATE CHECK
                                       ║
                                       ▼
INTEGRATION STEP
┌─────────────────────────────────────────────────────────────────────────────┐
│                         @integration-engineer                               │
│ • Review all deviations from ARCHITECTURE.md                               │
│ • Run SDET #1's tests on Feature A → Fix failures                         │
│ • Run SDET #2's tests on Feature B → Fix failures                         │
│ • Resolve integration mismatches between features                          │
│ • Ensure all features work together                                        │
│ • Create INTEGRATION-REPORT.md                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                       ║
                                  GATE CHECK
                                       ║
                                       ▼
VALIDATION & QA STEP
┌─────────────────────┐ ┌─────────────────────┐ ┌─────────────────────┐ ┌─────────────────────┐
│ @test-engineer      │ │ @product-manager    │ │@performance-eng     │ │@security-eng        │
│ E2E Testing         │ │ Golden Path Valid.  │ │ Load Testing        │ │ Security Audit      │
│ User Journeys       │ │ User Story Verif.   │ │ Optimization        │ │ Penetration Tests   │
│ Cross-browser       │ │ Sign-off            │ │ Bottleneck Analysis │ │ Vulnerability Scan  │
└─────────────────────┘ └─────────────────────┘ └─────────────────────┘ └─────────────────────┘
         │                       │                       │                       │
         └───────────────────── GATE CHECK ─────────────────────────────────────┘
                                    ║
                               ALL PASS?
                           ╱              ╲
                         NO                YES
                         ║                  ║
                         ▼             Continue to:
    ┌─────────────────────────┐        - Next Implementation Batch
    │ FIX → INTEGRATE → VALIDATE │     - OR Deployment Step
    │        CYCLE              │      - OR Next Sprint
    │ REPEAT UNTIL ALL PASS    │
    └─────────────────────────┘
              ║
              ▼
         Fix Tasks
              ║
              ▼
      Integration Step
              ║
              ▼
     Validation & QA Step
              ║
         (Return to
         ALL PASS?)

DEPLOYMENT STEP (When all features complete)
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│@documentation    │ ║   │   @devops        │ ║   │@integration-eng  │
│ User Guides      │ ║   │ CI/CD Pipeline   │ ║   │ Final Validation │
│ API Docs         │ ║   │ Infrastructure   │ ║   │ Smoke Tests      │
│ Release Notes    │ ║   │ Monitoring       │ ║   │ Health Checks    │
└──────────────────┘ ║   └──────────────────┘ ║   └──────────────────┘
         │            ║            │           ║            │
         └────────── FINAL GATE ───────────────────────────┘
                         ║
                    COMPLETE
                         ║
                         ▼
            ┌────────────────────────┐
            │ Milestone Complete?     │
            │ More features needed?   │
            └────────────────────────┘
                    ║         ║
                   YES        NO
                    ║         ║
                    ▼         ▼
            Start Next     ✅ ALL MILESTONES COMPLETE
            Sprint (→ Requirements     Autonomous session done!
            or Implementation)
            
🔄 SPRINTS CONTINUE UNTIL ALL USER GOALS ACHIEVED

CRITICAL: The cycle REPEATS for EVERY implementation batch:
- After Auth → Integrate → Validate → Fix if needed → PASS → Next batch
- After Core Features → Integrate → Validate → Fix if needed → PASS → Next batch
- NEVER skip to next implementation batch without full validation PASS

Legend: ║ = Parallel Execution    │ = Sequential Flow    GATE = Mandatory Checkpoint
```

## Overview
This workflow ensures integrated, working software by:
1. Starting with user requirements (PM first)
2. Designing with clear interfaces upfront
3. Building complete features in parallel
4. Integration reconciliation before validation
5. Validating the working system
6. Iterating for additional feature batches

## Key Terminology

**Sprint**: A complete cycle through the workflow steps. Some sprints include all steps (Requirements → Deployment), others just Implementation → Validation. Not every sprint includes all steps - sometimes you just need Implementation→Integration→Validation.

**Implementation Batch**: Parallel work groups within Implementation Step, organized by dependencies (Implementation Batch 1 = independent work, Implementation Batch 2 = depends on Batch 1).

**Milestone**: Product-specific goals that may require multiple sprints to achieve (e.g., "Core functionality complete", "Email system working"). These represent major user value deliveries, not process stages. For example:
- Milestone 1: Core News Collection (might take 2 sprints)
- Milestone 2: Email Delivery System (might take 1 sprint)
- Milestone 3: Advanced Analytics (might take 3 sprints)

**Fix Tasks**: Remediation work created when validation fails. Always followed by mandatory Integration → Validation cycle that repeats until all validators pass.

**Steps**: The 6 workflow stages that may be included in a sprint:
1. Requirements Step
2. Foundation Design Step
3. Implementation Step
4. Integration Step
5. Validation & QA Step
6. Deployment Step

## Sprint-Based Development & The Mandatory Cycle

### The Iron Rule: IMPLEMENT → INTEGRATE → VALIDATE → PASS

**EVERY implementation batch MUST follow this cycle:**
```
1. IMPLEMENT (any coding work)
   ↓
2. INTEGRATE
   - Run ALL tests
   - Fix integration issues
   ↓
3. VALIDATE - PARALLEL!
   - Test Engineer
   - Product Manager  
   - Performance Engineer
   - Security Engineer
   ↓
4. If ANY validator fails:
   ┌─────────────────────────────────┐
   │ MANDATORY FIX CYCLE:            │
   │ • Create Fix Tasks              │
   │ • Re-run Integration Step       │
   │ • Re-run Validation Step        │
   │ • REPEAT until ALL PASS         │
   └─────────────────────────────────┘
   ↓
5. ONLY THEN proceed to:
   - Next Implementation Batch
   - OR Deployment Step
   - OR Next Sprint
```

**Example Sprint Flow:**
```
Sprint 1:
  Requirements → Foundation Design → Implement Auth → Integrate → Validate → PASS
  
Sprint 2:
  Implement Features → Integrate → Validate → FAIL
  └── Fix Cycle: Fix bugs → Re-integrate → Re-validate → FAIL
  └── Fix Cycle: Fix more → Re-integrate → Re-validate → PASS
  
Sprint 3:
  Implement Admin → Integrate → Validate → PASS → Deploy
```

**NEVER:**
- Skip integration after implementation
- Use only one validator (must be all 4 in parallel)
- Proceed to next implementation before validation PASSES
- Create made-up steps - fixes are just more implementation

### 🚨 What "PASS" Actually Means

**PASS requires ALL of these:**
- ✅ Every user story works end-to-end (not just "page loads")
- ✅ User completes the actual task (not just "API returns 200")
- ✅ Data persists correctly (not just "form submits")
- ✅ All integration tests passing (with evidence)
- ✅ Test coverage meets target (with numbers)

**These are NOT passing:**
- ❌ "92% of pages are accessible" → Features must WORK
- ❌ "Needs configuration later" → Configure it NOW
- ❌ "Works locally" → Must work in deployment
- ❌ "UI looks good" → Must function correctly
- ❌ "8/16 features working" → That's 50% FAIL

### 🔄 The Mandatory Fix Cycle

When validation fails, you MUST enter this cycle:
```
REPEAT UNTIL ALL VALIDATORS PASS:
1. Create Fix Tasks for each failure
2. Implement fixes (parallel where possible)
3. Re-run Integration Step
4. Re-run Validation Step (all 4 validators)
5. Check results:
   - All pass? → Continue to next batch/sprint
   - Any fail? → Return to step 1
```

**Example Fix Cycle (from news aggregator project):**
```
Validation Failure: PM reports topic selection doesn't persist
→ Fix Task: Correct topic persistence bug
→ Integration: Run tests, fix test failures
→ Validation: PM ✅, Security ❌ (auth tokens exposed in logs)
→ Fix Task: Remove token logging
→ Integration: Update tests for security
→ Validation: ALL ✅ → Continue
```

**PM Validation Must Test (Specific Questions):**
```
For each user story:
1. Can user complete the task? (not just "page loads")
2. Does data persist correctly? (not just "form submits")
3. Do errors recover gracefully? (test actual error cases)
4. Is performance acceptable? (measure actual response times)
5. Does the feature work end-to-end? (complete user journey)

If ANY answer is NO → FAIL → Fix required
```

## Discovery Step (When Requirements are Vague)
**Duration**: 30-45 minutes for question gathering and user response
**Goal**: Transform vague requests into actionable context
**When to use**: "Build me a...", "I want something like...", "Create an app that..."

```
PARALLEL EXECUTION:
├── Task: @product-manager - Generate business clarification questions
├── Task: @architect - Generate technical clarification questions
├── Task: @ux-designer - Generate design clarification questions
├── Task: @devops - Generate deployment clarification questions
└── Task: @security-engineer - Generate security clarification questions
```

**Orchestrator then:**
1. Consolidates questions (remove duplicates, limit to 15-20)
2. Presents organized questions to user
3. Stores responses in `.work/discovery/`
4. Documents assumptions for unanswered questions
5. Creates discovery summary for all personas to reference

**Deliverables**:
- `.work/discovery/questions/` - All questions from personas
- `.work/discovery/responses/user-responses.md` - User's answers
- `.work/discovery/responses/discovery-summary.md` - Key decisions & assumptions

**Gate Check**: Discovery complete with responses documented → Proceed to Requirements

**Why Discovery First**: Prevents costly assumptions and rework by clarifying intent upfront.

See `.claude/patterns/discovery-process.md` for detailed execution guide.

## Requirements Step (PM First!)
**Duration**: Complete before ANY design work
**Goal**: Define what we're building and why

```
SOLO EXECUTION:
└── Task A: @product-manager
    ├── Analyze PRD or user prompt
    ├── Create detailed user stories
    ├── Define acceptance criteria
    ├── Map golden path scenarios
    └── Prioritize features for implementation
```

**Deliverables**:
- `.work/foundation/product/user-stories.md`
- `.work/foundation/product/acceptance-criteria.md`
- `.work/foundation/product/golden-paths.md`

**Gate Check**: User stories COMPLETE with acceptance criteria → Proceed to Foundation Design

**Why PM First**: User needs drive architecture, not the reverse.

## Foundation Design Step (Architecture-First)
**Goal**: Design system with clear interfaces to prevent integration issues

```
PARALLEL EXECUTION:
├── Task B: @architect
│   ├── Read all user stories from PM
│   ├── Design system to support user stories
│   ├── Define EXACT API contracts for each feature
│   ├── Specify feature boundaries (what each owns)
│   ├── Document integration points between features
│   ├── Create ARCHITECTURE.md with:
│   │   ├── Feature A: routes, data models, API contracts
│   │   ├── Feature B: routes, data models, API contracts
│   │   ├── Shared resources and access patterns
│   │   └── Integration contracts between features
│   ├── Create INTERFACE.md for each feature
│   └── Define dependency graph for parallel execution
└── Task C: @ux-designer  
    ├── Read all user stories from PM
    ├── Create user flows for each story
    ├── Design wireframes and mockups
    ├── Define UI component library
    ├── Plan responsive layouts
    └── Ensure accessibility (WCAG AA)
```

**Critical Architect Deliverables**:
- `.work/foundation/architecture/ARCHITECTURE.md` - THE source of truth
- `.work/foundation/architecture/INTERFACE-[feature].md` - Per feature contracts
- `.work/foundation/architecture/DEPENDENCIES.md` - What can be built in parallel
- **ALL INTERFACES MUST BE COMPLETE** - No "TBD" sections allowed

**Gate Check**: Both complete with ALL interfaces fully defined → Proceed to Implementation

## Implementation Step (Full-Stack + SDET)
**Goal**: Build complete features following architecture contracts

### 🚨 MANDATORY FIRST: Development Environment & Infrastructure Setup

**BEFORE ANY FEATURE WORK OR PACKAGE INSTALLATION:**
```
Task: @software-engineer-1 - Set up complete development environment
Step 1: Create .gitignore (MUST BE FIRST!)
→ Add node_modules/, dist/, build/, .env, .DS_Store
→ Add any framework-specific ignores (e.g., .next/, .nuxt/)
→ Add IDE folders (.vscode/, .idea/)
→ COMMIT .gitignore before proceeding

Step 2: Initialize project and install core packages
→ Initialize package manager (npm init, yarn init, etc.)
→ Install core runtime (Node.js packages, Python venv, etc.)
→ Install frameworks from ARCHITECTURE.md
→ Create directory structure (src/, tests/, etc.)

Step 3: Set up testing infrastructure
→ Install test frameworks specified in ARCHITECTURE.md
→ Configure test scripts in package.json
→ Write ONE passing E2E test
→ EVIDENCE: Show npm run test:e2e working
```

**GATE: No feature work until environment setup complete!**

### CRITICAL RULE: Blocking Dependencies Get Integration Check

**Example from DEPENDENCIES.md:**
```
Implementation Batch 1: Authentication (blocks everything)
Implementation Batch 2: Features requiring auth
```

**WORKFLOW:**
```
Implementation Batch 1: Build Authentication
├── @fullstack-engineer #1 - Implement auth
├── @sdet #1 - Write auth tests
└── Wait for completion

⬇️ MANDATORY INTEGRATION STEP for Auth
└── @integration-engineer
    ├── Run auth tests
    ├── Verify auth ACTUALLY WORKS
    └── Fix any failures

⬇️ ONLY AFTER AUTH VERIFIED
Implementation Batch 2: Build Features Needing Auth
├── @fullstack-engineer #2 - User profile (needs auth)
├── @sdet #2 - Profile tests
├── @fullstack-engineer #3 - Todo API (needs auth)
└── @sdet #3 - Todo tests
```

### Standard Parallel Execution (Non-blocking Features)

```
PARALLEL EXECUTION (per feature):
├── Feature Team A:
│   ├── @fullstack-engineer #1
│   │   ├── MUST READ ARCHITECTURE.md first
│   │   ├── Implement Feature A per contracts:
│   │   │   ├── Backend API (exact contract)
│   │   │   ├── Frontend UI components
│   │   │   ├── Database integration
│   │   │   └── Follow boundaries defined
│   │   ├── Create EVIDENCE.md with:
│   │   │   ├── What was implemented
│   │   │   ├── Any deviations from ARCHITECTURE.md
│   │   │   └── Why deviations were necessary
│   │   └── MUST REPORT ALL DEVIATIONS
│   └── @sdet #1
│       ├── MUST READ ARCHITECTURE.md first
│       ├── Write comprehensive test suites:
│       │   ├── Unit tests (90%+ coverage targets)
│       │   ├── Integration tests (with mocked dependencies)
│       │   ├── Contract tests (verify API matches spec)
│       │   └── Edge cases and error scenarios
│       ├── Tests written as executable files
│       └── Create test EVIDENCE.md listing all test files
├── Feature Team B:
│   ├── @fullstack-engineer #2
│   │   └── [Same as Feature A]
│   └── @sdet #2
│       └── [Same as SDET #1]
└── [Additional feature teams...]
```

**Important Notes**:
- Full-stack engineers and SDETs work in TRUE parallel
- Neither runs the other's code during Implementation Step
- SDETs write tests based on architecture, not implementation
- Tests will be executed in Integration Step by integration engineer

**Deviation Protocol**:
- If implementation requires changes to interfaces → DOCUMENT in EVIDENCE.md
- Include: what changed, why it was necessary, impact on other features
- Integration engineer will reconcile all deviations in next step

**Gate Check**: ALL features complete + tests written → Proceed to Integration

## Integration Step (NEW!)
**Goal**: Reconcile all parallel work, run SDET tests, and fix issues

```
SOLO EXECUTION:
└── @integration-engineer
    ├── Read ARCHITECTURE.md (source of truth)
    ├── Review all EVIDENCE.md files for deviations
    ├── Examine all feature implementations
    ├── Run SDET test suites on corresponding features:
    │   ├── Execute SDET #1's tests on Feature A
    │   ├── Execute SDET #2's tests on Feature B
    │   ├── Fix any failing tests
    │   └── Update code to pass all tests
    ├── Identify integration mismatches:
    │   ├── API contract violations
    │   ├── Data model conflicts
    │   ├── Interface inconsistencies
    │   └── Dependency issues
    ├── Fix ALL problems:
    │   ├── Test failures from SDET suites
    │   ├── Integration mismatches between features
    │   ├── Update code to match contracts OR
    │   └── Update contracts if changes are justified
    ├── Verify all features work together
    ├── Ensure compatibility with previous sprints
    └── Create INTEGRATION-REPORT.md
```

**Integration Engineer Deliverables**:
- All SDET tests passing for all features
- All features properly integrated
- `.work/integration/INTEGRATION-REPORT.md` documenting:
  - Test results from each SDET suite
  - Test failures found and fixed
  - Deviations found and how resolved
  - Contract updates made
  - Integration verified working
  - Compatibility with previous sprints verified
- Working, tested, integrated system ready for validation

**Gate Check**: All tests passing + system integrated → Proceed to Validation Step

## Validation & QA Step
**Goal**: Validate the INTEGRATED, WORKING system

**🚨 MUST BE PARALLEL - ALL 4 VALIDATORS IN ONE MESSAGE:**
```
PARALLEL EXECUTION (NEVER SEQUENTIAL):
├── Task: @test-engineer - E2E testing and user journeys
├── Task: @product-manager - Golden path validation
├── Task: @performance-engineer - Load testing and optimization
└── Task: @security-engineer - Security audit and compliance
```

**Details per validator:**
```
@test-engineer:
├── Design and run E2E test scenarios
├── Test complete user journeys (not unit tests)
├── Cross-browser testing
├── Regression testing
├── Accessibility validation
└── Focus on system-level behavior

@product-manager:
├── Validate golden paths on WORKING system
├── Verify all user stories implemented
├── Test actual user workflows
└── Formal sign-off in .work/validation/sign-offs/

@performance-engineer:
├── Load testing on integrated system
├── Performance profiling
└── Optimization recommendations

@security-engineer:
├── Security audit of complete system
├── Penetration testing
└── Vulnerability assessment
```

**VALIDATION OUTCOMES:**
- ✅ ALL PASS → Proceed to next implementation batch or deployment
- ❌ ANY FAIL → Create fix tasks → Re-integrate → Re-validate
- 🔄 REPEAT until ALL validators PASS

**Critical**: Everyone validates the INTEGRATED system, not isolated components

## Deployment Step (When all features complete)
**Goal**: Prepare the validated system for production

```
PARALLEL EXECUTION:
├── Task K: @documentation-writer
│   ├── User documentation
│   ├── API documentation
│   └── Release notes
├── Task L: @devops
│   ├── CI/CD pipeline setup
│   ├── Infrastructure provisioning
│   └── Monitoring configuration
└── Task M: @integration-engineer
    ├── Final integration validation
    ├── Smoke test suite
    └── Health check endpoints
```

**Gate Check**: Deployment ready → Ship it!

## Key Improvements Over Previous Workflow

### 1. PM Goes First
- User stories drive everything
- Architecture serves user needs
- Clear acceptance criteria upfront

### 2. Complete Interface Definition
- Architect defines ALL interfaces upfront
- No "TBD" sections allowed
- Clear dependency graph for parallelism

### 3. Deviation Reporting
- Engineers MUST document any architecture changes
- All deviations tracked in EVIDENCE.md
- Integration engineer reconciles differences

### 4. Dedicated Integration Step
- Integration Step specifically for integration
- One engineer reviews ALL parallel work
- Fixes mismatches before validation

### 5. Smart Parallelism
- Architect defines what can be built in parallel
- Dependencies respected in task assignment
- Parallel where safe, sequential where needed

## Red Flags (Create Fix Tasks)
- Engineers not reading ARCHITECTURE.md
- Deviating from defined contracts
- Building outside feature boundaries
- Validation before integration
- Missing SDET coverage
- PM validating mockups instead of working system

## Enforcement Checklist

**Before starting design, orchestrator MUST verify:**
- [ ] @product-manager completed user stories
- [ ] Acceptance criteria defined
- [ ] Golden paths documented

**Before starting implementation, orchestrator MUST verify:**
- [ ] @architect created ARCHITECTURE.md with ALL contracts complete
- [ ] No "TBD" sections in any interface definitions
- [ ] DEPENDENCIES.md shows parallelization plan
- [ ] @ux-designer created all user flows
- [ ] INTERFACE.md files created for each feature

**During implementation, orchestrator MUST ensure:**
- [ ] All engineers read ARCHITECTURE.md first
- [ ] Features assigned per dependency graph
- [ ] Engineers know to report ALL deviations
- [ ] Deviation reporting emphasized in task descriptions

**After implementation, orchestrator MUST:**
- [ ] Collect all EVIDENCE.md files
- [ ] Check for reported deviations
- [ ] Assign integration engineer for Integration Step
- [ ] Ensure integration completes before validation

**Before marking complete, orchestrator MUST verify:**
- [ ] Integration engineer fixed all mismatches
- [ ] INTEGRATION-REPORT.md documents resolution
- [ ] System is actually integrated and working
- [ ] @product-manager validated golden paths on INTEGRATED system
- [ ] @test-engineer validated integrated system

## ARCHITECTURE.md Template

The architect MUST create this before implementation:

```markdown
# System Architecture

## User Stories Summary
[Reference PM's user stories being implemented]

## Feature Boundaries

### Feature A: User Authentication
**Owns**: 
- Routes: /api/auth/*, /login, /register
- Tables: users, sessions
- State: auth context

**API Contract**:
POST /api/auth/login
- Request: {email: string, password: string}
- Response: {token: string, user: {id, email, name}}
- Error cases: 401 (invalid credentials), 400 (missing fields)

### Feature B: Todo Management  
**Owns**:
- Routes: /api/todos/*, /todos
- Tables: todos
- State: todos context

**Depends on Feature A for**: Authentication token

**API Contract**:
POST /api/todos
- Headers: Authorization: Bearer <token>
- Request: {title: string, description?: string}
- Response: {id: string, title: string, completed: boolean}
- Error cases: 401 (no auth), 400 (invalid data)

## Integration Points
- All /api/todos/* routes require auth token from Feature A
- Token passed as: Authorization: Bearer <token>
- Shared error response format

## Shared Resources
- Database connection pool
- Redis cache for sessions
- Error handling middleware

## Development Environment & Infrastructure (MANDATORY FIRST TASK)
**CRITICAL: This MUST be the first implementation task in Sprint 1**

### Step 1: Version Control Setup (BEFORE ANY PACKAGES!)
```
.gitignore MUST include:
- node_modules/
- dist/
- build/
- .env
- .env.local
- .DS_Store
- *.log
- .vscode/
- .idea/
- coverage/
- .next/
- .nuxt/
```

### Step 2: Core Development Stack
- Runtime: Node.js 18+ (or as specified)
- Package Manager: npm/yarn/pnpm
- Build Tools: As specified for framework
- Linting: ESLint + Prettier

### Step 3: Testing Infrastructure
- E2E Testing: Playwright
- Unit Testing: Vitest + React Testing Library  
- API Testing: MSW for mocking
- Load Testing: Artillery

### Project Structure
```
src/               # Source code
tests/
├── e2e/          # User journey tests (Playwright)
├── integration/  # API integration tests
├── unit/         # Component tests
└── fixtures/     # Test data
```

### Coverage Requirements
- Minimum: 80% overall
- Critical paths: 100%
- New code: 90%

### First Implementation Task (Sprint 1, Before ANY Features)
Development environment setup MUST be completed before any feature work:
- Create and commit .gitignore FIRST
- Initialize project and package manager
- Install core runtime and packages
- Set up test frameworks
- Configure all scripts (dev, test, build)
- Write one passing E2E test
- EVIDENCE: Show git status clean + test:e2e working

## Dependency Graph (CRITICAL!)
### Sprint 1
Development Environment Setup (MANDATORY FIRST):
- Create .gitignore and commit
- Set up complete dev environment from ARCHITECTURE.md
- Configure all tooling and scripts
- Write ONE passing E2E test

Implementation Batch 1 (after environment setup):
- ALL mocked external services (see .claude/patterns/mocked-services-first.md)
- Component Library (no external dependencies)
- Core data models (no external dependencies)

Implementation Batch 2 (depends on Batch 1):
- Feature A: Authentication (requires mocked email service from Batch 1)
- Feature B: User Profile (requires models from Batch 1)

Implementation Batch 3 (depends on Batch 2):
- Feature C: Dashboard (requires Auth from Batch 2)
- Feature D: Notifications (requires Auth + mocked email)

### Sprint 2 (example)
Implementation Batch 1 (can be parallel):
- Feature C: Notifications (requires Auth from Sprint 1)
- Feature D: Search (no dependencies)

Implementation Batch 2 (depends on Batch 1):
- Feature E: Admin Panel (requires Auth + Notifications)

[Continue pattern for additional sprints]
```

## Work Directory Structure

Sprints are organized in the `.work` directory:

```
.work/
├── foundation/                  # Project-wide foundation (created once, used by all sprints)
│   ├── architecture/           # ARCHITECTURE.md, DEPENDENCIES.md, INTERFACE-*.md
│   ├── ux/                    # Wireframes, design system, component library
│   └── product/               # User stories, acceptance criteria, golden paths
├── validation/                 # Project-wide validation templates and sign-offs
│   ├── golden-paths/          # PM validation results
│   └── sign-offs/             # Sprint completion approvals
├── sprints/
│   ├── sprint-001/            # First sprint (implementation focused)
│   │   ├── implementation/    # Code and tests for this sprint
│   │   │   ├── features/     # Feature implementations
│   │   │   └── tests/        # SDET test suites
│   │   ├── integration/      # Integration reports
│   │   └── validation/       # Sprint-specific validation results
│   │
│   └── sprint-002/           # Next sprint (same structure)
│
├── PROJECT-STATE.md          # Current status
├── tasks/                    # Individual task tracking
└── sessions/                 # Work session logs
```

### Sprint Naming
- Format: `sprint-XXX` (e.g., sprint-001, sprint-002)
- Each sprint is self-contained
- Later sprints can reference earlier ones

### Cross-Sprint Dependencies
When features in sprint-002 depend on sprint-001:
- Architect documents in DEPENDENCIES.md
- Integration engineer ensures compatibility
- Tests verify cross-sprint integration

---
*User stories first. Complete architecture upfront. Smart parallelism. Integration reconciliation. Validate working systems.*
