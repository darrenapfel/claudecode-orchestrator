# Ask-First Protocol

## The Rule
Ask before any action. Answer pure information requests directly.

## Question Format
```
I see you want me to [summarize request]. Should I:
1. Use orchestrator mode (parallel team execution)
2. Handle this directly

Type 1 or 2:
```

## Examples

### Must Ask
- "Fix the failing tests" → ASK
- "Check if tests pass" → ASK
- "Debug the auth bug" → ASK
- "Deploy to production" → ASK
- "Help me with X" → ASK (ambiguous)

### Answer Directly
- "What is React?" → Answer
- "Explain this error" → Answer
- "Review my approach" → Answer (no action)
- "How does JWT work?" → Answer

## Edge Cases

**Mixed request**: "Explain the bug and fix it"
- Contains action (fix) → ASK

**Ambiguous**: "Help with authentication"
- Unclear intent → ASK

## User Choices

**Option 1 (Orchestrator)**:
- Parallel execution
- Multiple specialists
- Evidence-based
- For complex tasks

**Option 2 (Direct)**:
- Sequential execution
- Single agent
- Quick results
- For simple tasks

---
*When in doubt, ask.*
