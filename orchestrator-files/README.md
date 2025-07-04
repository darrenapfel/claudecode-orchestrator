# Orchestrator Files Directory

This directory contains all files that will be installed by the `orchestrator.sh` script.

## Contents

- **`.claude/`** - All orchestration configuration files
  - personas/ - AI personas for different roles
  - validators/ - Validation protocols
  - preferences/ - User preferences and tech stacks
  - examples/ - Example implementations
  - etc.

- **`.work/`** - Template working directory structure
  - foundation/ - Project-wide architecture, product, UX
  - milestones/ - Major development phases
  - sprints/ - Global sprint tracking
  - discovery/ - One-time discovery questions

- **`CLAUDE.md`** - Root instructions for Claude Code

## Important Notes

1. **DO NOT** edit files here directly for your project
2. These are **template files** that get installed by orchestrator.sh
3. To update the orchestration system, modify files here and rebuild orchestrator.sh
4. After installation, the files will be copied to your project or ~/.claude

## Building

To rebuild orchestrator.sh after making changes:

```bash
node ../build-orchestrator.js
```

This will scan this directory and embed all files into the installer script.