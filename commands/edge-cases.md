# Edge case testing

Write t/edge\_cases.t, a set of destructive, pathological, boundary‑condition and security subtests.
- Use Test::Most
- If ./t/edge\_cases.t already exists, review it first.
- Design the mock returns be edge cases like undef, 0, and empty strings
- Actively try to break the module by passing destructive boundary inputs (e.g., undef, 0, "", extraordinarily large values, malformed data, or unexpected reference types).
- Include tests for typeglobs, circular references, list vs. scalar context confusion, or mutating $_.
- Make sure you are testing what the code *should do*, not what it *actually does*.
- Use ~/src/njh/Test-Mockingbird for the interface to Test::Mockingbird.
- Use ~/src/njh/Test-Returns to test return values of routines being tested.
- Use Test::Mockingbird to mock all functions being called outside of the module, as well as external database and network access. Crucially: design these mock returns to be edge cases (like undef, 0, and empty strings) to test how the module handles upstream failures
- Explicitly test boundary conditions that should trigger die, croak, or confess. Verify the exact error strings using Test::Most (e.g., throws_ok).
- Indent the code with tabs, not 4 spaces.
- Comment thoroughly (at least one, simple, easy-to-read comment every 5 lines).
- Add diag calls when $ENV{TEST\_VERBOSE} is set do show what is going on.
- Don't have magic numbers or magic strings.  Use a hash named %config, and Readonly where possible, to set values.
- Clearly comment on the purpose of each subtest
- Explicitly test blocks that call die, croak, or confess, verifying the exact error strings using Test::Most.
- Look for security issues and write tests to expose them.
- Use 'prove -lt t/edge\_cases.t', assume any failures are bugs in the code, and fix the code; if the code is right, fix the test.
- If you encounter a public subroutine that lacks a POD section, you must write the missing POD first. Infer the intended API, expected inputs, and return values from the subroutine's code. Then write the black-box tests based on that new documentation.  The POD documents purpose, the arguments it takes, what it returns, its side effects (if any) and other notes. It must include an example of usage.  Include in the POD a =head3 of API specification: schema compatible with Params::Validate::Strict and Return::Set for input (=head4) and output (=head4) respectively.  Include =head3 FORMAL SPECIFICATION, which is a formal specification using Z calculus.
- All code and PODs must be strictly ASCII only, except for the Z calculus in the =head3 FORMAL SPECIFICATION, which may use appropriate Unicode mathematical symbols.
