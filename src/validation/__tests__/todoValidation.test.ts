import { TodoValidator } from '../todoValidation';
import { ValidationError } from '../../errors/ValidationError';

describe('TodoValidator', () => {
  describe('validateCreateTodo', () => {
    it('should validate a valid todo', () => {
      const data = {
        title: 'Valid Todo',
        description: 'Valid description',
        completed: false,
      };

      const result = TodoValidator.validateCreateTodo(data);

      expect(result).toEqual({
        title: 'Valid Todo',
        description: 'Valid description',
        completed: false,
      });
    });

    it('should trim whitespace from strings', () => {
      const data = {
        title: '  Trimmed Title  ',
        description: '  Trimmed Description  ',
      };

      const result = TodoValidator.validateCreateTodo(data);

      expect(result.title).toBe('Trimmed Title');
      expect(result.description).toBe('Trimmed Description');
    });

    it('should default completed to false when not provided', () => {
      const data = { title: 'Test' };

      const result = TodoValidator.validateCreateTodo(data);

      expect(result.completed).toBe(false);
    });

    it('should throw error when title is missing', () => {
      const data = { description: 'No title' };

      expect(() => TodoValidator.validateCreateTodo(data)).toThrow(ValidationError);
      try {
        TodoValidator.validateCreateTodo(data);
      } catch (error) {
        expect((error as ValidationError).details).toContainEqual({
          field: 'title',
          message: 'Title is required and must be a string',
        });
      }
    });

    it('should throw error when title is empty', () => {
      const data = { title: '   ' };

      expect(() => TodoValidator.validateCreateTodo(data)).toThrow(ValidationError);
      try {
        TodoValidator.validateCreateTodo(data);
      } catch (error) {
        expect((error as ValidationError).details).toContainEqual({
          field: 'title',
          message: 'Title cannot be empty',
        });
      }
    });

    it('should throw error when title exceeds 200 characters', () => {
      const data = { title: 'a'.repeat(201) };

      expect(() => TodoValidator.validateCreateTodo(data)).toThrow(ValidationError);
      try {
        TodoValidator.validateCreateTodo(data);
      } catch (error) {
        expect((error as ValidationError).details).toContainEqual({
          field: 'title',
          message: 'Title cannot exceed 200 characters',
        });
      }
    });

    it('should throw error when description exceeds 1000 characters', () => {
      const data = { 
        title: 'Valid',
        description: 'a'.repeat(1001)
      };

      expect(() => TodoValidator.validateCreateTodo(data)).toThrow(ValidationError);
      try {
        TodoValidator.validateCreateTodo(data);
      } catch (error) {
        expect((error as ValidationError).details).toContainEqual({
          field: 'description',
          message: 'Description cannot exceed 1000 characters',
        });
      }
    });

    it('should throw error when completed is not boolean', () => {
      const data = { 
        title: 'Valid',
        completed: 'true' as any
      };

      expect(() => TodoValidator.validateCreateTodo(data)).toThrow(ValidationError);
      try {
        TodoValidator.validateCreateTodo(data);
      } catch (error) {
        expect((error as ValidationError).details).toContainEqual({
          field: 'completed',
          message: 'Completed must be a boolean',
        });
      }
    });

    it('should collect multiple errors', () => {
      const data = { 
        title: '',
        description: 123 as any,
        completed: 'yes' as any
      };

      try {
        TodoValidator.validateCreateTodo(data);
      } catch (error) {
        expect((error as ValidationError).details).toHaveLength(3);
      }
    });
  });

  describe('validateUpdateTodo', () => {
    it('should validate valid update data', () => {
      const data = {
        title: 'Updated Title',
        completed: true,
      };

      const result = TodoValidator.validateUpdateTodo(data);

      expect(result).toEqual({
        title: 'Updated Title',
        completed: true,
      });
    });

    it('should allow partial updates', () => {
      const data = { completed: true };

      const result = TodoValidator.validateUpdateTodo(data);

      expect(result).toEqual({ completed: true });
    });

    it('should throw error when no fields provided', () => {
      const data = {};

      expect(() => TodoValidator.validateUpdateTodo(data)).toThrow(
        'At least one field must be provided for update'
      );
    });

    it('should validate title when provided', () => {
      const data = { title: 'a'.repeat(201) };

      expect(() => TodoValidator.validateUpdateTodo(data)).toThrow(ValidationError);
      try {
        TodoValidator.validateUpdateTodo(data);
      } catch (error) {
        expect((error as ValidationError).details).toContainEqual({
          field: 'title',
          message: 'Title cannot exceed 200 characters',
        });
      }
    });

    it('should ignore undefined fields', () => {
      const data = {
        title: 'New Title',
        description: undefined,
        completed: undefined,
      };

      const result = TodoValidator.validateUpdateTodo(data);

      expect(result).toEqual({ title: 'New Title' });
    });
  });

  describe('validateUUID', () => {
    it('should accept valid UUID v4', () => {
      const validUUIDs = [
        '550e8400-e29b-41d4-a716-446655440000',
        '6ba7b810-9dad-11d1-80b4-00c04fd430c8',
        '6ba7b811-9dad-11d1-80b4-00c04fd430c8',
      ];

      validUUIDs.forEach(uuid => {
        expect(() => TodoValidator.validateUUID(uuid)).not.toThrow();
      });
    });

    it('should throw error for invalid UUID', () => {
      const invalidUUIDs = [
        'not-a-uuid',
        '12345',
        '',
        null as any,
        undefined as any,
        '550e8400-e29b-41d4-a716-44665544000g', // invalid character
        '550e8400-e29b-41d4-a716-4466554400', // too short
      ];

      invalidUUIDs.forEach(uuid => {
        expect(() => TodoValidator.validateUUID(uuid)).toThrow(ValidationError);
      });
    });
  });
});