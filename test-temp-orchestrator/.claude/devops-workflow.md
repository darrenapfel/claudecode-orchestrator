# DevOps Workflow for Orchestrated Projects

## Overview

This workflow enables indie developers to easily test and deploy their applications without deep DevOps knowledge. It provides three environments: local (development), preview (for human validation), and production.

## Initial Environment Setup (First Sprint Only)

### 1. Environment Definition

When starting a new project, the orchestrator asks:

```
"I'll set up your deployment pipeline. Please choose your preferred platform:

1. **Vercel** (Recommended for Next.js, React, static sites)
   - Free tier available
   - Automatic preview deployments
   - One-click setup
   
2. **Railway** (Full-stack apps with databases)
   - Simple GitHub integration
   - Databases included
   - Good free tier
   
3. **Render** (Traditional web apps)
   - Supports Docker
   - Good for APIs
   - Free PostgreSQL

4. **GitHub Pages** (Static sites only)
   - Completely free
   - Simple setup
   - Limited to static content

Which platform would you like to use? (1-4)"
```

### 2. Automatic Configuration

Based on the choice, orchestrator creates:

```
.claude/environments/
├── config.json
├── local.md
├── preview.md
└── production.md
```

#### Example `config.json` for Vercel:
```json
{
  "platform": "vercel",
  "project_type": "nextjs",
  "environments": {
    "local": {
      "url": "http://localhost:3000",
      "start_command": "npm run dev",
      "test_command": "npm test"
    },
    "preview": {
      "url_pattern": "https://{branch}-{project}.vercel.app",
      "auto_deploy": true,
      "deploy_command": "vercel --prod=false"
    },
    "production": {
      "url": "https://{project}.vercel.app",
      "deploy_command": "vercel --prod",
      "requires_approval": true
    }
  }
}
```

## Human Validation Process

### 1. After Each Orchestrator Sprint

When orchestrator completes tasks:

```
"✅ Sprint Complete\! All tasks finished successfully.

## Ready for Human Validation

I've deployed a preview of your changes:
🔗 Preview URL: https://sprint-20240129-user-auth-myapp.vercel.app

To test the new features:
1. Click the preview link above
2. Test: User registration at /register
3. Test: User login at /login
4. Test: Protected route at /dashboard

Automated tests: ✅ All passing (18/18)
Security scan: ✅ No vulnerabilities

Would you like to:
1. ✅ Approve and deploy to production
2. 🔄 Request changes
3. 💬 Discuss issues"
```

### 2. Local Testing Fallback

If preview deployment fails:

```
"Preview deployment pending. Test locally:

1. Open terminal and run:
   cd /path/to/project
   npm install
   npm run dev

2. Open http://localhost:3000

3. Test these features:
   - User registration
   - User login
   - Dashboard access

Once verified, I can help deploy to production."
```

## Deployment Automation

### Platform-Specific Setup

#### Vercel Setup (Handled by Orchestrator)
```bash
# First time only
npm i -g vercel
vercel login
vercel link

# Per deployment
vercel --prod=false  # Preview
vercel --prod        # Production
```

#### Railway Setup
```bash
# First time only
npm i -g @railway/cli
railway login
railway link

# Per deployment
railway up          # Deploys to current environment
```

### The `.claude/personas/devops.md` Enhancement

Add deployment capabilities:

```markdown
## Deployment Responsibilities

### 1. Environment Management
- Configure deployment platforms
- Manage environment variables
- Set up CI/CD pipelines

### 2. Preview Deployments
After each sprint:
- Deploy to preview environment
- Generate shareable URLs
- Provide testing instructions

### 3. Production Deployments
When approved:
- Run production builds
- Execute deployment commands
- Verify deployment success
- Rollback if needed

### 4. Monitoring Setup
- Error tracking (Sentry free tier)
- Analytics (Vercel Analytics)
- Uptime monitoring (UptimeRobot)
```

## Simplified Deployment Flow

### 1. Initial Setup (Once per project)
```mermaid
graph LR
    A[Choose Platform] --> B[Connect GitHub]
    B --> C[Configure Environments]
    C --> D[Set Environment Vars]
    D --> E[Ready to Deploy]
```

### 2. Per-Sprint Flow
```mermaid
graph LR
    A[Orchestrator Completes] --> B[Deploy Preview]
    B --> C[Generate Test URL]
    C --> D[Human Tests]
    D --> E{Approved?}
    E -->|Yes| F[Deploy Production]
    E -->|No| G[Document Issues]
```

### 3. Environment Variables Management

`.env.example`:
```bash
# Created by orchestrator
DATABASE_URL=postgresql://localhost:5432/myapp
JWT_SECRET=generate-me
STRIPE_KEY=your-key-here
```

Instructions provided:
```
"For deployment, set these environment variables:

1. In Vercel Dashboard:
   - Go to Settings > Environment Variables
   - Add each variable from .env.example
   - Use different values for preview/production

2. Secrets are stored securely on platform
3. Never commit real values to git"
```

## Platform Recommendations by Project Type

### Static Sites / SPAs
- **Vercel**: Best DX, great free tier
- **Netlify**: Similar to Vercel
- **GitHub Pages**: Totally free, basic

### Full-Stack Apps
- **Railway**: Easiest for beginners
- **Render**: Good free PostgreSQL
- **Fly.io**: More control, steeper learning

### APIs Only
- **Railway**: Simple deployment
- **Render**: Good for background jobs
- **Vercel**: Serverless functions

### With Databases
- **Railway**: Integrated PostgreSQL/MySQL
- **Render**: Free PostgreSQL
- **Supabase**: Full BaaS solution

## Common Issues & Solutions

### 1. Build Failures
```
"Build failed on deployment. Common fixes:

1. Check package.json scripts:
   - 'build' script must exist
   - Try locally: npm run build

2. Environment variables:
   - All required vars set?
   - Check .env.example

3. Node version:
   - Specify in package.json:
   'engines': { 'node': '18.x' }"
```

### 2. Database Connections
```
"Database connection failed. Checking:

1. DATABASE_URL format:
   postgresql://user:pass@host:5432/db

2. SSL requirements:
   Add ?sslmode=require to URL

3. Connection pooling:
   Set pool size for serverless"
```

## Final Integration

Update orchestrator's completion message:

```markdown
## Sprint Complete ✅

All tasks finished successfully:
- ✨ Feature: User authentication
- 🧪 Tests: 18/18 passing  
- 🔒 Security: No vulnerabilities
- 📦 Commits: 3 commits pushed

## 🚀 Preview Deployment

Your changes are live at:
https://sprint-auth-myapp.vercel.app

**Test Checklist:**
- [ ] Register new user
- [ ] Login with credentials
- [ ] Access protected route
- [ ] Logout functionality

## Next Steps

1. ✅ **Approve** → Deploy to production
2. 🔄 **Changes Needed** → Create fix tasks
3. 💬 **Discuss** → Talk through issues

What would you like to do?
```

This gives users a complete path from code to production without needing DevOps expertise\!

