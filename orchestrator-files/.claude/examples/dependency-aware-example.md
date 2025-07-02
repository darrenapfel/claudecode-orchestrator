# Example: Dependency-Aware Execution - E-Commerce Platform

This example shows how the orchestrator intelligently handles dependencies while maximizing parallelism.

## Initial Request
"Build an e-commerce platform with product catalog, shopping cart, and checkout with payment processing"

## Orchestrator's Dependency Analysis

### Step 1: Identify Dependencies
```
1. Database schema must exist before APIs
2. Product model required before cart implementation  
3. User authentication needed before checkout
4. Payment gateway config before payment processing
5. All features need testing and security audit
```

### Step 2: Create Dependency Graph
```
Database Schema
    ├── Product API ──┐
    ├── User API ─────┼── Cart API ──── Checkout API
    └── Order API ────┘                        │
                                       Payment Gateway
```

### Step 3: Optimal Execution Strategy
**Strategy: Progressive Parallel Execution**

## Execution Plan

### Phase 1: Foundation (0-10 minutes)
**Parallel Streams:**
- Stream A: Database Schema (@software-engineer)
- Stream B: Test Framework Setup (@sdet)  
- Stream C: Security Framework (@security-engineer)
- Stream D: Payment Gateway Config (@devops)

```markdown
## Phase 1 Task Definition

### Stream A: Database Schema
**Dependencies**: None
**Can start**: Immediately
**Outputs for others**:
- product.schema → Product API
- user.schema → User API
- order.schema → Order API

### Stream B: Test Framework
**Dependencies**: None
**Can start**: Immediately
**Outputs**: Test utilities for all streams

### Stream C: Security Framework  
**Dependencies**: None
**Can start**: Immediately
**Outputs**: Security policies, auth middleware

### Stream D: Payment Gateway
**Dependencies**: None
**Can start**: Immediately
**Outputs**: Payment config for Checkout API
```

### Phase 2: Core APIs (10-20 minutes)
**Parallel Streams:**
- Stream E: Product API (@software-engineer)
- Stream F: User API (@software-engineer-2)
- Stream G: Order API (@software-engineer-3)
- Stream H: API Testing (@sdet)
- Stream I: API Security Audit (@security-engineer)

```markdown
## Phase 2 Task Definition

### Stream E: Product API
**Dependencies**: 
- Prerequisites: Database Schema (Stream A)
- Required inputs: product.schema
- Can start**: After Phase 1 completes
**Outputs**: /api/products endpoints

### Stream F: User API
**Dependencies**:
- Prerequisites: Database Schema (Stream A)
- Required inputs: user.schema, auth middleware (Stream C)
- Can start**: After Phase 1 completes
**Outputs**: /api/users, /api/auth endpoints

### Stream G: Order API
**Dependencies**:
- Prerequisites: Database Schema (Stream A)
- Required inputs: order.schema
- Can start**: After Phase 1 completes
**Outputs**: /api/orders endpoints

### Stream H: API Testing
**Dependencies**:
- Prerequisites: Test Framework (Stream B)
- Can start**: After Phase 1, parallel with API development
**Note**: Writes tests based on specs while APIs are built

### Stream I: API Security Audit
**Dependencies**:
- Prerequisites: Security Framework (Stream C)
- Can start**: After Phase 1, parallel with API development
**Note**: Audits API designs and early implementation
```

### Phase 3: Integration Features (20-30 minutes)
**Parallel Streams:**
- Stream J: Shopping Cart (@software-engineer)
- Stream K: Checkout Flow (@software-engineer-2)
- Stream L: Integration Testing (@sdet)
- Stream M: End-to-End Testing (@test-engineer)
- Stream N: Final Security Validation (@test-engineer)

