import request from 'supertest';
import { app } from '../app';
import { todoStorage } from '../storage/TodoStorage';

describe('Performance Tests', () => {
  beforeEach(() => {
    todoStorage.clear();
  });

  describe('Response Time Benchmarks', () => {
    it('should create todo in under 100ms', async () => {
      const start = Date.now();
      
      await request(app)
        .post('/todos')
        .send({ title: 'Performance test', completed: false })
        .expect(201);
      
      const duration = Date.now() - start;
      expect(duration).toBeLessThan(100);
    });

    it('should list 100 todos in under 100ms', async () => {
      // Create 100 todos
      for (let i = 0; i < 100; i++) {
        todoStorage.create({
          title: `Todo ${i}`,
          description: `Description for todo ${i}`,
          completed: i % 2 === 0,
        });
      }

      const start = Date.now();
      
      await request(app)
        .get('/todos')
        .expect(200);
      
      const duration = Date.now() - start;
      expect(duration).toBeLessThan(100);
    });

    it('should handle concurrent requests efficiently', async () => {
      const concurrentRequests = 50;
      const start = Date.now();

      const promises = Array.from({ length: concurrentRequests }, (_, i) =>
        request(app)
          .post('/todos')
          .send({ title: `Concurrent ${i}`, completed: false })
      );

      const results = await Promise.all(promises);
      const duration = Date.now() - start;

      // All requests should succeed
      results.forEach(res => expect(res.status).toBe(201));
      
      // Should complete within reasonable time (2ms per request average)
      expect(duration).toBeLessThan(concurrentRequests * 2);
      
      // Should create all todos
      expect(todoStorage.size()).toBe(concurrentRequests);
    });
  });

  describe('Memory Usage', () => {
    it('should handle large numbers of todos efficiently', () => {
      const initialMemory = process.memoryUsage().heapUsed;
      
      // Create 1000 todos
      for (let i = 0; i < 1000; i++) {
        todoStorage.create({
          title: `Todo ${i}`,
          description: `This is a longer description to test memory usage with realistic data ${i}`,
          completed: false,
        });
      }

      const finalMemory = process.memoryUsage().heapUsed;
      const memoryIncrease = (finalMemory - initialMemory) / 1024 / 1024; // MB

      // Should use less than 10MB for 1000 todos
      expect(memoryIncrease).toBeLessThan(10);
    });
  });

  describe('Operation Complexity', () => {
    it('should maintain O(1) lookup performance', () => {
      // Create many todos
      const todos = [];
      for (let i = 0; i < 1000; i++) {
        todos.push(todoStorage.create({
          title: `Todo ${i}`,
          completed: false,
        }));
      }

      // Time lookup of last todo (worst case for array, O(1) for map)
      const targetId = todos[999].id;
      const start = process.hrtime.bigint();
      
      const found = todoStorage.findById(targetId);
      
      const end = process.hrtime.bigint();
      const duration = Number(end - start) / 1000000; // Convert to ms

      expect(found).toBeDefined();
      expect(duration).toBeLessThan(1); // Should be sub-millisecond
    });
  });
});