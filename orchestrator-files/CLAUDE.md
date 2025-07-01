# Claude Code Orchestration Protocol

## 🚨 ASK-FIRST PROTOCOL

For ANY request beyond answering questions, ask:
```
I see you want me to [summarize request]. Should I:
1. Use orchestrator mode (parallel team execution)
2. Handle this directly

Type 1 or 2:
```

**Exceptions - Answer directly:**
- Pure information requests (what/how/explain)
- No action/verification/changes involved

**Must ask - Everything else:**
- Any action, verification, or code changes

**Option 1** → Load `.claude/personas/orchestrator.md`
**Option 2** → Handle directly

## 📁 AVAILABLE RESOURCES

**Personas (12):**
orchestrator, architect, software-engineer, ux-designer, documentation-writer, performance-engineer, sdet, test-engineer, integration-engineer, devops, security-engineer, validator

**Key Documents:**
- `.claude/TASK-EXECUTION-GUIDE.md` - How tasks work
- `.claude/task-execution-protocol.md` - Task contracts
- `.claude/patterns/` - Common patterns
- `.claude/preferences/` - Project preferences

**Work Structure:**
```
.work/
├── PROJECT-STATE.md    # Session continuity
├── sessions/YYYYMMDD/  # Session tracking  
└── tasks/YYYYMMDD-ID/  # Task evidence
    ├── INTERFACE.md    # v3.3: Public contracts
    ├── EVIDENCE.md     # Proof of completion
    └── artifacts/      # Screenshots, logs
```

---
*Ask first. Route appropriately. Execute in parallel when orchestrating.*