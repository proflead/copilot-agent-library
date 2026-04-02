# Contributing to Copilot Agent Library

Thank you for your interest in contributing! This guide will help you create high-quality agents and submit them to the library.

## 📋 Table of Contents

- [How to Contribute](#how-to-contribute)
- [Agent Quality Standards](#agent-quality-standards)
- [Creating a New Agent](#creating-a-new-agent)
- [Submission Guidelines](#submission-guidelines)
- [PR Review Process](#pr-review-process)
- [Code of Conduct](#code-of-conduct)

---

## How to Contribute

### Types of Contributions

- **New Agents**: Submit new custom agents
- **Agent Improvements**: Enhance existing agents
- **Documentation**: Improve guides and examples
- **Bug Fixes**: Fix issues in existing agents
- **Examples**: Add usage examples and workflows

### Getting Started

1. **Fork** the repository
2. **Clone** your fork locally
3. **Create** a new branch: `git checkout -b feature/agent-name`
4. **Make** your changes
5. **Test** your agent thoroughly
6. **Submit** a pull request

---

## Agent Quality Standards

All agents must meet these criteria:

### Required Elements

✅ **Complete Frontmatter**
- `name`: Clear, descriptive agent name
- `description`: One-line summary of agent purpose
- `model`: Recommended model (e.g., `claude-sonnet-4.5`, `gpt-4.1`)
- `tools`: List of required tools
- `agents`: Sub-agents (if applicable)
- `handoffs`: Handoff configurations (if applicable)

✅ **Comprehensive Documentation**
- Clear description of purpose and capabilities
- Workflow or process description
- Usage examples for both CLI and IDE
- Integration patterns with other agents
- Limitations and constraints
- Tips for best results

✅ **Testing**
- Tested in CLI environment
- Tested in IDE (VS Code)
- Works with specified model
- Produces expected output
- Handles edge cases gracefully

✅ **Quality**
- Well-structured prompts
- Clear, actionable instructions
- No sensitive data or credentials
- Follows agent template structure
- Professional tone and formatting

---

## Creating a New Agent

### Step 1: Choose the Right Category

Place your agent in the appropriate directory:

- `agents/orchestration/` - Multi-agent coordination
- `agents/fullstack/` - Full-stack development
- `agents/coding/` - Language-specific experts
- `agents/testing/` - Testing and quality
- `agents/design/` - Design and UI/UX
- `agents/productivity/` - Planning and documentation
- `agents/devops/` - DevOps and infrastructure
- `agents/debugging/` - Debugging and optimization

### Step 2: Use the Template

Copy the agent template:

```bash
cp templates/agent-template.md agents/[category]/[agent-name].agent.md
```

### Step 3: Fill Out the Template

```yaml
---
name: My Awesome Agent
description: Helps developers do amazing things efficiently
model: claude-sonnet-4.5
tools: ['read', 'write', 'search', 'bash']
agents: ['SubAgent1', 'SubAgent2']
handoffs:
  - label: Hand off to Expert
    agent: expert-agent
    prompt: 'Continue with expert analysis'
    send: true
---
```

### Step 4: Write Agent Content

- **Description**: Explain what the agent does and when to use it
- **Core Capabilities**: List 3-5 key features
- **Workflow**: Step-by-step process
- **Rules**: Important constraints and guidelines
- **Examples**: Both CLI and IDE usage
- **Integration Patterns**: How it works with other agents
- **Limitations**: What it cannot do
- **Tips**: Best practices for using the agent

### Step 5: Test Your Agent

#### CLI Testing

```bash
# Copy agent to your local agents directory
cp agents/[category]/[agent-name].agent.md ~/.github/agents/

# Test with various prompts
copilot agent run [agent-name] "Test prompt 1"
copilot agent run [agent-name] "Test prompt 2"
```

#### IDE Testing

1. Add agent to `.github/agents/` in your workspace
2. Invoke in VS Code: `@[agent-name] test prompt`
3. Test handoffs (if applicable)
4. Verify tool access works correctly

### Step 6: Document Usage

Add your agent to the README.md table in the appropriate category with:
- Agent name (linked to file)
- Brief description
- Common use cases

---

## Submission Guidelines

### Before Submitting

- [ ] Agent follows the template structure
- [ ] All frontmatter fields are complete
- [ ] Tested in both CLI and IDE
- [ ] No sensitive data or credentials
- [ ] Documentation is clear and comprehensive
- [ ] Examples are relevant and helpful
- [ ] Agent added to README.md table

### Pull Request Template

When submitting a PR, include:

```markdown
## Agent Submission: [Agent Name]

**Category**: [orchestration/fullstack/coding/testing/design/productivity/devops/debugging]

**Description**: [Brief description of what the agent does]

**Testing**:
- [ ] Tested in CLI
- [ ] Tested in VS Code
- [ ] Tested with recommended model
- [ ] Edge cases handled

**Documentation**:
- [ ] Agent added to README.md
- [ ] Usage examples provided
- [ ] Integration patterns documented

**Additional Notes**:
[Any special considerations or dependencies]
```

---

## PR Review Process

### Review Criteria

Reviewers will check:

1. **Quality**: Agent meets quality standards
2. **Completeness**: All required sections present
3. **Testing**: Evidence of thorough testing
4. **Documentation**: Clear and helpful documentation
5. **Uniqueness**: Doesn't duplicate existing agents
6. **Value**: Provides clear benefit to users

### Review Timeline

- **Initial Review**: Within 3-5 business days
- **Feedback**: Reviewers will provide constructive feedback
- **Iteration**: Work with reviewers to address feedback
- **Approval**: Once all criteria met, PR will be merged

### After Approval

- Agent is merged into main branch
- Added to agent library
- Featured in next release notes
- You're credited as a contributor!

---

## Multi-Agent Patterns

When creating agents that coordinate with others:

### Orchestration Best Practices

```yaml
handoffs:
  - label: Delegate to Backend Expert
    agent: backend-developer
    prompt: 'Implement the API endpoint described above'
    send: true
```

### Agent Composition

- **Sequential**: Agent A → Agent B → Agent C
- **Parallel**: Agent distributes to multiple agents simultaneously
- **Hierarchical**: Orchestrator → Specialists → Sub-specialists

### Example Multi-Agent Workflow

```
Orchestrator Agent
  ├─> Frontend Developer (UI implementation)
  ├─> Backend Developer (API development)
  ├─> Database Architect (Schema design)
  └─> Test Generator (Create tests)
```

---

## Code of Conduct

### Our Standards

- **Be Respectful**: Treat all contributors with respect
- **Be Constructive**: Provide helpful, actionable feedback
- **Be Inclusive**: Welcome developers of all backgrounds
- **Be Professional**: Maintain professional conduct
- **Be Collaborative**: Work together to improve agents

### Unacceptable Behavior

- Harassment, discrimination, or hostile behavior
- Personal attacks or insults
- Trolling or inflammatory comments
- Sharing others' private information
- Other unprofessional conduct

### Reporting Issues

Report code of conduct violations to: [your-email@example.com]

All reports will be reviewed confidentially.

---

## Questions?

- **General Questions**: Open a [GitHub Discussion](../../discussions)
- **Bug Reports**: Open an [Issue](../../issues)
- **Feature Requests**: Open an [Issue](../../issues)

---

Thank you for contributing to Copilot Agent Library! Your contributions help developers worldwide build better software faster.
