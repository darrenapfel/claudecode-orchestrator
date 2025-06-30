# Task Breakdown Example: User Authentication Feature

## Feature Analysis
User authentication with login, logout, password reset, and session management.

## Dependency Mapping
```
1. Database schema (no deps)
2. Auth service (depends on 1)
3. API endpoints (depends on 2)  
4. Frontend components (depends on 3)
5. Integration tests (depends on 2,3,4)
```

## Parallel Execution Plan

### Phase 1: Foundation (Parallel)
```
[PARALLEL:auth-foundation]
├── @software-engineer-1: Database schema & migrations
├── @software-engineer-2: Auth service skeleton
├── @sdet-1: Test structure setup
└── @security-engineer: Security requirements doc
[CONVERGE:auth-foundation]
```

### Phase 2: Core Implementation (Parallel)
```
[PARALLEL:auth-core]
├── @software-engineer-1: Login/logout endpoints
├── @software-engineer-2: Password reset flow
├── @software-engineer-3: Session management
├── @sdet-1: Unit tests for auth service
├── @sdet-2: API integration tests
└── @ux-designer: Login/reset UI mockups
[CONVERGE:auth-core]
```

### Phase 3: Frontend & Integration (Parallel)
```
[PARALLEL:auth-frontend]
├── @software-engineer-4: Login component
├── @software-engineer-5: Password reset component
├── @software-engineer-6: Auth context/state
├── @ux-designer: Responsive styling
├── @sdet-3: Frontend unit tests
└── @test-engineer: E2E test scenarios
[CONVERGE:auth-frontend]
```

### Phase 4: Validation & Security (Parallel)
```
[PARALLEL:auth-validation]
├── @test-engineer: Full E2E suite with Playwright
├── @security-engineer: Penetration testing
├── @performance-engineer: Load testing auth endpoints
└── @validator: Complete system validation
[CONVERGE:auth-validation]
```

## Task Sizing Guidelines

### 30-Minute Tasks:
- Single endpoint implementation
- Component with tests
- Database migration
- Security review of one flow
- E2E test for one journey

### Too Large (Split Required):
- "Implement entire auth system"
- "Create all frontend components"  
- "Write all tests"

### Too Small (Combine):
- "Create login button"
- "Add password field"
- "Write one test"

## Evidence Requirements per Task

1. **Code commit** with descriptive message
2. **Test results** showing pass/fail
3. **Screenshot** if UI involved
4. **Performance metrics** if applicable
5. **Security scan** results if security-related

## Convergence Checkpoints

At each [CONVERGE]:
- All parallel tasks complete
- Integration tests pass
- No merge conflicts
- Build succeeds
- Ready for next phase

## Total Execution Time

With proper parallelization:
- Sequential: 16 tasks × 30 min = 8 hours
- Parallel: 4 phases × 30 min = 2 hours
- Efficiency gain: 75%