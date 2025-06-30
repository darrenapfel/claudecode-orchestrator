# API Validation Protocol

## Required Evidence for API Tasks

### 1. Endpoint Testing
```bash
# Document every endpoint with curl
curl -X POST http://localhost:3000/api/endpoint \
  -H "Content-Type: application/json" \
  -d '{"key": "value"}' \
  -v 2>&1 | tee output.log
```

### 2. Error Handling Tests
- 400 Bad Request
- 401 Unauthorized
- 404 Not Found
- 500 Server Error

### 3. Performance Testing
```bash
ab -n 100 -c 10 http://localhost:3000/api/endpoint
```

### 4. Security Validation
- SQL Injection attempts
- XSS attempts
- Auth bypass attempts

## Common API Failures
- No error handling
- Sensitive data in errors
- No rate limiting
- Missing authentication
