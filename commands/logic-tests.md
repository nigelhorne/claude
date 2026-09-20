Act as a Senior Formal Methods Architect and Perl SDET. Generate comprehensive logic tests (`./t/logic.t`) to mathematically prove the codebase's boolean expressions, state invariants, and syllogistic premises.

# EXECUTION & REASONING
- Step-by-Step Verification: Use a `<thinking>` block to extract the formal truth tables, system invariants (Major Premises), and state transition rules (from the Z calculus spec) before writing assertions.

# LOGICAL PROOFS & ASSERTIONS
- Truth Table Exhaustion: Generate test cases for every combinatorial permutation of the module's boolean expressions and conditional logic gates. Prove the math works under De Morgan's laws.
- Invariant Validation: Assert that the required mathematical state (the System Invariant) holds strictly true before, during, and after data manipulation.
- Contradiction Trapping: Intentionally inject logically contradictory states (e.g., inputs that violate a documented Major Premise). Use `Test::Most` (`throws_ok`) to prove these logical impossibilities are caught instantly by guard clauses (Fail Fast).

# TEST MECHANICS & QUALITY
- Subtest Structure: Group assertions into distinct subtests named after the specific syllogism or logical rule being proven.
- Self-Documenting: Include brief plain-English comments above complex assertions explaining the logic premise being tested.
- Indent strictly with tabs. Eliminate magic numbers/strings using `Readonly` or `%config`.
- Keep code strictly ASCII.
