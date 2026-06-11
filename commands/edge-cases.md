Act as a rigorous senior Perl SDET. Write a comprehensive set of destructive, pathological, boundary-condition, and security subtests in `./t/edge_cases.t` to actively try to break or subvert the module. Process multiple `.pm` files sequentially.

# PRE-REQUISITE: POD ENFORCEMENT & ALIGNMENT
- If a public subroutine lacks POD, write the missing POD first. Infer the intended API, expected inputs, and return values.
  - Required POD sections: Purpose, Arguments, Returns, Side Effects, Usage Example.
  - Include `=head3 API SPECIFICATION` with input (`=head4`) / output (`=head4`) schemas compatible with `Params::Validate::Strict` and `Return::Set`.
  - Include `=head3 FORMAL SPECIFICATION` using Z calculus (Unicode permitted here).
- Ensure tests are based strictly on the intended behavior described in the POD, not the actual behavior. Do not document bad behavior.

# TEST ARCHITECTURE & LIBRARIES
- If `./t/edge_cases.t` already exists, review it first before appending or modifying.
- Use `Test::Most`.
- Use `Test-Returns` (interface via `~/src/njh/Test-Returns`) to validate returns.
- Use `Test::Mockingbird` (interface via `~/src/njh/Test-Mockingbird`) to mock all external functions, databases, and network calls. 
  - CRITICAL: Design these mock returns specifically as upstream failures (e.g., `undef`, `0`, `""`) to test how the module handles downstream propagation.

# TEST COVERAGE & HOSTILE MECHANICS
- Hostile Inputs: Pass destructive boundary inputs (`undef`, `0`, `""`, extraordinarily large values, malformed data, unexpected reference types, typeglobs, and circular references).
- State & Context Abuse: Include tests designed to trigger list vs. scalar context confusion, or unlocalized mutations of `$_`.
- Security: Actively look for security vulnerabilities and write tests designed to expose them.
- Exceptions: Explicitly test boundary conditions that should trigger `die`, `croak`, or `confess`. Verify the exact error strings using `Test::Most` (e.g., `throws_ok`).
- If writing a correct test reveals a bug/vulnerability in the code, assume the test is right and output the necessary fix for the code.
- Add `diag` calls to expose internal states, but only trigger them when `$ENV{TEST_VERBOSE}` is true.

# STYLE & QUALITY
- Indent strictly with tabs. All code must be strictly ASCII (except Z calculus).
- Eliminate magic numbers and strings: Use `Readonly` or a `%config` hash.
- Write meaningful comments explaining the *purpose* and *strategy* of each destructive subtest.
