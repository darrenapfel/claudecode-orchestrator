# Project Structure Preferences

## Directory References
For the complete `.work/` directory structure, see:
- **Master Structure**: `.claude/patterns/MASTER-DIRECTORY-STRUCTURE.md`
- **Common Paths**: `.claude/patterns/COMMON-PATHS.md`

This file defines preferences for non-orchestration directories only.

## Root Directory
```
project/
├── README.md           # Project overview
├── CLAUDE.md          # Orchestration entry point
├── package.json       # Dependencies
├── .gitignore         # Git exclusions (create FIRST)
├── .env.example       # Environment template
└── [config files]     # Essential configs only
```

## Orchestration Directories
```
.claude/               # Orchestration system (static)
├── preferences/       # Project configurations
├── personas/         # AI agent roles
├── patterns/         # Workflow patterns
├── validators/       # Validation protocols
└── hooks/           # Git hooks and automation

.work/                # Active work (dynamic, git-tracked)
└── [See MASTER-DIRECTORY-STRUCTURE.md for complete structure]
```

## Source Code Structure
```
src/                  # Application code
├── app/             # Next.js app router (if applicable)
├── components/      # React components
├── services/        # Business logic
├── lib/            # Shared utilities
├── types/          # TypeScript definitions
└── config/         # App configuration

tests/               # Test files
├── unit/           # Component/function tests
├── integration/    # API/service tests
├── e2e/           # User journey tests
└── fixtures/       # Test data

docs/                # Documentation (if needed)
├── api/            # API documentation
└── guides/         # User guides
```

## Build Outputs (git-ignored)
```
dist/               # Production build
build/              # Build artifacts
.next/              # Next.js build cache
node_modules/       # Dependencies
coverage/           # Test coverage reports
```

## Configuration Files
```
Root level only:
- package.json      # Node.js manifest
- tsconfig.json     # TypeScript config
- next.config.js    # Next.js config (if applicable)
- jest.config.js    # Test configuration
- .eslintrc.js      # Linting rules
- .prettierrc       # Code formatting
```

## Best Practices
1. **Keep root minimal** - Only essential configs at root
2. **Group by feature** - Organize src/ by feature, not file type
3. **Colocate tests** - Keep tests near source when possible
4. **Document in .work/** - All project docs go in .work/foundation/
5. **Track progress** - Evidence always in .work/milestones/

## Anti-Patterns to Avoid
- ❌ Mixing source and docs at root level
- ❌ Deep nesting (max 3-4 levels)
- ❌ Duplicate structures in different locations
- ❌ Config files scattered throughout src/
- ❌ Test files far from source files

---
*For .work/ directory structure, always refer to MASTER-DIRECTORY-STRUCTURE.md*
