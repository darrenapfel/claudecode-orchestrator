# Testing Prerequisites Pattern

## Overview
Testing infrastructure MUST be established before implementation begins. Without proper testing tools, validation becomes theater.

## Testing Infrastructure Requirements

### Web Applications
**E2E Testing (MANDATORY)**
```bash
# Playwright for browser automation
npm install -D @playwright/test playwright
npx playwright install

# OR Cypress
npm install -D cypress
```

**Component Testing**
```bash
npm install -D @testing-library/react @testing-library/jest-dom
npm install -D @testing-library/user-event vitest
```

**API Testing**
```bash
npm install -D msw @mswjs/data  # Mock Service Worker
npm install -D supertest        # API endpoint testing
```

### Backend Applications
```bash
# Node.js
npm install -D jest supertest

# Python
pip install pytest pytest-cov pytest-asyncio

# Go
go get -u github.com/stretchr/testify
```

## Project Structure (MANDATORY)

```
project/
├── tests/
│   ├── e2e/         # End-to-end user journey tests
│   ├── integration/ # API and service integration tests
│   ├── unit/        # Component and function tests
│   └── fixtures/    # Test data and mocks
├── package.json     # Must include test scripts
└── README.md        # Must document how to run tests
```

## Required npm Scripts

```json
{
  "scripts": {
    "test": "vitest",
    "test:e2e": "playwright test",
    "test:e2e:ui": "playwright test --ui",
    "test:integration": "vitest run tests/integration",
    "test:coverage": "vitest --coverage"
  }
}
```

## When This Happens

### During Architecture Phase
The architect MUST include testing infrastructure in ARCHITECTURE.md:
```markdown
## Testing Strategy
- E2E Framework: Playwright
- Unit Testing: Vitest + React Testing Library
- API Mocking: MSW
- Coverage Target: 80%

## Test Structure
tests/e2e/       - User journey tests
tests/unit/      - Component tests
tests/api/       - API contract tests
```

### During Implementation Phase
**First implementation task MUST be testing setup:**
```
Task: @software-engineer-1 - Set up testing infrastructure
- Install test frameworks per ARCHITECTURE.md
- Create test directory structure
- Configure test scripts in package.json
- Write ONE example E2E test that passes
- EVIDENCE: Show `npm run test:e2e` executing successfully
```

### During SDET Work
SDETs write E2E tests for each user story:
```typescript
// tests/e2e/user-login.spec.ts
test('User can login with valid credentials', async ({ page }) => {
  await page.goto('/login');
  await page.fill('[name="email"]', 'user@example.com');
  await page.fill('[name="password"]', 'password123');
  await page.click('button[type="submit"]');
  
  // Verify redirect to dashboard
  await expect(page).toHaveURL('/dashboard');
  
  // Verify user data persists
  await page.reload();
  await expect(page.locator('[data-testid="user-name"]')).toContainText('John Doe');
});
```

### During Integration Phase
Integration engineer MUST:
1. Run `npm run test:e2e` and capture output
2. Take screenshots of any failures
3. Fix broken tests before proceeding
4. Document in INTEGRATION-REPORT.md:
```markdown
## E2E Test Execution Results
Command: npm run test:e2e
Results:
- Total: 24 tests
- Passing: 20
- Failing: 4
- Time: 45.3s

### Failed Tests:
1. user-logout.spec.ts - Session not clearing properly
   [Screenshot: logout-failure.png]
2. podcast-create.spec.ts - API timeout on generation
   [Screenshot: podcast-timeout.png]
```

### During PM Validation
PM MUST see test results before sign-off:
```markdown
## Validation Report

### User Story: User can create account
- E2E Test: tests/e2e/user-registration.spec.ts
- Status: ✅ PASSING (see screenshot)
- Execution time: 3.2s
- Evidence: registration-test-pass.png

### User Story: User can generate podcast
- E2E Test: tests/e2e/podcast-generation.spec.ts  
- Status: ❌ FAILING - API not configured
- Evidence: podcast-test-fail.png
- Result: NOT COMPLETE (needs fix)
```

## Red Flags That Block Progress

### During Implementation
- No test directory exists
- No test scripts in package.json
- "We'll add tests later"
- Tests not running in CI/CD

### During Integration
- "Checking if pages return 200" instead of running tests
- No E2E test execution output
- Missing test failure screenshots
- "Tests will be written post-launch"

### During Validation
- PM validating without test results
- Counting "accessible" as "working"
- No E2E tests for user stories
- Manual testing only

## Enforcement Rules

1. **Architecture must specify testing tools**
2. **First implementation task sets up testing**
3. **SDET writes E2E tests for all user stories**
4. **Integration engineer runs all tests**
5. **PM sees test results before sign-off**

Without these, you're not validating - you're pretending.

---
*No tests = No validation = No completion*