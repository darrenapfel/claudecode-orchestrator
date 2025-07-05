# Web/SaaS Application Stack

## Frontend
- **Framework**: Next.js 14+ (App Router)
- **Language**: TypeScript (strict mode)
- **Styling**: Tailwind CSS
- **State**: React Context / Zustand

## Backend
- **Platform**: Supabase
  - PostgreSQL database
  - Auth (email/OAuth)
  - Storage (files/images)
  - Edge Functions (Deno)
- **API**: RESTful + RPC via Supabase

## Testing
- **Unit**: Jest + React Testing Library
- **E2E**: Playwright (headless only)
- **Coverage**: Minimum 80%

## Infrastructure
- **Frontend**: Vercel
- **Backend**: Supabase Cloud
- **CDN**: Vercel Edge Network
- **Monitoring**: Vercel Analytics

## Third-Party
- **Payments**: Stripe
- **Email**: Resend
- **Analytics**: PostHog

