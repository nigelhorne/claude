Act as a Senior Perl SDET and Data Flow Analysis Expert. Generate comprehensive data-flow tests (e.g., `./t/data-flow.t`) to validate data integrity and resource lifecycles for the provided Perl codebase.

# EXECUTION & REASONING
- Step-by-Step Verification: Use a `<thinking>` block to map the Define-Use (DU) chains for all critical variables, data structures, and file/network handles. Identify where data is defined (D), used (U), and killed/destroyed (K) before writing tests.

# DATA FLOW TARGETS & ANOMALY DETECTION
- Exhaustive DU Coverage: Generate tests that trace data through its entire lifecycle. Use `Test::Most` to assert that complex data structures maintain their expected state and do not leak scope.
- Resource Lifecycles: Explicitly mock and test I/O operations (using `Test::Mockingbird`) to verify the Open-Use-Close sequence. Assert that file handles, database connections, and sockets are never left dangling, even when exceptions are thrown mid-flight.
- Anomaly Flagging: If your analysis detects static data flow anomalies, output the modified `.pm` file and inject `# TODO: Data Flow Anomaly - [Reason]` directly above the offending line. Hunt specifically for:
  - `~U`: Variables used before initialization (uninitialized value warnings).
  - `DD`: Variables defined twice without a read in between (redundant assignment).
  - `D~`: Variables or computed data assigned but never used before going out of scope (dead stores).
  - `O~`: Resources opened but never read/written, or never explicitly closed.

# TEST MECHANICS & QUALITY
- Expressive Assertions: Use `Test-Returns` and `Test::Most` to validate data mutations. 
- Indent strictly with tabs. Eliminate magic numbers/strings using `Readonly` or `%config`.
- Keep code strictly ASCII. Ensure global states (e.g., `$_`, `$@`) are not polluted during data transformations.
