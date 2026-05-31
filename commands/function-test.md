# Function level testing

Write ./t/function.t, a set of white-box subtests to test each function, including internal helpers:
- Use Test::Most
- If ./t/function.t already exists, review it first.
- If there is more than one .pm, do it .pm by .pm one at a time, as a standalone function.
- Use Test::Mockingbird to mock all non-core functions being called, even those in this module.
- Make sure you are testing what the code *should do*, not what it *actually does*.
- Don't use the tests to document bad behaviour.
- Use ~/src/njh/Test-Mockingbird for the interface to Test::Mockingbird.
- Use ~/src/njh/Test-Returns to test return values of routines being tested.
- Indent the code with tabs, not 4 spaces.
- All code must be ASCII only.
- Comment thoroughly (at least one, simple, easy-to-read comment every 5 lines).
- Add diag calls when $ENV{TEST\_VERBOSE} is set do show what is going on.
- Don't have magic numbers or magic strings.  Use a hash named %config, and Readonly where possible, to set values.
- Clearly comment on the purpose of each subtest
- Explicitly test blocks that call die, croak, or confess, verifying the exact error strings using Test::Most.
- Verify that internal helpers do not clobber global variables like $_ without localizing them first.
- Test internal data states using Test::Memory::Cycle to ensure the garbage collector can clean up the function's internal variables.
- Use 'prove -lt t/function.t', assume any failures are bugs in the code, and fix the code; if the code is right, fix the test.
