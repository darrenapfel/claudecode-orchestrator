# Evidence Template - Proof of Work Documentation

## Overview
This template ensures all evidence follows a consistent, verifiable format. Every task must produce evidence that can be independently validated.

## Evidence Structure

```
.work/milestones/YYYYMMDD-{milestone}/sprint-XXX/implementation/[task-name]/
├── TASK.md           # Task definition from orchestrator
├── INTERFACE.md      # Public APIs/contracts (if applicable)
├── EVIDENCE.md       # Proof of completion (REQUIRED)
└── artifacts/        # Supporting files
    ├── screenshots/  # UI evidence with timestamps
    ├── test-output/  # Test results and coverage
    └── logs/         # Console output, performance data
```

## EVIDENCE.md Template

```markdown
# Task Evidence: [Task Name]

**Sprint**: Sprint-XXX
**Task ID**: [TASK-XXX or descriptive-name]
**Assigned**: @[persona-name]
**Start Time**: YYYY-MM-DD HH:MM:SS
**Complete Time**: YYYY-MM-DD HH:MM:SS
**Duration**: [Must be <30 minutes]
**Validation**: Pending (awaiting 4-validator parallel check)

## Summary
[One paragraph describing what was accomplished and how it meets requirements]

## Changes Made
List each file changed with specific details:
- `src/feature.js` (lines 12-45): Added validation logic
- `src/feature.test.js` (new file): Complete test coverage
- `src/api/routes.js` (lines 78-92): New endpoint added

## Test Evidence

### Command Run
```bash
npm test -- feature.test.js --coverage
```

### Full Output
```
 PASS  tests/feature.test.js
  Feature Implementation
    ✓ validates input correctly (45ms)
    ✓ handles edge cases (23ms)
    ✓ integrates with API (128ms)
    ✓ maintains performance standards (89ms)

----------|---------|----------|---------|---------|-------------------
File      | % Stmts | % Branch | % Funcs | % Lines | Uncovered Line #s
----------|---------|----------|---------|---------|-------------------
All files |   92.31 |    87.50 |  100.00 |   92.31 |
 feature.js|   92.31 |    87.50 |  100.00 |   92.31 | 34,67
----------|---------|----------|---------|---------|-------------------

Test Suites: 1 passed, 1 total
Tests:       4 passed, 4 total
Time:        1.245s
```

## Live Verification

### Server Running
```bash
$ npm start
Server running on http://localhost:3000
Database connected
All systems operational
```

### API Test
```bash
# Test the new endpoint
curl -X POST http://localhost:3000/api/feature \
  -H "Content-Type: application/json" \
  -d '{"data":"test"}'

# Response:
{"success":true,"id":"123","processed":"test"}
```

### UI Screenshot
![Feature Working](./artifacts/screenshots/feature-working-20250702-143022.png)
*Timestamp: 2025-07-02 14:30:22 PST*

## Metrics Comparison

### Baseline (Before)
- Tests: 45/50 passing
- Coverage: 78%
- Build time: 32s
- Bundle size: 1.2MB

### Current (After)
- Tests: 50/50 passing ✅
- Coverage: 92% ✅
- Build time: 28s ✅
- Bundle size: 1.2MB ✅

## Architecture Compliance
- ✅ Follows established patterns
- ✅ No new dependencies added
- ✅ Security requirements met (see security checklist)
- ✅ Performance within bounds

## Security Checklist
- ✅ Input validation implemented
- ✅ No sensitive data in logs
- ✅ Authentication required for endpoints
- ✅ Rate limiting in place
- ✅ OWASP Top 10 considered

## Reproduction Steps
1. Clone repository: `git clone [repo]`
2. Checkout branch: `git checkout feature-branch`
3. Install deps: `npm install`
4. Set environment: `cp .env.example .env`
5. Run tests: `npm test`
6. Start server: `npm start`
7. Test endpoint: [curl command above]
8. Verify UI: Navigate to http://localhost:3000/feature

## Git Commit
```bash
commit abc123def456
Author: Claude <noreply@anthropic.com>
Date:   Tue Jul 2 14:35:00 2025 -0700

    feat: implement feature with full test coverage
    
    - Added input validation
    - Created comprehensive tests
    - Integrated with existing API
    - Maintained performance standards
    
    Task: TASK-XXX
    Evidence: .work/milestones/YYYYMMDD-{milestone}/sprint-XXX/implementation/[task]/EVIDENCE.md
