import { Router } from 'express';
import { TodoController } from '../controllers/todoController';

export const todoRouter = Router();

// Create todo
todoRouter.post('/todos', TodoController.createTodo);

// Get all todos
todoRouter.get('/todos', TodoController.getAllTodos);

// Update todo
todoRouter.patch('/todos/:id', TodoController.updateTodo);

// Delete todo
todoRouter.delete('/todos/:id', TodoController.deleteTodo);