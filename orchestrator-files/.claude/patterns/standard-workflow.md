# Standard Orchestration Workflow Pattern

## Overview
This is the mandatory workflow pattern for ALL orchestration sessions. No exceptions.

## Phase 0: Foundation (MANDATORY - Never Skip)
**Duration**: Must complete before ANY implementation
**Goal**: Establish architecture and UX foundation

```
PARALLEL EXECUTION:
├── Task A: @architect
│   └── Design system architecture, boundaries, data flow
└── Task B: @ux-designer  
    └── Create user flows, wireframes, experience design
```

**Gate Check**: Both tasks COMPLETE with evidence → Proceed to Phase 1

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

## Phase 2: Independent Validation 
**Goal**: Adversarial validation by different personas

```
PARALLEL EXECUTION:
├── Task G: @test-engineer
│   └── Run full test suite, E2E validation, performance check
└── Task H: @validator
    └── Adversarial review of ALL evidence from Phase 1
```

**Critical**: @validator and @test-engineer are DIFFERENT from Phase 1 implementers

**Gate Check**: ALL validations PASS → Proceed to Phase 3

## Phase 3: Integration Convergence
**Goal**: Ensure all parallel streams work together

```
SINGLE TASK:
└── Task I: @integration-engineer
    └── Collect all INTERFACE.md files, test cross-component compatibility
```

**Gate Check**: Integration PASS → Phase Complete

## Red Flags (Create Fix Phase)
- Any persona validating own work
- Missing @architect or @ux-designer foundation  
- Combined persona assignments ("@engineer and @designer")
- Implementation before architecture
- Missing evidence files
- Failed validations ignored

## Example: Building Todo API

### Phase 0: Foundation
```
Task A: @architect
- Design database schema, API endpoints, authentication flow
- Output: ARCHITECTURE.md with system diagram

Task B: @ux-designer  
- Design user flows for create/read/update/delete todos
- Output: USER-FLOWS.md with wireframes
```

### Phase 1: Implementation  
```
Task C: @software-engineer
- Implement todo CRUD endpoints with validation
- Output: Working API with error handling

Task D: @sdet
- Write API tests for all endpoints
- Output: Test suite with 95%+ coverage

Task E: @software-engineer
- Implement user authentication system  
- Output: Login/logout endpoints with JWT

Task F: @sdet
- Write authentication tests and security validation
- Output: Security test suite
```

### Phase 2: Validation
```
Task G: @test-engineer
- Run full API test suite, load testing, E2E validation
- Output: Performance metrics, test report

Task H: @validator  
- Review all evidence, attempt to break the system
- Output: Validation report with PASS/FAIL
```

### Phase 3: Integration
```
Task I: @integration-engineer
- Test auth + todo endpoints together, verify no conflicts
- Output: Integration test results, deployment readiness
```

## Enforcement Checklist

**Before starting implementation, orchestrator MUST verify:**
- [ ] @architect task complete with evidence
- [ ] @ux-designer task complete with evidence  
- [ ] All tasks assigned to exactly ONE persona
- [ ] Validation personas different from implementation personas

**Before marking phase complete, orchestrator MUST verify:**
- [ ] All evidence files present and verified
- [ ] @validator provided adversarial review
- [ ] @integration-engineer confirmed compatibility
- [ ] No persona validated their own work

---
*Foundation first. One persona per task. Adversarial validation. Integration mandatory.*