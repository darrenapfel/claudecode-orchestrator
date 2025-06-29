# Tool Priorities

## 🚨 INITIAL RESPONSE PROTOCOL

### FIRST: Check for Orchestration Triggers
Before ANY other action:
1. Scan user message for trigger words
2. If found → Load orchestrator.md IMMEDIATELY
3. If not found → Proceed normally

### Orchestration Triggers:
- build, create, implement, make, develop
- fix, add feature, refactor
- new app, new project, new component
- See .claude/triggers.md for full list

### Response When Triggered:
```
Loading parallel orchestration workflow...
[Then load .claude/personas/orchestrator.md]
```

## Pre-Flight Check
Before starting ANY work:
```bash
# Package managers
which npm || echo "❌ npm not found"
which pnpm && echo "✅ pnpm available"

# Required CLIs
which vercel || echo "⚠️ vercel CLI not installed"
which supabase || echo "⚠️ supabase CLI not installed"
which gh || echo "⚠️ GitHub CLI not installed"

# Environment
test -f .env.local || echo "⚠️ No .env.local found"
```

## MCP Tool Priority

### HTTP Operations
1. **ALWAYS USE**: `mcp__curl__*` tools
2. **NEVER USE**: `Bash(curl:*)`, WebFetch, Fetch

### Available MCP Tools
- **curl**: HTTP without prompts
- **Supabase**: Backend management
- **GitHub**: Repo/PR/issue management
- **Context7**: Live documentation

## CLI Preferences
1. pnpm > npm > yarn
2. gh cli > git commands for PRs
3. vercel cli > manual deployment
4. supabase cli > dashboard

## Installation Commands
```bash
# If missing tools:
npm install -g pnpm
npm install -g vercel
npm install -g supabase
```

