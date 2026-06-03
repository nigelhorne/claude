# Unit level testing

Write t/unit.t, a set of black-box subtests to test each public function exactly as defined by its API documentation in the POD.
- Use Test::Most
- If ./t/function.t already exists, review it first.
- If there is more than one .pm, do it .pm by .pm one at a time, as a standalone function.
- Use Test::Mockingbird to mock all functions being called outside of the module as well as external database and network access
- Design the mock returns to force the code through every conditional branch
- Cross-reference the behaviour with the POD and review differences between the POD and the code.
- Make sure you are testing what the code *should do*, not what it *actually does*.
- Don't use the tests to document bad behaviour.
- Use ~/src/njh/Test-Mockingbird for the interface to Test::Mockingbird.
- Use ~/src/njh/Test-Returns to test return values of routines being tested.
- Indent the code with tabs, not 4 spaces.
- All code must be ASCII only, except for the Z calculus.
- Comment thoroughly (at least one, simple, easy-to-read comment every 5 lines).
- Add diag calls when $ENV{TEST\_VERBOSE} is set do show what is going on.
- Don't have magic numbers or magic strings.  Use a hash named %config, and Readonly where possible, to set values.
- Clearly comment on the purpose of each subtest
- Explicitly test blocks that call die, croak, or confess, verifying the exact error strings using Test::Most.
- Use 'prove -lt t/unit.t', assume any failures are bugs in the code, and fix the code; if the code is right, fix the test.
- Check that the documentation correctly reflects the behaviour of the code.
- If you encounter a public subroutine that lacks a POD section, you must write the missing POD first. Infer the intended API, expected inputs, and return values from the subroutine's code. Then write the black-box tests based on that new documentation.  The POD documents purpose, the arguments it takes, what it returns, its side effects (if any) and other notes. It must include an example of usage.  Include in the POD a =head3 of API specification: schema compatible with Params::Validate::Strict and Return::Set for input (=head4) and output (=head4) respectively.  Include =head3 FORMAL SPECIFICATION, which is a formal specification using Z calculus.
