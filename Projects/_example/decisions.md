---
date: 2026-03-17
type: decisions
project: example
---

# Example Project -- Decisions

## ADR-001: Use Express over Fastify (2026-03-16)
- **Status**: accepted
- **Context**: Needed a Node.js HTTP framework. Team has Express experience.
- **Decision**: Use Express for the REST API.
- **Consequences**: Slower than Fastify, but faster onboarding and more middleware available.

## ADR-002: JWT for authentication (2026-03-17)
- **Status**: accepted
- **Context**: Need stateless auth for horizontal scaling.
- **Decision**: Use JWT tokens with short expiry + refresh tokens.
- **Consequences**: No server-side session storage needed. Must handle token rotation.
