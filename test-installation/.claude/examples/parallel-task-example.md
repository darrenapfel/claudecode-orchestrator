# Example: Parallel Task Execution - User Authentication

This example demonstrates parallel execution for building user authentication.

## Initial Request
"Build a secure user authentication system with login, logout, and password reset"

## Parallel Execution Strategy

### Why These Can Run in Parallel
- **Implementation** writes code based on architecture
- **SDET** writes tests based on same architecture
- **Security** audits the design, not implementation
- All work from the same architectural spec, not each other's output

## Sprint 1, Implementation Batch 1

### The RIGHT Way (Parallel in ONE Message)
```markdown
Task: @software-engineer - Implement auth system (login, logout, password reset)
Task: @sdet - Write auth tests (unit, integration, E2E)
Task: @security-engineer - Security audit of auth design
```

### The WRONG Way (Sequential)
```markdown
Task: @software-engineer - Implement auth
[Wait for completion]
Task: @sdet - Write tests
[Wait for completion]  
Task: @security-engineer - Audit
```

## Execution Timeline

```
Time    | Engineer              | SDET                 | Security
--------|--------------------- |---------------------|--------------------
T+0     | Read ARCHITECTURE.md | Read ARCHITECTURE.md | Read ARCHITECTURE.md
T+5     | Build user model     | Write model tests   | Threat model auth
T+10    | Implement APIs       | Integration tests   | OWASP checklist
T+15    | Password reset flow  | E2E test scenarios  | Session audit
T+20    | Complete + EVIDENCE  | Complete + EVIDENCE | Complete + EVIDENCE
--------|--------------------- |---------------------|--------------------
T+21    | ← Integration Engineer reconciles all work →
```

## Evidence Structure

```
.work/sprints/sprint-001/implementation/
├── auth-implementation/
│   ├── EVIDENCE.md      # What was built
│   ├── src/             # Actual code
│   └── deviations.md    # Any changes from architecture
├── auth-tests/
│   ├── EVIDENCE.md      # Test coverage report
│   ├── tests/           # Test files
│   └── results.json     # Test run output
└── auth-security/
    ├── EVIDENCE.md      # Security findings
    ├── threat-model.md  # Threat analysis
    └── owasp-check.md   # Compliance report
```

## Integration Step (After Parallel Work)

```markdown
Task: @integration-engineer - Reconcile auth implementation
→ Run SDET's tests on engineer's code
→ Apply security recommendations
→ Fix any integration issues
→ Create INTEGRATION-REPORT.md
```

## Key Principles

1. **Architecture First**: All personas work from ARCHITECTURE.md
2. **True Parallelism**: 3 personas × 20 min = 20 min total (not 60)
3. **No Dependencies**: Tests don't need code to be written
4. **Integration Reconciles**: Brings parallel work together
5. **Evidence Required**: Each stream produces proof

## Common Mistakes to Avoid

❌ **Sequential Dependencies**
"First implement, then test, then audit"

✅ **Parallel from Architecture**
"Everyone works from the spec simultaneously"

❌ **Waiting for Code**
"SDET waits for implementation to write tests"

✅ **Test-First Approach**
"SDET writes tests from architecture while code is written"

❌ **Late Security**
"Security reviews after everything is built"

✅ **Security by Design**
"Security audits the design in parallel with build"

---
*True parallelism comes from working from specifications, not from each other's output.*
