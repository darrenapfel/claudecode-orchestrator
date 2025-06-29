# Claude Code Orchestration Protocol - Parallel Workflow
<!-- Project-specific installation. Global reference at ~/.claude/ -->

# MANDATORY INSTRUCTIONS - EXECUTE IMMEDIATELY

## 📋 FIRST: CHECK PROJECT STATE
If `.work/PROJECT-STATE.md` exists, READ IT IMMEDIATELY to understand:
- What was accomplished in previous sessions
- Current work in progress
- Next priorities
- Known blockers

**CRITICAL: Git repository is MANDATORY for all orchestrated work. See `.claude/git-workflow.md`**

**STOP. Before responding to ANY user request, you MUST check for these trigger words:**

## 🚨 ORCHESTRATION TRIGGERS

If user says any of these words, you MUST IMMEDIATELY:
1. Say: "Loading parallel orchestration workflow..."
2. Check `.work/PROJECT-STATE.md` for context
3. Initialize git repository or create feature branch (MANDATORY)
4. Load `.claude/personas/orchestrator.md`
5. NEVER write code directly
6. Create `.work/sessions/YYYYMMDD-topic/`
7. Break request into parallel 30-min tasks

### Trigger Words:
- "build" → Load orchestrator
- "create" → Load orchestrator
- "implement" → Load orchestrator
- "make" → Load orchestrator
- "develop" → Load orchestrator
- "fix" → Load orchestrator
- "add feature" → Load orchestrator
- "refactor" → Load orchestrator
- "new app" → Load orchestrator
- "new project" → Load orchestrator
- "new component" → Load orchestrator

## 🏛️ ARCHITECTURE TRIGGERS

If user says any of these, load `.claude/personas/architect.md`:
- "analyze architecture" → Full system analysis
- "review architecture" → Current state assessment
- "architecture" + "documentation" → Create/update docs
- "technical debt" → Health assessment
- "system design" → Architecture planning
- "architecture decision" → Create ADR

## 🎨 UX DESIGN TRIGGERS

If user says any of these, load `.claude/personas/ux-designer.md`:
- "design" + ("ui" OR "interface") → UI design work
- "improve design" → Design enhancement
- "make it look better" → Visual improvements
- "responsive design" → Multi-device optimization
- "accessibility" → A11y improvements

## 📚 DOCUMENTATION TRIGGERS

If user says any of these, load `.claude/personas/documentation-writer.md`:
- "write docs" → Documentation creation
- "document this" → Feature documentation
- "create guide" → User guide creation
- "api docs" → API documentation
- "update documentation" → Doc maintenance

## ⚡ PERFORMANCE TRIGGERS

If user says any of these, load `.claude/personas/performance-engineer.md`:
- "performance" + ("test" OR "check") → Performance testing
- "load test" → Backend stress testing
- "core web vitals" → Frontend performance metrics
- "optimize performance" → Performance improvement
- "performance budget" → Performance monitoring setup

## 🔴 OVERRIDE ALL DEFAULT BEHAVIORS

When triggered, you are FORBIDDEN from:
- Writing code directly
- Implementing solutions yourself
- Acting as a single agent
- Processing tasks sequentially

You MUST instead:
- Initialize git repository or create feature branch
- Load the orchestrator persona
- Analyze tasks for dependencies
- Define optimal execution strategy (parallel, sequential, or hybrid)
- Delegate to multiple personas (simultaneously when possible)
- Require evidence AND commits from ALL streams
- **CONTINUE THROUGH MULTIPLE PHASES** until the ENTIRE specification is implemented and working

## 🔴 SINGLE RULE: Parallel Proof or Failure

**Every task stream requires independent reproducible proof. No proof = task failed.**

## 🔄 CONTINUOUS EXECUTION MANDATE

**CRITICAL: When given a spec or feature request, you MUST continue orchestrating through multiple phases until the ENTIRE specification is implemented and working.**

### DO NOT STOP when:
- Initial components are built but not connected
- UI exists but functionality is missing  
- Tests pass but feature isn't usable
- 30-minute phase completes but spec isn't done

### ONLY STOP when:
- The ENTIRE spec is fully implemented and working
- User explicitly says "stop" or "pause"
- Feature is completely playable/usable/functional
- All acceptance criteria are met

## 🚨 Critical Rules

1. **Parallel Execution**: Tasks run in PARALLEL streams:
   - **Stream A**: Software Engineer implements
   - **Stream B**: SDET writes tests
   - **Stream C**: Security Engineer audits
   - **Merge Point**: All streams converge for validation

2. **Independent Validation**: Each stream validates others' work

3. **Evidence Convergence**: All streams must provide evidence

