# NAME

Claude Skills for Perl SDET & Architecture

# DESCRIPTION

A curated collection of highly optimized, token-efficient system prompts ("skills") designed for Anthropic's Claude LLM. These skills transform Claude into a ruthless, constructive Senior Perl Architect and SDET, capable of automating the entire Perl software development lifecycle--from scaffolding and modernization to pathological edge-case testing and CPAN release auditing.

Designed specifically for the **Claude Code CLI** (but completely usable in the web UI or other API wrappers), these prompts use strict formatting, agentic instructions, and `<thinking>` protocols to eliminate AI hallucinations and enforce modern, rigorous Perl standards.

# DESIGN PHILOSOPHY

These skills are engineered to bypass common LLM traps:

- **Token Efficiency:** Conversational filler is stripped out. Instructions are dense, structured, and scannable.
- **No Hallucinated Executions:** Instead of commanding the AI to "run `prove`" (which it cannot natively do without terminal tools), the prompts instruct Claude to simulate the execution via static analysis and automatically fix the code if it spots a failure.
- **Strict Adherence to Standards:** Enforces `use strict;`, `use warnings;`, `use autodie qw(:all);`, strict tab indentation, and ASCII-only code.
- **Self-Correction:** Implements `<thinking>` blocks so Claude verifies its logic, identifies dead code, and double-checks POD drift _before_ generating final output.

# THE SKILL DIRECTORY

## Architecture & Code Quality

- **`critique.md`**: Deep static analysis. Refactors code, enforces `Sub::Private`/`Sub::Protected` encapsulation, resolves `TODO`s, and synchronizes POD.
- **`modernize.md`**: Upgrades ancient legacy Perl to modern standards, enforcing `Params::Validate::Strict` and replacing outdated CPAN modules.
- **`new-code-boilerplate.md`**: Generates strict, architecturally sound skeleton `.pm` files with full Z-calculus POD schemas.
- **`performance-review.md`**: Analyzes Big-O complexity, memory bloat, and flags inefficient array/hash operations.
- **`regex-audit.md`**: Hunts for Catastrophic Backtracking (ReDoS) vulnerabilities and optimizes capture groups for memory efficiency.

## Comprehensive Testing Suite (SDET)

- **`function-test.md`**: White-box tests for internal functions, mocking internals with `Test::Mockingbird` and checking memory cycles.
- **`unit-test.md`**: Black-box API tests based strictly on the POD. Asserts global state integrity (`$@`, `$!`, `$_`).
- **`integration-test.md`**: End-to-end tests across multiple packages. Uses spies over mocks and verifies concurrency and missing optional dependencies (`Test::Without::Module`).
- **`edge-cases.md`**: Destructive boundary tests. Actively tries to break the module by passing malformed inputs and simulating upstream failures.
- **`extended-tests.md`**: Chases 95%+ coverage and high LCSAJ/TER3 scores by deliberately targeting untested conditional branches and identifying dead code.
- **`mutant-killers.md`**: Reverse-engineers object states to explicitly kill auto-generated mutation testing stubs.
* **`path-tests.md`**: Maps Control Flow Graphs (CFGs) to generate exhaustive path-coverage tests, while actively injecting `TODO` markers into the source code for unreachable or dead lines.

## Security & DevSecOps

- **`security-audit.md`**: Static application security testing (SAST). Hunts for taint mode failures, eval dangers, command injection, and insecure `/tmp/` file usage.
- **`pen-test.md`**: Dynamic testing simulation for CGI scripts. Injects hostile payloads into localized `%ENV` variables to test for command injection, traversal, and XSS.

## CI/CD & Deployment

- **`ci-review.md`**: Generates or updates GitHub Actions/AppVeyor YAMLs with locale-resilience matrix testing, dependency caching, and code coverage reporting.
- **`cpan-audit.md`**: The final pre-release checklist. Verifies `$VERSION` sync, dependency completeness, `MANIFEST` accuracy, and leftover debugging artifacts.

## Professional Workflow

- **`crash-analyzer.md`**: Ingests raw stack traces or core dumps, isolates the root cause, outputs the patched code, and writes a regression test.
- **`handover-generator.md`**: Converts unstructured project notes into a polished, structured transition manual for remote teams.

# HOW TO USE (CLAUDE CODE CLI)

If you are using the [Claude Code CLI](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview), you can leverage these markdown files directly by aliasing them or passing them as contextual prompts.

Because Claude Code has file-system access, you can run commands like:

        # Example: Run a security audit on a specific module
        claude -p security-audit.md "Review lib/MyModule.pm"

        # Example: Run the CPAN audit on the whole repository
        claude -p cpan-audit.md "Do a final check of this repo"

_Pro-Tip: You can set up custom bash aliases in your `~/.bashrc` or `~/.zshrc` to make execution instantaneous:_

        alias claude-critique='claude -p /path/to/repo/critique.md'
        alias claude-pentest='claude -p /path/to/repo/pen-test.md'

# HOW TO USE (WEB INTERFACE / CUSTOM WRAPPERS)

1. Open a new chat or create a "Project" in Claude.
2. Upload the desired `.md` skill file to the project's knowledge base (or paste it into the system instructions).
3. Provide the target Perl code or filename in your prompt: _"Run the critique skill on the attached `User.pm` file."_

# LICENCE AND COPYRIGHT

This toolkit is provided as-is. Feel free to fork, adapt, and integrate into your own CI/CD pipelines and prompt libraries.

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.
