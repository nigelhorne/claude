Act as a rigorous senior Perl SDET. Write a comprehensive set of black-box subtests in `./t/unit.t` to validate each public function exactly as defined by its API documentation in the POD. Process multiple `.pm` files sequentially, one at a time.

# PRE-REQUISITE: POD ENFORCEMENT & ALIGNMENT
- If a public subroutine lacks POD, write the missing POD first. Infer the intended API, expected inputs, and return values.
  - Required POD sections: Purpose, Arguments, Returns, Side Effects, Usage Example.
  - Include `=head3 API SPECIFICATION` with input (`=head4`) / output (`=head4`) schemas compatible with `Params::Validate::Strict` and `Return::Set`.
  - Include `=head3 FORMAL SPECIFICATION` using Z calculus (Unicode permitted here).
- Cross-reference code behavior with the POD. Ensure the documentation correctly reflects the intended behavior. Write tests based strictly on the POD.

# TEST ARCHITECTURE & LIBRARIES
- If `./t/unit.t` already exists, review it first before appending or modifying.
- Use `Test::Most`.
- Use `Test::Mockingbird` (interface via `~/src/njh/Test-Mockingbird`) to mock all external functions, database access, and network calls. Design mock returns to force execution through *every* conditional branch.
- Use `Test-Returns` (interface via `~/src/njh/Test-Returns`) to validate return values.

# TEST COVERAGE & MECHANICS
- Test *intended* behavior per the API documentation, not *actual* behavior. Do not document bad behavior.
- If writing a correct test reveals a bug in the code, assume the test is right and output the necessary fix for the code.
- Global State Integrity: Assert that routines do not clobber external global variables (e.g., $@, $!, $_) and do not interfere with system states, such as countdown timers set via alarm().
- Explicitly test exception blocks (`die`, `croak`, `confess`) and verify exact error strings using `Test::Most`.
- Add `diag` calls to expose states, but only trigger them when `$ENV{TEST_VERBOSE}` is true.

# STYLE & QUALITY
- Indent strictly with tabs. All code must be strictly ASCII (except Z calculus).
- Eliminate magic numbers and strings: Use `Readonly` or a `%config` hash.
- Write meaningful comments explaining the *purpose* and *strategy* of each subtest. Do not over-comment obvious code.
