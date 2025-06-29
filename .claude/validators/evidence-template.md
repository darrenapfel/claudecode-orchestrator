# Evidence Template - Proof of Work Documentation

## Overview
This template ensures all evidence follows a consistent, verifiable format. Every task must produce evidence that can be independently validated.

## Evidence Structure (Parallel Workflow v2.1)

```
.work/tasks/YYYYMMDD-HHMM-description/
├── TASK.md                 # Master task definition
├── streams/                # Parallel execution streams
│   ├── implementation/
│   │   ├── STREAM.md       # Implementation stream log
│   │   └── evidence/       # Implementation artifacts
│   │       ├── screenshots/
│   │       ├── code-changes/
│   │       └── unit-tests/
│   ├── testing/
│   │   ├── STREAM.md       # Testing stream log
│   │   └── evidence/       # Testing artifacts
│   │       ├── test-results/
│   │       ├── coverage-reports/
│   │       └── performance/
│   ├── security/
│   │   ├── STREAM.md       # Security stream log
│   │   └── evidence/       # Security artifacts
│   │       ├── scan-results/
│   │       ├── audit-logs/
│   │       └── compliance/
│   └── manual/             # Manual testing stream (if applicable)
│       ├── STREAM.md       
│       └── evidence/
│           ├── user-flows/
│           └── edge-cases/
├── CONVERGENCE.md          # Stream convergence report
└── EVIDENCE.md             # Final consolidated evidence
```

## EVIDENCE.md Template (Parallel Workflow v2.1)

```markdown
# Task Evidence: [Task Name]

**Task ID**: YYYYMMDD-HHMM-description
**Start Time**: YYYY-MM-DD HH:MM:SS
**Convergence Time**: YYYY-MM-DD HH:MM:SS
**Total Duration**: XXm XXs
**Execution Strategy**: Full Parallel | Progressive | Hybrid | Sequential
**Validated By**: @validator (must be different from all stream personas)

## Summary
Brief description of what was accomplished across all streams and how it meets the task requirements.

## Stream Execution Report

### Implementation Stream (@software-engineer)
**Status**: ✅ Complete | ⚠️ Partial | ❌ Failed
**Duration**: XXm XXs
**Evidence Path**: `./streams/implementation/evidence/`

#### Code Changes
- Files modified: X files
- Lines added: +XXX
- Lines removed: -XXX
- Key components:
  - `path/to/file1.js` - Description of changes
  - `path/to/file2.js` - Description of changes

#### Working Implementation
**Screenshot**: [./streams/implementation/evidence/screenshots/feature-working.png]
**Description**: Shows the feature functioning as specified

#### Code Quality
- Linting: ✅ No errors
- Type checking: ✅ No errors
- Unit tests: ✅ XX/XX passing

### Testing Stream (@sdet)
**Status**: ✅ Complete | ⚠️ Partial | ❌ Failed
**Duration**: XXm XXs
**Evidence Path**: `./streams/testing/evidence/`

#### Test Coverage
```
File                | % Stmts | % Branch | % Funcs | % Lines |
--------------------|---------|----------|---------|---------|
All files           |   87.3  |   84.2   |   91.5  |   87.3  |
 src/feature.js     |   92.1  |   88.9   |   100   |   92.1  |
 src/feature.test.js|   100   |   100    |   100   |   100   |
```

#### Test Results
```
Test Suites: X passed, X total
Tests: XX passed, XX total
Snapshots: X passed, X total
Time: X.XXs
```

#### Test Artifacts
- Full test report: [./streams/testing/evidence/test-results/test-report.xml]
- Coverage report: [./streams/testing/evidence/coverage-reports/index.html]
- Performance tests: [./streams/testing/evidence/performance/load-test.html]

### Security Stream (@security-engineer)
**Status**: ✅ Complete | ⚠️ Partial | ❌ Failed
**Duration**: XXm XXs
**Evidence Path**: `./streams/security/evidence/`

#### Security Scan Results
- Dependency audit: ✅ 0 vulnerabilities
- SAST scan: ✅ No issues found
- Security checklist: X/X items passed
- Penetration test: ✅ No critical issues

#### Security Artifacts
- Scan report: [./streams/security/evidence/scan-results/security-report.html]
- Audit log: [./streams/security/evidence/audit-logs/npm-audit.json]
- Compliance report: [./streams/security/evidence/compliance/compliance-check.pdf]

### Manual Testing Stream (@test-engineer) [If Applicable]
**Status**: ✅ Complete | ⚠️ Partial | ❌ Failed
**Duration**: XXm XXs
**Evidence Path**: `./streams/manual/evidence/`

#### User Experience Testing
- User flows tested: X/X
- Edge cases verified: X/X
- Browser compatibility: X/X browsers
- Accessibility: WCAG 2.1 AA compliant

#### Manual Test Artifacts
- User flow recordings: [./streams/manual/evidence/user-flows/]
- Edge case documentation: [./streams/manual/evidence/edge-cases/]
- Accessibility report: [./streams/manual/evidence/accessibility-audit.html]

## Cross-Stream Validation

### Implementation ↔ Testing
- [ ] Code works with test suite
- [ ] Tests cover all implemented features
- [ ] Performance tests validate implementation
- [ ] Integration tests pass

### Implementation ↔ Security
- [ ] Code follows security guidelines
- [ ] No security vulnerabilities introduced
- [ ] Input validation implemented
- [ ] Authentication/authorization working

### Testing ↔ Security
- [ ] Security tests included in test suite
- [ ] Test environment secure
- [ ] No sensitive data in test fixtures
- [ ] Tests cover security scenarios

## Convergence Report
See: [./CONVERGENCE.md] for detailed stream convergence analysis

## CONVERGENCE.md Template

```markdown
# Stream Convergence Report

