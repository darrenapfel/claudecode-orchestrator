import { TodoStorage } from '../TodoStorage';
import { CreateTodoDto } from '../../types/Todo';

describe('TodoStorage', () => {
  let storage: TodoStorage;

  beforeEach(() => {
    storage = new TodoStorage();
  });

  describe('create', () => {
    it('should create a new todo with generated ID and timestamps', () => {
      const todoData: CreateTodoDto = {
        title: 'Test Todo',
        description: 'Test Description',
        completed: false,
      };

      const todo = storage.create(todoData);

      expect(todo).toMatchObject({
        title: 'Test Todo',
        description: 'Test Description',
        completed: false,
      });
      expect(todo.id).toBeDefined();
      expect(todo.id).toMatch(/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i);
      expect(todo.createdAt).toBeInstanceOf(Date);
      expect(todo.updatedAt).toBeInstanceOf(Date);
      expect(todo.createdAt).toEqual(todo.updatedAt);
    });

    it('should create multiple todos with unique IDs', () => {
      const todo1 = storage.create({ title: 'Todo 1', completed: false });
      const todo2 = storage.create({ title: 'Todo 2', completed: false });

      expect(todo1.id).not.toEqual(todo2.id);
      expect(storage.size()).toBe(2);
    });
  });

  describe('findAll', () => {
    it('should return empty array when no todos exist', () => {
      expect(storage.findAll()).toEqual([]);
    });

    it('should return all todos', () => {
      const todo1 = storage.create({ title: 'Todo 1', completed: false });
      const todo2 = storage.create({ title: 'Todo 2', completed: true });

      const todos = storage.findAll();

      expect(todos).toHaveLength(2);
      expect(todos).toContainEqual(todo1);
      expect(todos).toContainEqual(todo2);
    });

    it('should return copies of todos to prevent external modification', () => {
      const todo = storage.create({ title: 'Original', completed: false });
      const todos = storage.findAll();
      
      todos[0].title = 'Modified';
      
      const freshTodos = storage.findAll();
      expect(freshTodos[0].title).toBe('Original');
    });
  });

  describe('findById', () => {
    it('should return null for non-existent ID', () => {
      expect(storage.findById('non-existent-id')).toBeNull();
    });

    it('should return the correct todo by ID', () => {
      const todo = storage.create({ title: 'Find me', completed: false });
      
      const found = storage.findById(todo.id);
      
      expect(found).toEqual(todo);
    });

    it('should return a copy to prevent external modification', () => {
      const todo = storage.create({ title: 'Original', completed: false });
      const found = storage.findById(todo.id);
      
      found!.title = 'Modified';
      
      const freshFound = storage.findById(todo.id);
      expect(freshFound!.title).toBe('Original');
    });
  });

  describe('update', () => {
    it('should return null for non-existent ID', () => {
      const result = storage.update('non-existent-id', { title: 'Updated' });
      expect(result).toBeNull();
    });

    it('should update todo fields', async () => {
      const todo = storage.create({ title: 'Original', completed: false });
      const originalCreatedAt = todo.createdAt;
      
      // Wait a bit to ensure updatedAt changes
      await new Promise(resolve => setTimeout(resolve, 10));
      
      const updated = storage.update(todo.id, {
        title: 'Updated',
        completed: true,
      });

      expect(updated).toMatchObject({
        id: todo.id,
        title: 'Updated',
        completed: true,
        createdAt: originalCreatedAt,
      });
      expect(updated!.updatedAt.getTime()).toBeGreaterThan(originalCreatedAt.getTime());
    });

    it('should not allow changing ID or createdAt', () => {
      const todo = storage.create({ title: 'Original', completed: false });
      
      const updated = storage.update(todo.id, {
        title: 'Updated',
        // TypeScript prevents these, but test runtime behavior
        ...{ id: 'new-id', createdAt: new Date('2020-01-01') }
      } as any);

      expect(updated!.id).toBe(todo.id);
      expect(updated!.createdAt).toEqual(todo.createdAt);
    });

    it('should allow partial updates', () => {
      const todo = storage.create({ 
        title: 'Original', 
        description: 'Original desc',
        completed: false 
      });
      
      const updated = storage.update(todo.id, { completed: true });

      expect(updated).toMatchObject({
        title: 'Original',
        description: 'Original desc',
        completed: true,
      });
    });
  });

  describe('delete', () => {
    it('should return false for non-existent ID', () => {
      expect(storage.delete('non-existent-id')).toBe(false);
    });

    it('should delete existing todo and return true', () => {
      const todo = storage.create({ title: 'Delete me', completed: false });
      
      expect(storage.size()).toBe(1);
      expect(storage.delete(todo.id)).toBe(true);
      expect(storage.size()).toBe(0);
      expect(storage.findById(todo.id)).toBeNull();
    });
  });

  describe('clear', () => {
    it('should remove all todos', () => {
      storage.create({ title: 'Todo 1', completed: false });
      storage.create({ title: 'Todo 2', completed: false });
      storage.create({ title: 'Todo 3', completed: false });
      
      expect(storage.size()).toBe(3);
      
      storage.clear();
      
      expect(storage.size()).toBe(0);
      expect(storage.findAll()).toEqual([]);
    });
  });

  describe('concurrent operations', () => {
    it('should handle multiple creates safely', () => {
      const promises = Array.from({ length: 100 }, (_, i) => 
        Promise.resolve(storage.create({ title: `Todo ${i}`, completed: false }))
      );

      return Promise.all(promises).then(todos => {
        expect(storage.size()).toBe(100);
        const ids = todos.map(t => t.id);
        const uniqueIds = new Set(ids);
        expect(uniqueIds.size).toBe(100);
      });
    });
  });
});