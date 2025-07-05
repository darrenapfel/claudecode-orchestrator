# Service Management Pattern

This file centralizes service startup and validation procedures used across multiple personas. Reference this file to ensure consistent service management.

## Service Startup Protocol

### Standard Startup Commands
```bash
# 1. Start service with logging
npm run dev > service.log 2>&1 &
SERVICE_PID=$!
echo $SERVICE_PID > .service_pid

# 2. Allow startup time
sleep 15

# 3. Validate service responds
curl -f http://localhost:3000 > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ SERVICE STARTUP FAILED"
    cat service.log
    exit 1
fi

# 4. Validate API health endpoint
curl -f http://localhost:3000/api/health > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ API NOT RESPONDING"
    cat service.log
    exit 1
fi

# 5. Test basic functionality
curl -s http://localhost:3000 | grep -q "<!DOCTYPE html"
if [ $? -ne 0 ]; then
    echo "❌ HOMEPAGE NOT LOADING PROPERLY"
    exit 1
fi

echo "✅ SERVICE VALIDATED at http://localhost:3000"
```

### Alternative Service Commands
For different project types, adapt the startup command:
```bash
# Next.js projects
npm run dev

# React projects  
npm start

# Express/Node.js
npm run start:dev

# Python/Django
python manage.py runserver

# Docker-based
docker-compose up -d
```

### Service Validation Checklist
- [ ] Service starts without errors
- [ ] Process ID captured and stored
- [ ] Homepage responds with HTTP 200
- [ ] API health endpoint responds
- [ ] Basic HTML content loads
- [ ] No critical errors in startup logs

## Evidence Documentation

### Service Validation Evidence Template
```markdown
## Service Startup Validation

### Commands Executed
1. `npm run dev > service.log 2>&1 &`
2. `curl -f http://localhost:3000`
3. `curl -f http://localhost:3000/api/health`
4. `curl -s http://localhost:3000 | grep "<!DOCTYPE html"`

### Results
- Service PID: [pid_number]
- Homepage response: ✅ HTTP 200
- API health: ✅ HTTP 200
- HTML content: ✅ Valid DOCTYPE found
- Service URL: http://localhost:3000
- Startup time: [X] seconds

### Service Log (first 50 lines)
[Include relevant startup logs showing successful initialization]

### Validation Timestamp
[ISO timestamp of validation]
```

## Failure Handling Protocol

### When Service Fails to Start
1. **DO NOT** proceed with milestone completion
2. **CAPTURE** complete error logs
3. **ANALYZE** common startup issues:
   - Missing dependencies (`npm install`)
   - Port conflicts (check if 3000 is in use)
   - Environment variables missing
   - Database connection issues
   - Build compilation errors
4. **CREATE** fix tasks for identified issues
5. **RETRY** service startup after fixes
6. **VALIDATE** again before proceeding

### Common Startup Issues and Solutions

#### Missing Dependencies
```bash
# Check if node_modules exists
ls node_modules/ > /dev/null 2>&1 || npm install
```

#### Port Conflicts
```bash
# Check if port 3000 is in use
lsof -ti:3000 && echo "Port 3000 in use" || echo "Port 3000 available"

# Kill existing process if needed
lsof -ti:3000 | xargs kill -9
```

#### Environment Configuration
```bash
# Check for required environment variables
[ -f .env.local ] || echo "Missing .env.local file"
[ -f .env.example ] && echo "Copy .env.example to .env.local"
```

#### Database Issues
```bash
# Check database connection
npm run db:check 2>/dev/null || echo "Database connection failed"

# Run migrations if needed
npm run db:migrate 2>/dev/null || echo "Migrations needed"
```

## Milestone Completion Integration

### When to Use Service Management
Service management is required during:
1. **Milestone completion** - Before declaring milestone complete
2. **Integration testing** - After major feature integration
3. **Fix cycles** - After resolving service-breaking issues
4. **User acceptance testing setup** - Before user testing begins

### Orchestrator Delegation
The orchestrator delegates service management to:
- **@test-engineer** - Primary responsibility for service startup
- **@integration-engineer** - During integration testing
- **@devops** - For production-like environments

### Service URL Communication
Once validated, communicate service status:
```
✅ SERVICE RUNNING AND VALIDATED
🔗 URL: http://localhost:3000
📊 Status: All endpoints responding
⏱️ Startup time: [X] seconds
📋 Ready for user testing
```

## Cross-Reference

This pattern is used by:
- `.claude/personas/test-engineer.md`
- `.claude/patterns/milestone-completion-protocol.md`
- `.claude/patterns/standard-workflow.md`
- Integration and validation workflows

**Always reference this file for consistent service management procedures.**
