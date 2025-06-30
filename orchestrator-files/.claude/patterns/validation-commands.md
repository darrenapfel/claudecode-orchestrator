# Validation Commands Reference

## Build Validation

### Node.js/npm Projects
```bash
# To claim 50% - Code Compiles:
npm run build || npm run compile || npm run tsc
echo "Exit code: $?"
# Must be 0 to pass
```

### Python Projects
```bash
# To claim 50% - Code Compiles:
python -m py_compile **/*.py
echo "Exit code: $?"
```

### Go Projects
```bash
# To claim 50% - Code Compiles:
go build ./...
echo "Exit code: $?"
```

## Test Validation

### To claim 75% - Tests Pass:
```bash
# Node.js
npm test -- --coverage || jest --coverage
# Check: All tests passing, coverage > 80%

# Python
pytest --cov=. --cov-report=term
# Check: All tests passing, coverage > 80%

# Go
go test ./... -cover
# Check: All tests passing
```

## Server Validation

### To claim 90% - Server Runs:
```bash
# Start server in background
npm start & SERVER_PID=$!
# OR
python app.py & SERVER_PID=$!
# OR
./main & SERVER_PID=$!

# Wait for startup
sleep 5

# Verify it's running
curl -f http://localhost:3000 || curl -f http://localhost:8080
RESULT=$?

# Clean up
kill $SERVER_PID

# Check result
if [ $RESULT -eq 0 ]; then
  echo "Server running successfully"
else
  echo "Server failed to start"
  exit 1
fi
```

## E2E Validation

### To claim 100% - E2E Passes:
```bash
# Install Playwright if needed
npx playwright install chromium

# Run E2E tests
npx playwright test --reporter=list

# Capture screenshots
npx playwright test --screenshot=on

# Generate report
npx playwright show-report
```

## Web Project Validation

### For ANY project with UI:
```bash
# 1. Start dev server
npm run dev & DEV_PID=$!
sleep 10

# 2. Check if accessible
curl -I http://localhost:3000

# 3. Take screenshot proof
npx playwright screenshot http://localhost:3000 homepage.png

# 4. Check for console errors
npx playwright test e2e/console-check.spec.ts

# 5. Clean up
kill $DEV_PID
```

## API Validation

### For REST APIs:
```bash
# Health check
curl -f http://localhost:3000/health

# Test endpoints
curl -X GET http://localhost:3000/api/users
curl -X POST http://localhost:3000/api/users -d '{"name":"test"}'

# Measure response time
curl -w "@curl-format.txt" -o /dev/null -s http://localhost:3000/api/users
```

## Database Validation

### For projects with databases:
```bash
# Run migrations
npm run migrate || python manage.py migrate

# Test connection
npm run db:test || python test_db.py

# Run integration tests
npm test -- --testPathPattern=integration
```

## Common Issues

### Port already in use:
```bash
# Find process using port
lsof -i :3000
# Kill it
kill -9 <PID>
```

### Missing dependencies:
```bash
# Node.js
rm -rf node_modules package-lock.json
npm install

# Python
pip install -r requirements.txt

# Go
go mod download
```

## Remember
- Exit code 0 = success
- Any other exit code = failure
- Capture all output for evidence
- Take screenshots for UI claims