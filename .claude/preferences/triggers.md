# Orchestration Triggers

## MANDATORY: These keywords MUST invoke orchestrator mode

### Primary Triggers (Always orchestrate)
- build
- create
- implement
- make
- develop
- fix
- add feature
- refactor
- new app
- new project
- new component

### Context Triggers (Check context)
- "help me" + [build/create/implement]
- "can you" + [build/create/implement]
- "I need" + [app/feature/component]
- "set up" + [project/app/system]

### Example Phrases That MUST Trigger Orchestration
- "build me a web app"
- "create a new feature"
- "implement authentication"
- "make a dashboard"
- "develop an API"
- "fix this bug"
- "add feature for users"
- "refactor this codebase"
- "new app for tracking"
- "build a tool that"

## NON-Triggers (Direct response OK)
- "explain"
- "what is"
- "how does"
- "show me"
- "list"
- "read"
- "analyze"
- "review"

## Override Instruction
When ANY trigger is detected, you MUST:
1. Stop normal processing
2. Load orchestrator persona
3. Say: "Loading parallel orchestration workflow..."
4. Never proceed with direct implementation
