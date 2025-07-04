# Discovery Step Example

## User Request
"Build me a social media app for my company"

## Orchestrator Response
```
Loading parallel orchestration workflow...

I notice you want to build a social media app. To ensure we build exactly what you need for the entire project, I'll gather some clarifying questions from our specialized team members.

🚨 Note: This is a ONE-TIME discovery that will guide ALL sprints and milestones.

Initiating Discovery Step with 6 parallel personas (0-3 questions each)...
```

## Parallel Discovery Tasks

### Task 1: @product-manager
**Output:**
```markdown
### Core Business Questions (Max 3)
1. **Internal vs External**: Is this for internal company use (like Slack) or customer-facing (like LinkedIn)?
2. **MVP Features**: What are the 3-5 must-have features for launch?
3. **User Scale**: Roughly how many users do you expect (100s, 1000s, 10000s)?
```

### Task 2: @architect
**Output:**
```markdown
### Technical Architecture (Max 3)
1. **Real-time Needs**: Do you need instant messaging or real-time notifications?
2. **Integration**: Any existing systems to integrate with (SSO, HR systems)?
3. **Mobile Support**: Native mobile apps, responsive web, or both?
```

### Task 3: @ux-designer
**Output:**
```markdown
### Design Priorities (Max 3)
1. **Design Reference**: Any social platforms you like the look/feel of?
2. **Key Workflows**: What's the most important user action (posting, messaging, networking)?
3. **Brand Identity**: Do you have existing brand guidelines to follow?
```

### Task 4: @devops
**Output:**
```markdown
### Deployment (Max 3)
1. **Cloud Preference**: Any preferred cloud provider (AWS, Azure, GCP)?
2. **Compliance**: Any regulatory requirements (SOC2, GDPR)?
```
*Note: Only 2 questions needed - budget can be inferred*

### Task 5: @security-engineer
**Output:**
```markdown
### Security Requirements (Max 3)
1. **Authentication**: Company SSO, social logins, or email/password?
2. **Data Sensitivity**: Will users share sensitive/confidential information?
3. **Privacy**: Public profiles or private by default?
```

### Task 6: @orchestrator
**Output:**
```markdown
### Project Coordination (Max 3)
1. **Timeline**: Do you have a target completion date for the entire project?
2. **Delivery Approach**: Would you prefer iterative releases (MVP then enhancements) or comprehensive first release?
```
*Note: Only 2 questions needed - success metrics covered by PM*

## Orchestrator Consolidation

```markdown
## Project Discovery Questions (ONE-TIME for Entire Project)

I've gathered clarifying questions from our team to ensure we build exactly what you need across ALL milestones. This is our only discovery phase - your answers will guide the entire project.

### 🎯 Product & Purpose
1. Is this for internal company communication or customer-facing?
2. What are the 3-5 must-have features for your MVP?
3. Roughly how many users do you expect?

### 🔧 Technical Preferences  
4. Do you need real-time features (instant messaging, notifications)?
5. Any existing systems to integrate with (SSO, databases, APIs)?
6. Native mobile apps, responsive web, or both?

### 🎨 Design & Experience
7. Any social platforms you'd like us to reference for UX?
8. What's the primary user action (posting, messaging, networking)?
9. Do you have brand guidelines to follow?

### 🚀 Deployment & Operations
10. Preferred cloud provider (AWS, Azure, GCP)?
11. Any compliance requirements (GDPR, SOC2)?
12. Timeline for complete project delivery?

### 🔒 Security
13. How will users log in (SSO, social logins, email/password)?
14. Will users share sensitive/confidential information?

**Total: 14 questions** (from 6 personas contributing 0-3 each)

**Note**: Your answers will guide ALL sprints. We'll document assumptions for anything unspecified.
```

## User Response
```
Great questions! Here's what I can tell you:

1. Internal company communication - like our own private Facebook
2. Our teams are distributed and email chains are getting out of control
3. Must-haves: News feed, team groups, direct messaging, file sharing, employee profiles
4. About 500 employees currently, growing to maybe 1000

5. Yes, real-time notifications are important
6. Web is priority but mobile-friendly responsive design
7. Needs to integrate with our Azure AD for single sign-on

8. Yes, I'll share our brand guide
9. Primary action is sharing updates/news within teams
10. We like how Workplace from Meta looks but simpler

11. We use Azure for everything
12. Azure AD SSO required
13. Yes, some teams share confidential product info

14. Text posts, images, documents (PDF, Word, Excel)
15. No specific compliance but good security practices

Timeline: Hoping for MVP in 2-3 months if possible
```

## Discovery Summary (Stored in .work/discovery/)

```markdown
# Discovery Summary - Internal Social Platform

## Confirmed Requirements
- **Type**: Internal company social network (500-1000 users)
- **Core Problem**: Distributed teams, email overload
- **Must-Have Features**: News feed, team groups, DMs, file sharing, profiles
- **Tech Stack**: Azure ecosystem preferred
- **Auth**: Azure AD SSO (mandatory)
- **Platform**: Web-first, responsive design
- **Real-time**: Yes - notifications required
- **Timeline**: 2-3 month MVP target

## Documented Assumptions
- **Database**: Azure SQL for relational data
- **File Storage**: Azure Blob Storage for documents/images
- **Search**: Basic search (not Elasticsearch level)
- **Video**: Not required for MVP (images/documents only)
- **Mobile Apps**: Not required for MVP (responsive web only)
- **Analytics**: Basic usage metrics only

## Architecture Implications
1. Microservices on Azure App Service
2. SignalR for real-time notifications
3. Azure CDN for static assets
4. Multi-tenant groups architecture
5. Role-based permissions per group

## Security Decisions
- All data encrypted at rest and in transit
- File scanning for malware before storage
- Content moderation for inappropriate posts
- Audit logs for all actions
- Private by default, no public profiles

## Next Steps
With this context, the Product Manager will now create detailed user stories and the team will design an architecture optimized for your Azure environment.
```

## Benefits Demonstrated

1. **Parallel Efficiency**: All questions gathered in ~5 minutes vs sequential 30+ minutes
2. **Limited Questions**: Max 3 per persona keeps it focused (14 questions total vs potential 50+)
3. **One-Time Process**: Never repeated - applies to ALL sprints and milestones
4. **Domain Expertise**: Each persona contributes their most critical questions
5. **Clear Context**: Discovery data referenced throughout entire autonomous session
6. **Audit Trail**: Complete record guides all development decisions

This discovery transforms "build me a social media app" into a clear project with defined scope, technical constraints, and success criteria.
