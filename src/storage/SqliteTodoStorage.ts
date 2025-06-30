import { Database } from 'sqlite3';
import { Todo, CreateTodoDto, UpdateTodoDto } from '../types/Todo';
import { v4 as uuidv4 } from 'uuid';
import { promisify } from 'util';

export class SqliteTodoStorage {
  private db: Database;
  private runAsync: (sql: string, params?: any[]) => Promise<void>;
  private getAsync: (sql: string, params?: any[]) => Promise<any>;
  private allAsync: (sql: string, params?: any[]) => Promise<any[]>;

  constructor(filename: string = ':memory:') {
    this.db = new Database(filename);
    
    // Promisify database methods
    this.runAsync = promisify(this.db.run.bind(this.db));
    this.getAsync = promisify(this.db.get.bind(this.db));
    this.allAsync = promisify(this.db.all.bind(this.db));
  }

  async initialize(): Promise<void> {
    const createTableSQL = `
      CREATE TABLE IF NOT EXISTS todos (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        completed INTEGER NOT NULL DEFAULT 0,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL
      )
    `;
    
    await this.runAsync(createTableSQL);
  }

  async create(todoData: CreateTodoDto): Promise<Todo> {
    const now = new Date();
    const todo: Todo = {
      id: uuidv4(),
      ...todoData,
      createdAt: now,
      updatedAt: now,
    };
    
    const sql = `
      INSERT INTO todos (id, title, description, completed, createdAt, updatedAt)
      VALUES (?, ?, ?, ?, ?, ?)
    `;
    
    await this.runAsync(sql, [
      todo.id,
      todo.title,
      todo.description || null,
      todo.completed ? 1 : 0,
      todo.createdAt.toISOString(),
      todo.updatedAt.toISOString()
    ]);
    
    return todo;
  }

  async findAll(): Promise<Todo[]> {
    const sql = 'SELECT * FROM todos ORDER BY createdAt DESC';
    const rows = await this.allAsync(sql);
    
    return rows.map(this.rowToTodo);
  }

  async findById(id: string): Promise<Todo | null> {
    const sql = 'SELECT * FROM todos WHERE id = ?';
    const row = await this.getAsync(sql, [id]);
    
    return row ? this.rowToTodo(row) : null;
  }

  async update(id: string, updates: UpdateTodoDto): Promise<Todo | null> {
    const existing = await this.findById(id);
    if (!existing) {
      return null;
    }

    const updatedTodo: Todo = {
      ...existing,
      ...updates,
      id: existing.id,
      createdAt: existing.createdAt,
      updatedAt: new Date(),
    };

    const sql = `
      UPDATE todos 
      SET title = ?, description = ?, completed = ?, updatedAt = ?
      WHERE id = ?
    `;

    await this.runAsync(sql, [
      updatedTodo.title,
      updatedTodo.description || null,
      updatedTodo.completed ? 1 : 0,
      updatedTodo.updatedAt.toISOString(),
      id
    ]);

    return updatedTodo;
  }

  async delete(id: string): Promise<boolean> {
    const sql = 'DELETE FROM todos WHERE id = ?';
    const result = await this.runAsync(sql, [id]);
    
    // Check if any rows were affected
    return (result as any).changes > 0;
  }

  async clear(): Promise<void> {
    const sql = 'DELETE FROM todos';
    await this.runAsync(sql);
  }

  async size(): Promise<number> {
    const sql = 'SELECT COUNT(*) as count FROM todos';
    const row = await this.getAsync(sql);
    return row.count;
  }

  async close(): Promise<void> {
    return new Promise((resolve, reject) => {
      this.db.close((err) => {
        if (err) reject(err);
        else resolve();
      });
    });
  }

  private rowToTodo(row: any): Todo {
    return {
      id: row.id,
      title: row.title,
      description: row.description,
      completed: row.completed === 1,
      createdAt: new Date(row.createdAt),
      updatedAt: new Date(row.updatedAt),
    };
  }
}

// Export a factory function instead of singleton
export const createSqliteTodoStorage = async (filename?: string): Promise<SqliteTodoStorage> => {
  const storage = new SqliteTodoStorage(filename);
  await storage.initialize();
  return storage;
};