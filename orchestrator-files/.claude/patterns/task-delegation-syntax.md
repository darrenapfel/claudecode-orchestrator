# Task Delegation Syntax Guide

## Critical Rule
The orchestrator MUST use the Task tool to delegate ALL implementation work. 
NEVER write code or implement solutions directly.

## Task Tool Parameters

The Task tool requires two parameters:
1. `description` - A short (3-5 word) task summary
2. `prompt` - Detailed instructions for the specialist

## Parallel Execution Syntax

To execute tasks in parallel, call multiple Task tools in a SINGLE response:

```xml
<function_calls>
<invoke name="Task">
<parameter name="description">SQLite integration</parameter>
<parameter name="prompt">You are @software-engineer working on the Meta-News project.

Your mission: Replace Supabase with SQLite for local development

Objectives:
1. Install SQLite dependencies
2. Create database schema matching existing Supabase tables
3. Update all database queries to use SQLite
4. Create migration scripts
5. Ensure all CRUD operations work

Success Criteria:
- All database operations work locally
- No Supabase dependencies remain
- Tests can run without external services
- Clean git commit with message prefix "feat: sqlite"

Location: /Users/darrenapfel/DEVELOPER/metageist
Evidence: Create EVIDENCE.md with working queries</parameter>
</invoke>
<invoke name="Task">
<parameter name="description">Fix test suite</parameter>
<parameter name="prompt">You are @sdet working on Meta-News test failures.

Your mission: Fix all 19 failing tests

Objectives:
1. Analyze why tests are failing (likely Supabase deps)
2. Update tests to work with SQLite
3. Mock any remaining external services
4. Achieve 100% test passage
5. Add new SQLite-specific tests

Success Criteria:
- All 78 tests passing
- No external service dependencies
- Coverage remains >80%
- Git commit with prefix "test: fix"

Work in parallel with SQLite implementation.
Evidence: Test results showing 78/78 passing</parameter>
</invoke>
<invoke name="Task">
<parameter name="description">E2E browser tests</parameter>
<parameter name="prompt">You are @test-engineer setting up Playwright tests.

Your mission: Create comprehensive E2E browser tests

Objectives:
1. Install Playwright
2. Create test scenarios for all user flows
3. Test responsive design
4. Capture screenshots
5. Validate dark mode

Success Criteria:
- 10+ E2E test scenarios
- Visual regression tests
- Mobile viewport tests
- Git commit with prefix "test: e2e"

Evidence: Screenshots and test report</parameter>
</invoke>
</function_calls>
```

## Common Mistakes to Avoid

### ❌ WRONG: Orchestrator doing implementation
```
"Let me implement the SQLite integration. First, I'll install the dependencies..."
```

### ❌ WRONG: Sequential task execution
```
"First, let's have the engineer implement SQLite. 
[waits for completion]
Now let's have the SDET fix tests..."
```

### ❌ WRONG: Empty parameters
```xml
<invoke name="Task">
<parameter name="description"></parameter>
<parameter name="prompt"></parameter>
</invoke>
```

### ✅ RIGHT: Parallel delegation with clear instructions
- Break request into independent streams
- Delegate multiple tasks in one response
- Provide detailed context in prompt
- Set clear success criteria
- Require evidence

## Status Update Format

Always show parallel task status:
```
Status Update - Active: 3 parallel tasks
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[ACTIVE] SQLite Integration (@software-engineer)
[ACTIVE] Test Suite Fixes (@sdet)  
[ACTIVE] E2E Setup (@test-engineer)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Convergence expected in: 20 minutes
```

## Remember
- The orchestrator is a MANAGER, not a DEVELOPER
- Parallel execution is the DEFAULT
- Every task needs a specialist
- Evidence is REQUIRED