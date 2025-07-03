# Infrastructure Setup Pattern

## Overview
This pattern ensures proper development environment setup BEFORE any package installation to avoid common git and dependency issues. This is ALWAYS the first implementation task in Sprint 1.

## Assigned To
**@software-engineer-1** - The first software engineer assigned to the project

## Critical Order of Operations

### ⚠️ STEP 1: Version Control Setup (MUST BE FIRST!)

**Why First**: Installing packages before .gitignore creates thousands of tracked files in git, causing performance issues and API rate limit errors.

```bash
# 1. Create comprehensive .gitignore
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
bower_components/
vendor/
venv/
env/
__pycache__/
*.pyc

# Build outputs
dist/
build/
out/
.next/
.nuxt/
.output/
.cache/
coverage/
*.log

# Environment files
.env
.env.local
.env.*.local
*.pem

# IDE/Editor files
.vscode/
.idea/
*.swp
*.swo
.DS_Store

# Framework specific
.angular/
.svelte-kit/
.vercel/
.netlify/
EOF

# 2. Commit .gitignore IMMEDIATELY
git add .gitignore
git commit -m "chore: add comprehensive .gitignore before package installation"
```

### STEP 2: Project Initialization

**Only after .gitignore is committed:**

```bash
# Initialize package manager
npm init -y  # or yarn init -y, pnpm init

# Update package.json with project info
npm pkg set name="project-name"
npm pkg set version="0.1.0"
npm pkg set description="Project description"
```

### STEP 3: Core Runtime & Development Tools

```bash
# Install development dependencies first
npm install -D typescript @types/node eslint prettier

# Install core framework (as specified in ARCHITECTURE.md)
npm install react react-dom  # or vue, angular, etc.

# Install build tools
npm install -D vite @vitejs/plugin-react  # or webpack, etc.
```

### STEP 4: Testing Infrastructure

```bash
# Install test frameworks from ARCHITECTURE.md
npm install -D playwright @playwright/test
npm install -D vitest @testing-library/react
npm install -D msw @types/testing-library__react

# Create test directories
mkdir -p tests/{e2e,unit,integration,fixtures}
```

### STEP 5: Script Configuration

Update package.json scripts:
```json
{
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "test": "vitest",
    "test:e2e": "playwright test",
    "test:coverage": "vitest --coverage",
    "lint": "eslint src --ext ts,tsx",
    "format": "prettier --write src"
  }
}
```

### STEP 6: Verification

```bash
# Verify git status is clean
git status  # Should show only expected untracked files

# Create minimal E2E test
cat > tests/e2e/smoke.spec.ts << 'EOF'
import { test, expect } from '@playwright/test';

test('application starts', async ({ page }) => {
  await page.goto('http://localhost:3000');
  await expect(page).toHaveTitle(/App/);
});
EOF

# Run test to verify setup
npm run test:e2e
```

## Evidence Requirements

The assigned engineer must provide:

1. **Git Status Output**: Showing clean working directory after package installation
2. **Package.json**: Showing all installed dependencies and configured scripts
3. **Test Execution**: Screenshot/output of passing E2E test
4. **Directory Structure**: Output of `tree -L 2` or similar showing project structure

## Common Pitfalls to Avoid

### ❌ DON'T
- Install any packages before creating .gitignore
- Use `npm install` without understanding what's being installed
- Skip the E2E test verification
- Proceed to feature work before environment is fully set up

### ✅ DO
- Create and commit .gitignore as the VERY FIRST step
- Install only packages specified in ARCHITECTURE.md
- Verify each step before proceeding to the next
- Document any deviations in EVIDENCE.md

## Framework-Specific Considerations

### React/Next.js
```bash
# After .gitignore
npx create-next-app@latest . --typescript --tailwind --app
```

### Vue/Nuxt
```bash
# After .gitignore
npx nuxi@latest init .
```

### Python/Django
```bash
# After .gitignore
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install django djangorestframework
pip freeze > requirements.txt
```

## Delegation Instructions for Orchestrator

When assigning this task:

```markdown
Task: Set up development environment and infrastructure
ID: sprint-001-infra-setup
Assigned: @software-engineer-1

CRITICAL: Follow infrastructure-setup.md pattern EXACTLY
1. Create .gitignore FIRST and commit before ANY installations
2. Initialize project and install packages per ARCHITECTURE.md
3. Set up complete testing infrastructure
4. Provide evidence: clean git status + passing E2E test

This blocks ALL other implementation work. No feature development until complete.
```

---
*Proper setup prevents hours of debugging. Do it right the first time.*