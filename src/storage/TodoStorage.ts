import { Todo, CreateTodoDto, UpdateTodoDto } from '../types/Todo';
import { v4 as uuidv4 } from 'uuid';

export class TodoStorage {
  private todos: Map<string, Todo> = new Map();

  create(todoData: CreateTodoDto): Todo {
    const now = new Date();
    const todo: Todo = {
      id: uuidv4(),
      ...todoData,
      createdAt: now,
      updatedAt: now,
    };
    
    this.todos.set(todo.id, todo);
    return { ...todo };
  }

  findAll(): Todo[] {
    return Array.from(this.todos.values()).map(todo => ({ ...todo }));
  }

  findById(id: string): Todo | null {
    const todo = this.todos.get(id);
    return todo ? { ...todo } : null;
  }

  update(id: string, updates: UpdateTodoDto): Todo | null {
    const todo = this.todos.get(id);
    if (!todo) {
      return null;
    }

    const updatedTodo: Todo = {
      ...todo,
      ...updates,
      id: todo.id, // Ensure ID can't be changed
      createdAt: todo.createdAt, // Ensure createdAt can't be changed
      updatedAt: new Date(),
    };

    this.todos.set(id, updatedTodo);
    return { ...updatedTodo };
  }

  delete(id: string): boolean {
    return this.todos.delete(id);
  }

  clear(): void {
    this.todos.clear();
  }

  // Helper method for testing
  size(): number {
    return this.todos.size;
  }
}

// Singleton instance
export const todoStorage = new TodoStorage();