```markdown
## Phase 3 Task Definition

### Stream J: Shopping Cart
**Dependencies**:
- Prerequisites: Product API (E), User API (F)
- Required inputs: Product endpoints, User sessions
- Can start**: After Phase 2 streams E & F complete
**Outputs**: Cart functionality

### Stream K: Checkout Flow
**Dependencies**:
- Prerequisites: All APIs (E,F,G), Payment Gateway (D)
- Required inputs: All API endpoints, Payment config
- Can start**: After Phase 2 completes
**Outputs**: Complete checkout process

### Stream L: Integration Testing
**Dependencies**:
- Prerequisites: Cart (J) and initial Checkout (K)
- Can start**: Parallel with K, after J starts
**Outputs**: Integration test results

### Stream M: E2E Testing
**Dependencies**:
- Prerequisites: All features implemented
- Can start**: As features complete
**Outputs**: Full user flow validation

### Stream N: Final Validation
**Dependencies**: All streams
**Can start**: After all implementation complete
**Outputs**: Final security and functionality approval
```

## Execution Timeline

```
Time    Phase 1 (Foundation)          Phase 2 (APIs)              Phase 3 (Integration)
--------|----------------------------|---------------------------|----------------------
T+0     | A: Database Schema         |                          |
        | B: Test Framework          |                          |
        | C: Security Framework      |                          |
        | D: Payment Gateway         |                          |
T+5     | All streams working...     |                          |
T+10    | ✓ Phase 1 Complete         | E: Product API           |
        |                            | F: User API              |
        |                            | G: Order API             |
        |                            | H: API Testing           |
        |                            | I: Security Audit        |
T+15    |                            | APIs near completion...  |
T+20    |                            | ✓ Phase 2 Complete       | J: Shopping Cart
        |                            |                          | K: Checkout Flow
        |                            |                          | L: Integration Tests
        |                            |                          | M: E2E Tests
T+25    |                            |                          | Integration working...
T+30    |                            |                          | ✓ All Complete → Validation
```

## Benefits of Intelligent Dependency Management

### 1. **Maximum Parallelism**
- 4 streams in Phase 1 (fully parallel)
- 5 streams in Phase 2 (parallel after dependencies)
- 4 streams in Phase 3 (parallel where possible)
- Total: 13 parallel streams vs 13 sequential tasks

### 2. **Dependency Respect**
- Database exists before APIs try to use it
- APIs exist before cart/checkout need them
- Payment configured before checkout uses it

### 3. **Early Testing**
- Test framework ready from minute 0
- Tests written in parallel with implementation
- Security auditing throughout, not just at end

### 4. **Time Savings**
- Sequential approach: ~6.5 hours (13 tasks × 30 min)
- Intelligent parallel: 30 minutes total
- **13x faster** while respecting all dependencies

## Evidence Structure
```
.work/tasks/20250628-ecommerce/
├── phase1/
│   ├── database-schema/EVIDENCE.md
│   ├── test-framework/EVIDENCE.md
│   ├── security-framework/EVIDENCE.md
│   └── payment-gateway/EVIDENCE.md
├── phase2/
│   ├── product-api/EVIDENCE.md
│   ├── user-api/EVIDENCE.md
│   ├── order-api/EVIDENCE.md
│   ├── api-testing/EVIDENCE.md
│   └── api-security/EVIDENCE.md
├── phase3/
│   ├── shopping-cart/EVIDENCE.md
│   ├── checkout-flow/EVIDENCE.md
│   ├── integration-tests/EVIDENCE.md
│   └── e2e-tests/EVIDENCE.md
└── FINAL-VALIDATION.md
```

## Key Lessons

1. **Dependencies Don't Mean Sequential**: Many tasks can still run in parallel
2. **Phases Enable Parallelism**: Group independent tasks within phases
3. **Smart Orchestration**: The orchestrator identifies optimal execution paths
4. **Evidence at Every Level**: Each phase produces verifiable outputs

---
*This example demonstrates how intelligent dependency analysis enables massive parallelism while respecting technical requirements.*
