# TASK: TASK-1735468800-validation - Input Validation Layer
**Persona**: @sdet
**Stream**: Validation Implementation
**Deadline**: 2025-06-29T08:30:00Z
**Dependencies**: None

## Requirements
Create a comprehensive validation layer for the Todo API with proper error handling.

### Validation Rules
1. **Todo Creation**:
   - `title`: Required, string, 1-200 characters
   - `description`: Optional, string, max 1000 characters
   - `completed`: Optional, boolean (defaults to false)

2. **Todo Update**:
   - At least one field must be provided
   - `title`: If provided, 1-200 characters
   - `description`: If provided, max 1000 characters
   - `completed`: If provided, must be boolean

3. **ID Validation**:
   - Must be valid UUID v4 format
   - Must exist for update/delete operations

### Error Response Format
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validation failed",
    "details": [
      {
        "field": "title",
        "message": "Title is required"
      }
    ]
  }
}
```

## Success Criteria
- [ ] Validation middleware for Express
- [ ] Comprehensive validation rules
- [ ] Consistent error responses
- [ ] Unit tests for all validators
- [ ] Test coverage >90%
- [ ] Evidence documented in .work/tasks/TASK-1735468800-validation/
- [ ] Git commit with reference to TASK-1735468800-validation

## Expected Outputs
1. `src/validation/todoValidation.ts` - Validation rules
2. `src/middleware/validationMiddleware.ts` - Express middleware
3. `src/errors/ValidationError.ts` - Custom error class
4. `src/validation/__tests__/` - Comprehensive tests
5. EVIDENCE.md with validation examples

## Context
Use a validation library like Joi, Yup, or implement custom validators. Ensure validation is performant and provides clear, actionable error messages.

Remember to:
1. Create progress updates in .work/tasks/TASK-1735468800-validation/STATUS.md
2. Document evidence in .work/tasks/TASK-1735468800-validation/EVIDENCE.md
3. Return structured JSON output as specified in the protocol
4. Commit all changes with reference to task ID