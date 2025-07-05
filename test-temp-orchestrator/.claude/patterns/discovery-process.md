# Discovery Process - One-Time Project Context Gathering

## Overview
The Discovery Step is a **ONE-TIME ONLY** optional first step that runs at the very beginning of an orchestration session. It gathers clarifying questions from multiple domain experts in parallel, presents them to the user, and stores the answers for reference throughout ALL sprints and milestones until the entire project is delivered.

**🚨 CRITICAL: Discovery runs ONCE per orchestration session, NOT per sprint or milestone.**

## When to Use Discovery Step

### USE Discovery When:
- User provides vague requirements ("build me a social media app")
- New greenfield projects without detailed specs
- Complex projects with multiple unknowns
- User explicitly asks for help defining requirements
- Multiple deployment/technology options exist

### SKIP Discovery When:
- Comprehensive PRD or detailed requirements exist
- Simple, well-defined tasks ("fix this bug")
- User has provided extensive context already
- Follow-up work on existing projects with context

## Discovery Execution Flow

### 1. Parallel Question Generation
```
ORCHESTRATOR: "I'll gather some clarifying questions to better understand your needs for the entire project..."

PARALLEL TASKS:
├── @product-manager - Business & user context (0-3 questions)
├── @architect - Technical requirements (0-3 questions)
├── @ux-designer - Design preferences (0-3 questions)
├── @devops - Deployment needs (0-3 questions)
├── @security-engineer - Security requirements (0-3 questions)
└── @orchestrator - Project coordination (0-3 questions)
```

**Note**: Each persona asks UP TO 3 questions. They may ask fewer or none if the request is clear in their domain.

### 2. Question Consolidation
Orchestrator receives all questions and:
1. Adds own 0-3 questions about project coordination
2. Removes duplicates
3. Groups by theme
4. Prioritizes critical questions
5. Limits to maximum 15-18 total questions (6 personas × 3 max)
6. Formats for clear presentation

### 3. User Presentation Format
```markdown
## Project Discovery Questions

I've consulted with our virtual team and we have some clarifying questions to ensure we build exactly what you need. You don't need to answer all of these - just provide what you know:

### 🎯 Product & Users
1. Who are the primary users of this product?
2. What's the main problem we're solving?
3. What would success look like for this project?

### 🔧 Technical Preferences
4. Do you have any preferred technologies or frameworks?
5. What scale do we need to support (users, data, traffic)?
6. Are there systems this needs to integrate with?

### 🎨 Design & Experience
7. Do you have brand guidelines or design preferences?
8. Are there products you'd like us to reference for UX?
9. What devices/platforms must we support?

### 🚀 Deployment & Operations
10. Where would you like this deployed (cloud provider preference)?
11. Do you need staging/preview environments?
12. Any specific monitoring or analytics needs?

### 🔒 Security & Compliance
13. What type of user authentication is needed?
14. Are there compliance requirements (GDPR, HIPAA, etc)?
15. How sensitive is the data we'll be handling?

**Note**: Just answer what you can - we'll make reasonable assumptions for anything not specified and document them.
```

### 4. Answer Storage Structure
```
.work/discovery/
├── questions/
│   ├── product-manager-questions.md
│   ├── architect-questions.md
│   ├── ux-designer-questions.md
│   ├── devops-questions.md
│   ├── security-questions.md
│   └── consolidated-questions.md
├── responses/
│   ├── user-responses.md          # Raw user answers
│   ├── parsed-responses.json      # Structured data
│   └── discovery-summary.md       # Key decisions & assumptions
└── DISCOVERY-COMPLETE.md          # Gate file with timestamp
```

## Discovery Task Instructions

### For Each Persona
```markdown
## Task: Generate Discovery Questions

Based on the user's request: "[user's original prompt]"

Generate UP TO 3 clarifying questions from your domain expertise that would help us:
1. Avoid incorrect assumptions
2. Make appropriate technology/design choices  
3. Understand critical requirements
4. Identify potential blockers early

**IMPORTANT**: 
- Maximum 3 questions total
- Only ask if truly needed - 0 questions is fine if the request is clear
- Focus on the most critical unknowns in your domain

Return questions in this format:
```
### [Category]
1. **[Topic]**: [Specific question]
2. **[Topic]**: [Specific question]
```
```

