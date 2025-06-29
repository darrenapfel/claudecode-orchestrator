# Existing Project Onboarding & Migration Guide

## Overview

When the Claude.md orchestration system is added to an existing project, we need to:
1. Detect existing infrastructure and deployment setup
2. Understand current workflows
3. Offer migration path to recommended practices
4. Preserve what's working while enhancing what could be better

## Detection Phase

### Orchestrator's Initial Project Analysis

When first loaded in a project, orchestrator checks:

```typescript
interface ProjectAnalysis {
  isExistingProject: boolean  // Has commits, existing code
  hasDeployment: boolean      // Has deployment config
  deploymentType: string      // Vercel, Netlify, custom, none
  hasCICD: boolean           // GitHub Actions, CircleCI, etc.
  hasDatabase: boolean       // PostgreSQL, MySQL, MongoDB
  hasTests: boolean          // Jest, Mocha, pytest
  framework: string          // Next.js, Express, Django
  packageManager: string     // npm, yarn, pnpm
  gitHistory: number         // Number of commits
}
```

### Detection Script

```bash
# Check for existing project indicators
function analyzeExistingProject() {
  # Git history
  COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null || echo "0")
  
  # Deployment configs
  HAS_VERCEL=$([ -f "vercel.json" ] && echo "true" || echo "false")
  HAS_NETLIFY=$([ -f "netlify.toml" ] && echo "true" || echo "false")
  HAS_DOCKERFILE=$([ -f "Dockerfile" ] && echo "true" || echo "false")
  
  # CI/CD
  HAS_GH_ACTIONS=$([ -d ".github/workflows" ] && echo "true" || echo "false")
  HAS_CIRCLECI=$([ -f ".circleci/config.yml" ] && echo "true" || echo "false")
  
  # Database
  HAS_PRISMA=$([ -f "prisma/schema.prisma" ] && echo "true" || echo "false")
  HAS_MIGRATIONS=$([ -d "migrations" ] && echo "true" || echo "false")
  
  # Framework detection
  if [ -f "next.config.js" ]; then FRAMEWORK="nextjs"
  elif [ -f "package.json" ] && grep -q "express" package.json; then FRAMEWORK="express"
  elif [ -f "manage.py" ]; then FRAMEWORK="django"
  else FRAMEWORK="unknown"
  fi
}
```

## Onboarding Conversation Flow

### 1. Initial Detection & Introduction

```markdown
"I've detected this is an existing [Next.js] project with [247] commits.

I found:
✅ Git repository with history
✅ Vercel deployment configuration
✅ GitHub Actions CI/CD
✅ PostgreSQL database (Prisma)
✅ Jest test suite

I can help optimize your development workflow with:
- Parallel task orchestration
- Automated preview deployments
- Enhanced error recovery
- Structured evidence tracking

Would you like me to:
1. 🔍 Analyze your current setup in detail
2. 🚀 Set up orchestration while preserving your config
3. 📋 Show me what this system offers
4. ⏭️ Skip setup for now"
```

### 2. Detailed Analysis (If Requested)

```markdown
"Let me analyze your project setup...

## Current Architecture

### Deployment Pipeline
- **Platform**: Vercel (detected vercel.json)
- **Production URL**: https://myapp.vercel.app
- **Preview deploys**: Enabled for PRs
- **Build command**: `npm run build`

### CI/CD Workflow
- **GitHub Actions**: 3 workflows detected
  - `test.yml`: Runs on all PRs
  - `deploy.yml`: Deploys to production
  - `cron.yml`: Daily scheduled tasks

### Database Setup
- **ORM**: Prisma 5.0
- **Database**: PostgreSQL (connection string in .env)
- **Migrations**: 12 migrations found

### Testing Infrastructure
- **Framework**: Jest + React Testing Library
- **Coverage**: 73% (from last run)
- **E2E Tests**: None detected

## Optimization Opportunities

1. **Parallel Testing**: Your tests could run 3x faster
2. **Preview Deployments**: Could auto-deploy all branches
3. **Security Scanning**: No automated security checks
4. **Database Backups**: No automated backup strategy

Would you like me to create an enhancement plan?"
```

### 3. Migration Options

```markdown
"Based on your setup, I recommend:

## 🟢 Keep As-Is
- Vercel deployment (already optimized)
- GitHub repository structure
- Prisma database setup
- Existing environment variables

## 🔄 Enhance
- **Parallel Testing**: Split tests across 3 workers
- **Preview URLs**: Auto-deploy feature branches
- **Security**: Add automated vulnerability scanning
- **Monitoring**: Add error tracking (Sentry free)

## 🔧 Migrate
- **Task Orchestration**: Use parallel development streams
- **Evidence Tracking**: Document all changes
- **Error Recovery**: Automated retry mechanisms

## Implementation Plan

1. **Phase 1** (Today): Set up orchestration without changing existing setup
2. **Phase 2** (Next Session): Enhance CI/CD pipeline
3. **Phase 3** (Optional): Add monitoring and security

Shall I proceed with Phase 1?"
```

