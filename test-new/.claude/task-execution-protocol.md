# Task Execution Protocol - Standardized Task Interface

## Overview
This protocol ensures EVERY task, regardless of persona, produces structured output and maintains progress documentation in the .work/ directory.

## Task Initiation Template

Every task MUST be initiated with this structure:

```markdown
# TASK: [Task ID] - [Task Description]
**Persona**: @[persona-name]
**Stream**: [implementation|testing|security|manual|devops]
**Deadline**: [timestamp + 30 minutes]
**Dependencies**: [list of task IDs that must complete first]

## Requirements
[Specific requirements from orchestrator]

## Success Criteria
- [ ] Specific measurable outcome 1
- [ ] Specific measurable outcome 2
- [ ] Evidence documented in .work/

## Output Contract
You MUST return a JSON structure at task completion:
```json
{
  "task_id": "TASK-001",
  "status": "complete|partial|failed|blocked",
  "commit_sha": "git commit hash",
  "evidence_path": ".work/tasks/[task-id]/EVIDENCE.md",
  "metrics": { /* persona-specific metrics */ },
  "blockers": [],
  "next_steps": [],
  "structured_output": { /* parseable results */ }
}
```

## Progress Documentation
Create and update these files in .work/tasks/[task-id]/:
- STATUS.md - Real-time progress updates
- EVIDENCE.md - Proof of completion
- OUTPUT.json - Structured return data
```

## Standardized Task Lifecycle

### 1. Task Initialization (0-1 minute)
```typescript
class TaskExecutor {
  async initializeTask(taskDefinition: TaskDef): Promise<void> {
    // Create task directory
    const taskDir = `.work/tasks/${taskDefinition.id}/`
    await createDirectory(taskDir)
    
    // Initialize status file
    await writeFile(`${taskDir}/STATUS.md`, `
# Task Status: ${taskDefinition.id}
**Started**: ${new Date().toISOString()}
**Persona**: ${taskDefinition.persona}
**Status**: IN_PROGRESS

## Progress Log
- [${timestamp()}] Task initialized
- [${timestamp()}] Reading requirements...
    `)
    
    // Create evidence template
    await writeFile(`${taskDir}/EVIDENCE.md`, `
# Evidence for ${taskDefinition.id}

## Requirements
${taskDefinition.requirements}

## Implementation
[To be filled]

## Proof of Completion
[To be filled]
    `)
  }
}
```

### 2. Progress Tracking (Throughout execution)
```typescript
class ProgressTracker {
  private statusFile: string
  private updateInterval: NodeJS.Timer
  
  constructor(taskId: string) {
    this.statusFile = `.work/tasks/${taskId}/STATUS.md`
    this.startAutoUpdate()
  }
  
  async logProgress(message: string, percentage: number): Promise<void> {
    const entry = `- [${timestamp()}] ${message} (${percentage}% complete)`
    await appendFile(this.statusFile, entry + '\n')
  }
  
  async logMilestone(milestone: string): Promise<void> {
    const entry = `\n### Milestone: ${milestone}\n- [${timestamp()}] Completed\n`
    await appendFile(this.statusFile, entry)
  }
  
  private startAutoUpdate(): void {
    // Update every 2 minutes with heartbeat
    this.updateInterval = setInterval(async () => {
      await this.logProgress('Still working...', this.calculateProgress())
    }, 120000)
  }
}
```

### 3. Structured Output Generation
```typescript
interface TaskOutput {
  // Common fields for ALL personas
  task_id: string
  persona: string
  stream: string
  status: 'complete' | 'partial' | 'failed' | 'blocked'
  started_at: string
  completed_at: string
  duration_minutes: number
  
  // Git integration
  git: {
    commit_sha: string
    files_changed: string[]
    branch: string
  }
  
  // Evidence
  evidence: {
    primary_path: string
    screenshots: string[]
    logs: string[]
    artifacts: string[]
  }
  
  // Persona-specific output
  output: {
    [key: string]: any
  }
  
  // Quality metrics
  metrics: {
    [key: string]: number | boolean
  }
  
  // Issues and next steps
  issues: {
    blockers: string[]
    warnings: string[]
    recommendations: string[]
  }
  
