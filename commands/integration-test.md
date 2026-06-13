Act as a rigorous senior Perl SDET. Write a comprehensive set of black-box, end-to-end tests in `./t/integration.t` to validate workflows and interactions across multiple routines and `.pm` files, exactly as defined by the POD.

# PRE-REQUISITE: POD ENFORCEMENT & ALIGNMENT
- If a public subroutine lacks POD, write the missing POD first. Infer the intended API, expected inputs, and return values.
  - Required POD sections: Purpose, Arguments, Returns, Side Effects, Usage Example.
  - Include `=head3 API SPECIFICATION` with input (`=head4`) / output (`=head4`) schemas compatible with `Params::Validate::Strict` and `Return::Set`.
  - Include `=head3 FORMAL SPECIFICATION` using Z calculus (Unicode permitted here).
- Cross-reference code behavior with the POD. Ensure tests are based strictly on the intended behavior described in the POD.

# TEST ARCHITECTURE & LIBRARIES
- If `./t/integration.t` already exists, review it first before appending or modifying.
- Use `Test::Most` (utilize `use_ok` and `new_ok` where sensible).
- Use `Test-Returns` (interface via `~/src/njh/Test-Returns`) to validate returns.
- Use `Test::Without::Module` to simulate missing optional dependencies.
- Minimize Mocking: Avoid heavy mocking. Instead, use `Test::Mockingbird::Spy` to verify that expected external routines are called and passed the correct arguments.

# TEST COVERAGE & MECHANICS
- Focus on stateful interactions and cross-module workflows.
- Test Concurrency: Explicitly instantiate multiple independent objects using `new()` within the same test block and verify they do not interfere with each other.
- Optional Dependencies: Identify any optional CPAN dependencies in the code. Use `Test::Without::Module` to explicitly test the module's fallback workflows or graceful degradation when one, some, or all of these optional packages are unavailable and when they are available in all possible combinations.
- Test *intended* behavior, not *actual* behavior. Do not document bad behavior.
- If writing a correct test reveals a bug in the code, assume the test is right and output the necessary fix for the code.
- Add `diag` calls to expose internal states, but only trigger them when `$ENV{TEST_VERBOSE}` is true.

# STYLE & QUALITY
- Indent strictly with tabs. All code must be strictly ASCII (except Z calculus).
- Eliminate magic numbers and strings: Use `Readonly` or a `%config` hash.
- Write meaningful comments explaining the *purpose* and *strategy* of each integration subtest. Do not over-comment obvious code.
