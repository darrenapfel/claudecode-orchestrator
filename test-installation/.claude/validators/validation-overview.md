# Validation Overview - The 4-Validator Parallel Process

## Core Concept
After Integration Step reconciles all implementation work, FOUR validators work in parallel to ensure quality. This is NOT sequential - all 4 validators must work simultaneously.

## The Four Validators

### 1. @product-manager - Golden Path Validation
**Focus**: Do the features actually work for users?
- Tests each user story end-to-end
- Validates acceptance criteria are met
- Confirms business value delivered
- NOT just "pages load" but "users can complete tasks"

### 2. @test-engineer - Technical Validation
**Focus**: Does the system work correctly?
- Runs E2E test suites
- Tests error handling and edge cases
- Validates cross-browser compatibility
- Confirms accessibility standards

### 3. @performance-engineer - Performance Validation
**Focus**: Does it scale and perform?
- Load testing under realistic conditions
- Response time measurements
- Resource usage analysis
- Bottleneck identification

### 4. @security-engineer - Security Validation
**Focus**: Is it secure?
- OWASP compliance check
- Authentication/authorization testing
- Data protection validation
- Vulnerability scanning

## Parallel Execution (CRITICAL)

### The RIGHT Way
```markdown
# ONE message with ALL FOUR validators:
Task: @product-manager - Validate golden paths and user stories
Task: @test-engineer - Run E2E tests and user journeys
Task: @performance-engineer - Load testing and optimization
Task: @security-engineer - Security audit and compliance
```

### The WRONG Way
```markdown
# NEVER do this sequentially:
Task: @product-manager - Validate
[Wait for completion]
Task: @test-engineer - Test
[Wait for completion]
Task: @performance-engineer - Check performance
[Wait for completion]
Task: @security-engineer - Audit
```

## Validation Outcomes

### All PASS
✅ Continue to next implementation batch OR deployment

### Any FAIL
❌ MANDATORY Fix Cycle:
```
REPEAT UNTIL ALL VALIDATORS PASS:
1. Create Fix Tasks for each failure
2. Implement fixes
3. Re-run Integration Step
4. Re-run ALL 4 validators in parallel
```

## Evidence Requirements

Each validator produces evidence in:
```
.work/sprints/sprint-XXX/validation/
├── pm-validation/
│   ├── EVIDENCE.md
│   └── golden-path-results.md
├── test-validation/
│   ├── EVIDENCE.md
│   └── e2e-results/
├── performance-validation/
│   ├── EVIDENCE.md
│   └── load-test-results/
└── security-validation/
    ├── EVIDENCE.md
    └── security-audit.md
```

## Sprint Context

Validation happens:
- After EVERY implementation batch
- Before proceeding to next batch
- Multiple times per sprint if needed
- Always with all 4 validators

## What "PASS" Actually Means

**PM PASS means:**
- Every user story functions end-to-end
- Users can complete actual tasks
- Data persists correctly
- Business value delivered

**Test Engineer PASS means:**
- All E2E tests passing
- Edge cases handled
- Cross-browser working
- Accessibility compliant

**Performance PASS means:**
- Response times acceptable
- Load tests successful
- No memory leaks
- Scales as required

**Security PASS means:**
- No vulnerabilities found
- Auth working correctly
- Data properly protected
- OWASP compliant

## Common Validation Failures

❌ **"92% of pages accessible"** → Features must WORK, not just load
❌ **"Needs configuration later"** → Configure it NOW
❌ **"Works locally"** → Must work in deployment environment
❌ **"Minor security issues"** → ALL security issues must be fixed

## The Fix Cycle

When ANY validator fails:

1. **Create Fix Tasks**
   ```markdown
   Task: @software-engineer - Fix login persistence issue
   Task: @software-engineer-2 - Fix performance bottleneck
   ```

2. **Re-integrate**
   ```markdown
   Task: @integration-engineer - Re-run integration after fixes
   ```

3. **Re-validate (All 4 Again)**
   ```markdown
   Task: @product-manager - Re-validate golden paths
   Task: @test-engineer - Re-run E2E tests
   Task: @performance-engineer - Re-test performance
   Task: @security-engineer - Re-audit security
   ```

4. **Repeat Until All Pass**

## Remember

- **Parallel Always**: All 4 validators work simultaneously
- **Binary Results**: PASS or FAIL, no "mostly working"
- **Evidence Required**: Every claim needs proof
- **Fix Until Perfect**: The cycle repeats until ALL pass
- **No Shortcuts**: Can't skip validators or declare "good enough"

---
*Quality comes from parallel validation, not sequential checking.*
