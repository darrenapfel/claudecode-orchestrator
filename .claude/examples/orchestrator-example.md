# Orchestrator Example: Building a Tide Tracking App

## Initial Request
"build a web app that shows me the local tides based on zip code"

## Orchestrator Response

```
Entering autonomous orchestration mode...

[Creates git init subtask]
[Waits for completion]
[Creates session structure subtask]
[Waits for completion]

Breaking down into deliverables:

DEL-001: Project initialization (Next.js, TypeScript, Tailwind)
DEL-002: Tide data service (NOAA API integration)
DEL-003: Zip to location service (geocoding)
DEL-004: Tide chart component (24-hour graph)
DEL-005: Tide table component (11-day forecast)
DEL-006: Main UI with zip code input
DEL-007: Full test coverage
DEL-008: Deployment configuration
```

## Deliverable Execution Flow

### DEL-001: Project Initialization

**Step 1: Define Task**
```markdown
## Deliverable: Project Initialization
**ID**: DEL-001
**Max Duration**: 30 minutes

### Success Criteria
1. Next.js 14+ with App Router initialized
2. TypeScript configured with strict mode
3. Tailwind CSS working with custom config
4. Development server runs on port 3000
5. Basic layout component created

### Required Evidence
- [ ] Screenshot of running dev server
- [ ] Directory tree showing structure
- [ ] Sample page with Tailwind styles
- [ ] Package.json with all dependencies
- [ ] TypeScript config verification
```

**Step 2: Create Implementation Subtask**
```python
Task(
    description="Build: Next.js project initialization",
    prompt="""
    1. Load persona: .claude/personas/software-engineer.md
    2. Read task definition: .work/tasks/20250628-1000-init/TASK.md
    3. Execute:
       - Run: pnpm create next-app@latest tide-tracker --typescript --tailwind --app
       - Configure TypeScript strict mode
       - Create basic layout structure
       - Verify dev server runs
    4. Write evidence: .work/tasks/20250628-1000-init/EVIDENCE.md
    5. Return: {"status": "complete", "evidence_path": "[path]", "files_created": [...]}
    
    DO NOT interact with user. Work autonomously.
    """
)
```

**Step 3: Evaluate Evidence**
[Orchestrator waits for subtask completion]
[Reads returned evidence]
[Verifies all criteria met]

**Step 4: Create Test Subtask**
```python
Task(
    description="Test: Next.js initialization",
    prompt="""
    1. Load persona: .claude/personas/sdet.md
    2. Read implementation evidence: .work/tasks/20250628-1000-init/EVIDENCE.md
    3. Create and run tests:
       - Verify build process
       - Test TypeScript compilation
       - Validate Tailwind configuration
       - Check accessibility setup
    4. Write test results: .work/tasks/20250628-1000-init/TESTS.md
    5. Return: {"status": "complete", "coverage": 95, "tests_passed": 12}
    """
)
```

**Step 5: Create Validation Subtask**
```python
Task(
    description="Validate: Next.js initialization",
    prompt="""
    1. Load persona: .claude/personas/validator.md
    2. Read all evidence at: .work/tasks/20250628-1000-init/
    3. Attempt to break implementation:
       - Clone fresh and verify reproducibility
       - Test with different Node versions
       - Verify no console errors
       - Check for security issues
    4. Write validation: .work/tasks/20250628-1000-init/VALIDATION.md
    5. Return: {"status": "PASS", "issues_found": 0}
    """
)
```

**Step 6: Commit Deliverable**
```python
Task(
    description="Commit: Project initialization",
    prompt="""
    1. Stage all changes
    2. Commit with message:
       feat(init): initialize Next.js project with TypeScript and Tailwind
       
       - Next.js 14.2.5 with App Router
       - TypeScript 5.5.3 in strict mode
       - Tailwind CSS 3.4.1 configured
       - Tests: 12/12 passing
       - Coverage: 95%
       
       Deliverable: DEL-001
       Evidence: .work/tasks/20250628-1000-init/EVIDENCE.md
       
       🤖 Generated with [Claude Code](https://claude.ai/code)
       Co-authored-by: Claude <noreply@anthropic.com>
    3. Return: {"commit_sha": "a1b2c3d"}
    """
)
```

### DEL-002: Tide Data Service

[Similar flow repeated for NOAA API integration]
- Define success criteria
- Implement with software-engineer
- Test with sdet
- Validate with validator
- Commit on success

### Final PR Creation

After all deliverables complete:

```python
Task(
    description="Create pull request",
    prompt="""
    1. Generate summary from .work/sessions/20250628-tide-app/
    2. Create PR with:
       
       ## Tide Tracking Web App
       
       ### Completed Deliverables
       ✅ DEL-001: Project initialization
       ✅ DEL-002: NOAA tide data integration  
       ✅ DEL-003: Zip code geocoding service
       ✅ DEL-004: 24-hour tide chart component
       ✅ DEL-005: 11-day tide table
       ✅ DEL-006: Main UI with zip input
       ✅ DEL-007: 94% test coverage
       ✅ DEL-008: Vercel deployment ready
       
       ### Evidence
       All implementation evidence available in `.work/tasks/`
       
       ### Demo
       - Dev server: http://localhost:3000
       - Vercel preview: [link]
       
    3. Return: {"pr_url": "github.com/user/tide-tracker/pull/1"}
    """
)
```

## Key Differences from V1

1. **Every action is a Task tool invocation** - No direct implementation
2. **Structured returns** - JSON responses for decision making
3. **Autonomous subtasks** - Each loads its own persona and works independently
4. **Evidence chain** - Build → Test → Validate → Commit
5. **Retry on failure** - Automatic fix subtasks with failure context
6. **Git automation** - Repo creation, branching, commits, PR - all automated

## Result

A fully functional tide tracking app with:
- Complete implementation
- Comprehensive tests
- Validated functionality
- Git history showing incremental progress
- PR ready for review
