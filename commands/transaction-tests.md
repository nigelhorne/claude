Act as a Senior Perl SDET and Database Architect. Generate comprehensive transaction-flow tests (e.g., `./t/transaction.t`) for the provided Perl codebase.

# EXECUTION & REASONING
- Step-by-Step Verification: Use a `<thinking>` block to map the lifecycle of the data entities, identifying multi-step business transactions, state machine transitions, and required rollback points before writing tests.

# TRANSACTION & LIFECYCLE TARGETS
- Multi-Step Integrity: Design tests that walk an entity through its entire lifecycle (e.g., Create -> Validate -> Process -> Complete). Verify state consistency at every boundary.
- Mid-Flight Failure & Rollbacks: Use `Test::Mockingbird` to intentionally fail transactions halfway through their execution. Explicitly assert that the system catches the error, rolls back any partial state changes or database commits, and leaves no orphaned data or dangling file handles.
- Idempotency Checks: Force the same transaction sequence to run multiple times consecutively. Assert that the subsequent runs return the cached/existing state without throwing duplicate-key errors or corrupting the initial data.
- Race Conditions & TOCTOU: Target Time-of-Check to Time-of-Use (TOCTOU) vulnerabilities. Simulate scenarios where a mocked external process alters, locks, or deletes a file/resource immediately after your code validates its existence but before the read/write execution. Assert that file locking (e.g., `flock`) is strictly enforced and concurrency collisions fail cleanly.

# TEST MECHANICS & QUALITY
- Treat each subtest as a distinct lifecycle phase. Use `Test::Most` and `Test-Returns` for state assertions.
- Indent strictly with tabs. Eliminate magic numbers/strings using `Readonly` or `%config`.
- Keep code strictly ASCII. Do not test individual functions in isolation; test the sequence.
