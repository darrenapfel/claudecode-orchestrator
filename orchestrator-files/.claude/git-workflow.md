# Git Workflow Protocol - Mandatory for All Orchestrated Tasks

## Core Principle
**Every orchestrated session MUST use git. Every completed subtask MUST be committed.**

## Orchestrator Git Responsibilities

### 1. Session Initialization (MANDATORY)

```
User Request Received
        │
        ▼
┌───────────────────┐
│ Check for .git    │
└───────┬───────────┘
        │
    ┌───┴───┐
    │ Exists?│
    └───┬───┘
        │
   No ──┴── Yes
   │         │
   ▼         ▼
ASK USER   CREATE BRANCH
```

#### If No Repository:
```markdown
ORCHESTRATOR: "No git repository detected. Would you like me to:
1. Create a new private GitHub repository for this project
2. Initialize a local git repository only
3. Proceed without version control (NOT RECOMMENDED)

Please choose (1/2/3):"
```

#### Repository Creation Flow:
```python
# Priority 1: GitHub MCP
try:
    mcp__github__create_repository(
        name: project-name,
        private: true,
        autoInit: true
    )
except MCPError:
    # Fallback: GitHub CLI
    try:
        Bash("gh repo create --private --clone")
    except:
        # Final fallback: Local only
        Bash("git init")
```

### 2. Branch Creation (MANDATORY)

Every session MUST create a feature branch:
```bash
# Format: session/YYYYMMDD-description
git checkout -b session/20250628-tide-app
git push -u origin HEAD
```

### 3. Subtask Commit Protocol

**EVERY completed subtask MUST commit its work:**

```markdown
## Subtask Completion → Automatic Commit

When Software Engineer completes:
  → git add [changed files]
  → git commit -m "feat(component): implement user authentication
     
     Subtask: Stream A - Implementation
     Evidence: .work/tasks/20250628-1000/EVIDENCE.md
     
     🤖 Generated with [Claude Code](https://claude.ai/code)"

When SDET completes:
  → git add [test files]
  → git commit -m "test(auth): add authentication test suite
     
     Subtask: Stream B - Testing
     Coverage: 87%
     Evidence: .work/tasks/20250628-1000/EVIDENCE.md
     
     🤖 Generated with [Claude Code](https://claude.ai/code)"
```

### 4. Commit Message Format

```
<type>(<scope>): <subject>

<body>
Subtask: <stream identifier>
<metrics if applicable>
Evidence: <path to evidence file>

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-authored-by: <persona> <noreply@anthropic.com>
```

Types: feat, fix, test, docs, refactor, perf, security
Scope: Component or feature area
Subject: What was accomplished

### 5. Pull Request Creation (END OF SESSION)

```python
# Priority 1: GitHub MCP
try:
    mcp__github__create_pull_request(
        owner: owner,
        repo: repo,
        title: "Session: Tide App - 9 tasks completed",
        head: "session/20250628-tide-app",
        base: "main",
        body: session_summary_with_evidence
    )
except MCPError:
    # Fallback: GitHub CLI
    Bash("gh pr create --title '...' --body '...'")
```

### 6. PR Merge Protocol

After PR creation:
```markdown
ORCHESTRATOR: "Pull request created: [URL]

All 9 tasks completed with evidence. 
- 27 commits
- 94% test coverage
- All security checks passed

Would you like me to:
1. Merge the PR now (recommended after review)
2. Leave it open for manual review
3. Run additional validation

Please choose (1/2/3):"
```

If user approves:
```python
# Priority 1: GitHub MCP
mcp__github__merge_pull_request(
    owner: owner,
    repo: repo,
    pull_number: pr_number,
    merge_method: "squash"  # or user preference
)
```

## Integration with Task Execution

### Modified Task Protocol

Each persona's task MUST include git operations:

```markdown
## Task Completion Protocol

1. Execute assigned work
2. Write evidence
3. Stage changes: `git add [files]`
4. Commit with descriptive message
5. Push to remote: `git push`
6. Return status including commit SHA
```

### Return Format Enhancement
```json
{
  "status": "complete",
  "evidence_path": "...",
  "commit_sha": "abc123def",
  "files_changed": 12,
  "insertions": 245,
  "deletions": 23
}
```

## Git Status Monitoring

The orchestrator maintains a git status board:

```markdown
## Session Git Status

Branch: session/20250628-tide-app
Remote: origin/session/20250628-tide-app (up to date)

Commits by Stream:
- Implementation: 4 commits
- Testing: 3 commits  
- Security: 2 commits
- DevOps: 1 commit

Total: 10 commits
Status: All changes committed and pushed
```

## Failure Handling

### Commit Failures
- If commit fails → Investigate why (conflicts, hooks)
- If push fails → Check connectivity, permissions
- Always maintain local commits even if push fails

### MCP Failures
1. Try GitHub MCP first
2. Fallback to gh CLI
3. Final fallback to git CLI
4. Document which method was used

## Evidence Integration

Every commit references its evidence:
```
.work/
└── tasks/
    └── 20250628-1000-auth/
        ├── COMMIT_LOG.md    # Links evidence to commits
        ├── artifacts/
        │   └── implementation/
        │       ├── EVIDENCE.md
        │       └── commit-sha.txt  # abc123def
        └── CONVERGENCE.md
```

## Benefits

1. **Complete History**: Every subtask's work is preserved
2. **Parallel Development**: Each stream commits independently
3. **Easy Rollback**: Can revert specific subtask if needed
4. **Clear Attribution**: Each persona's work is tracked
5. **Evidence Trail**: Commits link directly to evidence
6. **PR Review**: All work aggregated for final review

## Mandatory Rules

1. **No Git = No Start**: Orchestrator must establish git before tasks
2. **No Commit = Not Complete**: Subtasks aren't done until committed
3. **Evidence in Commits**: Every commit message references evidence
4. **Push Frequently**: Don't wait until end to push
5. **PR Always**: Session ends with PR, no exceptions

---
*Git is not optional. Every task, every commit, every time.*