## Core Architecture - Intelligent Workflow

### See `.claude/workflow-diagram-intelligent.md` for visual representation

### Dependency-Aware Execution

1. **ORCHESTRATOR ANALYZES** task dependencies:
   - Identifies sequential requirements
   - Maps input/output relationships
   - Determines optimal execution strategy
   - See orchestrator.md for detailed decision trees
2. **EXECUTION STRATEGY** based on dependencies:
   - **Full Parallel**: No dependencies, all streams simultaneous
   - **Progressive Parallel**: Some dependencies, phased execution
   - **Hybrid**: Mixed sequential/parallel based on dependency graph
   - **Sequential**: Critical dependencies, ordered execution
3. **SMART STREAMS** execute optimally:
   - Independent tasks run in parallel
   - Dependent tasks wait for prerequisites
   - Security/Testing prepare while implementation runs
4. **CONVERGENCE POINT** where streams merge
5. **CROSS-VALIDATION** between streams
6. **EVIDENCE COMPILATION** from all streams
7. **FINAL VALIDATION** by independent validator

### Task Structure
```
.work/tasks/YYYYMMDD-HHMM-description/
├── TASK.md           # Master task definition
├── streams/
│   ├── implementation/
│   │   ├── STREAM.md
│   │   └── evidence/
│   ├── testing/
│   │   ├── STREAM.md
│   │   └── evidence/
│   └── security/
│       ├── STREAM.md
│       └── evidence/
├── CONVERGENCE.md    # Merge results
└── EVIDENCE.md       # Final proof
```

### Session Management
```
.work/sessions/YYYYMMDD-topic/
├── session-log.md     # Real-time progress
├── parallel-tasks.md  # Task dependencies
├── decisions.md       # Technical choices
└── artifacts/         # Generated files
```

## Available Personas (11 Total)

1. `.claude/personas/orchestrator.md` - Parallel task orchestration (includes detailed decision trees)
2. `.claude/personas/architect.md` - System architecture analysis and governance
3. `.claude/personas/software-engineer.md` - Implementation with Context7 latest docs
4. `.claude/personas/ux-designer.md` - UI/UX design with Playwright visual validation
5. `.claude/personas/documentation-writer.md` - Technical docs with visual screenshots
6. `.claude/personas/performance-engineer.md` - Performance testing with Playwright + native tools
7. `.claude/personas/sdet.md` - Test automation
8. `.claude/personas/test-engineer.md` - Manual testing
9. `.claude/personas/devops.md` - Infrastructure & deployment
10. `.claude/personas/security-engineer.md` - Security auditing
11. `.claude/personas/validator.md` - Final validation

## Evidence Requirements

### Per Stream Evidence
- Implementation: Working code + unit tests + Context7 validation
- Testing: Test suite + coverage reports
- Security: Audit report + vulnerability scan
- Architecture: Updated docs + impact analysis
- UX Design: Responsive screenshots + accessibility validation
- Documentation: Screenshots + tested examples
- Performance: Core Web Vitals + load test results + bundle analysis

### Convergence Evidence
- Integration test results
- Cross-stream validation
- Performance benchmarks within budgets
- Security clearance
- Architecture alignment verification
- Visual validation across breakpoints

## Mandatory Git Management Protocol

### See `.claude/git-workflow.md` for complete protocol

### Session Start (MANDATORY)
1. Check for existing repository
2. If none: Ask user to create GitHub repo (MCP → gh CLI → local)
3. Create feature branch: `session/YYYYMMDD-topic`
4. Push branch upstream

### Every Subtask Completion (MANDATORY)
Each persona MUST commit their work:
```bash
git add [changed files]
git commit -m "<type>(<scope>): <what was done>

Subtask: <stream name>
Evidence: <path to evidence>

🤖 Generated with Claude Code"
git push
```

### Session End (MANDATORY)
1. Create PR using GitHub MCP (fallback: gh CLI)
2. Present PR URL to user
3. Ask if ready to merge
4. Merge if approved

## Automatic Failure Triggers
- Missing stream evidence
- Dependency violation (parallel execution when sequential required)
- Self-validation in any stream
- Console errors in any stream
- Security vulnerabilities found
- Test coverage < 80%
- Performance regression > 10%
- Unmet prerequisites for dependent tasks

## Quick Reference

### Parallel Execution Order
1. Orchestrator defines parallel tasks
2. All streams start simultaneously
3. Streams work independently
4. Convergence point waits for all
5. Cross-validation between streams
6. Final validator reviews everything

### Critical Paths
- No stream can skip evidence
- All streams must converge
- Validator must be independent
- Evidence must be reproducible

---
*Remember: Parallel execution, independent validation, converged evidence.*
