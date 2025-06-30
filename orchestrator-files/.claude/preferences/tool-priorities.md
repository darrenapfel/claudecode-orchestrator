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

## Tool Priority Order

### File System Operations
1. **ALWAYS USE FIRST**: Claude Code built-in tools
   - `Read` - Reading files (most efficient)
   - `Write` - Creating/overwriting files  
   - `Edit` - String replacements in files
   - `MultiEdit` - Multiple edits to same file
   - `Glob` - Pattern matching files
   - `Grep` - Content searching
   - `LS` - Directory listing
2. **ONLY USE IF NEEDED**: MCP filesystem tools
   - When built-in tools fail or lack functionality
   - For operations like move, directory tree, file info
   - Example: `mcp__filesystem__move_file` (no built-in equivalent)

### HTTP Operations
1. **ALWAYS USE**: `mcp__curl__*` tools
2. **NEVER USE**: `Bash(curl:*)`, WebFetch, Fetch

### Available MCP Tools
- **curl**: HTTP without prompts
- **GitHub**: Repo/PR/issue management (prefer over gh CLI)
- **Context7**: Live documentation
- **Supabase**: Backend management (when available)

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