### 4. Safe Migration Process

```markdown
"I'll set up orchestration while preserving your existing workflow:

## Step 1: Create Configuration
Creating `.claude/deployment/config.json`:
```json
{
  "platform": "vercel",
  "existing_setup": true,
  "preserve": {
    "vercel_json": true,
    "github_actions": true,
    "env_vars": true
  },
  "enhancements": {
    "parallel_testing": "pending",
    "preview_all_branches": "pending",
    "security_scanning": "pending"
  }
}
```

## Step 2: Document Current State
Creating `.claude/existing-setup-snapshot.md` with your current configuration...

## Step 3: Test Compatibility
Running compatibility check...
✅ Orchestration compatible with existing setup
✅ No conflicts detected
✅ Deployment pipeline preserved

## Step 4: First Orchestrated Task
Ready to try the orchestration system?

Example: "Add user profile feature"
- I'll coordinate 3 parallel streams
- Auto-deploy preview when done
- No changes to your existing setup

Would you like to start with a small task to see how it works?"
```

## Migration Patterns

### Pattern 1: Gradual Enhancement

For projects wanting minimal disruption:

```markdown
Week 1: Use orchestration for new features only
Week 2: Add preview deployments for branches
Week 3: Enhance CI/CD with parallel testing
Week 4: Add monitoring and security
```

### Pattern 2: Full Migration

For projects ready for complete transformation:

```markdown
Day 1: Set up complete orchestration system
- Migrate all workflows to parallel execution
- Set up comprehensive deployment pipeline
- Add all security and monitoring

Day 2-7: Team training and adjustment
```

### Pattern 3: Hybrid Approach

Keep critical paths, enhance everything else:

```markdown
Keep:
- Production deployment workflow (if complex)
- Custom CI/CD scripts
- Existing monitoring

Enhance:
- Development workflow with orchestration
- Preview deployments
- Test parallelization
```

## Special Considerations

### 1. Monorepo Detection

```typescript
if (hasMultiplePackageJsons() || hasLernaConfig()) {
  "I see you have a monorepo setup. Our orchestration can:
  - Coordinate changes across packages
  - Deploy only affected services
  - Run package-specific tests in parallel
  
  Want monorepo-optimized orchestration?"
}
```

### 2. Custom Scripts

```typescript
if (hasComplexNpmScripts()) {
  "You have custom build/deploy scripts. I'll:
  - Preserve all existing scripts
  - Wrap them in our orchestration
  - Add parallel execution where safe
  
  Your scripts remain the source of truth."
}
```

### 3. Environment Variables

```markdown
"I found environment variables in:
- `.env.example` (12 variables)
- Vercel dashboard (detected from deployment)

Our system will:
- Use your existing .env structure
- Help manage staging vs production
- Never expose secrets in logs

No changes needed to your current setup."
```

## DevOps Checklist for Existing Projects

The orchestrator presents this interactively:

```markdown
## 📋 DevOps Migration Checklist

Let's review your setup:

### 1. Deployment Platform
- [ ] Current: Vercel
- [ ] Recommendation: Keep Vercel ✅
- [ ] Action: None needed

### 2. Preview Deployments  
- [ ] Current: PR previews only
- [ ] Recommendation: All branches
- [ ] Action: Update vercel.json?

### 3. Environment Management
- [ ] Current: .env + Vercel dashboard
- [ ] Recommendation: Add .env.staging
- [ ] Action: Create staging variables?

### 4. CI/CD Pipeline
- [ ] Current: GitHub Actions (sequential)
- [ ] Recommendation: Parallelize tests
- [ ] Action: Optimize workflows?

### 5. Monitoring
- [ ] Current: None detected
- [ ] Recommendation: Sentry (free tier)
- [ ] Action: Add error tracking?

### 6. Security
- [ ] Current: Dependabot only
- [ ] Recommendation: Add security scanning
- [ ] Action: Add to CI pipeline?

Which items would you like to address? (Enter numbers or 'none')
```

## Success Metrics

Track migration success:

```json
{
  "migration_metrics": {
    "setup_time": "12 minutes",
    "workflows_preserved": 3,
    "workflows_enhanced": 2,
    "breaking_changes": 0,
    "developer_satisfaction": "high",
    "deployment_time_improvement": "45%",
    "test_time_improvement": "67%"
  }
}
```

This ensures smooth onboarding for existing projects while preserving what works and enhancing what could be better\!
