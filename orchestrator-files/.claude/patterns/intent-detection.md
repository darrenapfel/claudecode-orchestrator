# Intent Detection Guide

## Critical: Not Every Request Needs Orchestration

The orchestrator must distinguish between:
1. **Action Requests** - User wants something built → Orchestrate
2. **Discussion Requests** - User wants to talk → Converse normally

## Discussion Request Examples (DO NOT ORCHESTRATE)

### Questions & Analysis
- "What do you think about the orchestrator model?"
- "Can you review my code and give feedback?"
- "How does the parallel execution work?"
- "What's the best way to structure this?"
- "Should I use SQLite or PostgreSQL?"
- "Is the orchestrator working correctly?"

### Planning & Exploration
- "I'm thinking about adding feature X..."
- "Let's discuss the architecture"
- "Help me understand the trade-offs"
- "What would happen if we..."
- "Can you explain why..."

### Feedback & Opinions
- "Give me your thoughts on..."
- "What's your opinion about..."
- "Does this look right to you?"
- "Am I using the orchestrator correctly?"
- "Review this approach"

## Action Request Examples (DO ORCHESTRATE)

### Build/Create Commands
- "Build a user authentication system"
- "Create a new React component"
- "Implement the payment flow"
- "Set up the testing framework"
- "Make a responsive dashboard"

### Fix/Refactor Commands
- "Fix the failing tests"
- "Refactor the database layer"
- "Debug the login issue"
- "Optimize the API performance"
- "Update the dependencies"

### Feature Additions
- "Add dark mode to the app"
- "Integrate Stripe payments"
- "Add user notifications"
- "Implement search functionality"

## Response Patterns

### For Discussion (Normal Conversation)
```
User: "What do you think about the orchestrator model?"
Assistant: "The orchestrator model is designed to maximize parallel execution 
and prevent fabrication through evidence-based development. Here are my thoughts..."
[Normal conversation continues]
```

### For Action (Orchestration Mode)
```
User: "Build a user authentication system"
Assistant: "Loading parallel orchestration workflow...

Breaking down user authentication into parallel streams:
[Orchestration begins with Task delegations]
```

## Mixed Requests

Sometimes users mix discussion with action:

```
User: "Can you explain how auth works and then build one?"
```

Handle these in sequence:
1. First, answer the question (discussion mode)
2. Then ask: "Would you like me to build an authentication system now?"
3. Only orchestrate if they confirm

## When Uncertain

If intent is unclear, ASK:
```
"I want to make sure I understand correctly. Are you:
a) Looking for discussion/advice about X?
b) Wanting me to build/implement X?

Please clarify so I can provide the most helpful response."
```

## Remember

- Orchestration is powerful but not always needed
- Users often just want to talk or understand
- Spawning unnecessary tasks wastes time
- A good orchestrator knows when NOT to orchestrate
- Discussion and planning are valuable activities

## Anti-Patterns to Avoid

### ❌ Over-Orchestration
```
User: "How does the Task tool work?"
Wrong: "Loading orchestration workflow to demonstrate Task tool..."
Right: "The Task tool allows the orchestrator to delegate work..."
```

### ❌ Missing Action Requests
```
User: "Fix the broken tests"
Wrong: "To fix broken tests, you would need to..."
Right: "Loading parallel orchestration workflow..."
```

### ✅ Correct Pattern Recognition
- Discussion → Converse
- Action → Orchestrate
- Mixed → Clarify first
- Uncertain → Ask user