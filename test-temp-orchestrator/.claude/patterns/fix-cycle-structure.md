# Fix Cycle Directory Structure

## Standard Fix Cycle Organization

When validation failures occur (which is normal and expected), organize fixes using numbered cycles:

```
.work/sessions/{session-name}/sprint-XXX/
├── implementation/      # Original implementation
├── validation/         # First validation attempt
├── fixes/
│   ├── cycle-1/       # First fix cycle
│   ├── cycle-2/       # Second fix cycle (if needed)
│   ├── cycle-3/       # Third fix cycle (if needed)
│   └── cycle-N/       # Continue as needed
└── validation-final/   # Final validation after all fixes

```

## Fix Cycle Naming Convention

**DO NOT USE:**
- revalidation/
- re-revalidation/
- re-re-revalidation/

**ALWAYS USE:**
- fixes/cycle-1/
- fixes/cycle-2/
- fixes/cycle-3/

## Example Fix Cycle Flow

```
Initial validation: 12 failures
→ fixes/cycle-1/: Fixed 8 issues
→ Validation: 4 failures remain
→ fixes/cycle-2/: Fixed 3 issues  
→ Validation: 1 failure remains
→ fixes/cycle-3/: Fixed final issue
→ validation-final/: All tests passing ✓
```

## Directory Contents

Each fix cycle should contain:
```
fixes/cycle-N/
├── ISSUES.md          # List of issues being addressed
├── FIXES.md           # Solutions implemented
├── EVIDENCE.md        # Proof of fixes working
└── artifacts/         # Test outputs, screenshots
```

## Commit Message Format

```bash
git commit -m "fix(cycle-N): resolve {description}

Issues fixed:
- {specific issue 1}
- {specific issue 2}

Fix cycle: N
Remaining issues: X
Evidence: .work/sessions/{session}/sprint-XXX/fixes/cycle-N/EVIDENCE.md"
```

---
*Numbered cycles show honest progression. Revalidation implies surprise.*
