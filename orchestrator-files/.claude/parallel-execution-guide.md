# Parallel Execution Guide

## Core Principle
Claude can spawn unlimited parallel tasks. Use this power to maximize efficiency.

## When to Parallelize

### ALWAYS Parallelize Within Phases:
```
[PARALLEL:feature-name]
├── Multiple @software-engineer tasks for different components
├── @sdet tasks writing tests while code develops
├── @ux-designer creating UI while backend builds
└── @security-engineer reviewing patterns
[CONVERGE:feature-name] → Integration point
```

### Natural Parallelism Patterns

#### 1. Feature Development
```
[PARALLEL:user-service]
├── @software-engineer-1: Core service logic
├── @software-engineer-2: API endpoints
├── @software-engineer-3: Database layer
├── @sdet-1: Unit tests
├── @sdet-2: Integration tests
└── @security-engineer: Security review
[CONVERGE:user-service]
```
All 6 tasks execute simultaneously.

#### 2. UI-Heavy Features
```
[PARALLEL:dashboard]
├── @software-engineer: React components
├── @ux-designer-1: Layout design
├── @ux-designer-2: Responsive styling
├── @ux-designer-3: Dark mode theme
├── @test-engineer: Visual regression tests
└── @performance-engineer: Bundle optimization
[CONVERGE:dashboard]
```

#### 3. Multi-Feature Projects
Start next feature when current feature's core API stabilizes:
```
Auth:      ████████░░ (80% - API stable)
Catalog:   ░░░█████░░ (Starting - uses Auth API)
Dashboard: ░░░░░███░░ (Starting - uses both APIs)
```

## Convergence Requirements

All parallel tasks must:
1. Reach "ready" state before convergence
2. Have committed their code
3. Have evidence of functionality
4. Be tested against each other's work

## Evidence of Parallelism

Tasks must reference other parallel work:
```markdown
## Task Evidence: API Implementation
- Implemented user endpoints for @sdet-1 to test
- Exposed OpenAPI spec for @documentation-writer
- Used security patterns reviewed by @security-engineer
- Performance metrics: 50ms average (measured by @performance-engineer)
```

## Optimal Task Distribution

### For 1 Feature (e.g., Authentication)
- 3-4 engineers on different layers
- 2 SDETs (unit + integration)
- 1 security engineer
- 1 UX designer (if UI exists)
**Total: 7-8 parallel tasks**

### For 3 Features (Full System)
- 12-15 engineers across features
- 6 SDETs for different test types
- 3 security engineers (one per feature)
- 5 UX designers for UI components
**Total: 26-29 parallel tasks**

## Anti-Pattern: Sequential Execution
```
WRONG:
Task 1 complete (10:00) → 
Task 2 starts (10:30) → 
Task 3 starts (11:00)

RIGHT:
Task 1 starts (10:00)
Task 2 starts (10:01)
Task 3 starts (10:02)
All converge at (10:30)
```

## Dependencies That Require Sequencing

Some things genuinely can't be parallel:
1. Database must exist before services
2. API must exist before frontend can call it
3. Build must pass before deployment

But within each phase, maximize parallelism.

## Example: Complete Web App

```
Phase 1: Foundation [PARALLEL]
├── Database schema (engineer-1)
├── API structure (engineer-2)
├── Frontend scaffold (engineer-3)
├── CI/CD setup (devops)
└── Test framework (sdet)

Phase 2: Features [PARALLEL×3]
├── Auth feature (4 parallel tasks)
├── Product catalog (4 parallel tasks)
└── Admin panel (4 parallel tasks)

Phase 3: Integration [PARALLEL]
├── Cross-feature tests (sdet-1)
├── E2E scenarios (test-engineer)
├── Performance testing (perf-engineer)
└── Security audit (security-engineer)

Phase 4: Production [PARALLEL]
├── Deployment prep (devops)
├── Documentation (doc-writer)
├── Final validation (validator)
└── Monitoring setup (devops-2)
```

Total time: 4 × 30min = 2 hours (vs 20+ hours sequential)

## Remember
- Parallel is the DEFAULT
- Sequential needs justification
- More parallel tasks = faster delivery
- Convergence ensures integration