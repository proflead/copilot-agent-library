# Getting Started with Copilot Agent Library

Welcome! This guide will help you install and start using custom Copilot agents from our library.

## What are Copilot Agents?

Copilot agents are specialized AI assistants that you can invoke in the GitHub Copilot CLI or IDE to perform specific tasks. Think of them as expert consultants you can call upon - a Python Expert for Python code, a Security Auditor for security reviews, or an Orchestrator to coordinate multiple agents for complex projects.

## Installation

### Prerequisites

- **GitHub Copilot** subscription (Individual, Business, or Enterprise)
- **GitHub Copilot CLI** installed OR **VS Code with GitHub Copilot extension**

### For CLI Users

1. **Choose an agent** from the [README](../README.md) agent catalog

2. **Download the agent file** (click the agent link, then download the `.agent.md` file)

3. **Copy to your agents directory**:
 ```bash
 # Create agents directory if it doesn't exist
 mkdir -p ~/.github/agents
   
 # Copy the downloaded agent
 cp ~/Downloads/orchestrator.agent.md ~/.github/agents/
 ```

4. **Verify installation**:
 ```bash
 copilot agent list
 ```
   
 You should see your installed agent in the list.

5. **Use the agent**:
 ```bash
 copilot agent run orchestrator "Your task here"
 ```

### For IDE Users (VS Code)

1. **Choose an agent** from the [README](../README.md) agent catalog

2. **Download the agent file**

3. **Add to your workspace**:
 ```bash
 # Create agents directory in your project
 mkdir -p .github/agents
   
 # Copy the agent
 cp ~/Downloads/orchestrator.agent.md .github/agents/
 ```

4. **Reload VS Code** (or restart the Copilot extension)

5. **Use the agent in chat**:
 - Open GitHub Copilot chat (`Ctrl+Shift+I` or `Cmd+Shift+I`)
 - Type: `@orchestrator Your task here`

## Your First Agent

Let's try the **Python Expert** agent:

### Step 1: Install the Agent

```bash
# CLI users
cp agents/coding/python-expert.agent.md ~/.github/agents/

# VS Code users  
cp agents/coding/python-expert.agent.md .github/agents/
```

### Step 2: Use the Agent

**CLI:**
```bash
copilot agent run python-expert "Create a function to parse CSV files with type hints and error handling"
```

**VS Code:**
```
@python-expert Create a function to parse CSV files with type hints and error handling
```

### Step 3: Review the Output

The agent will generate type-annotated Python code following best practices:
- Type hints on all functions
- Proper error handling
- Docstrings
- Example usage

## Installing Multiple Agents

You can install as many agents as you need:

```bash
# Install a full-stack development set
cp agents/fullstack/frontend-developer.agent.md ~/.github/agents/
cp agents/fullstack/backend-developer.agent.md ~/.github/agents/
cp agents/fullstack/database-architect.agent.md ~/.github/agents/

# Install testing agents
cp agents/testing/test-generator.agent.md ~/.github/agents/
cp agents/testing/e2e-tester.agent.md ~/.github/agents/

# Install the orchestrator to coordinate them all
cp agents/orchestration/orchestrator.agent.md ~/.github/agents/
```

## Understanding Agent Capabilities

Each agent specifies its capabilities in the frontmatter:

```yaml
---
name: Python Expert
description: Python specialist with type hints, pytest, and best practices
model: claude-sonnet-4.5
tools: ['read', 'write', 'bash', 'search']
agents: ['test-generator']
---
```

**Key fields:**
- **name**: How to invoke the agent
- **description**: What the agent does
- **model**: Recommended AI model
- **tools**: What tools the agent can access (file operations, web search, etc.)
- **agents**: Which sub-agents this agent can delegate to

## Common Use Cases

### Single Agent Tasks

Use one agent for focused tasks:

```bash
# Code review
copilot agent run code-reviewer "Review this pull request for quality issues"

# Design conversion
copilot agent run figma-to-html "Convert this Figma design to React components"

# Performance optimization
copilot agent run performance-optimizer "This API endpoint is slow, help optimize it"
```

### Multi-Agent Workflows

Use the Orchestrator for complex tasks requiring multiple specialists:

```bash
copilot agent run orchestrator "Build a user authentication feature with:
- React frontend with login/signup forms
- Node.js backend with JWT authentication
- PostgreSQL database schema
- Comprehensive tests
- Security review"
```

The Orchestrator will:
1. Break down the task
2. Delegate to appropriate specialists (Frontend Dev, Backend Dev, Database Architect, Test Generator, Security Auditor)
3. Coordinate the work
4. Ensure everything integrates

## Tips for Success

### 1. Be Specific

 **Too vague:**
```bash
copilot agent run backend-developer "Build an API"
```

 **Better:**
```bash
copilot agent run backend-developer "Build a RESTful API for a blog platform with:
- Posts (CRUD operations)
- Comments on posts
- User authentication with JWT
- PostgreSQL database
- Express.js framework"
```

### 2. Provide Context

Include relevant information:
- Technology stack preferences
- Existing patterns to follow
- Constraints or requirements
- Target users or use cases

### 3. Use the Right Agent

- **Broad tasks**  Use **Orchestrator** to coordinate specialists
- **Focused tasks**  Use specific agents (Python Expert, Frontend Developer, etc.)
- **Research needed**  Start with **Research Agent**
- **Planning needed**  Start with **Enhanced Planner**

### 4. Iterate

Agents can refine their work:

```bash
# First request
copilot agent run frontend-developer "Create a user profile component"

# Follow-up refinement
copilot agent run frontend-developer "Add form validation and loading states to the profile component"
```

## Troubleshooting

### Agent Not Found

**Problem:** `Agent 'orchestrator' not found`

**Solution:** 
- Verify the agent file is in `~/.github/agents/` (CLI) or `.github/agents/` (VS Code)
- Check the filename matches: `orchestrator.agent.md`
- Restart Copilot CLI or reload VS Code

### Agent Not Responding

**Problem:** Agent starts but doesn't complete

**Solution:**
- Check your internet connection
- Verify your Copilot subscription is active
- Try a simpler prompt first
- Check if the model specified in the agent is available

### Unexpected Output

**Problem:** Agent's output doesn't match expectations

**Solution:**
- Review the agent's capabilities and limitations in its file
- Provide more specific instructions
- Try a different agent more suited to the task
- Break the task into smaller steps

## Next Steps

- **[Agent Guide](./agent-guide.md)** - Detailed guide for each agent
- **[CLI vs IDE](./cli-vs-ide.md)** - Platform-specific tips
- **[Orchestration Patterns](./orchestration-patterns.md)** - Multi-agent workflows
- **[Best Practices](./best-practices.md)** - Advanced usage patterns

## Need Help?

- Check the [Troubleshooting Guide](./troubleshooting.md)
- Review [agent-specific documentation](./agent-guide.md)
- Open a [GitHub Discussion](../../discussions)
- Report bugs via [GitHub Issues](../../issues)

---

**Ready to dive deeper?** Continue to the [Agent Guide](./agent-guide.md) to learn about each agent's capabilities in detail.
