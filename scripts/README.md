# Scripts

Utilities for testing and validating the agent library.

## validate-agents.sh

Validates all agent files for proper formatting and structure.

**Usage:**
```bash
./scripts/validate-agents.sh
```

**Checks:**
- ✅ File exists and is not empty
- ✅ Has YAML frontmatter (starts with `---`)
- ✅ Has required fields (`name:` and `description:`)
- ✅ Has sufficient content
- ✅ File size is reasonable

**Exit Codes:**
- `0` - All validations passed
- `1` - One or more validations failed

---

## test-report-template.md

Template for documenting test results when testing agents.

**Usage:**
1. Copy the template
2. Fill in test results for each agent
3. Document issues found
4. Save as dated report (e.g., `test-report-2024-04-02.md`)

**What to track:**
- Test scenario used
- Response time
- Output quality (1-5 stars)
- Issues found
- Additional notes

---

## Running Tests

### Quick Validation
```bash
# Validate all agent files
./scripts/validate-agents.sh
```

### Manual Testing
```bash
# CLI - Test a specific agent
gh copilot agent run orchestrator "Build a simple REST API"

# VS Code - Test in IDE
# 1. Copy agents to .github/agents/ in workspace
# 2. Open Copilot Chat
# 3. Type: @orchestrator Build a simple REST API
```

### Full Test Suite
Follow the scenarios in `TESTING.md` for comprehensive testing.

---

## Adding New Scripts

When adding new scripts:
1. Add executable permissions: `chmod +x scripts/new-script.sh`
2. Document in this README
3. Include usage examples
4. Follow bash best practices
