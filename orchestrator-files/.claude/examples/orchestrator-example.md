# Orchestrator Example: Building a Tide Tracking App

## Initial Request
"Build a web app that shows me the local tides based on zip code"

## Orchestrator Response

```markdown
Loading parallel orchestration workflow...
Creating Sprint 1 structure: .work/milestones/20250628-example-milestone/sprint-001/

Breaking down into implementation tasks:
- Testing infrastructure setup (MANDATORY FIRST)
- NOAA API integration for tide data
- Zip code to coordinates service
- Tide visualization components
- Main UI with user input
```

## Sprint 1: Foundation & Core Features

### Requirements Step
```markdown
Task: @product-manager - Define user stories and acceptance criteria
```

**PM Output:**
- User can enter zip code and see today's tides
- Shows high/low times with heights
- Visual chart for 24-hour period
- Mobile responsive design

### Foundation Design Step (Parallel)
```markdown
Task: @architect - Design system architecture
Task: @ux-designer - Create UI mockups and user flow
```

### Implementation Step

#### Batch 1: Testing & Foundation
```markdown
Task: @software-engineer-1 - Set up testing infrastructure
→ Install Playwright, Vitest
→ Configure test scripts
→ Write first E2E test
→ EVIDENCE: Show npm run test:e2e working
```

**GATE: No feature work until testing complete!**

#### Batch 2: Core Services (Parallel)
```markdown
Task: @software-engineer-2 - NOAA tide API service
Task: @sdet-1 - Tide service tests
Task: @software-engineer-3 - Zip geocoding service  
Task: @sdet-2 - Geocoding tests
```

#### Batch 3: UI Components (After Services)
```markdown
Task: @software-engineer-4 - Tide chart component
Task: @software-engineer-5 - Tide table component
Task: @sdet-3 - Component tests
```

### Integration Step
```markdown
Task: @integration-engineer - Reconcile all components
→ Run all SDET tests
→ Fix integration issues
→ Verify services work together
→ Create INTEGRATION-REPORT.md
```

### Validation Step (Parallel - All 4)
```markdown
Task: @product-manager - Test golden paths
Task: @test-engineer - Run E2E tests
Task: @performance-engineer - Check API response times
Task: @security-engineer - Audit API key handling
```

**Result**: ✅ All validators pass

## Git Workflow Throughout Sprint

**After each implementation batch:**
```bash
git add .
git commit -m "feat: [description]

Task: TASK-XXX
Evidence: .work/milestones/20250628-example-milestone/sprint-001/implementation/[task]/EVIDENCE.md"
```

**Sprint complete:**
```bash
gh pr create --title "feat: tide tracking app MVP"
```

## Key Orchestration Principles

1. **Never writes code** - Only delegates via Task tool
2. **Parallel where possible** - Multiple engineers work simultaneously  
3. **Evidence required** - Every task produces EVIDENCE.md
4. **Integration mandatory** - Catch issues before validation
5. **Binary validation** - PASS or create fix tasks

## Result

Complete tide tracking app with:
- ✅ All user stories implemented
- ✅ 90%+ test coverage
- ✅ Integration verified
- ✅ All validators passed
- ✅ Ready for deployment

---
*Orchestration enables fast, parallel delivery with quality gates at every step.*