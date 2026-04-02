# CLI vs IDE: Platform-Specific Guide

GitHub Copilot agents work in both the CLI and IDEs (like VS Code), but each platform has unique strengths. This guide helps you choose the right platform and use agents effectively in each environment.

## Quick Comparison

| Feature | CLI | IDE (VS Code) |
|---------|-----|---------------|
| **Best For** | Automation, scripts, CI/CD | Interactive development, code editing |
| **Agent Invocation** | `copilot agent run agent-name "task"` | `@agent-name task` in chat |
| **File Access** | Current directory and subdirectories | Open workspace files |
| **Output** | Terminal text | Chat window + inline code |
| **Multi-turn** | Sequential commands | Conversational in same chat |
| **Automation** | Easy to script | Manual interaction |
| **Context** | Explicit file paths | Automatic workspace context |

## CLI Usage

### When to Use CLI

✅ **Perfect for:**
- Automated workflows and scripts
- CI/CD pipelines
- Batch processing multiple files
- Terminal-based development
- Remote server work (SSH)
- Quick one-off tasks

❌ **Not ideal for:**
- Interactive code editing
- Real-time feedback while coding
- Tasks needing IDE features (debugging, refactoring)

### CLI Best Practices

#### 1. Be Explicit with Paths

The CLI works in your current directory. Specify file paths clearly:

```bash
# Good - explicit paths
copilot agent run python-expert "Review the user authentication in src/auth/login.py"

# Less clear - ambiguous
copilot agent run python-expert "Review the login file"
```

#### 2. Pipe Output to Files

Save agent output for later use:

```bash
# Save generated code
copilot agent run backend-developer "Create user repository class" > src/repositories/user.py

# Save documentation
copilot agent run doc-generator "Create README" > README.md

# Append to existing file
copilot agent run test-generator "Add tests for UserService" >> tests/test_user_service.py
```

#### 3. Chain Commands

Combine multiple agents in scripts:

```bash
#!/bin/bash

# Research best practices
copilot agent run research-agent "Research FastAPI best practices" > research.md

# Implement based on research
copilot agent run backend-developer "Create FastAPI app using best practices from research.md"

# Generate tests
copilot agent run test-generator "Create tests for the FastAPI app"

# Review everything
copilot agent run code-reviewer "Review all files in src/"
```

#### 4. Use Environment Variables

Pass configuration to agents:

```bash
export FRAMEWORK="FastAPI"
export DATABASE="PostgreSQL"

copilot agent run backend-developer "Create API using $FRAMEWORK with $DATABASE"
```

#### 5. Integrate with Git

Combine agents with git workflows:

```bash
# Before committing
copilot agent run code-reviewer "Review staged changes"

# Auto-generate commit message
CHANGES=$(git diff --staged)
copilot agent run doc-generator "Write commit message for: $CHANGES"

# Pre-merge review
copilot agent run security-auditor "Review changes in this branch"
```

### CLI Automation Examples

#### Example 1: Pre-Commit Hook

`.git/hooks/pre-commit`:
```bash
#!/bin/bash

# Run security audit on staged files
echo "Running security audit..."
copilot agent run security-auditor "Review staged files for security issues"

if [ $? -ne 0 ]; then
    echo "Security issues found. Commit aborted."
    exit 1
fi

# Check code quality
echo "Running code review..."
copilot agent run code-reviewer "Review staged changes"

exit 0
```

#### Example 2: CI Pipeline

`.github/workflows/review.yml`:
```yaml
name: AI Code Review

on: [pull_request]

jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install Copilot CLI
        run: gh extension install github/gh-copilot
      
      - name: Security Review
        run: |
          copilot agent run security-auditor "Review PR changes for vulnerabilities"
      
      - name: Code Quality Review
        run: |
          copilot agent run code-reviewer "Review PR for code quality issues"
```

#### Example 3: Bulk File Processing

```bash
#!/bin/bash
# Add type hints to all Python files

for file in src/**/*.py; do
    echo "Processing $file..."
    copilot agent run python-expert "Add type hints to $file" > "${file}.tmp"
    mv "${file}.tmp" "$file"
done

echo "All files processed!"
```

## IDE Usage (VS Code)

### When to Use IDE

✅ **Perfect for:**
- Interactive development
- Real-time code assistance
- Editing existing code
- Exploring unfamiliar codebases
- Refactoring
- Quick questions while coding

❌ **Not ideal for:**
- Automation and scripts
- CI/CD integration
- Batch processing

### IDE Best Practices

#### 1. Use Workspace Context

Agents automatically see your open files and workspace:

```
# Agent sees your current file context
@backend-developer Add authentication middleware to this Express app

# Agent understands your project structure
@frontend-developer Update the LoginForm component to use the new API
```

#### 2. Multi-Turn Conversations

Have back-and-forth conversations in the same chat:

```
You: @python-expert Create a user service class

Agent: [Generates UserService class]

You: Add caching to the get_user method

Agent: [Updates with caching]

You: Now add type hints

Agent: [Adds type hints]
```

#### 3. Select Code for Context

Highlight code before asking:

```
1. Select a function in your editor
2. Open Copilot Chat
3. @code-reviewer What could be improved here?
```

The agent sees the selected code automatically.

#### 4. Use Inline Suggestions

Some agents work great with inline suggestions:

```
# In your editor, start typing a comment
# Function to validate email address

# Press Ctrl+Space or wait for suggestion
# Agent suggests implementation based on comment
```

