Critique this code - think of new comments, improvements, Z notation specification, edge case handling with carp/croak and anything else to improve it.
Act as a ruthless but constructive senior Perl engineer. Look at the files in lib/, t/ and bin/. Your task is to critique the code, improve its architecture, add formal specifications, and output a complete, refactored version of the file.

- Make it clear where you're making the changes
- Use croak and carp instead of warn and die for packages (not CLIs).
- Comment thoroughly (at least one, simple, easy-to-read comment every 5 lines).
- Each public routine (i.e. ones not starting with \_) must document in its POD its purpose, the arguments it takes, what it returns, its side effects (if any) and other notes. It must include an example of usage.  Include in the POD a =head3 of API specification: schema compatible with Params::Validate::Strict and Return::Set for input (=head4) and output (=head4) respectively.  Include a =head3 MESSAGES to contain a able of all error messages and warnings the method can produce, what they mean and what to do when they appear.
- Include =head3 FORMAL SPECIFICATION, which is a formal specification using Z calculus.
- I don't need PODs for helper and internal routines that start with \_; however, I do need comments before the routine, including purpose, entry criteria, exit status, side effects (if any) and notes (if any).
- All code and PODs must be strictly ASCII only, except for the Z calculus in the =head3 FORMAL SPECIFICATION which may use appropriate Unicode mathematical symbols.
- Use Params::Get and Params::Validate::Strict for public routines.
- Indent with tabs, not 4 spaces (Perl::Critic is wrong on this)
- Return arrayrefs rather than arrays where possible.
- Don't have magic numbers or magic strings.  Use a hash named %config that can be configured by Object::Configure if wanted, and Readonly where possible.
- As well as strict and warnings, have this statement "use autodie qw(:all);"
- When all of the return paths of a public method have no specfic return value (i.e. they say "return;"), make all of the paths return $self to allow chaining of methods.
- Avoid goto.
- Run `extract-schemas --strict-pod=fatal` to help diagnose and fix POD errors
- Always write a single line for the changelog for each new feature or fix. Place the changelog line at the very top of its response, separate from the code block.
- Do not bump version numbers in the code, but it's OK to preannounce in the changelog by adding entries in there for what will be in the next release.
- Make bug fixes, code improvements, and replace code that is the reimplementation of another CPAN module which can therefore be replaced by a call to that module.
- For all new code or bug fixes, add a test case, and if the code is publically facing, update the POD.
- Point out spelling and grammitical mistakes in documentation, comments, POD and error messages.
- Show unused variables and ineffecient code.
- Add code to ensure the private methods are truly protected (i.e. only callable from the class or its subclasses) except for when they are called during white-box testing.  They should croak when an invalid call is made.
- Ensure terminology used in messages is consistent
- Try hard to remove the exit paths from each routine, that is to say, the number of return statements a routine has.  All routines of 10 or fewer lines should have no more than 1 return statement. Reducing the number of die/croaks would all help to make the code easier to follow, but may be very hard to do.
- Test the code with various locals and locales, including English, French, German and Mandarin. Test the code under two distinct dimensions of "locale":

1. Geographic locale (GeoIP country detection)

Write, or update, a test file t/locales.t that exercises country-based access-control rules using real country detection for the following language regions: English (GB and US), French (FR), German (DE), and Mandarin (CN).
- Begin with a sanity subtest that verifies each relevant test resolves to the expected ISO country code. Use BAIL\_OUT if any mapping has changed, to make GeoIP database drift fail fast and obviously.
- Cover: case-insensitive country codes and concurrent independent instances.

2. System locale (POSIX LC\_ALL / LANG)

For every test that exercises an error path, or generate a message, particularly paths that produce a die/croak message containing an OS error string (e.g. a missing config file, a failed open) — run the same test with local $ENV{LC\_ALL} set to at least en\_US.UTF-8 and de_\DE.UTF-8 and one east Asian language.

- Do not use POSIX::strerror(ENOENT) to build the expected regex. Use local $! = ENOENT; my $msg = "$!" instead — this sources the string from Perl's own $! layer, which is what ends up in the thrown exception, and avoids divergence between the C library's locale and Perl's locale on mixed-locale systems.
- Verify that error messages match (or are at least thrown) under both locales. A test that passes only on the developer's locale is not a passing test.
