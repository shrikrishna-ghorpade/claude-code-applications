# springboot-app - project memory

## Stack
Spring Boot 3 with Maven. Java version: see pom.xml (do not assume).
Database: H2 in memory for local and tests.

## Commands
- Build:      ./mvnw clean package
- Run:        ./mvnw spring-boot:run   (port 8080)
- All tests:  ./mvnw test
- One test:   ./mvnw test -Dtest=ClassName

## Architecture
controller -> service -> repository. Rules:
- Controllers only map HTTP; no business logic.
- Services hold logic and are the only layer that calls repositories.
- Request and response bodies are DTOs (Java records), never JPA entities.

## Code style
- Constructor injection only; no @Autowired on fields.
- Errors go through one @RestControllerAdvice class.
- Every new endpoint gets a controller test (MockMvc) and a service unit test (JUnit 5 + Mockito).

## Gotchas
- Never edit files under target/; they are generated.
- application.yml must not hold real passwords; use environment variables.

## Subagents in this app
backend-developer, database-developer, api-tester, junit-tester.
See the root CLAUDE.md for how the main session coordinates them.