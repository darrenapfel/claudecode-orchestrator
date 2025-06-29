import request from 'supertest';
import { app } from '../app';
import { todoStorage } from '../storage/TodoStorage';

describe('Todo API Integration Tests', () => {
  beforeEach(() => {
    todoStorage.clear();
  });

  describe('POST /todos', () => {
    it('should create a new todo', async () => {
      const todoData = {
        title: 'Integration Test Todo',
        description: 'Testing the API',
        completed: false,
      };

      const response = await request(app)
        .post('/todos')
        .send(todoData)
        .expect(201);

      expect(response.body).toMatchObject(todoData);
      expect(response.body.id).toBeDefined();
      expect(response.body.createdAt).toBeDefined();
      expect(response.body.updatedAt).toBeDefined();
    });

    it('should handle validation errors', async () => {
      const response = await request(app)
        .post('/todos')
        .send({ description: 'No title' })
        .expect(400);

      expect(response.body).toEqual({
        error: {
          code: 'VALIDATION_ERROR',
          message: 'Validation failed',
          details: [
            {
              field: 'title',
              message: 'Title is required and must be a string',
            },
          ],
        },
      });
    });

    it('should trim whitespace from input', async () => {
      const response = await request(app)
        .post('/todos')
        .send({ title: '  Trimmed  ', description: '  Also trimmed  ' })
        .expect(201);

      expect(response.body.title).toBe('Trimmed');
      expect(response.body.description).toBe('Also trimmed');
    });
  });

  describe('GET /todos', () => {
    it('should return empty array when no todos exist', async () => {
      const response = await request(app)
        .get('/todos')
        .expect(200);

      expect(response.body).toEqual([]);
    });

    it('should return all todos', async () => {
      // Create some todos
      const todo1 = todoStorage.create({ title: 'Todo 1', completed: false });
      const todo2 = todoStorage.create({ title: 'Todo 2', completed: true });

      const response = await request(app)
        .get('/todos')
        .expect(200);

      expect(response.body).toHaveLength(2);
      expect(response.body).toContainEqual(expect.objectContaining({
        id: todo1.id,
        title: 'Todo 1',
      }));
      expect(response.body).toContainEqual(expect.objectContaining({
        id: todo2.id,
        title: 'Todo 2',
      }));
    });
  });

  describe('PATCH /todos/:id', () => {
    it('should update an existing todo', async () => {
      const todo = todoStorage.create({ 
        title: 'Original', 
        description: 'Original desc',
        completed: false 
      });

      const response = await request(app)
        .patch(`/todos/${todo.id}`)
        .send({ title: 'Updated', completed: true })
        .expect(200);

      expect(response.body).toMatchObject({
        id: todo.id,
        title: 'Updated',
        description: 'Original desc',
        completed: true,
      });
      expect(new Date(response.body.updatedAt).getTime())
        .toBeGreaterThan(new Date(todo.updatedAt).getTime());
    });

    it('should handle non-existent todo', async () => {
      const response = await request(app)
        .patch('/todos/550e8400-e29b-41d4-a716-446655440000')
        .send({ title: 'Updated' })
        .expect(400);

      expect(response.body.error.message).toContain('not found');
    });

    it('should validate UUID format', async () => {
      const response = await request(app)
        .patch('/todos/invalid-uuid')
        .send({ title: 'Updated' })
        .expect(400);

      expect(response.body.error.message).toContain('Invalid ID format');
    });

    it('should require at least one field', async () => {
      const todo = todoStorage.create({ title: 'Test', completed: false });

      const response = await request(app)
        .patch(`/todos/${todo.id}`)
        .send({})
        .expect(400);

      expect(response.body.error.message).toContain('At least one field');
    });
  });

  describe('DELETE /todos/:id', () => {
    it('should delete an existing todo', async () => {
      const todo = todoStorage.create({ title: 'Delete me', completed: false });

      await request(app)
        .delete(`/todos/${todo.id}`)
        .expect(204);

      expect(todoStorage.findById(todo.id)).toBeNull();
    });

    it('should handle non-existent todo', async () => {
      const response = await request(app)
        .delete('/todos/550e8400-e29b-41d4-a716-446655440000')
        .expect(400);

      expect(response.body.error.message).toContain('not found');
    });

    it('should validate UUID format', async () => {
      const response = await request(app)
        .delete('/todos/invalid-uuid')
        .expect(400);

      expect(response.body.error.message).toContain('Invalid ID format');
    });
  });

  describe('GET /health', () => {
    it('should return health status', async () => {
      const response = await request(app)
        .get('/health')
        .expect(200);

      expect(response.body).toEqual({
        status: 'ok',
        timestamp: expect.any(String),
      });
    });
  });

  describe('Error handling', () => {
    it('should handle 404 for unknown routes', async () => {
      await request(app)
        .get('/unknown-route')
        .expect(404);
    });

    it('should handle invalid JSON', async () => {
      await request(app)
        .post('/todos')
        .set('Content-Type', 'application/json')
        .send('invalid json')
        .expect(400);
    });
  });
});