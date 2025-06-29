import express from 'express';
import { todoRouter } from './routes/todoRoutes';
import { errorHandler } from './middleware/errorHandler';

export const app = express();

// Middleware
app.use(express.json());

// Routes
app.use(todoRouter);

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// Error handling (must be last)
app.use(errorHandler);