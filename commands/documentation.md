Act as a Senior Technical Writer and Perl Architect. Generate or thoroughly update the POD documentation for the provided code.

# EXECUTION & AUDIENCE
- Step-by-Step Verification: Use a `<thinking>` block to translate complex code logic into simple, jargon-free concepts before generating POD.
- Extreme Clarity: Write in crystal-clear, basic English. The documentation MUST be effortlessly understood by non-Perl programmers, absolute beginners to this codebase, and non-native English speakers (ESL).

# REQUIRED POD SECTIONS
- SYNOPSIS: Provide multiple distinct, real-world usage patterns (do not just show basic instantiation).
- COMMON PITFALLS: Include a `=head1 COMMON PITFALLS` section explicitly warning users about gotchas like nested merge behavior, `undef` handling, and unexpected side effects.
- API & SPECIFICATIONS: Include `=head3 API SPECIFICATION` schemas (compatible with `Params::Validate::Strict` and `Return::Set`) and `=head3 FORMAL SPECIFICATION` (Z calculus).

# STYLE & STANDARDS
- Ensure strict POD formatting (as if verified by `extract-schemas --strict-pod=fatal`).
- Keep all text strictly ASCII, except for Z calculus blocks.
