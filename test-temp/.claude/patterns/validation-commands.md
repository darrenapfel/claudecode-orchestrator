# Validation Commands

## Quick Reference
- **Build**: Exit code 0 required
- **Tests**: All pass, >80% coverage
- **Server**: Responds to requests
- **E2E**: Visual validation passes

## Build Commands
```bash
# Node.js
npm run build || npm run compile

# Python
python -m py_compile **/*.py

# Go
go build ./...

# Check result
echo "Exit code: $?"  # Must be 0
```

## Test Commands
```bash
# Node.js
npm test -- --coverage

# Python
pytest --cov=. --cov-report=term

# Go
go test ./... -cover
```

## Server Validation
```bash
# Start server
npm start & PID=$!
sleep 5

# Test it
curl -f http://localhost:3000
RESULT=$?

# Cleanup
kill $PID

# Verify
[ $RESULT -eq 0 ] && echo "PASS" || echo "FAIL"
```

## E2E Testing
```bash
# Playwright
npx playwright install
npx playwright test --screenshot=on

# Cypress
npx cypress run

# Manual
# 1. Open browser
# 2. Test all features
# 3. Check console for errors
# 4. Test mobile view
```

## Integration Validation (v3.3)
```bash
# Test cross-component calls
curl -X POST localhost:3000/api/auth/login -d '{...}'
TOKEN=$(jq -r .token response.json)
curl -H "Authorization: Bearer $TOKEN" localhost:3000/api/users

# Verify data flow
# Component A creates → Component B reads → Component C processes
```

## Common Issues

**Port conflicts**:
```bash
lsof -i :3000  # Find what's using port
kill -9 <PID>  # Kill it
```

**Missing dependencies**:
```bash
npm install
pip install -r requirements.txt
go mod download
```

**Database not running**:
```bash
docker-compose up -d
# or
postgres -D /usr/local/var/postgres
```

---
*If it doesn't run, it doesn't work.*
