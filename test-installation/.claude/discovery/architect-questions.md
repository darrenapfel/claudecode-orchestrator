# Architect Discovery Questions

## Core Questions Template

When given a high-level request, ask UP TO 3 clarifying questions (0-3 questions is acceptable):

### 1. Scale & Performance Requirements
- What's the expected user load (concurrent users, requests/second)?
- Are there specific performance targets (response time, throughput)?
- What's the expected data volume and growth rate?

### 2. Technology Stack & Constraints
- Are there existing systems this needs to integrate with?
- Any required technologies or platforms we must use?
- Are there technologies we should avoid?

### 3. Integration & APIs
- What external services or APIs will this need to connect to?
- Will this expose APIs for other systems to consume?
- Are there specific data formats or protocols required?

## Example Output Format
```markdown
## Architecture Discovery Questions

*Note: Asking 0-3 questions based on what's unclear from the request*

1. **Expected Scale**: What's the anticipated user load and data volume for this system? (e.g., 1000 concurrent users, 1TB data)

2. **Technology Preferences**: Are there specific technologies or frameworks your team prefers or requires? (e.g., AWS, React, PostgreSQL)

3. **Integration Requirements**: What existing systems or APIs will this need to integrate with?
```
