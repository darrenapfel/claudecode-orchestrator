# Standard Orchestration Workflow Pattern

## Workflow Diagram
```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         ORCHESTRATION WORKFLOW                              │
└─────────────────────────────────────────────────────────────────────────────┘

PHASE 0: REQUIREMENTS DEFINITION
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
PHASE 1: FOUNDATION DESIGN
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
PHASE 2: PARALLEL IMPLEMENTATION
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
PHASE 2.5: INTEGRATION RECONCILIATION
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
PHASE 3: VALIDATION & QUALITY ASSURANCE
┌─────────────────────┐ ┌─────────────────────┐ ┌─────────────────────┐ ┌─────────────────────┐
│ @test-engineer      │ │ @product-manager    │ │@performance-eng     │ │@security-eng        │
│ E2E Testing         │ │ Golden Path Valid.  │ │ Load Testing        │ │ Security Audit      │
│ User Journeys       │ │ User Story Verif.   │ │ Optimization        │ │ Penetration Tests   │
│ Cross-browser       │ │ Sign-off            │ │ Bottleneck Analysis │ │ Vulnerability Scan  │
└─────────────────────┘ └─────────────────────┘ └─────────────────────┘ └─────────────────────┘
         │                       │                       │                       │
         └───────────────────── GATE CHECK ─────────────────────────────────────┘
                                    ║
                                 ALL PASS
                                    ║
                                    ▼
PHASE 4: DEPLOYMENT PREPARATION
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
            │ More features needed?  │
            └────────────────────────┘
                    ║         ║
                   YES        NO
                    ║         ║
                    ▼         ▼
            Return to      ✅ READY TO SHIP
            PHASE 0
            (Next batch)

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

## Iterative Development
The workflow is designed to handle multiple waves of features:
- Each iteration goes through all phases (0-4)
- Documentation and deployment configs update with each wave
- Previous features remain stable while new ones are added
- Integration engineer ensures new features work with existing ones

## Phase 0: Requirements Definition (PM First!)
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

**Gate Check**: User stories COMPLETE with acceptance criteria → Proceed to Phase 1

**Why PM First**: User needs drive architecture, not the reverse.

## Phase 1: Foundation Design (Architecture-First)
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

**Gate Check**: Both complete with ALL interfaces fully defined → Proceed to Phase 2

## Phase 2: Parallel Implementation (Full-Stack + SDET)
**Goal**: Build complete features following architecture contracts

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
- Neither runs the other's code during Phase 2
- SDETs write tests based on architecture, not implementation
- Tests will be executed in Phase 2.5 by integration engineer

**Deviation Protocol**:
- If implementation requires changes to interfaces → DOCUMENT in EVIDENCE.md
- Include: what changed, why it was necessary, impact on other features
- Integration engineer will reconcile all deviations in next phase

**Gate Check**: ALL features complete + tests written → Proceed to Integration

## Phase 2.5: Integration Reconciliation (NEW!)
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
  - Compatibility with previous iterations verified
- Working, tested, integrated system ready for validation

**Gate Check**: All tests passing + system integrated → Proceed to Phase 3

## Phase 3: Validation & Quality Assurance
**Goal**: Validate the INTEGRATED, WORKING system

```
PARALLEL EXECUTION:
├── Task G: @test-engineer
│   ├── Design and run E2E test scenarios
│   ├── Test complete user journeys (not unit tests)
│   ├── Cross-browser testing
│   ├── Regression testing
│   ├── Accessibility validation
│   └── Focus on system-level behavior
├── Task H: @product-manager
│   ├── Validate golden paths on WORKING system
│   ├── Verify all user stories implemented
│   ├── Test actual user workflows
│   └── Formal sign-off in .work/validation/sign-offs/
├── Task I: @performance-engineer
│   ├── Load testing on integrated system
│   ├── Performance profiling
│   └── Optimization recommendations
└── Task J: @security-engineer
    ├── Security audit of complete system
    ├── Penetration testing
    └── Vulnerability assessment
```

**Note on Test Types**:
- Unit/integration tests already run in Phase 2.5
- Test engineer focuses on END-TO-END user scenarios
- PM validates from business/user perspective

**Critical**: Everyone validates the INTEGRATED system, not isolated components

**Gate Check**: ALL validations PASS → Proceed to Phase 4

## Phase 4: Deployment Preparation
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

### 4. Dedicated Integration Phase
- Phase 2.5 specifically for integration
- One engineer reviews ALL parallel work
- Fixes mismatches before validation

### 5. Smart Parallelism
- Architect defines what can be built in parallel
- Dependencies respected in task assignment
- Parallel where safe, sequential where needed

## Red Flags (Create Fix Phase)
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
- [ ] Assign integration engineer for Phase 2.5
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

## Dependency Graph (CRITICAL!)
### Iteration 1
Phase 2a (can be parallel):
- Feature A: Authentication (no dependencies)
- Component Library (no dependencies)

Phase 2b (depends on 2a):
- Feature B: Todos (requires Auth from 2a)
- User Dashboard (requires Component Library)

### Iteration 2 (example)
Phase 2a (can be parallel):
- Feature C: Notifications (requires Auth from Iteration 1)
- Feature D: Search (no dependencies)

Phase 2b (depends on 2a):
- Feature E: Admin Panel (requires Auth + Notifications)

[Continue pattern for additional iterations]
```

---
*User stories first. Complete architecture upfront. Smart parallelism. Integration reconciliation. Validate working systems.*