**Task ID**: YYYYMMDD-HHMM-description
**Convergence Date**: YYYY-MM-DD HH:MM:SS
**Strategy Used**: Full Parallel | Progressive | Hybrid | Sequential

## Stream Completion Status
- [ ] Implementation Stream (@software-engineer): ✅ Complete
- [ ] Testing Stream (@sdet): ✅ Complete  
- [ ] Security Stream (@security-engineer): ✅ Complete
- [ ] Manual Testing Stream (@test-engineer): ✅ Complete [if applicable]

## Integration Verification
- [ ] All streams produced required evidence
- [ ] No blocking issues between streams
- [ ] Cross-validation checks passed
- [ ] All git commits successful

## Quality Gates Passed
- [ ] Code quality: No linting/type errors
- [ ] Test coverage: >80% achieved
- [ ] Security: No critical vulnerabilities
- [ ] Performance: Within acceptable limits
- [ ] Manual testing: All user flows work

## Issues Resolved During Convergence
| Issue | Stream | Resolution | Status |
|-------|--------|------------|--------|
| Example issue | Testing | Fixed in commit abc123 | ✅ Resolved |

## Final Validation Readiness
All streams have converged successfully. Task is ready for final validation by @validator.
```

## Reproduction Steps

### Environment Setup
```bash
git checkout [branch-name]
npm install
cp .env.example .env
# Configure environment variables
```

### Running the Feature
1. Start the application: `npm run dev`
2. Navigate to: `http://localhost:3000/feature`
3. Perform action: [specific steps]
4. Verify result: [expected outcome]

### Running Tests
```bash
# Unit tests
npm test

# Integration tests
npm run test:integration

# E2E tests
npm run test:e2e
```

## Validation Checklist

### Functional Requirements
- [ ] Feature works as specified
- [ ] All acceptance criteria met
- [ ] Edge cases handled
- [ ] Error scenarios managed

### Non-Functional Requirements
- [ ] Performance within limits
- [ ] Security requirements met
- [ ] Accessibility standards followed
- [ ] Documentation complete

### Code Quality
- [ ] No linting errors
- [ ] Tests comprehensive
- [ ] Code reviewed
- [ ] No TODOs or placeholders

## Known Issues
List any known issues or limitations:
- Issue 1: Description and impact
- Issue 2: Description and impact

## Follow-up Tasks
Tasks identified during implementation:
- [ ] Task 1: Description
- [ ] Task 2: Description

## Sign-off

### Developer Confirmation
I confirm this implementation:
- Meets all requirements
- Has been tested thoroughly
- Contains no known security issues
- Is ready for validation

**Signed**: @developer-name
**Date**: YYYY-MM-DD HH:MM:SS

### Validator Confirmation
I have independently verified:
- All evidence is accurate
- Implementation meets requirements
- Tests are comprehensive
- No critical issues found

**Signed**: @validator-name
**Date**: YYYY-MM-DD HH:MM:SS
```

## Evidence Requirements by Type

### Screenshots
- Clear and focused on relevant area
- Include browser dev tools if relevant
- Show success and error states
- Name descriptively: `feature-state-description.png`

### Logs
- Include timestamps
- Show full operation lifecycle
- Capture both success and errors
- Sanitize sensitive information

### Test Results
- Full test suite output
- Coverage reports with details
- Performance benchmarks
- Failed test explanations

### Code Snippets
```javascript
// Always include context
// Show before and after for changes
// Highlight key logic
// Include error handling
```

## Common Evidence Failures

### ❌ Insufficient Evidence
- "It works" without proof
- Screenshots of wrong thing
- Partial test results
- Missing reproduction steps

### ❌ Fake Evidence
- Edited screenshots
- Selective test results
- Hidden failures
- Manipulated metrics

### ❌ Irreproducible Evidence
- Works on my machine only
- Required specific conditions
- Timing-dependent results
- Environment-specific

### ❌ Incomplete Evidence
- Happy path only
- No error scenarios
- Missing edge cases
- No performance data

## Evidence Validation Process

### Level 1: Completeness
- All sections filled
- All artifacts present
- All links working
- All requirements addressed

### Level 2: Accuracy
- Claims match evidence
- Metrics are realistic
- Tests actually pass
- Screenshots current

### Level 3: Reproducibility
- Steps clear and complete
- Environment documented
- Dependencies listed
- Can be verified independently

### Level 4: Quality
- Comprehensive coverage
- Professional presentation
- Clear documentation
- No ambiguity

## Remember
- Evidence is not optional
- Quality over quantity
- Reproducibility is key
- Independence required
- Truth over convenience

---
*This template ensures consistent, verifiable evidence for every task.*
