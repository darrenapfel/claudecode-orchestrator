# Standard Orchestration Workflow Pattern

## Workflow Diagram
```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         ORCHESTRATION WORKFLOW                              │
└─────────────────────────────────────────────────────────────────────────────┘

PHASE 0: FOUNDATION (MANDATORY)
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│   @architect     │ ║   │  @ux-designer    │ ║   │@product-manager  │
│ System Design    │ ║   │ User Flows & UX  │ ║   │ User Stories     │
│ Data Architecture│ ║   │ Wireframes       │ ║   │ Acceptance Crit. │
└──────────────────┘ ║   └──────────────────┘ ║   └──────────────────┘
         │            ║            │           ║            │
         └──────────────── GATE 1 ─────────────────────────┘
                  ║
                 PASS
                  ║
                  ▼
PHASE 1: IMPLEMENTATION 
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│ @software-eng #1 │ ║   │     @sdet #1     │ ║   │ @software-eng #2 │ ║ ...
│ Feature A Code   │ ║   │ Feature A Tests  │ ║   │ Feature B Code   │ ║
│                  │ ║   │                  │ ║   │                  │ ║
└──────────────────┘ ║   └──────────────────┘ ║   └──────────────────┘ ║
         │            ║            │           ║            │           ║
         └──────────── GATE 2 ──────────────────────────────┘          ║
                      ║                                                 ║
                     PASS                                                ║
                      ║                                                 ║
                      ▼                                                 ║
PHASE 2: VALIDATION & DOCUMENTATION                                      ║
┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
│ @test-engineer  │ │@product-manager │ │@performance-eng │ │@security-eng    │ │@documentation   │
│ E2E Testing     │ │ Golden Path     │ │ Load Testing    │ │ Security Audit  │ │ API Docs        │
│ Integration     │ │ User Validation │ │ Optimization    │ │ Penetration     │ │ User Guides     │
└─────────────────┘ └─────────────────┘ └─────────────────┘ └─────────────────┘ └─────────────────┘
         │                   │                   │                   │                   │
         └─────────────────── GATE 3 ───────────────────────────────────────────────────┘
                              ║
                             PASS  
                              ║
                              ▼
PHASE 3: INTEGRATION & ARCHITECTURE UPDATES
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│@integration-eng  │ ║   │   @architect     │ ║   │     @devops      │
│ Stream Merge     │ ║   │ Architecture     │ ║   │ Deployment Prep  │
│ Compatibility    │ ║   │ Updates          │ ║   │ CI/CD Pipeline   │
└──────────────────┘ ║   └──────────────────┘ ║   └──────────────────┘
         │            ║            │           ║            │
         └─────────── GATE 4 ──────────────────────────────┘
                      ║
                   COMPLETE
                      ║
                      ▼
               ✅ MISSION SUCCESS

Legend: ║ = Parallel Execution    │ = Sequential Flow    GATE = Mandatory Checkpoint
```

## Overview
This is the mandatory workflow pattern for ALL orchestration sessions. No exceptions.

## Phase 0: Foundation (MANDATORY - Never Skip)
**Duration**: Must complete before ANY implementation
**Goal**: Establish architecture, UX foundation, and user stories

```
PARALLEL EXECUTION:
├── Task A: @architect
│   └── Design system architecture, boundaries, data flow
├── Task B: @ux-designer  
│   └── Create user flows, wireframes, experience design
└── Task C: @product-manager
    └── Create user stories, acceptance criteria, golden paths
```

**Gate Check**: All three tasks COMPLETE with evidence → Proceed to Phase 1

## Phase 1: Implementation (After Foundation Only)
**Goal**: Build features in parallel with testing

```
PARALLEL EXECUTION (per feature):
├── Task C: @software-engineer
│   └── Implement Feature X with proper error handling
├── Task D: @sdet
│   └── Write unit/integration tests for Feature X
├── Task E: @software-engineer  
│   └── Implement Feature Y with proper error handling
└── Task F: @sdet
    └── Write unit/integration tests for Feature Y
```

**Key Rules**:
- ONE persona per task
- Implementation and testing happen in parallel
- Each feature gets separate implementation + test tasks

**Gate Check**: ALL implementation + testing COMPLETE → Proceed to Phase 2

## Phase 2: Independent Validation & Documentation
**Goal**: Comprehensive validation and documentation by different personas

```
PARALLEL EXECUTION:
├── Task G: @test-engineer
│   └── Run full test suite, E2E validation, integration testing
├── Task H: @product-manager
│   └── Golden path validation, user story verification
├── Task I: @performance-engineer
│   └── Load testing, performance profiling, optimization analysis
├── Task J: @security-engineer
│   └── Security audit, vulnerability assessment, penetration testing
└── Task K: @documentation-writer
    └── API docs, user guides, deployment instructions
```

**Critical**: ALL validation personas are DIFFERENT from Phase 1 implementers

**Gate Check**: ALL validations PASS → Proceed to Phase 3

## Phase 3: Integration Convergence & Architecture Updates
**Goal**: Ensure all parallel streams work together and update architecture

```
PARALLEL EXECUTION:
├── Task L: @integration-engineer
│   └── Collect all INTERFACE.md files, test cross-component compatibility  
├── Task M: @architect
│   └── Update architecture based on implementation learnings and validation findings
└── Task N: @devops
    └── Deployment planning, infrastructure setup, CI/CD pipeline
```

**Gate Check**: Integration PASS + Architecture updated → Phase Complete

## Red Flags (Create Fix Phase)
- Any persona validating own work
- Missing @architect or @ux-designer foundation  
- Combined persona assignments ("@engineer and @designer")
- Implementation before architecture
- Missing evidence files
- Failed validations ignored

## Enforcement Checklist

**Before starting implementation, orchestrator MUST verify:**
- [ ] @architect task complete with evidence
- [ ] @ux-designer task complete with evidence  
- [ ] All tasks assigned to exactly ONE persona
- [ ] Validation personas different from implementation personas

**Before marking phase complete, orchestrator MUST verify:**
- [ ] All evidence files present and verified
- [ ] @product-manager validated user experience
- [ ] @test-engineer provided technical validation
- [ ] @integration-engineer confirmed compatibility
- [ ] No persona validated their own work

---
*Foundation first. One persona per task. Adversarial validation. Integration mandatory.*