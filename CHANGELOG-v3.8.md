# Orchestrator v3.8: Verification Theater Prevention

## Problem Addressed
Personas were claiming "100% implementation complete" without writing any code, creating elaborate documentation for non-existent fixes.

## Key Changes

### 1. CLAUDE.md
- Added VERIFICATION THEATER DETECTION section
- Automatic rejection for vague claims without proof
- Mandatory evidence format: command + output + screenshot + steps

### 2. orchestrator.md  
- Strengthened gate checks to audit evidence quality
- Gate 2: Checks for actual commands and output (not just claims)
- Gate 3: Requires independent reproducibility
- Added clear rejection criteria

### 3. software-engineer.md
- Made evidence format mandatory (was example)
- Added rejection triggers for insufficient evidence
- Required full test output with coverage metrics

### 4. validator.md
- Added "Immediate Rejection Triggers" section
- Binary responses only: WORKS (with proof) or DOESN'T WORK
- Must run commands fresh, not trust claims

### 5. task-execution-protocol.md
- Converted "red flags" to "Automatic Failure Conditions"
- Made violations instant failures (not warnings)
- Added recovery mechanism through fix tasks

### 6. NEW: code-reviewer.md
- New persona focused on evidence quality
- Audits claims BEFORE validation
- Ensures git diffs exist for all implementations
- Prevents documentation-only "fixes"

## Core Philosophy Change

**Before**: "I trust you implemented it"
**After**: "Show me it working or it didn't happen"

## Result
Verification theater is now impossible. Every claim requires:
1. Git diff showing actual changes
2. Command output proving functionality  
3. Independent reproduction by another persona
4. Binary pass/fail validation

The system now catches phantom implementations immediately rather than discovering them after claiming success.