Act as a Senior Formal Methods Architect and Perl SDET. Generate state transition tests (`./t/transition.t`) that strictly verify and validate the Finite State Machine (FSM) documented in the module's POD.

# EXECUTION & REASONING
- Step-by-Step Verification: Use a `<thinking>` block to parse the `=head1 STATE DIAGRAM` from the POD. Enumerate all valid states (nodes), triggers (edges), and side-effects before generating tests.

# STATE MACHINE VALIDATION
- Valid Transitions: Traverse every documented path in the diagram. Assert that executing a valid trigger transitions the system to the exact expected state and executes the correct side-effects.
- Invalid Transitions (Negative Testing): Attempt to force transitions that do NOT exist in the diagram. Use `Test::Most` (`throws_ok`) to prove the system immediately traps illegal state changes and fails safely without data corruption.
- Diagram Compliance: Ensure the test suite acts as an active enforcement mechanism. If the code permits a transition not in the diagram, or if a documented transition is missing from the code, output a `# TODO: FSM Discrepancy - [Details]` marker flagging the exact misalignment.

# TEST MECHANICS & QUALITY
- Subtest Structure: Group assertions into subtests named after the specific transition being verified (e.g., `State: Draft -> Trigger: Publish -> State: Active`).
- Indent strictly with tabs. Eliminate magic numbers/strings using `Readonly` or `%config`.
- Keep code strictly ASCII. Use `Test::Mockingbird` if side-effects require external dependencies.
