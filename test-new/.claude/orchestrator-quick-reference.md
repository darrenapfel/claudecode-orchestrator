# Orchestrator Quick Reference - Task Execution Protocol

## Task Delegation Template

When delegating ANY task, use this template:

```typescript
const taskId = `TASK-${Date.now()}-${stream}`
const protocol = readFile('.claude/task-execution-protocol.md')

const result = await Task({
  description: "Brief description for task tool",
  prompt: `
${protocol}

# TASK: ${taskId} - [Specific Task Description]
**Persona**: @[persona-name]
**Stream**: [implementation|testing|security|manual|devops]
**Deadline**: ${new Date(Date.now() + 30*60*1000).toISOString()}
**Dependencies**: [none | list of task IDs]

## Requirements
- [Specific requirement 1]
- [Specific requirement 2]

## Success Criteria
- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]
- [ ] Evidence documented in .work/tasks/${taskId}/
- [ ] Git commit with reference to ${taskId}

## Expected Outputs
- [What files/artifacts should be created]
- [What metrics should be reported]

## Context
[Any relevant context or connections to other tasks]

Remember to:
1. Create progress updates in .work/tasks/${taskId}/STATUS.md
2. Document evidence in .work/tasks/${taskId}/EVIDENCE.md  
3. Return structured JSON output as specified in the protocol
4. Commit all changes with reference to task ID
`
})

// Parse the result
const taskOutput = JSON.parse(result)
```

## Expected Task Output Structure

Every task MUST return:

```json
{
  "task_id": "TASK-1234-impl",
  "status": "complete|partial|failed|blocked",
  "commit_sha": "abc123def456",
  "evidence_path": ".work/tasks/TASK-1234-impl/EVIDENCE.md",
  "metrics": {
    // Persona-specific metrics
  },
  "blockers": [],
  "next_steps": [],
  "structured_output": {
    // Persona-specific parseable data
  }
}
```

## Task Monitoring

Check progress every 2-3 minutes:

```bash
# Check status
cat .work/tasks/*/STATUS.md

# Check for completion
ls .work/tasks/*/OUTPUT.json

# Read output
cat .work/tasks/TASK-XXX/OUTPUT.json
```

## Convergence Checklist

Before convergence:
- [ ] All OUTPUT.json files exist
- [ ] All status = "complete" 
- [ ] All evidence paths valid
- [ ] All git commits successful
- [ ] No blocking issues

## Common Task IDs Pattern

- Implementation: `TASK-{timestamp}-impl`
- Testing: `TASK-{timestamp}-test`
- Security: `TASK-{timestamp}-security`
- Manual Testing: `TASK-{timestamp}-manual`
- DevOps: `TASK-{timestamp}-devops`
- Validation: `TASK-{timestamp}-validate`

## Quick Debug

If a task isn't producing output:
1. Check if STATUS.md is being updated
2. Verify the protocol was included in prompt
3. Check for parsing errors in the result
4. Look for error messages in STATUS.md

