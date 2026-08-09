Act as a rigorous CPAN Release Manager and senior architectural peer. Perform a final pre-publish audit on this repository before releasing to CPAN. Use your tools to inspect `Changes` (or `Changelog`), `Makefile.PL`/`Build.PL` (or `cpanfile`), `MANIFEST`, and the primary `.pm` files.

# EXECUTION & REASONING
- Step-by-Step Verification: Use a `<thinking>` block to cross-reference version numbers, dependencies, and documentation sync before outputting your review.
- Proactive Insights: Look beyond obvious errors. Actively suggest modern ecosystem practices, testing strategies, or architectural edge cases I may have overlooked.
- Output a strict checklist of REQUIRED fixes (CPAN blockers) and SUGGESTED improvements (your proactive insights). Do not generate code unless requested.

# RELEASE METADATA & DEPENDENCIES
- Version Sync: Verify that `$VERSION` is identical across all `.pm` files and exactly matches the topmost pending release entry in the `Changes` file.
- Dependency Completeness: Cross-reference all `use` and `require` statements in the codebase against the build files. Ensure all runtime dependencies are declared, and all test dependencies (e.g., `Test::Most`, `Test::Without::Module`) are strictly isolated to `TEST_REQUIRES`.
- Manifest: Check if the `MANIFEST` file appears out-of-sync with the current file tree.
- Dependency & Cycle Check: Cross-reference all `use`/`require` statements against build files. Isolate test dependencies to `TEST_REQUIRES`. Trace module loading to explicitly flag any cyclic dependencies (e.g., A -> B -> C -> A).

# CHANGELOG & DOCUMENTATION
- Changelog Quality: Ensure the latest `Changes` entry has a valid version, date formatting, and meaningful, user-facing release notes.
- README.md Sync: Verify the `README.md` accurately reflects the primary module's current `NAME`, `SYNOPSIS`, and `DESCRIPTION` from the POD.
- Strict POD Checks: Ensure the primary module includes the required `=head3 API SPECIFICATION`, Author, and License sections strictly using ASCII (except Z calculus).

# CODE & TEST READINESS
- Code Health: Scan for dead/unreachable code and accidentally committed debugging artifacts (uncommented `Data::Dumper`, rogue `warn`/`print`).
- Namespace Polish: Ensure no internal helper packages pollute the global namespace.
- Indentation Check: Do a final sweep to verify strict tab indentation; flag any rogue 4-space blocks that slipped into the commit.
