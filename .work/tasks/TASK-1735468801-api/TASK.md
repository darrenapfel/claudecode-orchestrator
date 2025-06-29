# TASK: TASK-1735468801-api - REST API Implementation
**Persona**: @software-engineer
**Stream**: API Implementation
**Deadline**: 2025-06-29T08:35:00Z
**Dependencies**: Storage module from TASK-1735468800-storage

## Requirements
Build REST API endpoints for the Todo application using Express.js.

### API Endpoints
1. **POST /todos** - Create a new todo
2. **GET /todos** - List all todos
3. **PATCH /todos/:id** - Update todo (mark complete, edit)
4. **DELETE /todos/:id** - Delete a todo

### Request/Response Examples

#### POST /todos
Request:
```json
{
  "title": "Buy groceries",
  "description": "Milk, eggs, bread",
  "completed": false
}
```
Response: 201 Created
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "title": "Buy groceries",
  "description": "Milk, eggs, bread",
  "completed": false,
  "createdAt": "2025-06-29T08:00:00Z",
  "updatedAt": "2025-06-29T08:00:00Z"
}
```

#### GET /todos
Response: 200 OK
```json
[
  {
    "id": "123e4567-e89b-12d3-a456-426614174000",
    "title": "Buy groceries",
    "description": "Milk, eggs, bread",
    "completed": false,
    "createdAt": "2025-06-29T08:00:00Z",
    "updatedAt": "2025-06-29T08:00:00Z"
  }
]
```

## Success Criteria
- [ ] Express server running on port 3000
- [ ] All 4 endpoints implemented
- [ ] Proper HTTP status codes
- [ ] JSON request/response handling
- [ ] Integration with storage module
- [ ] Error handling middleware
- [ ] Evidence documented in .work/tasks/TASK-1735468801-api/
- [ ] Git commit with reference to TASK-1735468801-api

## Expected Outputs
1. `src/app.ts` - Express application setup
2. `src/routes/todoRoutes.ts` - Route definitions
3. `src/controllers/todoController.ts` - Request handlers
4. `src/middleware/errorHandler.ts` - Error handling
5. `src/server.ts` - Server startup file
6. EVIDENCE.md with cURL examples

## Context
Use the storage module created in TASK-1735468800-storage. Integrate the validation from TASK-1735468800-validation. Ensure proper separation of concerns.

Remember to:
1. Create progress updates in .work/tasks/TASK-1735468801-api/STATUS.md
2. Document evidence in .work/tasks/TASK-1735468801-api/EVIDENCE.md
3. Return structured JSON output as specified in the protocol
4. Commit all changes with reference to task ID