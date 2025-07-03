# Deployment Setup Guide for Orchestrator

## First Sprint Setup Script

When starting a new project, orchestrator should:

### 1. Project Type Detection

```typescript
// Orchestrator analyzes request
const projectType = detectProjectType(userRequest)
// Returns: 'nextjs' | 'react' | 'node-api' | 'static' | 'fullstack'

const deployment = recommendDeployment(projectType)
// Returns: { platform: 'vercel', reason: 'Best for Next.js apps' }
```

### 2. Setup Dialogue

```markdown
"I'll help you deploy this project for easy testing and sharing.

Based on your Next.js application, I recommend **Vercel** because:
- ✅ Automatic preview URLs for each branch
- ✅ Zero-config Next.js support  
- ✅ Free tier perfect for indie developers
- ✅ 1-click rollbacks

To set this up, I'll need you to:
1. Create a free Vercel account at vercel.com
2. Install Vercel CLI: `npm i -g vercel`
3. Run `vercel login` in your terminal

Ready to proceed? (I'll guide you through each step)"
```

### 3. Configuration Files Creation

#### `.claude/deployment/vercel.json`
```json
{
  "framework": "nextjs",
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "regions": ["iad1"],
  "github": {
    "enabled": true,
    "autoAlias": true
  }
}
```

#### `.github/workflows/preview.yml`
```yaml
name: Preview Deployment
on:
  push:
    branches-ignore:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: amondnet/vercel-action@v25
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-args: '--prod=false'
          alias-domains: |
            {{BRANCH}}-myapp.vercel.app
```

### 4. Environment Variables Template

```bash
# .env.local (for development)
DATABASE_URL=postgresql://localhost:5432/dev
NEXTAUTH_SECRET=dev-secret-change-in-prod
NEXTAUTH_URL=http://localhost:3000

# .env.production (template)
DATABASE_URL=# Set in Vercel Dashboard
NEXTAUTH_SECRET=# Generate with: openssl rand -base64 32
NEXTAUTH_URL=https://myapp.vercel.app
```

## Per-Platform Quick Setup

### Vercel (Recommended for most projects)

```bash
# One-time setup
npm i -g vercel
vercel login
vercel link
vercel env pull  # Gets env vars

# Per deployment
vercel          # Preview deploy
vercel --prod   # Production deploy
```

### Railway (Full-stack with databases)

```bash
# One-time setup  
npm i -g @railway/cli
railway login
railway link

# Database included\!
railway add postgresql
railway variables  # Manage env vars

# Deploy
railway up
```

### Render (Traditional apps)

```bash
# Create render.yaml
services:
  - type: web
    name: myapp
    env: node
    buildCommand: npm install && npm run build
    startCommand: npm start
    envVars:
      - key: DATABASE_URL
        fromDatabase:
          name: myapp-db
          property: connectionString

databases:
  - name: myapp-db
    plan: free
```

## Orchestrator Integration Points

### 1. After Initial Setup

```markdown
"✅ Deployment pipeline configured\!

Your app will automatically deploy:
- **Preview**: Every push to feature branches
- **Production**: When you merge to main

I've created:
- Deployment configuration
- GitHub Actions workflow  
- Environment variable templates

Next: Let's implement your first feature\!"
```

### 2. After Each Sprint

```markdown
"Sprint complete\! Deploying preview...

⏳ Building application...
✅ Build successful (45s)
⏳ Deploying to Vercel...
✅ Deployed\!

🔗 **Preview URL**: https://sprint-auth-myapp-7xn2.vercel.app

**What's New:**
- User registration form
- Login/logout flow
- Protected dashboard

**Quick Test:**
1. Click preview URL
2. Register a test user
3. Try logging in/out

Ready to push to production?"
```

### 3. Production Deployment

```markdown
"Deploying to production...

⚠️ **Pre-flight checks:**
- [ ] All tests passing
- [ ] Security scan clean
- [ ] Performance acceptable
- [ ] Environment vars set

Proceed with production deployment? (yes/no)"
```

## Troubleshooting Playbook

### Build Failures
```markdown
"Build failed. Let me diagnose...

Found issue: Missing build script
Fix: Adding to package.json:
  'scripts': {
    'build': 'next build'
  }

Retrying deployment..."
```

### Environment Variables
```markdown
"App crashed: Missing environment variable

To fix:
1. Go to: https://vercel.com/dashboard/project/env
2. Add these variables:
   - DATABASE_URL: (your production database)
   - JWT_SECRET: (generate secure value)
3. Redeploy

I'll wait while you set these up."
```

## Success Metrics

Track deployment success:

```json
{
  "deployments": {
    "total": 42,
    "successful": 38,
    "failed": 4,
    "average_build_time": "52s",
    "common_failures": [
      "missing_env_vars",
      "build_script_error"
    ]
  }
}
```

This creates a complete DevOps workflow that's approachable for indie developers while maintaining professional deployment practices\!
