# Security rules (always loaded)

- Never print, log or commit secrets, tokens or passwords.
- Read config secrets from environment variables only.
- Validate every request body with @Valid and Bean Validation annotations.
- Never build SQL by string concatenation; use JPA methods or parameters.