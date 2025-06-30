# Error Recovery Patterns

## Build Failures

### Symptom: npm run build fails
```bash
# Common fixes in order:
1. rm -rf node_modules package-lock.json && npm install
2. npm audit fix
3. npx tsc --noEmit  # Check TypeScript errors
4. npm run lint      # Check linting errors
```

### Symptom: Module not found
```bash
# Check if dependency is installed
npm list [module-name]

# If missing:
npm install [module-name]

# If type definitions missing:
npm install -D @types/[module-name]
```

## Test Failures

### Symptom: Tests timeout
```javascript
// Increase timeout in test file
jest.setTimeout(30000); // 30 seconds

// Or in specific test
test('slow test', async () => {
  // test code
}, 30000);
```

### Symptom: Cannot find module in tests
```javascript
// Check jest.config.js moduleNameMapper
moduleNameMapper: {
  '^@/(.*)$': '<rootDir>/src/$1'
}
```

## Server Start Failures

### Symptom: Port already in use
```bash
# Find and kill process
lsof -ti:3000 | xargs kill -9

# Or use different port
PORT=3001 npm start
```

### Symptom: Database connection failed
```bash
# Check database is running
docker ps | grep postgres

# Start if needed
docker-compose up -d db

# Check connection string
echo $DATABASE_URL
```

## E2E Test Failures

### Symptom: Playwright can't find server
```javascript
// Ensure server is running before tests
// In package.json:
"test:e2e": "start-server-and-test start http://localhost:3000 playwright"
```

### Symptom: Element not found
```javascript
// Add proper wait
await page.waitForSelector('[data-testid="my-element"]', {
  timeout: 10000
});
```

## Integration Issues

### Symptom: CORS errors
```javascript
// Add to server
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:3000',
  credentials: true
}));
```

### Symptom: Authentication failures
```bash
# Check environment variables
env | grep -E "(JWT|SECRET|AUTH)"

# Ensure .env is loaded
npm install dotenv
# Add to app: require('dotenv').config()
```

## Recovery Decision Tree

```
Build fails?
├─ YES → Fix dependencies → Retry
├─ NO → Tests fail?
   ├─ YES → Fix tests → Retry
   ├─ NO → Server fails?
      ├─ YES → Fix config → Retry
      ├─ NO → E2E fails?
         ├─ YES → Fix UI/timing → Retry
         └─ NO → SUCCESS
```

## When to Create New Phase

Create fix phase when:
- Same error after 2 fix attempts
- Multiple related errors discovered
- Structural changes needed
- Missing dependencies/tools

## When to Request Human Help

Only escalate when:
- Missing credentials (API keys, passwords)
- External service down
- Hardware/OS specific issue
- Legal/compliance blocker

## Remember
- Document each fix attempt
- Commit working state before major changes
- Test each fix in isolation
- Keep server running during validation