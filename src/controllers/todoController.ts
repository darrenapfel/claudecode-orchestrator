import { Request, Response, NextFunction } from 'express';
import { todoStorage } from '../storage/TodoStorage';
import { TodoValidator } from '../validation/todoValidation';
import { ValidationError } from '../errors/ValidationError';

export class TodoController {
  static async createTodo(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const validatedData = TodoValidator.validateCreateTodo(req.body);
      const todo = todoStorage.create(validatedData);
      res.status(201).json(todo);
    } catch (error) {
      next(error);
    }
  }

  static async getAllTodos(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const todos = todoStorage.findAll();
      res.json(todos);
    } catch (error) {
      next(error);
    }
  }

  static async updateTodo(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { id } = req.params;
      TodoValidator.validateUUID(id);
      
      const validatedData = TodoValidator.validateUpdateTodo(req.body);
      const updatedTodo = todoStorage.update(id, validatedData);
      
      if (!updatedTodo) {
        throw new ValidationError(`Todo with ID ${id} not found`);
      }
      
      res.json(updatedTodo);
    } catch (error) {
      next(error);
    }
  }

  static async deleteTodo(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { id } = req.params;
      TodoValidator.validateUUID(id);
      
      const deleted = todoStorage.delete(id);
      
      if (!deleted) {
        throw new ValidationError(`Todo with ID ${id} not found`);
      }
      
      res.status(204).send();
    } catch (error) {
      next(error);
    }
  }
}