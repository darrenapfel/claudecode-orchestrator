# System Architecture Map
*Last updated: [DATE] by Architect*

## Overview
[High-level description of the system's purpose and main architectural style]

## Component Diagram
```
[ASCII art or Mermaid diagram showing main components and their relationships]

Example format:
┌─────────────────┐     ┌─────────────────┐
│   Component A   │────▶│   Component B   │
│   (Technology)  │     │   (Technology)  │
└─────────────────┘     └─────────────────┘
```

## Components

### Frontend Layer
- **Technology**: [e.g., Next.js 14, React 18]
- **Purpose**: [User interface and client-side logic]
- **Key Features**:
  - [Feature 1]
  - [Feature 2]

### API Layer
- **Technology**: [e.g., Express, tRPC, GraphQL]
- **Purpose**: [Business logic and data orchestration]
- **Endpoints**: [Link to API documentation]

### Data Layer
- **Technology**: [e.g., PostgreSQL, Redis]
- **Purpose**: [Data persistence and caching]
- **Schema**: [Link to schema documentation]

### External Services
- **Service 1**: [Purpose and integration method]
- **Service 2**: [Purpose and integration method]

## Communication Patterns
- **Frontend ↔ API**: [REST/GraphQL/tRPC/WebSocket]
- **API ↔ Database**: [Direct/ORM/Query Builder]
- **Inter-Service**: [HTTP/gRPC/Message Queue]

## Key Architectural Patterns
1. **Pattern Name**: [Description and where it's used]
2. **Pattern Name**: [Description and where it's used]

## Deployment Architecture
```
[Diagram showing deployment topology]
```

## Security Boundaries
- **Public Zone**: [What's exposed to internet]
- **Private Zone**: [Internal services]
- **Data Zone**: [Database and storage]

## Performance Characteristics
- **Expected Load**: [Requests/second, concurrent users]
- **Response Time Targets**: [API: <200ms, Page Load: <3s]
- **Scaling Strategy**: [Horizontal/Vertical, Auto-scaling rules]

## Monitoring Points
- **Application Metrics**: [What's being monitored]
- **Infrastructure Metrics**: [What's being monitored]
- **Business Metrics**: [What's being monitored]

## Known Limitations
- [Limitation 1 and mitigation strategy]
- [Limitation 2 and mitigation strategy]

## Future Considerations
- [Planned architectural changes]
- [Scalability preparations]
- [Technical debt to address]
