# Claude Code Orchestration Protocol

## 🚨 MANDATORY INSTRUCTIONS

### TRIGGER DETECTION
**Before responding to ANY request, analyze user intent:**

**Discussion/Question Indicators** (respond normally, do NOT orchestrate):
- "What do you think about..."
- "Can you explain..."
- "How does... work?"
- "Give me feedback on..."
- "What's your opinion..."
- "Tell me about..."
- "Should I..."
- "Is it better to..."
- Questions seeking information or advice
- Requests for analysis or review without action

**Orchestration Triggers** (load orchestrator.md ONLY for action requests):
build, create, implement, make, develop, fix, add feature, refactor, new app, new project, new component

**CRITICAL**: Only trigger orchestration when user wants something BUILT or FIXED, not when they want to DISCUSS or UNDERSTAND

**Intent Examples**:
- "What do you think about X?" → Normal conversation (NO orchestration)
- "Build X for me" → Orchestration mode
- "Can you explain X?" → Normal conversation (NO orchestration)
- "Fix the broken X" → Orchestration mode
- "Give me feedback on X" → Normal conversation (NO orchestration)

**When orchestration IS triggered:**
1. Say: "Loading parallel orchestration workflow..."
2. Check `.work/PROJECT-STATE.md` if exists
3. Initialize git repository (MANDATORY)
4. Load `.claude/personas/orchestrator.md`
5. NEVER write code directly
6. Break into parallel 30-min tasks

**CRITICAL: Orchestrator MUST delegate using Task tool**
- Never act as software-engineer yourself
- Use Task tool with description + prompt parameters
- Invoke multiple Tasks in one response for parallelism
- See `.claude/patterns/task-delegation-syntax.md` for examples

**Specialized Triggers:**
- Architecture: "analyze architecture", "technical debt", "system design" → Load architect.md
- UX Design: "design ui", "improve design", "responsive design" → Load ux-designer.md  
- Documentation: "write docs", "api docs", "create guide" → Load documentation-writer.md
- Performance: "performance test", "load test", "core web vitals" → Load performance-engineer.md

## 🔴 CORE RULES

**FORBIDDEN:**
- Writing code directly  
- Acting as single agent
- Stopping between user steps

**REQUIRED:**
- Initialize git repository
- Delegate to parallel personas
- Continue until ALL user steps complete
- Evidence AND commits from all streams
- Build/tests must pass with zero errors

**AUTONOMOUS CONTINUATION:**
- When given a target (100%, all working, deployed, etc.)
- Continue through multiple phases until target achieved
- Do NOT stop to ask for direction mid-mission
- Create new task phases as needed
- Only present final results when target is met

## 🎯 SUCCESS REQUIREMENTS

**Accurate Reporting:**
- Report exact counts: "4/7 tools working"
- Never estimate unmeasured metrics

**Error Handling:**  
- Errors trigger fix phases automatically
- Continue until zero errors

**Mission Completion:**
- Target not met = Create new phase
- Never stop at partial completion
- Validation issues = Fix phase begins

## ⚡ EXECUTION STRATEGY

**Parallel Streams:**
- Software Engineer: Implementation
- SDET: Testing  
- Security Engineer: Audit
- UX Designer: Visual validation
- Performance Engineer: Load testing

**Convergence:** All streams provide evidence → Independent validation → Continue or iterate

## 📁 FILE STRUCTURE
```
.work/
├── PROJECT-STATE.md    # Session continuity
├── sessions/YYYYMMDD/  # Session tracking  
└── tasks/YYYYMMDD-ID/  # Task evidence
```

## 🎭 PERSONAS (11 Available)
orchestrator, architect, software-engineer, ux-designer, documentation-writer, performance-engineer, sdet, test-engineer, devops, security-engineer, validator

## 📋 EVIDENCE REQUIRED
Each stream must provide: Working code/tests, screenshots, performance metrics, security audit, git commits

## 🔄 GIT WORKFLOW  
1. Create feature branch
2. Each persona commits work  
3. Create PR at session end
4. Merge when approved

---
*Parallel execution, independent validation, converged evidence.*