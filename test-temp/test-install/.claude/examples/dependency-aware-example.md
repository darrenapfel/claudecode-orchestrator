# Example: Dependency-Aware Execution - E-Commerce Platform

This example shows how the orchestrator maximizes parallelism while respecting dependencies.

## Initial Request
"Build an e-commerce platform with product catalog, shopping cart, and checkout with payment processing"

## Sprint 1: Foundation & Core APIs

### Dependency Analysis
```
Database Schema
    ├── Product API ──┐
    ├── User API ─────┼── Cart API ──── Checkout API
    └── Order API ────┘                        │
                                       Payment Gateway
```

### Implementation Batch 1: Foundation (Parallel - No Dependencies)
```markdown
Task: @software-engineer-1 - Set up testing infrastructure
Task: @software-engineer-2 - Database schema (users, products, orders)
Task: @devops - Configure payment gateway
Task: @security-engineer - Set up auth middleware
```

**Why parallel?** None of these depend on each other.

### Integration Step
- Run tests on database schema
- Verify payment gateway connection
- Test auth middleware

### Implementation Batch 2: Core APIs (Parallel After Database)
```markdown
Task: @software-engineer-3 - Product API (/api/products)
Task: @sdet-1 - Product API tests
Task: @software-engineer-4 - User API (/api/users, /api/auth)  
Task: @sdet-2 - User API tests
Task: @software-engineer-5 - Order API (/api/orders)
Task: @sdet-3 - Order API tests
```

**Dependencies respected**: All need database schema from Batch 1.

### Integration Step
- Run all API tests
- Fix integration issues
- Verify APIs work together

### Validation Step (All 4 Validators in Parallel)
- PM: Can create products, users, orders?
- Test Engineer: API integration tests pass?
- Performance: APIs handle load?
- Security: Auth properly implemented?

## Sprint 2: Shopping Features

### Implementation Batch 3: Cart & Checkout
```markdown
Task: @software-engineer-6 - Shopping cart (needs Product + User APIs)
Task: @sdet-4 - Cart tests
```

**Wait for cart completion, then:**

```markdown
Task: @software-engineer-7 - Checkout flow (needs Cart + Order + Payment)
Task: @sdet-5 - Checkout tests
```

**Why sequential?** Checkout depends on working cart.

### Integration → Validation → Deploy

## Time Comparison

**Sequential Approach**: 9 tasks × 30 min = 4.5 hours
**Smart Parallel**: ~1.5 hours total
**Speedup**: 3x faster while respecting all dependencies

## Key Principles

1. **Testing First**: Always set up testing infrastructure before features
2. **Batch by Dependencies**: Group tasks that can run in parallel
3. **Integrate Early**: Don't wait until the end to integrate
4. **Validate Continuously**: Each sprint gets full validation

## Evidence Structure
```
.work/milestones/20250628-auth-system/sprint-001/
├── implementation/
│   ├── testing-setup/EVIDENCE.md
│   ├── database-schema/EVIDENCE.md
│   ├── payment-config/EVIDENCE.md
│   └── auth-middleware/EVIDENCE.md
├── integration/
│   └── INTEGRATION-REPORT.md
└── validation/
    ├── pm-signoff.md
    ├── test-results.md
    ├── performance-report.md
    └── security-audit.md
```

---
*Smart dependency management enables parallelism without sacrificing correctness.*
