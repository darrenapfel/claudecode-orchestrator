#\!/bin/bash
# Initialize Claude orchestration in a project

set -euo pipefail

echo "🚀 Initializing Claude orchestration for $(basename "$PWD")..."

# Create project structure with new .work directory
mkdir -p .work/Status .work/tasks .work/sessions .work/reports .claude

# Check for global install
if [ -d "$HOME/.claude/personas" ]; then
    echo "✅ Found global Claude installation"
    
    # Create minimal CLAUDE.md that references global
    cat > CLAUDE.md << 'CLAUDE'
# Project Orchestration

This project uses Claude Global Orchestrator (~/.claude/).

## Core Rule: Proof of Work or Failure
Every task requires evidence. No proof = task failed.

## Quick Reference
- Load personas: `Load ~/.claude/personas/[role].md`
- Load preferences: `Load ~/.claude/preferences/[file].md`
- Validate work: `~/.claude/hooks/validate.sh`

## Project Structure
- `.work/` - All working files (tracked)
- `.work/Status/` - TODO, STATUS, ISSUES
- `.work/sessions/` - Daily work
- `.work/tasks/` - Task evidence

## Project-Specific Rules
<\!-- Add custom rules below -->
CLAUDE
else
    echo "⚠️  No global installation found. Use local .claude/ directory"
fi

# Create initial status files
cat > .work/Status/STATUS.md << EOF
# Project Status

**Last Updated**: $(date -u +%Y-%m-%dT%H:%M:%SZ)
**Current Phase**: Initial Setup
**Overall Health**: 🟢 Good

## Summary
Project orchestration system initialized.
EOF

cat > .work/Status/TODO.md << EOF
# Project TODO List

**Created**: $(date -u +%Y-%m-%dT%H:%M:%SZ)

## Active Tasks
### 🔴 P0 - Critical
<\!-- Add critical tasks here -->

### 🟡 P1 - High Priority
<\!-- Add high priority tasks here -->
EOF

echo "✅ Project initialized\!"

