# API Validation Protocol

## Context
This validation runs as part of the 4-validator parallel process after Integration Step.

## Required Evidence for API Tasks

### 1. Endpoint Testing
Every endpoint must be tested with actual HTTP calls showing full request/response:

```bash
# Document every endpoint with curl
curl -X POST http://localhost:3000/api/endpoint \
  -H "Content-Type: application/json" \
  -d '{"key": "value"}' \
  -v 2>&1 | tee output.log
```

**Required Coverage:**
- All HTTP methods (GET, POST, PUT, DELETE, PATCH)
- All documented endpoints from ARCHITECTURE.md
- Request/response headers
- Status codes
- Response times

### 2. Error Handling Tests
Test ALL error scenarios:
- 400 Bad Request (malformed input)
- 401 Unauthorized (missing/invalid auth)
- 403 Forbidden (insufficient permissions)
- 404 Not Found (missing resources)
- 409 Conflict (duplicate resources)
- 422 Unprocessable Entity (validation errors)
- 429 Too Many Requests (rate limiting)
- 500 Server Error (demonstrate graceful handling)

### 3. Data Validation
```bash
# Test boundary conditions
curl -X POST http://localhost:3000/api/users \
  -d '{"email": "not-an-email"}' # Should return 422

# Test required fields
curl -X POST http://localhost:3000/api/users \
  -d '{}' # Should return 422 with field errors

# Test data types
curl -X POST http://localhost:3000/api/users \
  -d '{"age": "twenty"}' # Should return 422
```

### 4. Performance Testing
```bash
# Basic load test
ab -n 1000 -c 50 http://localhost:3000/api/endpoint

# Response time requirements:
# - GET endpoints: <200ms
# - POST/PUT endpoints: <500ms
# - Search endpoints: <1000ms
```

### 5. Security Validation
Test for common vulnerabilities:
```bash
# SQL Injection attempt
curl -X GET "http://localhost:3000/api/users?id=1' OR '1'='1"

# XSS attempt
curl -X POST http://localhost:3000/api/comments \
  -d '{"text": "<script>alert(1)</script>"}'

# Auth bypass attempt
curl -X GET http://localhost:3000/api/admin/users \
  -H "Authorization: Bearer invalid-token"

# CORS validation
curl -X OPTIONS http://localhost:3000/api/endpoint \
  -H "Origin: http://evil.com"
```

### 6. API Contract Compliance
Verify implementation matches ARCHITECTURE.md:
- Request schemas match specification
- Response schemas match specification
- Status codes as documented
- Headers as specified

## Evidence Format

```markdown
# API Validation Evidence

**Sprint**: Sprint-XXX
**API Component**: [Component Name]
**Validator**: @test-engineer
**Validation Time**: YYYY-MM-DD HH:MM:SS

## Endpoints Tested

### POST /api/users
✅ Success case (201)
✅ Validation errors (422)
✅ Duplicate email (409)
✅ Rate limiting (429)
Response time: 145ms (PASS: <500ms)

### GET /api/users/:id
✅ Success case (200)
✅ Not found (404)
✅ Invalid ID format (400)
Response time: 87ms (PASS: <200ms)

## Security Tests
✅ SQL injection: Properly escaped
✅ XSS: Input sanitized
✅ Auth: All endpoints protected
✅ CORS: Properly configured

## Performance Results
- Concurrent users: 50
- Requests: 1000
- Failures: 0
- Avg response: 123ms
- 95th percentile: 234ms

## Contract Compliance
✅ All endpoints match ARCHITECTURE.md
✅ Request/response schemas validated
✅ Error formats consistent
```

## Common API Failures

❌ **No error handling**: Returns 500 for bad input
❌ **Sensitive data in errors**: Stack traces, DB queries exposed
❌ **No rate limiting**: Allows unlimited requests
❌ **Missing authentication**: Endpoints accessible without auth
❌ **Inconsistent responses**: Different error formats
❌ **No input validation**: Accepts any data type
❌ **CORS misconfigured**: Allows any origin
❌ **No API versioning**: Breaking changes without notice

## Validation Checklist

- [ ] All endpoints from ARCHITECTURE.md tested
- [ ] All HTTP methods tested
- [ ] All error codes handled properly
- [ ] Response times within limits
- [ ] Security vulnerabilities checked
- [ ] Rate limiting functional
- [ ] API contracts matched
- [ ] No sensitive data exposed

---
*API validation ensures contracts are met and security is maintained.*
