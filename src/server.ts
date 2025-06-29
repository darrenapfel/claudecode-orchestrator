import { app } from './app';

const PORT = process.env.PORT || 3000;

const server = app.listen(PORT, () => {
  console.log(`🚀 Todo API server running on http://localhost:${PORT}`);
  console.log(`📋 API endpoints:`);
  console.log(`   POST   /todos     - Create todo`);
  console.log(`   GET    /todos     - List all todos`);
  console.log(`   PATCH  /todos/:id - Update todo`);
  console.log(`   DELETE /todos/:id - Delete todo`);
  console.log(`   GET    /health    - Health check`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('SIGTERM signal received: closing HTTP server');
  server.close(() => {
    console.log('HTTP server closed');
  });
});