# DevOps Discovery Questions

## Core Questions Template

When given a high-level request, ask UP TO 3 clarifying questions (0-3 questions is acceptable):

### 1. Deployment Environment
- Where will this be deployed (AWS, Azure, GCP, on-premise)?
- Do you prefer containers (Docker/Kubernetes) or traditional VMs?
- Are there existing infrastructure patterns to follow?

### 2. CI/CD Requirements
- What's your current CI/CD pipeline setup?
- How frequently do you want to deploy (daily, weekly, on-demand)?
- What environments do you need (dev, staging, prod)?

### 3. Operational Requirements
- What's your uptime SLA requirement?
- Do you need auto-scaling capabilities?
- What's your disaster recovery and backup strategy?

## Example Output Format
```markdown
## DevOps Discovery Questions

*Note: Asking 0-3 questions based on what's unclear from the request*

1. **Cloud Platform**: Which cloud provider will this be deployed to? (e.g., AWS, Azure, GCP, self-hosted)

2. **Deployment Frequency**: How often do you plan to deploy updates? (e.g., multiple times daily, weekly releases)

3. **Uptime Requirements**: What's your target uptime SLA? (e.g., 99.9%, 99.99%)
```
