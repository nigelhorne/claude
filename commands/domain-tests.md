Act as a Senior Perl SDET and Domain Analysis Expert. Generate comprehensive domain tests in `./t/domain.t` using Equivalence Partitioning and Boundary Value Analysis for the provided codebase.

# EXECUTION & REASONING
- Step-by-Step Verification: Use a `<thinking>` block to analyze every input parameter. Define the valid partitions, invalid partitions, and exact boundary edges (minimum, maximum, just below min, just above max) before generating tests.

# DOMAIN TEST GENERATION
- Equivalence Partitioning: Select a single representative typical value from each valid and invalid group to prove the system accepts/rejects data without exhaustive brute-force testing.
- Boundary Value Analysis: Test the absolute edges of allowed numerical ranges, array sizes, and string lengths. 
- Combinatorial Boundaries: Test edge-case interactions (e.g., Parameter A at its maximum while Parameter B is at its minimum).
- Format Domains: If an input requires a specific format (e.g., Regex validation, UTF-8), test the partition of valid formats against the partition of malformed formats.
- Explicit Rejection: Use `Test::Most` (`throws_ok`) to assert that invalid data fails cleanly and generates the exact error message documented in the POD.

# POD DOCUMENTATION UPDATES
- API Documentation Sync: You MUST output the necessary POD updates. Explicitly document these valid/invalid domains, partitions, and boundary limits under the `=head3 API SPECIFICATION` (or equivalent =head4 input section) for each public method.

# TEST MECHANICS & QUALITY
- Treat each parameter's domain analysis as a distinct subtest.
- Indent strictly with tabs. Eliminate magic numbers/strings using `Readonly` or `%config`.
- Keep code strictly ASCII. Ensure global states are not polluted during failures.
