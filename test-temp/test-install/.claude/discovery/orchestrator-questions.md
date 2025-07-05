# Orchestrator Discovery Questions

## Core Questions Template

When given a high-level request, the orchestrator may ask UP TO 3 clarifying questions about project coordination and delivery:

### 1. Project Scope & Milestones
- Are there specific phases or milestones you'd like us to deliver in sequence?
- Is there a hard deadline or preferred timeline for the complete project?
- Should we optimize for quick MVP or comprehensive initial release?

### 2. Communication & Updates
- How would you like to receive progress updates during development?
- Are there specific checkpoints where you'd like to review and provide feedback?
- Any stakeholders who should be considered in design decisions?

### 3. Success Criteria
- How will you measure if this project is successful?
- Are there specific metrics or KPIs we should optimize for?
- What would make this a "home run" from your perspective?

## Example Output Format
```markdown
## Orchestrator Questions

1. **Delivery Approach**: Would you prefer iterative releases (MVP then enhancements) or a comprehensive first release?

2. **Timeline**: Do you have a target completion date for the entire project?

3. **Success Metrics**: What's the single most important outcome that would make this project successful for you?
```

## Guidelines
- Only ask if the user hasn't specified delivery preferences
- Focus on coordination and overall project success
- Keep questions high-level and strategic
- 0 questions is fine if the request is clear
