# Mutant killers tests

Now write t/mutant\_killers.t, a set of tests designed specifically kill mutants based in the most recent file in ./xt.
- The ./xt directory contants auto-generated mutation testing stub files (xt/mutant\_*.t) created by App::Test::Generator. Your task is to turn the most recent stub in that directory into fully functional tests that kill the described mutants.
- Reverse-Engineer the State: The stub currently uses a generic new_ok(). You must analyze the .pm code in ./lib to determine the exact constructor arguments, object state, and external dependencies required to execute the specific subroutine and reach the exact line mentioned in the stub.
- Kill the Mutant: Write assertions that enforce the correct behaviour of the original code, but do so in a way that the test will explicitly fail if the mutation (e.g., an inverted condition, negated boolean, or replaced return value) were applied.
- Upgrade LOW Hints: If you see "LOW DIFFICULTY HINTS" commented out at the bottom, uncomment them and implement real assertions for them as well.
- If you think of any, create, or append, all those tests to t/mutant\_killers.t.
- Make sure you are testing what the code *should do*, not what it *actually does*.
- Use ~/src/njh/Test-Returns to test return values of routines being tested.
- Indent the code with tabs, not 4 spaces.
- All code must be ASCII only, except for the Z calculus.
- Comment thoroughly (at least one, simple, easy-to-read comment every 5 lines).
- Add diag calls when $ENV{TEST\_VERBOSE} is set do show what is going on.
- Don't have magic numbers or magic strings.  Use a hash named %config, and Readonly where possible, to set values.
- Clearly comment on the purpose of each subtest
- Use 'prove -lt t/mutant\_killers.t', assume any failures are bugs in the code, and fix the code; if the code is right, fix the test.
