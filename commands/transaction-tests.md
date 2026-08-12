Act as a Senior Perl SDET and Database Architect. Generate comprehensive transaction-flow tests (e.g., `./t/transaction.t`) for the provided Perl codebase.

# EXECUTION & REASONING
- Step-by-Step Verification: Use a `<thinking>` block to map the lifecycle of the data entities, identifying multi-step business transactions, state machine transitions, and required rollback points before writing tests.

# TRANSACTION & LIFECYCLE TARGETS
- Multi-Step Integrity: Design tests that walk an entity through its entire lifecycle (e.g., Create -> Validate -> Process -> Complete). Verify state consistency at every boundary.
- Mid-Flight Failure & Rollbacks: Use `Test::Mockingbird` to intentionally fail transactions halfway through their execution. Explicitly assert that the system catches the error, rolls back any partial state changes or database commits, and leaves no orphaned data or dangling file handles.
- Idempotency Checks: Force the same transaction sequence to run multiple times consecutively. Assert that the subsequent runs return the cached/existing state without throwing duplicate-key errors or corrupting the initial data.

# TEST MECHANICS & QUALITY
- Treat each subtest as a distinct lifecycle phase. Use `Test::Most` and `Test-Returns` for state assertions.
- Indent strictly with tabs. Eliminate magic numbers/strings using `Readonly` or `%config`.
- Keep code strictly ASCII. Do not test individual functions in isolation; test the sequence.
