import { CreateTodoDto, UpdateTodoDto } from '../types/Todo';
import { ValidationError, ValidationErrorDetail } from '../errors/ValidationError';

const UUID_REGEX = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

export class TodoValidator {
  static validateCreateTodo(data: any): CreateTodoDto {
    const errors: ValidationErrorDetail[] = [];

    // Validate title
    if (!data.title || typeof data.title !== 'string') {
      errors.push({ field: 'title', message: 'Title is required and must be a string' });
    } else if (data.title.trim().length === 0) {
      errors.push({ field: 'title', message: 'Title cannot be empty' });
    } else if (data.title.length > 200) {
      errors.push({ field: 'title', message: 'Title cannot exceed 200 characters' });
    }

    // Validate description (optional)
    if (data.description !== undefined) {
      if (typeof data.description !== 'string') {
        errors.push({ field: 'description', message: 'Description must be a string' });
      } else if (data.description.length > 1000) {
        errors.push({ field: 'description', message: 'Description cannot exceed 1000 characters' });
      }
    }

    // Validate completed (optional, defaults to false)
    if (data.completed !== undefined && typeof data.completed !== 'boolean') {
      errors.push({ field: 'completed', message: 'Completed must be a boolean' });
    }

    if (errors.length > 0) {
      throw new ValidationError('Validation failed', errors);
    }

    return {
      title: data.title.trim(),
      description: data.description?.trim(),
      completed: data.completed ?? false,
    };
  }

  static validateUpdateTodo(data: any): UpdateTodoDto {
    const errors: ValidationErrorDetail[] = [];

    // Check if at least one field is provided
    const hasFields = data.title !== undefined || 
                     data.description !== undefined || 
                     data.completed !== undefined;

    if (!hasFields) {
      throw new ValidationError('At least one field must be provided for update');
    }

    // Validate title if provided
    if (data.title !== undefined) {
      if (typeof data.title !== 'string') {
        errors.push({ field: 'title', message: 'Title must be a string' });
      } else if (data.title.trim().length === 0) {
        errors.push({ field: 'title', message: 'Title cannot be empty' });
      } else if (data.title.length > 200) {
        errors.push({ field: 'title', message: 'Title cannot exceed 200 characters' });
      }
    }

    // Validate description if provided
    if (data.description !== undefined) {
      if (typeof data.description !== 'string') {
        errors.push({ field: 'description', message: 'Description must be a string' });
      } else if (data.description.length > 1000) {
        errors.push({ field: 'description', message: 'Description cannot exceed 1000 characters' });
      }
    }

    // Validate completed if provided
    if (data.completed !== undefined && typeof data.completed !== 'boolean') {
      errors.push({ field: 'completed', message: 'Completed must be a boolean' });
    }

    if (errors.length > 0) {
      throw new ValidationError('Validation failed', errors);
    }

    const updates: UpdateTodoDto = {};
    if (data.title !== undefined) updates.title = data.title.trim();
    if (data.description !== undefined) updates.description = data.description.trim();
    if (data.completed !== undefined) updates.completed = data.completed;

    return updates;
  }

  static validateUUID(id: string): void {
    if (!id || typeof id !== 'string') {
      throw new ValidationError('ID is required and must be a string');
    }

    if (!UUID_REGEX.test(id)) {
      throw new ValidationError('Invalid ID format. Must be a valid UUID');
    }
  }
}