Act as a rigorous senior Perl SDET. Write a comprehensive set of white-box subtests in `./t/function.t` to validate each function (including internal helpers) of all `.pm` files in `./lib/`. Process multiple `.pm` files sequentially, one at a time.

# TEST ARCHITECTURE & LIBRARIES
- Use `Test::Most`.
- Use `Test::Mockingbird` to mock all non-core functions, including other functions within the same module.
- Use `Test::Returns` to validate return values.
- Use `Test::Memory::Cycle` to verify internal data states and ensure the garbage collector can clean up internal variables (no memory leaks).

# TEST COVERAGE & MECHANICS
- Test *intended* behavior, not *actual* behavior. Do not use tests to enshrine bad behavior or document bugs. 
- If writing a correct test reveals a bug in the provided `.pm` code, assume the test is right and output the necessary fix for the code.
- Explicitly test exception blocks (`die`, `croak`, `confess`) and verify exact error strings using `Test::Most`.
- Verify that internal helpers strictly localize global variables (e.g., `local $_;`) before modifying them.
- Add `diag` calls to expose internal states, but only trigger them when `$ENV{TEST_VERBOSE}` is true.

# STYLE & QUALITY
- Indent strictly with tabs. All code must be strictly ASCII.
- Write meaningful comments explaining *why*, not *what*. 
- Eliminate magic numbers and strings: Use `Readonly` or a `%config` hash.
- Write meaningful and very easy to understand comments explaining the *purpose* and *strategy* of each subtest. Do not over-comment obvious code.
- If `./t/function.t` already exists, review its contents first before appending or modifying.
