# Validation Independence Protocol

## Core Principle
**Adversarial Validation**: Every implementation must be validated by a DIFFERENT persona with an adversarial mindset - actively trying to find flaws, not just confirming success.

## Role Separation Matrix

| Role | Primary Function | Validates | Cannot Validate |
|------|------------------|-----------|-----------------|
| @software-engineer | Implementation | Nothing | Own code |
| @sdet | Testing during implementation | Code quality, test coverage | Final system validation |
| @test-engineer | Independent system testing | Full system functionality | Individual unit tests |
| @product-manager | User experience validation | Product requirements, user stories | Technical implementation details |
| @integration-engineer | Stream convergence | Cross-component compatibility | Individual streams |
| @architect | System design | Architecture decisions | Implementation details |
| @ux-designer | User experience | Design compliance | Technical implementation |

## Validation Hierarchy (5 Levels)

### Level 1: Self-Validation (Basic Functionality)
**Who**: The implementing persona  
**Scope**: "Does it run without crashing?"
**Example**: @software-engineer verifies API endpoints return 200 status

### Level 2: Peer Validation (Code Quality)
**Who**: @sdet during implementation sprint
**Scope**: Code quality, test coverage, basic functionality
**Example**: @sdet reviews code structure, writes comprehensive tests

### Level 3: Independent System Validation
**Who**: @test-engineer (different from Level 2)
**Scope**: Full system testing, performance, E2E scenarios
**Example**: @test-engineer runs Playwright tests, load testing, integration tests

### Level 4: Product Validation
**Who**: @product-manager (different from all above)
**Scope**: User experience, requirements fulfillment, golden path validation
**Example**: @product-manager walks through user journeys, validates against user stories

### Level 5: Integration Validation
**Who**: @integration-engineer
**Scope**: Cross-component compatibility, system-wide coherence
**Example**: @integration-engineer verifies auth system works with todo endpoints

## Adversarial Mindset Examples

### Good Adversarial Questions (@test-engineer should ask):
- "The tests show 95% passing - what about the 5% that failed?"
- "Screenshot shows login working - what happens with invalid credentials?"
- "API responds correctly - what about rate limiting and error cases?"
- "Code is committed - are there any console errors or warnings?"
- "Performance looks good - what happens under load?"

### Bad Non-Adversarial Validation:
- "Tests are passing, looks good!"
- "Implementation complete, moving on"
- "Code works as expected"
- "Everything seems fine"

## Validation Triggers

### Automatic FAIL Conditions:
- Same persona validating own work
- Missing evidence files
- Vague success claims without proof
- Test failures ignored or explained away
- Performance degradation from baseline
- Console errors present
- Cannot reproduce on fresh environment

### Automatic FIX SPRINT Creation:
- Any validation fails at any level
- Evidence integrity compromised
- Integration compatibility issues
- User requirements not met
- Security vulnerabilities found

## Evidence Standards by Level

### Level 1 (Self): Basic Proof
```bash
npm start
# Server running on port 3000
curl localhost:3000/api/todos
# {"todos": []}
```

### Level 2 (Peer): Quality Metrics  
```bash
npm test
# 45/45 tests passing
npm run coverage
# Coverage: 95% statements, 90% branches
```

### Level 3 (Independent): System Validation
```bash
npm run test:e2e
# All E2E scenarios passing
npm run test:load
# 1000 concurrent users: avg 200ms response
```

### Level 4 (Product): User Experience Validation
```markdown
# Golden Path Validation
1. New user registration → [Screenshot]
2. Complete first task → [Screenshot]
3. Error recovery → [Screenshot]
# User story verification
- STORY-001: ✅ User can register
- STORY-002: ✅ User can login
# Time to value: 2 minutes
```

### Level 5 (Integration): Cross-Component
```bash
# Testing component interactions
# Auth + Todo endpoints together
# Database + API + Frontend integration
# End-to-end user workflows
```

## Orchestrator Enforcement

### Before Assigning Validation Tasks:
1. Check: "Who implemented this feature?"
2. Ensure: "Validation is by a DIFFERENT persona"
3. Verify: "Validation level is appropriate"

### Red Flags (Must Create Fix Sprint):
- @software-engineer validating own API
- @sdet validating own tests
- @ux-designer validating own designs
- Any "everything looks good" without specific evidence
- Missing adversarial testing

### Good Validation Assignment Pattern:
```
Sprint 1: @software-engineer implements API
Sprint 2: @sdet writes tests (Level 2 validation)
Sprint 3: @test-engineer runs full suite (Level 3 validation)  
Sprint 4: @product-manager validates user experience (Level 4 validation)
Sprint 5: @integration-engineer tests compatibility (Level 5 validation)
```

### Bad Validation Assignment Pattern:
```
❌ @software-engineer implements AND validates API
❌ @sdet writes tests AND validates entire system
❌ Combined: "@engineer and @product-manager working together"
```

## Quality Gates

### Gate 1: Implementation → Validation
- All implementation tasks have evidence
- No self-validation present
- Independent validators assigned

### Gate 2: Validation → Integration  
- All validation levels completed
- All evidence verified by adversarial review
- No outstanding failures

### Gate 3: Integration → Complete
- Cross-component compatibility verified
- System-wide coherence confirmed
- User requirements validated end-to-end

---
*Independence mandatory. Adversarial mindset required. Evidence integrity paramount.*
