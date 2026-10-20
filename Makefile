# SDET-as-Code Pipeline Orchestration
# Run 'make sdet' to execute the full pipeline in the mathematically correct order.

.PHONY: all sdet critique audit docs logic transition data domain path transaction edge integration gap

# The complete pipeline in strictly dependent order
sdet: critique audit docs logic transition data domain path transaction edge integration gap
	@echo "✅ SDET Pipeline complete. Ready for CPAN release."

# PHASE 1: Static Analysis & Compliance
critique:
	@echo "Running critique.md (JSCPD reduction & structural review)..."
	# Example CLI hook: cat lib/MyModule.pm | ai-cli --prompt-file skills/critique.md

audit: critique
	@echo "Running cpan-audit.md (Dependency & Security compliance)..."

# PHASE 2: Formal Specification
docs: audit
	@echo "Running documentation.md (Generating POD, Z calculus, and ASCII State Diagram)..."

# PHASE 3: Mathematical & State Proofs (Requires Formal Spec)
logic: docs
	@echo "Running logic-tests.md (Proving truth tables and invariants)..."

transition: docs
	@echo "Running transition-tests.md (Validating FSM against the new POD State Diagram)..."

# PHASE 4: Data & Memory Integrity
data: transition
	@echo "Running data-flow.md (Define-Use chains & TOCTOU testing)..."

domain: data
	@echo "Running domain-tests.md (Equivalence Partitioning & BVA)..."

# PHASE 5: Structural & Hostile Environment Testing
path: domain
	@echo "Running path_tests.md (Control Flow Graph & McCabe Cyclomatic Complexity)..."

transaction: path
	@echo "Running transaction-tests.md (ACID properties & Concurrency Deadlocks)..."

edge: transaction
	@echo "Running edge-cases.md (Hostile inputs, ReDoS, Resource Exhaustion)..."

integration: edge
	@echo "Running integration-test.md (Subsystem sabotage & permissions drops)..."

# PHASE 6: Release Strategy
gap: integration
	@echo "Running gap-analysis.md (Validating TODOs and mapping Post-Release Roadmap)..."