```

## Known Issues
None identified during implementation.

## Follow-up Recommendations
- Consider adding integration tests with external service
- Monitor performance under load
- Add telemetry for usage tracking
```

## INTERFACE.md Template

```markdown
# Interface Definition

## Public APIs
Endpoints or functions this component exposes:
- GET /api/resource → {data: [], total: number}
- POST /api/resource → {id: string, created: date}
- DELETE /api/resource/:id → {success: boolean}

## Functions Exported
- processData(input: InputType) → Promise<ResultType>
- validateInput(data: unknown) → data is ValidType
- transformOutput(raw: RawType) → OutputType

## Dependencies Required
External services or resources needed:
- Database connection (PostgreSQL)
- Redis cache for session storage
- S3 bucket for file uploads

## Environment Variables
- PORT (default: 3000)
- DATABASE_URL (required)
- REDIS_URL (optional, defaults to localhost)
- AWS_BUCKET (required for uploads)

## Integration Points
How this connects with other components:
- Publishes events to: user.created, user.updated
- Subscribes to: auth.logout, system.shutdown
- Calls services: AuthService, EmailService
```

## Evidence Requirements by Type

### Screenshots (UI Features)
- **Filename format**: `feature-state-YYYYMMDD-HHMMSS.png`
- **Must include**: Visible timestamp (system clock or overlay)
- **Show both**: Success states AND error states
- **Browser details**: Include dev tools if relevant
- **Annotations**: Highlight key areas if complex

### Test Output
- **Complete output**: Never truncate or summarize
- **Include coverage**: Show coverage metrics
- **All test files**: Don't cherry-pick passing tests
- **Performance data**: Include timing information

### Console/Logs
- **Full commands**: Show exact commands used
- **Complete output**: Include all output, even verbose
- **Error scenarios**: Demonstrate error handling
- **Timestamps**: Ensure logs show when events occurred

### Code Changes
- **Specific lines**: Reference exact line numbers
- **Context**: Explain why changes were made
- **Diff-friendly**: Use git diff format when helpful

## Common Evidence Failures

### ❌ Vague Claims
- "Tests are passing" → Show the actual test output
- "Feature works" → Provide screenshot + reproduction steps
- "No errors" → Show console output proving this
- "Performance improved" → Show before/after metrics

### ❌ Incomplete Evidence
- Partial test results → Include full test suite run
- Happy path only → Show error handling too
- Missing timestamps → All screenshots need timestamps
- No reproduction steps → Others must be able to verify

### ❌ Unverifiable Evidence
- "Works on my machine" → Document exact environment
- Local-only URLs → Use localhost with port numbers
- Missing dependencies → List all requirements
- Hardcoded paths → Use relative or configurable paths

## Validation Process

### Parallel Validation Process
Validation happens with 4 validators working simultaneously:
- **@product-manager**: Validates user stories work end-to-end
- **@test-engineer**: Runs comprehensive E2E tests
- **@performance-engineer**: Tests load and performance
- **@security-engineer**: Audits security compliance

Each validator:
1. **Reads EVIDENCE.md** - Understands claims
2. **Checks artifacts** - Verifies screenshots/logs exist
3. **Runs reproduction steps** - Confirms it works
4. **Tests their domain** - PM tests UX, Security tests vulnerabilities, etc.
5. **Documents findings** - Creates validation evidence

### Validation Checklist
- [ ] All evidence files present
- [ ] Screenshots have timestamps
- [ ] Test output shows all tests
- [ ] Coverage meets standards
- [ ] Reproduction steps work
- [ ] No degradation in metrics
- [ ] Security requirements met
- [ ] Code follows patterns

## Remember
- **Evidence over claims** - Show, don't tell
- **Reproducibility is key** - Others must verify
- **Quality over speed** - Better evidence takes time
- **Independence required** - Can't validate own work
- **Parallel validation** - 4 validators work simultaneously
- **Sprint context** - Evidence organized by sprint
- **Truth over convenience** - Don't hide failures

---
*This template ensures consistent, verifiable evidence for every task.*