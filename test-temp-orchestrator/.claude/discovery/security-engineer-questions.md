# Security Engineer Discovery Questions

## Core Questions Template

When given a high-level request, ask UP TO 3 clarifying questions (0-3 questions is acceptable):

### 1. Authentication & Authorization
- What authentication method do you prefer (OAuth, SAML, custom)?
- Do you need multi-factor authentication (MFA)?
- How granular should role-based access control be?

### 2. Data Sensitivity & Compliance
- What type of sensitive data will be handled (PII, financial, health)?
- Are there specific compliance requirements (GDPR, HIPAA, PCI-DSS)?
- Do you need data encryption at rest and in transit?

### 3. Security Standards & Frameworks
- Do you follow specific security frameworks (OWASP, NIST)?
- Are there corporate security policies to adhere to?
- Do you require security certifications (SOC2, ISO 27001)?

## Example Output Format
```markdown
## Security Discovery Questions

*Note: Asking 0-3 questions based on what's unclear from the request*

1. **Authentication Requirements**: What authentication method should we implement? (e.g., OAuth 2.0, SAML, username/password with MFA)

2. **Data Classification**: What types of sensitive data will this system handle? (e.g., personal information, payment data, health records)

3. **Compliance Needs**: Are there specific compliance standards we must meet? (e.g., GDPR, HIPAA, SOC2)
```
