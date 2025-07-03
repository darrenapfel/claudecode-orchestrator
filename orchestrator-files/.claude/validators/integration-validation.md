# Integration Validation Protocol

## Context
This validation runs as part of the 4-validator parallel process after Integration Step.

## Purpose
Integration validation ensures all components work together as a cohesive system, not just in isolation.

## Required Evidence for Integration Tasks

### 1. End-to-End User Journeys
Document complete flows from user action to final result:

```markdown
## User Registration Journey
1. User clicks "Sign Up" → UI responds ✅
2. Enters email/password → Client validation ✅
3. Submits form → API called ✅
4. API validates data → Returns 201 ✅
5. User record created → Database verified ✅
6. Welcome email sent → Email service called ✅
7. User redirected to dashboard → UI updates ✅
8. Session established → Auth token valid ✅

Total journey time: 2.3 seconds ✅
```

### 2. Service Communication Tests
Verify all services communicate correctly:

```bash
# Test service mesh
curl http://api-service/health → ✅ 200 OK
curl http://auth-service/health → ✅ 200 OK
curl http://email-service/health → ✅ 200 OK

# Test inter-service auth
curl -X POST http://api-service/internal/validate \
  -H "X-Service-Token: ${SERVICE_TOKEN}" → ✅ Authorized

# Test service discovery
nslookup auth-service → ✅ Resolves correctly
```

### 3. Data Flow Validation
Trace data through the entire system:

```markdown
## Order Processing Flow
1. **UI Layer**: Order submitted with items
   - Data: {items: [...], total: 99.99}
   
2. **API Gateway**: Request validated
   - Added: {timestamp, requestId}
   
3. **Order Service**: Business logic applied
   - Added: {orderId, status: "pending"}
   - Validated: Inventory available
   
4. **Payment Service**: Payment processed
   - Added: {transactionId, paymentStatus}
   
5. **Database**: Order persisted
   - Tables updated: orders, order_items, inventory
   
6. **Event Bus**: Order event published
   - Event: "order.created"
   
7. **Email Service**: Confirmation sent
   - Template: order-confirmation
   - Status: Delivered

✅ Data integrity maintained throughout
```

### 4. Failure Recovery Tests
Test system resilience:

```bash
# Database failover
1. Kill primary database → ✅ Failover in 3s
2. Verify writes continue → ✅ No data loss
3. Restore primary → ✅ Automatic rebalance

# Service failure handling
1. Kill auth service → ✅ Circuit breaker activated
2. Verify graceful degradation → ✅ Cached auth works
3. Restart service → ✅ Auto-recovery

# Network partition
1. Simulate network split → ✅ Detected in 5s
2. Verify partial functionality → ✅ Read-only mode
3. Restore network → ✅ Full recovery, no data loss
```

### 5. Cross-Component Validation
Ensure components respect shared contracts:

```markdown
## Shared Contract Validation
- User ID format: UUID v4 → ✅ All services comply
- Date format: ISO 8601 → ✅ Consistent across APIs
- Error format: {error: {code, message}} → ✅ Uniform
- Auth header: Bearer token → ✅ All endpoints
- Pagination: {page, limit, total} → ✅ Standardized
```

### 6. Performance Under Integration
Test combined system performance:

```bash
# Full user journey load test
ab -n 1000 -c 100 -g results.tsv \
  http://localhost:3000/api/complete-journey

Results:
- 95th percentile: 450ms ✅
- 99th percentile: 890ms ✅
- Error rate: 0% ✅
- Throughput: 220 req/s ✅
```

## Integration Evidence Format

```markdown
# Integration Validation Evidence

**Sprint**: Sprint-XXX
**System Components**: [List all integrated]
**Validator**: @test-engineer
**Validation Time**: YYYY-MM-DD HH:MM:SS

## Component Status
- Frontend: ✅ Running (v1.2.3)
- API Gateway: ✅ Running (v2.1.0)
- Auth Service: ✅ Running (v1.5.2)
- Order Service: ✅ Running (v3.0.1)
- Email Service: ✅ Running (v1.1.0)
- Database: ✅ Running (PostgreSQL 14.5)
- Cache: ✅ Running (Redis 7.0)

## Integration Tests

### User Journey: Registration → First Order
1. Register new user ✅ (1.2s)
2. Verify email ✅ (0.3s)
3. Login ✅ (0.5s)
4. Browse products ✅ (0.8s)
5. Add to cart ✅ (0.2s)
6. Checkout ✅ (2.1s)
7. Receive confirmation ✅ (1.5s)

Total journey: 6.6s ✅

### Service Communication
✅ All health checks passing
✅ Inter-service auth working
✅ Event bus delivering messages
✅ No timeout errors

### Data Integrity
✅ User data consistent across services
✅ Order totals match across systems
✅ Inventory correctly decremented
✅ Audit trail complete

### Failure Recovery
✅ Database failover tested
✅ Service failures handled gracefully
✅ Network issues don't lose data
✅ System self-heals after issues
```

## Common Integration Failures

❌ **Service version mismatch**: APIs incompatible
❌ **Missing error handling**: One service failure crashes flow
❌ **Data inconsistency**: Different services show different data
❌ **No retry logic**: Temporary failures become permanent
❌ **Timeout cascade**: One slow service blocks everything
❌ **Missing circuit breakers**: Failures spread across system
❌ **No service discovery**: Hardcoded service URLs
❌ **Event loss**: Messages disappear without processing

## Integration Validation Checklist

- [ ] All user journeys tested end-to-end
- [ ] Service health checks passing
- [ ] Inter-service communication verified
- [ ] Data flows traced completely
- [ ] Failure scenarios tested
- [ ] Performance acceptable under load
- [ ] No data inconsistencies found
- [ ] Error handling works across services
- [ ] Monitoring and logging functional
- [ ] Recovery procedures tested

## Sprint Context

Integration validation ensures that Implementation Batches work together:
- After Batch 1: Validate foundation services integrate
- After Batch 2: Validate new features integrate with Batch 1
- After Batch 3: Validate entire system cohesion

---
*Integration validation ensures the whole is greater than the sum of its parts.*