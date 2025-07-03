# Mocked Services First Pattern

## Overview
External service mocks MUST be implemented in the first implementation batch, before any features that use them. This prevents engineers from being blocked and ensures consistent development.

## Why Mocks Come First

### The Problem
If you build features before their dependencies:
- Engineer builds Auth feature → needs to send email → no email service → BLOCKED
- Engineer builds Payment feature → needs payment API → no API → BLOCKED  
- Engineer hardcodes workarounds → technical debt → integration nightmare

### The Solution
Build mocked services FIRST, then features can use them:
- Mock email service ready → Auth can send verification emails
- Mock payment API ready → Payment features can process transactions
- Mock AI API ready → Features can use AI capabilities

## Implementation Order

### ❌ WRONG Order (Features First)
```
Batch 1: Auth, User Profile
Batch 2: Payment Features
Batch 3: Mock payment API, Mock email service
```
Result: Engineers blocked, features incomplete

### ✅ RIGHT Order (Mocks First)  
```
Batch 1: Infrastructure + ALL mocked services
Batch 2: Auth (can now use email mock), User Profile  
Batch 3: Payment Features (can now use payment mock)
```
Result: Engineers never blocked, features complete

## Types of Services to Mock

### Common External Services
1. **Email/SMS Services** (SendGrid, Twilio, Resend)
   - Used by: Auth, notifications, reports
   - Mock behavior: Log emails, return success

2. **Payment Processing** (Stripe, PayPal)
   - Used by: Subscriptions, purchases
   - Mock behavior: Approve all transactions, generate fake IDs

3. **AI/LLM APIs** (OpenAI, Anthropic, Perplexity)
   - Used by: Content generation, analysis
   - Mock behavior: Return canned responses

4. **File Storage** (S3, Cloudinary)
   - Used by: User uploads, media
   - Mock behavior: Store locally, return fake URLs

5. **Third-party Data** (APIs, webhooks)
   - Used by: Integrations, data sync
   - Mock behavior: Return test data

## Mock Implementation Guidelines

### Structure
```
src/services/mocks/
├── email-service.mock.ts
├── payment-service.mock.ts
├── ai-service.mock.ts
└── index.ts
```

### Example Mock Service
```typescript
// email-service.mock.ts
export class MockEmailService {
  async sendEmail(to: string, subject: string, body: string) {
    console.log(`[MOCK EMAIL] To: ${to}, Subject: ${subject}`);
    
    // Store for testing
    this.sentEmails.push({ to, subject, body, timestamp: new Date() });
    
    // Simulate async behavior
    await new Promise(resolve => setTimeout(resolve, 100));
    
    return {
      success: true,
      messageId: `mock-${Date.now()}`,
      mock: true
    };
  }
  
  // Helper for tests
  getLastEmail() {
    return this.sentEmails[this.sentEmails.length - 1];
  }
}
```

### Environment Configuration
```typescript
// Use mocks in development/test
const emailService = process.env.NODE_ENV === 'production'
  ? new RealEmailService()
  : new MockEmailService();
```

## Architect's Responsibility

When creating DEPENDENCIES.md, architect MUST:

1. **Identify ALL external services** that features will use
2. **List mocked services in Step 1** of dependency graph
3. **Note which features need which mocks**

Example in DEPENDENCIES.md:
```markdown
### Step 1: Infrastructure & Mocked Services
- Development Environment Setup
- Mock Email Service (needed by Auth, Reports)
- Mock Payment API (needed by Subscriptions)
- Mock AI API (needed by Content Generation)

### Step 2: Features (can build after Step 1)
- Auth Feature (uses Mock Email)
- Subscription Feature (uses Mock Payment)
```

## Orchestrator's Responsibility

1. **Don't pre-plan batches** before seeing DEPENDENCIES.md
2. **Always assign mocks to Batch 1** based on dependencies
3. **Verify mocks are working** before starting Batch 2

## Benefits

1. **No Blocking**: Engineers always have services to code against
2. **Consistent Development**: Same code works in dev/test/prod
3. **Better Testing**: Can control mock behavior for edge cases
4. **Faster Development**: No waiting for external service setup
5. **Cost Savings**: No API calls during development

## Red Flags

Watch for these anti-patterns:
- Mocked services planned for "later"
- Features that "will add service integration later"  
- Hardcoded workarounds instead of proper mocks
- Features built without their service dependencies

## Remember

**If a feature needs an external service, that service (even mocked) must exist FIRST.**

No exceptions. This is not negotiable. Build mocks first, features second.

---
*Mocks first, features second. This is the way.*