#### 5. Quick Fixes

Use agents for quick refactoring:

```
# Select problematic code
@refactoring-expert Simplify this function

# Or
@performance-optimizer Make this query faster
```

### IDE Workflow Examples

#### Example 1: Feature Development Flow

```
1. Planning
@enhanced-planner Create a plan for implementing user authentication

2. Implementation
@backend-developer Implement the authentication service

3. Testing
@test-generator Create tests for AuthenticationService

4. Review
@code-reviewer Review the authentication implementation

5. Documentation
@doc-generator Document the authentication API
```

#### Example 2: Debugging Workflow

```
1. Analyze error
@debug-detective Why am I getting this TypeError? [paste stack trace]

2. Fix suggested
[Agent provides diagnosis and fix]

3. Verify fix
@test-generator Create a test that would have caught this bug

4. Performance check
@performance-optimizer Is this fix optimal?
```

#### Example 3: Code Exploration

```
# New to a codebase?
@research-agent Explain how authentication works in this codebase

@uiux-designer What's the user flow for the checkout process?

@database-architect Show me the database schema and relationships
```

## Platform-Specific Agent Usage

### Best Agents for CLI

**1. Orchestrator**
```bash
# Perfect for complex automation
copilot agent run orchestrator "Build complete CI/CD pipeline"
```

**2. Code Reviewer**
```bash
# Automated code reviews
copilot agent run code-reviewer "Review PR #123"
```

**3. Security Auditor**
```bash
# Security scanning in CI
copilot agent run security-auditor "Scan codebase for vulnerabilities"
```

**4. Test Generator**
```bash
# Generate tests in batch
copilot agent run test-generator "Create tests for all services in src/services/"
```

### Best Agents for IDE

**1. Frontend Developer**
```
# Interactive UI development
@frontend-developer Add a loading spinner to this component
```

**2. Debug Detective**
```
# Real-time debugging help
@debug-detective Why is this component re-rendering infinitely?
```

**3. Python/JS/etc. Expert**
```
# Language-specific help while coding
@python-expert How can I make this function more Pythonic?
```

**4. UI/UX Designer**
```
# Design feedback
@uiux-designer Improve the user experience of this form
```

## Hybrid Workflows

Combine CLI and IDE for maximum productivity:

### Workflow 1: Development + Automation

**IDE (development):**
```
@fullstack-expert Build the user profile feature
@test-generator Create tests for the profile feature
```

**CLI (automation):**
```bash
# Pre-commit review
copilot agent run code-reviewer "Review staged changes"

# Deployment
copilot agent run docker-expert "Optimize Dockerfile"
```

### Workflow 2: Planning + Implementation

**CLI (planning):**
```bash
# Generate project plan
copilot agent run enhanced-planner "Plan migration to microservices" > plan.md
```

**IDE (implementation):**
```
@backend-developer Implement the first microservice from plan.md
@test-generator Create tests per the plan
```

### Workflow 3: Batch + Interactive

**CLI (batch processing):**
```bash
# Add docs to all files
for file in src/**/*.ts; do
    copilot agent run doc-generator "Add JSDoc to $file" > "${file}.tmp"
    mv "${file}.tmp" "$file"
done
```

**IDE (review and refine):**
```
@doc-generator Improve the documentation for this function
@code-reviewer Is this well-documented now?
```

## Tips by Use Case

### For Solo Developers

**Use IDE when:**
- Writing new features
- Debugging issues
- Learning new code

**Use CLI when:**
- Running tests
- Deploying code
- Batch operations

### For Teams

**Use IDE for:**
- Feature development
- Code reviews (interactive)
- Pair programming with agents

**Use CLI for:**
- CI/CD pipelines
- Automated quality gates
- Scheduled tasks (nightly tests, security scans)

### For DevOps

**Use CLI extensively:**
```bash
# Infrastructure as code
copilot agent run terraform-expert "Create VPC module"

# Container optimization
copilot agent run docker-expert "Optimize production Dockerfile"

# Pipeline generation
copilot agent run cicd-expert "Create GitHub Actions workflow"
```

**Use IDE occasionally:**
```
@kubernetes-expert Debug why this pod is CrashLoopBackOff
```

## Common Issues

### CLI Issue: Agent Can't Find Files

**Problem:**
```bash
copilot agent run backend-developer "Update the user service"
# Error: Can't find user service
```

**Solution:** Be explicit with paths:
```bash
copilot agent run backend-developer "Update the user service in src/services/user.service.ts"
```

### IDE Issue: Agent Lacks Context

**Problem:**
```
@backend-developer Add validation
# Agent doesn't know what to validate
```

**Solution:** Select code or be specific:
```
# Select the function, then:
@backend-developer Add input validation to this function
```

### CLI Issue: Output Lost in Terminal

**Problem:** Long agent output scrolls away

**Solution:** Pipe to file or pager:
```bash
copilot agent run doc-generator "Create API docs" | tee docs.md
copilot agent run orchestrator "Complex task" | less
```

## Next Steps

- **[Orchestration Patterns](./orchestration-patterns.md)** - Multi-agent coordination
- **[Best Practices](./best-practices.md)** - Advanced usage tips
- **[Troubleshooting](./troubleshooting.md)** - Common issues and solutions

---

**Choose your platform wisely:** Use IDE for interactive development, CLI for automation. Combine both for maximum productivity!
