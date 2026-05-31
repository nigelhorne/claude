# Integration level testing

Write integration.t, a set of subtests to black‑box, end‑to‑end behaviour across multiple routines, including the entire package, according to the POD documentation.
- Add as many stateful and integration tests with other packages as possible across the .pms in this package, if there is more than one.
- This is to test the modules' workflows and interaction with other modules.
- Use use\_ok and new\_ok where possible and sensible to do.
- There should be less mocking at this stage.
- Check the concurrency of multiple instances of the objects in the code, all created using new() in the same code.
- By all means, use Test::Mockingbird::Spy to check that the expected external routines are being called, and being called with the right arguments
- Use Test::Most
- If ./t/integration.t already exists, review it first.
- Cross-reference the behaviour with the POD and review differences between the POD and the code.
- Make sure you are testing what the code *should do*, not what it *actually does*.
- Don't use the tests to document bad behaviour.
- Use ~/src/njh/Test-Returns to test return values of routines being tested.
- Indent the code with tabs, not 4 spaces.
- All code must be ASCII only, except for the Z calculus.
- Comment thoroughly (at least one, simple, easy-to-read comment every 5 lines).
- Add diag calls when $ENV{TEST\_VERBOSE} is set do show what is going on.
- Don't have magic numbers or magic strings.  Use a hash named %config, and Readonly where possible, to set values.
- Clearly comment on the purpose of each subtest
- Use 'prove -lt t/integration.t', assume any failures are bugs in the code, and fix the code; if the code is right, fix the test.
- If you encounter a public subroutine that lacks a POD section, you must write the missing POD first. Infer the intended API, expected inputs, and return values from the subroutine's code. Then write the black-box tests based on that new documentation.  The POD documents purpose, the arguments it takes, what it returns, its side effects (if any), and other notes. It must include an example of usage.  Include in the POD a =head3 of API specification: schema compatible with Params::Validate::Strict and Return::Set for input (=head4) and output (=head4) respectively.  Include =head3 FORMAL SPECIFICATION, which is a formal specification using Z calculus.
