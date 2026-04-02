---
name: [Agent Name]
description: [Brief one-line description of what this agent does]
model: [Recommended model: claude-sonnet-4.5, gpt-4.1, etc.]
tools: [List of tools this agent needs access to, e.g., 'read', 'write', 'search', 'web', 'bash', 'github/*']
agents: [List of sub-agents this agent can delegate to, if any]
handoffs:
- label: [Handoff Button Label]
  agent: [target-agent]
  prompt: '[Instructions to pass to the target agent]'
  send: true
---

[Provide a comprehensive description of the agent's purpose, capabilities, and ideal use cases]

## Core Capabilities

- [Key capability 1]
- [Key capability 2]
- [Key capability 3]

## Workflow

[Describe the agent's typical workflow or process]

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Rules & Guidelines

<rules>
- [Important rule or constraint 1]
- [Important rule or constraint 2]
- [Important rule or constraint 3]
</rules>

## Usage Examples

### CLI Usage

```bash
# Example 1: [Describe what this does]
copilot agent run [agent-name] "[Your prompt here]"

# Example 2: [Describe what this does]
copilot agent run [agent-name] "[Your prompt here]"
```

### IDE Usage (VS Code)

```
@[agent-name] [Your prompt here]
```

**Example scenarios:**
- [Scenario 1]: `@[agent-name] [example prompt]`
- [Scenario 2]: `@[agent-name] [example prompt]`

## Integration Patterns

[How this agent works with other agents or tools]

### Works Well With
- **[Other Agent Name]**: [How they complement each other]
- **[MCP Server/Tool]**: [Integration details]

### Common Workflows
1. **[Workflow Name]**: [Agent A]  [This Agent]  [Agent B]
2. **[Workflow Name]**: [Description of multi-step process]

## Limitations

- [Limitation 1]
- [Limitation 2]
- [Limitation 3]

## Tips for Best Results

- [Tip 1]
- [Tip 2]
- [Tip 3]
