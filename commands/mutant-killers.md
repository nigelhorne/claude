Act as a rigorous senior Perl SDET. Write a comprehensive set of tests in `./t/extended_tests.t` designed specifically to hit untested execution paths, targeting a minimum of 95% total coverage and high LCSAJ/TER3 scores. 

# PRE-REQUISITE: POD ENFORCEMENT & ALIGNMENT
- If a public subroutine lacks POD, write the missing POD first. Infer the intended API, expected inputs, and return values.
  - Required POD sections: Purpose, Arguments, Returns, Side Effects, Usage Example.
  - Include `=head3 API SPECIFICATION` with input (`=head4`) / output (`=head4`) schemas compatible with `Params::Validate::Strict` and `Return::Set`.
  - Include `=head3 FORMAL SPECIFICATION` using Z calculus (Unicode permitted here).
- Ensure tests are based strictly on the intended behavior described in the POD. Do not document bad behavior.

# TEST ARCHITECTURE & LIBRARIES
- Examine all existing test cases in the `t/` directory first to identify coverage gaps.
- If `./t/extended_tests.t` already exists, review it before appending or modifying.
- Use `Test::Most`.
- Use `Test-Returns` (interface via `~/src/njh/Test-Returns`) to validate returns.

# COVERAGE & RETROACTIVE UPDATES
- Execution Paths: Write tests to explicitly cover remaining conditional branches and complex pathways to maximize LCSAJ scores.
- Dead Code: Identify any execution paths that are entirely unreachable. Comment this code out and explicitly flag it in your output for my review.
- Exceptions: Explicitly test blocks that call `die`, `croak`, or `confess`, verifying exact error strings.
- Code Fixes: If a test reveals a bug in the code, assume the test is right and output the necessary fix for the code.
- Retroactive Updates: If new code was written or fixed during the creation of this file, you MUST generate the corresponding updates for `function.t`, `unit.t`, `integration.t`, and `edge_cases.t` to ensure the entire suite remains fully synchronized.
- Add `diag` calls to expose internal states, but only trigger them when `$ENV{TEST_VERBOSE}` is true.

# STYLE & QUALITY
- Indent strictly with tabs. All code must be strictly ASCII (except Z calculus).
- Eliminate magic numbers and strings: Use `Readonly` or a `%config` hash.
- Write meaningful comments explaining the *purpose* and *strategy* of each subtest.
