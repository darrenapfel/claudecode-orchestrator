export interface ValidationErrorDetail {
  field: string;
  message: string;
}

export class ValidationError extends Error {
  public code = 'VALIDATION_ERROR';
  public statusCode = 400;
  public details: ValidationErrorDetail[];

  constructor(message: string, details: ValidationErrorDetail[] = []) {
    super(message);
    this.name = 'ValidationError';
    this.details = details;
  }

  toJSON() {
    return {
      error: {
        code: this.code,
        message: this.message,
        details: this.details,
      },
    };
  }
}