  // For orchestrator parsing
  next_actions: {
    required: string[]
    optional: string[]
    dependencies_created: string[]
  }
}
```

## Integration with Personas

### Persona Wrapper Function
Each persona should be wrapped with this execution framework:

```typescript
async function executePersonaTask(
  taskDef: TaskDefinition,
  personaExecutor: PersonaExecutor
): Promise<TaskOutput> {
  const tracker = new ProgressTracker(taskDef.id)
  const startTime = Date.now()
  
  try {
    // Initialize task environment
    await initializeTask(taskDef)
    await tracker.logProgress('Task initialized', 5)
    
    // Execute persona-specific logic
    await tracker.logProgress('Starting persona execution', 10)
    const personaResult = await personaExecutor.execute(taskDef)
    
    // Ensure git commit
    await tracker.logProgress('Committing changes', 80)
    const commitResult = await gitCommit(personaResult)
    
    // Generate structured output
    await tracker.logProgress('Generating output', 90)
    const output = await generateStructuredOutput({
      taskDef,
      personaResult,
      commitResult,
      duration: Date.now() - startTime
    })
    
    // Write final output
    await writeFile(
      `.work/tasks/${taskDef.id}/OUTPUT.json`,
      JSON.stringify(output, null, 2)
    )
    
    // Update status to complete
    await tracker.logMilestone('COMPLETE')
    
    return output
    
  } catch (error) {
    await tracker.logProgress(`ERROR: ${error.message}`, -1)
    
    return {
      task_id: taskDef.id,
      status: 'failed',
      error: error.message,
      // ... minimal output structure
    }
  }
}
```

## Task Communication Protocol

### Status Broadcasting
Tasks should broadcast their status for orchestrator monitoring:

```typescript
class TaskBroadcaster {
  async broadcast(update: StatusUpdate): Promise<void> {
    // Write to shared status file
    const sharedStatus = `.work/sessions/${sessionId}/task-status.json`
    const current = await readJSON(sharedStatus)
    
    current[update.task_id] = {
      status: update.status,
      progress: update.progress,
      last_update: new Date().toISOString(),
      eta: update.estimated_completion
    }
    
    await writeJSON(sharedStatus, current)
  }
}
```

### Inter-task Communication
For tasks that need to share data:

```typescript
class TaskDataExchange {
  async publish(taskId: string, dataKey: string, data: any): Promise<void> {
    const exchangePath = `.work/sessions/${sessionId}/exchange/${taskId}/`
    await ensureDirectory(exchangePath)
    await writeJSON(`${exchangePath}/${dataKey}.json`, data)
  }
  
  async consume(fromTaskId: string, dataKey: string): Promise<any> {
    const dataPath = `.work/sessions/${sessionId}/exchange/${fromTaskId}/${dataKey}.json`
    return await readJSON(dataPath)
  }
}
```

## Implementation Strategy

### Option 1: Modify Task Tool Calls (Recommended)
Modify how the orchestrator calls the Task tool:

```typescript
// Instead of just passing the task description
const result = await Task({
  description: "Implement authentication",
  prompt: `
${TASK_EXECUTION_PROTOCOL}

# TASK: ${taskId} - Implement authentication
**Persona**: @software-engineer
...rest of task definition...

Remember to:
1. Create progress updates in .work/tasks/${taskId}/STATUS.md
2. Document evidence in .work/tasks/${taskId}/EVIDENCE.md
3. Return structured JSON output
4. Commit all changes with reference to task ID
  `
})

// Parse the structured output
const taskOutput = JSON.parse(result.structured_output || result)
```

### Option 2: Create a Task Wrapper Tool
Create a new tool that wraps the Task tool with this protocol:

```typescript
async function StructuredTask(params: {
  persona: string
  description: string
  requirements: string[]
  dependencies?: string[]
}): Promise<TaskOutput> {
  const taskId = generateTaskId()
  const taskPrompt = generateTaskPrompt(params, taskId)
  
  // Call underlying Task tool
  const rawResult = await Task({
    description: params.description,
    prompt: taskPrompt
  })
  
  // Parse and validate output
  return parseTaskOutput(rawResult, taskId)
}
```

### Option 3: Embed in Orchestrator Logic
Build this into the orchestrator persona itself:

```typescript
// In orchestrator.md
class TaskManager {
  async delegateTask(definition: TaskDef): Promise<TaskOutput> {
    // Prepend protocol to every task
    const protocolPrompt = loadTaskProtocol()
    const fullPrompt = `${protocolPrompt}\n\n${definition.prompt}`
    
    // Execute with monitoring
    const result = await executeWithMonitoring(fullPrompt)
    
    // Validate output structure
    return validateTaskOutput(result)
  }
}
```

## Benefits of This Approach

1. **Consistent Structure** - Every task returns parseable data
2. **Progress Visibility** - Real-time updates in .work/
3. **Evidence Trail** - Complete documentation for validation
4. **Error Recovery** - Clear failure states and blockers
5. **Dependency Management** - Tasks can communicate needs
6. **Orchestrator Intelligence** - Can make decisions based on structured data

## Example Task Execution

```bash
# Task creates this structure:
.work/tasks/TASK-001-auth-implementation/
├── STATUS.md          # Real-time progress
├── EVIDENCE.md        # Proof of completion
├── OUTPUT.json        # Structured return data
├── artifacts/
│   ├── screenshots/
│   └── test-results/
└── commit-info.json   # Git commit details
```

## Next Steps

1. Choose implementation strategy (I recommend Option 1)
2. Update orchestrator to use new protocol
3. Create helper scripts for common patterns
4. Test with a simple task flow
5. Refine based on real usage

Would you like me to:
1. Create example implementations for each option?
2. Write helper utilities for task management?
3. Create a test scenario to validate this approach?
4. Modify the orchestrator persona to enforce this protocol?

