# Technical Decisions Log

**Purpose**: Document important technical decisions and their rationale

## Decision Template
```markdown
### DECISION-001: [Decision Title]
**Date**: [ISO Date]
**Status**: Proposed/Accepted/Deprecated
**Deciders**: [Who was involved]

**Context**:
[What is the issue we're addressing?]

**Decision**:
[What we decided to do]

**Rationale**:
[Why we made this choice]

**Alternatives Considered**:
1. [Alternative 1] - Rejected because...
2. [Alternative 2] - Rejected because...

**Consequences**:
- Positive: [Benefits]
- Negative: [Drawbacks]
- Neutral: [Trade-offs]

**Related**:
- Links to relevant docs/PRs/issues
```

## Example Decisions

### DECISION-000: Use Orchestrator Pattern
**Date**: 2025-06-28T20:01:03Z
**Status**: Accepted
**Deciders**: Team

**Context**:
Long coding sessions with Claude result in lost focus and fabricated results.

**Decision**:
Implement orchestrator pattern with atomic 30-minute tasks and adversarial validation.

**Rationale**:
- Maintains focus through small tasks
- Prevents fabrication through independent validation
- Creates clear audit trail

**Consequences**:
- Positive: Better quality, less drift
- Negative: More overhead
- Neutral: Requires discipline
