# Example: Git Workflow in Orchestrated Session

This example shows how git is integrated throughout an orchestrated session.

## User Request
"Build a user authentication system"

## Orchestrator Git Management Flow

### 1. Repository Check and Initialization

```markdown
ORCHESTRATOR: "Checking git repository status..."

[No .git found]

ORCHESTRATOR: "No git repository detected. Would you like me to:
1. Create a new private GitHub repository for this project
2. Initialize a local git repository only  
3. Proceed without version control (NOT RECOMMENDED)

Please choose (1/2/3):"

USER: "1"

ORCHESTRATOR: "Creating private GitHub repository..."
```

```python
# Orchestrator executes:
mcp__github__create_repository(
    name="auth-system",
    private=True,
    autoInit=True,
    description="User authentication system with secure login"
)
# Result: Repository created at github.com/user/auth-system
```

### 2. Session Branch Creation

```bash
# Orchestrator executes:
git clone https://github.com/user/auth-system.git
cd auth-system
git checkout -b session/20250628-authentication
git push -u origin HEAD
```

```markdown
ORCHESTRATOR: "Repository ready. Branch 'session/20250628-authentication' created.

I'm initiating parallel task streams for the authentication system..."
```

### 3. Parallel Task Execution with Commits

#### Stream A: Implementation (T+0 to T+20)

Software Engineer completes user model:
```bash
# Software Engineer executes after implementation:
git add src/models/user.ts src/services/auth.ts tests/auth.test.ts
git commit -m "feat(auth): implement user model and authentication service

- Add User model with bcrypt password hashing
- Create AuthService with login/logout methods  
- Add unit tests with 87% coverage

Subtask: Implementation Stream A
Evidence: .work/tasks/20250628-1000/streams/implementation/EVIDENCE.md

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: Software Engineer <noreply@anthropic.com>"

git push
# Commit SHA: a1b2c3d
```

#### Stream B: Testing (T+0 to T+20)

SDET completes test suite:
```bash
# SDET executes after test creation:
git add tests/integration/auth.spec.ts tests/e2e/login.spec.ts
git commit -m "test(auth): add comprehensive authentication test suite

- Integration tests for all auth endpoints
- E2E tests for login/logout flows
- Security test scenarios included
- All 47 tests passing

Subtask: Testing Stream B
Coverage: 92%
Evidence: .work/tasks/20250628-1000/streams/testing/EVIDENCE.md

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: SDET <noreply@anthropic.com>"

git push
# Commit SHA: b2c3d4e
```

#### Stream C: Security (T+0 to T+20)

Security Engineer completes audit:
```bash
# Security Engineer executes:
git add .security/auth-config.json docs/security-audit.md
git commit -m "security(auth): add security configurations and audit

- Configure rate limiting for login endpoints
- Add OWASP compliance checklist
- Document threat model
- No critical vulnerabilities found

Subtask: Security Stream C  
Evidence: .work/tasks/20250628-1000/streams/security/EVIDENCE.md

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: Security Engineer <noreply@anthropic.com>"

git push
# Commit SHA: c3d4e5f
```

### 4. Convergence and Validation

After all streams complete and product-manager approves:
```bash
# Orchestrator executes convergence commit:
git add .work/tasks/20250628-1000/CONVERGENCE.md
git commit -m "merge: converge authentication implementation streams

All parallel streams completed successfully:
- Implementation: ✓ (commit: a1b2c3d)
- Testing: ✓ (commit: b2c3d4e) 
- Security: ✓ (commit: c3d4e5f)

Validation: PASSED
Evidence: .work/tasks/20250628-1000/CONVERGENCE.md

🤖 Generated with [Claude Code](https://claude.ai/code)"

git push
```

### 5. Session Completion - Pull Request

```python
# Orchestrator creates PR using GitHub MCP:
pr_response = mcp__github__create_pull_request(
    owner="user",
    repo="auth-system",
    title="Session: Authentication System - 3 parallel streams completed",
    head="session/20250628-authentication",
    base="main",
    body="""
## Authentication System Implementation

### Completed Tasks
✅ User model and authentication service (87% coverage)
✅ Comprehensive test suite (92% coverage, 47 tests)
✅ Security audit and configuration (OWASP compliant)

### Evidence
All implementation evidence available in `.work/tasks/`

### Commits
- a1b2c3d: feat(auth): implement user model and authentication service
- b2c3d4e: test(auth): add comprehensive authentication test suite
- c3d4e5f: security(auth): add security configurations and audit
- d4e5f6g: merge: converge authentication implementation streams

### Validation Results
- All tests passing
- Security scan clean
- Performance within requirements

Ready for review and merge.
"""
)
```

### 6. User Approval Flow

```markdown
ORCHESTRATOR: "Pull request created: https://github.com/user/auth-system/pull/1

Authentication system completed with:
- 4 commits
- 92% test coverage
- All security checks passed

Would you like me to:
1. Merge the PR now (recommended after review)
2. Leave it open for manual review
3. Run additional validation

Please choose (1/2/3):"

USER: "1"

ORCHESTRATOR: "Merging pull request..."
```

```python
# Orchestrator executes merge:
mcp__github__merge_pull_request(
    owner="user",
    repo="auth-system", 
    pull_number=1,
    merge_method="squash",
    commit_title="feat: add complete authentication system (#1)",
    commit_message="Implemented via parallel orchestration with 3 streams"
)
```

## Git History Result

```bash
$ git log --oneline
f5g6h7i (HEAD -> main) feat: add complete authentication system (#1)
a1b2c3d feat(auth): implement user model and authentication service
b2c3d4e test(auth): add comprehensive authentication test suite
c3d4e5f security(auth): add security configurations and audit
d4e5f6g merge: converge authentication implementation streams
1234567 Initial commit
```

## Benefits of Integrated Git Workflow

1. **Complete Traceability**: Every piece of work is committed with evidence
2. **Parallel Development**: Each stream commits independently
3. **Clean History**: Semantic commits make it easy to understand changes
4. **Safe Rollback**: Can revert specific streams if needed
5. **PR Review**: All work aggregated for final review before merge
6. **Automation**: GitHub MCP handles repository operations seamlessly

## Fallback Handling

If GitHub MCP fails at any point:
```bash
# Orchestrator automatically falls back to gh CLI:
gh repo create auth-system --private --clone
# or
gh pr create --title "..." --body "..."
# or
gh pr merge 1 --squash

# If gh CLI also fails, uses standard git:
git init
git remote add origin [url]
git push
```

---
*Every task tracked. Every commit meaningful. Every merge reviewed.*
