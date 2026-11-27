---
name: spring-rest-endpoint
description: Creates a new REST endpoint in this Spring Boot app following the controller-service-repository pattern, with DTOs and tests. Use when the user asks to add, create or expose an API endpoint, route or controller method.
allowed-tools: Read, Grep, Glob, Edit, Write, Bash(./mvnw test:*)
---

# Spring REST endpoint

## Steps

1. Find the right package under src/main/java/com/example/demo/ (Glob for existing controllers).
2. Create or update the DTOs as Java records: <Name>Request and <Name>Response.
3. Add the service method with the business logic. Inject dependencies through the constructor.
4. Add the controller method. Use templates/Controller.java.tmpl as the starting shape.
   - Map only HTTP here: @GetMapping, @PostMapping, validation with @Valid.
   - Return ResponseEntity with the correct status (201 for create, 404 via the exception handler).
5. Add tests from templates/ControllerTest.java.tmpl:
   - A MockMvc controller test for the happy path and one error path.
   - A JUnit 5 + Mockito unit test for the service method.
6. Run ./mvnw test and fix any failures.
7. Run scripts/check-endpoint.sh <path> if the app is running, to hit the endpoint once.

## Rules

- Never return JPA entities from a controller.
- Never put business logic in a controller.
- Errors go through the existing @RestControllerAdvice class.

## Example

Request: "add GET /products/{id}"
Result: ProductResponse record, ProductService.findById, ProductController.getById, ProductControllerTest, ProductServiceTest.