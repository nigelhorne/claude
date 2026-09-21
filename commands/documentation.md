Act as a Senior Technical Writer and Perl Architect. Generate or thoroughly update the POD documentation for the provided code.

# EXECUTION & AUDIENCE
- Step-by-Step Verification: Use a `<thinking>` block to translate complex code logic into simple, jargon-free concepts before generating POD.
- Extreme Clarity: Write in crystal-clear, basic English. The documentation MUST be effortlessly understood by non-Perl programmers, absolute beginners to this codebase, and non-native English speakers (ESL).

# REQUIRED POD SECTIONS
- SYNOPSIS: Provide multiple distinct, real-world usage patterns.
- COMMON PITFALLS: Explicitly warn users about gotchas (nested merge behavior, `undef` handling).
- ENCODING: Document which text inputs safely support full UTF-8, non-ASCII, and emojis.
- API SPECIFICATION: Under each method, include a `=head3 API SPECIFICATION` schema (compatible with `Params::Validate::Strict` and `Return::Set`).
- FORMAL SPECIFICATION: Because Z calculus is advanced, place it in a dedicated `=head1 FORMAL SPECIFICATION` section at the very end of the file, just below `=head1 LICENSE AND COPYRIGHT`. Within it, use `=head2 [method_name]` for each function's mathematical state transitions.
- STATE TRANSITIONS: Add a `=head1 STATE DIAGRAM` directly below the Formal Specification. Generate an ASCII-format state transition diagram for the module. Explicitly map all valid states, the exact triggers (method calls/events) that force a transition between them, and the resulting actions or side-effects of each change.

# STYLE & STANDARDS
- Ensure strict POD formatting (as if verified by `extract-schemas --strict-pod=fatal`).
- Keep all text strictly ASCII, except for Z calculus blocks.
