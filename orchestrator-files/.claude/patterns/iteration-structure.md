# Iteration-Based Work Structure

## Directory Organization

The `.work` directory supports iterative development with clear separation between iterations:

```
.work/
├── iterations/
│   ├── iteration-001/           # First batch of features
│   │   ├── foundation/          # Phase 0-1 outputs
│   │   │   ├── architecture/    # ARCHITECTURE.md, DEPENDENCIES.md
│   │   │   ├── ux/             # Wireframes, design system
│   │   │   └── product/        # User stories, acceptance criteria
│   │   ├── implementation/      # Phase 2 outputs
│   │   │   ├── features/       # Feature implementations
│   │   │   │   ├── auth/       # Feature A code + EVIDENCE.md
│   │   │   │   └── todos/      # Feature B code + EVIDENCE.md
│   │   │   └── tests/          # SDET test suites
│   │   │       ├── auth/       # Feature A tests
│   │   │       └── todos/      # Feature B tests
│   │   ├── integration/        # Phase 2.5 outputs
│   │   │   └── reports/        # INTEGRATION-REPORT.md
│   │   ├── validation/         # Phase 3 outputs
│   │   │   ├── golden-paths/  # PM validation screenshots
│   │   │   ├── sign-offs/     # Formal approvals
│   │   │   └── e2e-tests/     # Test engineer results
│   │   └── deployment/         # Phase 4 outputs
│   │       ├── docs/          # Updated documentation
│   │       └── configs/       # CI/CD configurations
│   │
│   └── iteration-002/          # Second batch of features
│       └── [same structure]
│
├── tasks/                      # Individual task tracking
├── sessions/                   # Work session logs
├── architecture/               # Global architecture docs
└── state-archive/             # Historical states
```

## Iteration Naming Convention

- Format: `iteration-XXX` (e.g., iteration-001, iteration-002)
- Each iteration is self-contained with all phases
- Later iterations can reference earlier ones

## How Iterations Work

### Starting a New Iteration

1. Orchestrator creates new iteration directory
2. PM defines scope in `iteration-XXX/foundation/product/`
3. Architect reviews existing architecture from previous iterations
4. Architect updates global architecture with new features

### During Implementation

- Each feature gets its own directory
- Deviations tracked per feature
- Integration engineer can see all features in one place

### Cross-Iteration Dependencies

When Feature C in iteration-002 depends on Feature A from iteration-001:
- Architect documents this in DEPENDENCIES.md
- Integration engineer ensures compatibility
- Tests verify cross-iteration integration

## Example Iteration Flow

### Iteration 001 (MVP)
```
Features:
- Authentication system
- Basic todo CRUD
- Component library

Output:
- Working auth + todos
- Deployed to staging
```

### Iteration 002 (Enhancement)
```
Features:
- Real-time notifications (uses auth)
- Search functionality
- Admin panel (uses auth + todos)

Dependencies:
- Must integrate with iteration-001 auth
- Must not break existing todos
```

## Benefits

1. **Clear History**: Each iteration preserved
2. **Easy Rollback**: Can revert to previous iteration
3. **Parallel Work**: Multiple iterations can be planned
4. **Integration Clarity**: Dependencies explicit
5. **Progressive Enhancement**: Each iteration adds value

## Orchestrator Responsibilities

When starting new iteration:
```bash
# Create iteration structure
ITERATION_NUM=$(printf "%03d" $(($(ls -d .work/iterations/iteration-* 2>/dev/null | wc -l) + 1)))
mkdir -p .work/iterations/iteration-${ITERATION_NUM}/{foundation,implementation,integration,validation,deployment}

# Copy relevant docs from previous iteration
cp .work/iterations/iteration-*/foundation/architecture/ARCHITECTURE.md \
   .work/iterations/iteration-${ITERATION_NUM}/foundation/architecture/ARCHITECTURE-previous.md
```

---
*Each iteration builds on the last. Clear structure enables progress.*