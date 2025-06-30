# Project Structure

## Root Directory
```
project/
├── README.md           # Project overview
├── CLAUDE.md          # Orchestration entry
├── package.json       # Dependencies
└── [config files]     # Essential configs only
```

## Hidden Directories
```
.claude/               # Orchestration system
├── preferences/       # Configurations
├── personas/         # Agent roles
├── validators/       # Validation protocols
└── hooks/           # Automation

.work/                # Active work (TRACKED)
├── Status/          # TODO, STATUS, ISSUES
├── sessions/        # Daily work docs
├── tasks/          # Task evidence
└── reports/        # Test/perf results
```

## Source Code
```
src/                  # Application code
├── app/             # Next.js app router
├── components/      # React components
├── lib/            # Utilities
└── types/          # TypeScript types

tests/               # Test files
├── unit/           # Component tests
├── integration/    # API tests
└── e2e/           # User journey tests
```

## Rules
- Keep root minimal
- Document in .work/
- Evidence in tasks/
- Clean up sessions weekly