### For Orchestrator (Consolidation)
**EFFICIENT PROCESS**: Get questions directly from task results (no file I/O):

1. **Receive**: Get questions directly from each Task result
2. **Deduplicate**: Merge similar questions from all personas
3. **Prioritize**: Mark 10-12 as "critical" (must answer)
4. **Organize**: Group by theme (Product, Technical, Design, Operations, Security)
5. **Format**: Create clear, concise presentation for user
6. **Store Once**: Save only final consolidated questions to `.work/discovery/`

## Discovery Response Handling

### User Response Processing
When user provides answers:

1. **Store Raw**: Save complete response to `user-responses.md`
2. **Parse**: Extract key decisions to `parsed-responses.json`
3. **Document Assumptions**: For unanswered questions, document reasonable defaults
4. **Create Summary**: Generate `discovery-summary.md` with:
   - Answered questions → Explicit requirements
   - Unanswered questions → Documented assumptions
   - Key decisions that affect architecture
   - Identified risks or constraints

### Example Discovery Summary
```markdown
# Discovery Summary

## Confirmed Requirements
- **Users**: B2B SaaS for small businesses
- **Scale**: 1000 concurrent users initially
- **Tech Stack**: React + Node.js preferred
- **Deployment**: AWS with staging environment

## Assumptions (User didn't specify)
- **Authentication**: Standard email/password (no SSO required)
- **Browser Support**: Modern browsers only (Chrome, Firefox, Safari, Edge)
- **API**: RESTful (not GraphQL) unless specified otherwise
- **Testing**: 80% coverage target

## Key Decisions
1. Multi-tenant architecture due to B2B nature
2. PostgreSQL for relational data needs
3. Redis for caching and sessions
4. Docker-based deployment

## Risks Identified
- No compliance requirements specified - will build to general best practices
- Payment processing needs unclear - will design for future integration
```

## Integration with Workflow

### One-Time Execution Rule
**Discovery executes ONCE at the beginning of the orchestration session and applies to ALL milestones.**

Example session flow:
```
1. User: "Build me a social media app"
2. Orchestrator: Runs Discovery ONCE
3. Sprint 1: Build authentication (uses discovery data)
4. Sprint 2: Build feed system (uses SAME discovery data)
5. Sprint 3: Build messaging (uses SAME discovery data)
... continues until ALL milestones complete
```

### PROJECT-STATE.md Update
```markdown
## [Timestamp] - Discovery Complete (ONE-TIME)
- Status: Gathered requirements for ENTIRE project
- Questions Asked: 12 (10 answered, 2 assumptions made)
- Key Decisions: B2B SaaS, AWS deployment, React/Node stack
- Applies to: ALL sprints and milestones in this session
- Next: Requirements Step with PM for Sprint 1
```

### Downstream Usage
All subsequent personas reference discovery outputs throughout ALL sprints:
- PM: Uses discovery to write user stories for each sprint
- Architect: Bases all technology choices on discovery responses
- UX: Follows design preferences across all features
- DevOps: Configures deployment per discovery needs
- Security: Implements requirements consistently

**The discovery data remains the source of truth for the ENTIRE autonomous session.**

## Anti-Patterns to Avoid

❌ **DON'T**:
- Ask more than 3 questions per persona
- Ask overly technical questions to non-technical users
- Assume answers (always document assumptions explicitly)
- Skip discovery then make major assumptions
- **NEVER repeat discovery for subsequent sprints/milestones**
- Run discovery again after the session has started

✅ **DO**:
- Keep questions accessible and relevant
- Group questions logically
- Make it clear that partial answers are fine
- Document all assumptions clearly
- Reference discovery throughout the project

## Discovery Complete Gate

Before proceeding to Requirements Step:
- ✓ All personas have provided questions
- ✓ Questions consolidated and presented
- ✓ User has responded (even if partially)
- ✓ Responses stored in `.work/discovery/`
- ✓ Discovery summary created
- ✓ PROJECT-STATE.md updated

---
*Smart discovery prevents costly assumptions and rework.*
