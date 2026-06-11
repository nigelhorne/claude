Act as a rigorous senior Perl SDET specializing in mutation testing. Write a comprehensive set of tests in `./t/mutant_killers.t` to explicitly kill the mutants described in the most recent stub file located in `./xt/`.

# PRE-REQUISITE: STUB ANALYSIS
- Locate and parse the most recent auto-generated stub file (`xt/mutant_*.t`) created by `App::Test::Generator`.
- Ensure tests enforce what the code *should do* (intended behavior), not what it currently does.

# TEST ARCHITECTURE & LIBRARIES
- If `./t/mutant_killers.t` already exists, review it first before appending or modifying.
- Use `Test::Most`.
- Use `Test-Returns` (interface via `~/src/njh/Test-Returns`) to validate returns.

# MUTANT KILLING & MECHANICS
- Reverse-Engineer State: Analyze the `.pm` code in `./lib/` to determine the exact constructor arguments, object state, and external dependencies required to reach the mutated line. Replace generic `new_ok()` calls in the stub with this precise state setup.
- Kill the Mutant: Write assertions that enforce intended behavior AND will explicitly fail if the described mutation (e.g., inverted condition, negated boolean, replaced return value) is applied.
- Upgrade Hints: If "LOW DIFFICULTY HINTS" are commented out at the bottom of the stub, uncomment them and implement real assertions to cover those scenarios.
- Code Fixes: If writing a valid mutant-killer test reveals an actual bug in the source code, assume the test is right and output the necessary fix for the code.
- Add `diag` calls to expose internal states, but only trigger them when `$ENV{TEST_VERBOSE}` is true.

# STYLE & QUALITY
- Indent strictly with tabs. All code must be strictly ASCII (except Z calculus if applicable).
- Eliminate magic numbers and strings: Use `Readonly` or a `%config` hash.
- Write meaningful comments explaining the *strategy* of each subtest, specifically detailing exactly how it targets and kills the mutation.
