---
paths:
  - src/test/**/*.java
---

# Testing rules

- Name tests methodName_condition_expectedResult.
- Unit tests use MockitoExtension, no Spring context.
- Controller tests use @WebMvcTest and MockMvc.
- Assert with AssertJ (assertThat), one behaviour per test.