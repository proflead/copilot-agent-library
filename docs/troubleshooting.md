# Troubleshooting Guide

Common issues and solutions when using Copilot agents.

## Installation Issues

### Agent Not Found

**Problem:**
```bash
copilot agent run orchestrator "task"
Error: Agent 'orchestrator' not found
```

**Solutions:**

1. **Verify file location:**
 ```bash
 # CLI users - check ~/.github/agents/
 ls -la ~/.github/agents/
   
 # IDE users - check .github/agents/ in workspace
 ls -la .github/agents/
 ```

2. **Check filename:**
 - Must end with `.agent.md`
 - Name must match: `orchestrator.agent.md`
 - No extra extensions: ~~`orchestrator.agent.md.txt`~~

3. **Reload/restart:**
 ```bash
 # CLI: No restart needed, should work immediately
   
 # VS Code: Reload window
 # Cmd/Ctrl + Shift + P  "Developer: Reload Window"
 ```

4. **Check file permissions:**
 ```bash
 chmod 644 ~/.github/agents/orchestrator.agent.md
 ```

### Agent List Is Empty

**Problem:**
```bash
copilot agent list
# Shows no agents
```

**Solutions:**

1. **Create agents directory:**
 ```bash
 mkdir -p ~/.github/agents
 ```

2. **Verify Copilot CLI is updated:**
 ```bash
 gh extension upgrade gh-copilot
 ```

3. **Check Copilot authentication:**
 ```bash
 gh auth status
 # Should show you're logged in with Copilot access
 ```

## Agent Execution Issues

### Agent Starts But Doesn't Complete

**Problem:** Agent invocation hangs or times out

**Solutions:**

1. **Check internet connection:**
 - Agents require API access
 - Test: `ping github.com`

2. **Verify Copilot subscription:**
 ```bash
 gh copilot status
 ```
 Should show active subscription

3. **Simplify the prompt:**
 ```bash
 # Too complex might timeout
 copilot agent run orchestrator "Build entire enterprise application..."
   
 # Start simpler
 copilot agent run orchestrator "Create basic REST API structure"
 ```

4. **Check model availability:**
 - Some agents specify models (claude-sonnet-4.5, gpt-4.1)
 - If model unavailable, edit agent file to use different model
   
 ```yaml
 # In agent file
 model: claude-sonnet-4.5  # Try changing to gpt-4.1
 ```

### Agent Output Is Truncated

**Problem:** Agent response cuts off mid-sentence

**Solutions:**

1. **CLI - save to file:**
 ```bash
 copilot agent run orchestrator "task" > output.md
 ```

2. **Request in parts:**
 ```bash
 # Instead of one huge request
 copilot agent run backend-developer "Build complete backend"
   
 # Break it down
 copilot agent run backend-developer "Create user model and repository"
 copilot agent run backend-developer "Create authentication service"
 ```

3. **Increase terminal buffer** (terminal-dependent)

### "Rate Limited" or "Too Many Requests"

**Problem:**
```
Error: Rate limit exceeded
```

**Solutions:**

1. **Wait and retry** (rate limits typically reset within minutes)

2. **Spread out requests:**
 ```bash
 # Don't run 20 agents in parallel
   
 # Instead, batch appropriately
 copilot agent run orchestrator "handle coordination"
 ```

3. **Check Copilot usage limits for your plan**

## Output Quality Issues

### Agent Doesn't Understand Context

**Problem:** Agent produces generic code that doesn't match your project

**Solutions:**

1. **Provide explicit context:**
 ```bash
 # Bad - no context
 copilot agent run backend-developer "Create user service"
   
 # Good - rich context
 copilot agent run backend-developer "Create user service for our Node.js app:
 - Tech stack: TypeScript, Express, Prisma ORM, PostgreSQL
 - Follow existing pattern in src/services/product.service.ts
 - Use dependency injection from tsyringe
 - Return DTOs, not raw Prisma models"
 ```

2. **Share code examples:**
 ```bash
 copilot agent run backend-developer "Create order service similar to:
 \`\`\`typescript
 // Example from user service
 export class UserService {
   constructor(private repo: UserRepository) {}
   async findById(id: string): Promise<UserDTO> { ... }
 }
 \`\`\`"
 ```

3. **Reference existing files:**
 ```bash
 copilot agent run frontend-developer "Create ProductCard component following the pattern in src/components/UserCard.tsx"
 ```

### Agent Produces Outdated Code

**Problem:** Agent uses old libraries or deprecated patterns

**Solutions:**

1. **Specify versions:**
 ```bash
 copilot agent run frontend-developer "Create React component using:
 - React 18 with hooks (no class components)
 - TypeScript 5
 - Functional components with arrow functions"
 ```

2. **Mention modern patterns:**
 ```bash
 copilot agent run backend-developer "Use async/await, not callbacks or promises.then()"
 ```

3. **Request specific libraries:**
 ```bash
 copilot agent run test-generator "Create tests using:
 - Jest 29
 - Testing Library (not Enzyme)
 - Modern matchers like toBeInTheDocument()"
 ```

### Agent Ignores Requirements

**Problem:** Agent output missing critical requirements

**Solutions:**

1. **Use bullet points for requirements:**
 ```bash
 copilot agent run backend-developer "Create authentication API with:
 - JWT tokens with refresh
 - Password hashing with bcrypt
 - Rate limiting (10 attempts per minute)
 - Email verification required
 - Role-based access control"
 ```

2. **Prioritize requirements:**
 ```bash
 "CRITICAL: Must include input validation and SQL injection prevention
 IMPORTANT: Add rate limiting
 NICE TO HAVE: Logging"
 ```

3. **Iterate with feedback:**
 ```bash
 # First attempt
 copilot agent run backend-developer "Create API"
   
 # Review output, then refine
 copilot agent run backend-developer "Add the missing input validation to the API"
 ```

## IDE-Specific Issues

### Agent Not Available in VS Code

**Problem:** Can't invoke agent with `@agent-name`

**Solutions:**

1. **Check file location:**
 - Must be in workspace `.github/agents/` directory
 - Not in global `~/.github/agents/`

2. **Reload window:**
 - Cmd/Ctrl + Shift + P
 - "Developer: Reload Window"

3. **Check Copilot extension:**
 - Ensure GitHub Copilot extension is enabled
 - Check extension version (update if needed)

4. **Verify workspace:**
 - Agent files only work in open workspace
 - Open folder containing `.github/agents/`

### Agent Sees Wrong Files

**Problem:** Agent references files not in your project

**Solutions:**

1. **Be explicit with paths:**
 ```
 @backend-developer Update the user service in src/services/user.service.ts
 ```

2. **Select code first:**
 - Highlight relevant code in editor
 - Then invoke agent
 - Agent will see selected context

3. **Use workspace-relative paths:**
 ```
 @frontend-developer Create component in src/components/NewComponent.tsx
 ```

## CLI-Specific Issues

### Can't Find Files in Current Directory

**Problem:** Agent says it can't see files that exist

**Solutions:**

1. **Use absolute or relative paths:**
 ```bash
 # Absolute
 copilot agent run python-expert "Review /home/user/project/src/main.py"
   
 # Relative to current directory
 copilot agent run python-expert "Review ./src/main.py"
 ```

2. **Check current directory:**
 ```bash
 pwd  # Verify you're in the right place
 ls   # Verify files exist
 ```

3. **Provide file contents explicitly:**
 ```bash
 copilot agent run code-reviewer "Review this code:
 \`\`\`python
 $(cat src/main.py)
 \`\`\`"
 ```

### Output Goes to Terminal, Need in File

**Problem:** Agent output prints to terminal but you want it in a file

**Solutions:**

```bash
# Redirect to file
copilot agent run backend-developer "Create service" > src/service.ts

# Append to existing file
copilot agent run test-generator "Add tests" >> tests/service.test.ts

# Both stdout and file (tee)
copilot agent run doc-generator "Create README" | tee README.md

# Save and view with pager
copilot agent run orchestrator "Complex task" | tee output.md | less
```

## Multi-Agent / Orchestration Issues

### Agents Produce Inconsistent Code

**Problem:** Different agents use different styles or patterns

**Solutions:**

1. **Have Orchestrator set standards:**
 ```bash
 copilot agent run orchestrator "Build feature X. 
 Standards:
 - TypeScript strict mode
 - ESLint Airbnb config
 - Prettier formatting
 - Jest for testing
 Ensure all agents follow these standards."
 ```

2. **Provide style guide:**
 ```bash
 "Follow our style guide at CONTRIBUTING.md:
 - No default exports
 - Named exports only
 - Arrow functions for components"
 ```

3. **Use Code Reviewer as final gate:**
 ```bash
 copilot agent run orchestrator "Build feature"
 # Then
 copilot agent run code-reviewer "Ensure consistency with project standards in docs/STYLE_GUIDE.md"
 ```

### Integration Issues Between Agents

**Problem:** Frontend code doesn't work with Backend code

**Solutions:**

1. **Define contracts upfront:**
 ```bash
 copilot agent run api-designer "Create OpenAPI spec for user management"
   
 # Then use the spec for both
 copilot agent run backend-developer "Implement API matching spec.yaml"
 copilot agent run frontend-developer "Create client for API in spec.yaml"
 ```

2. **Use Orchestrator for coordination:**
 ```bash
 copilot agent run orchestrator "Build full-stack feature ensuring frontend and backend integrate properly"
 ```

3. **Explicit handoff:**
 ```bash
 # Save backend output
 copilot agent run backend-developer "Create API" > api-spec.txt
   
 # Use it for frontend
 copilot agent run frontend-developer "Create client for this API: $(cat api-spec.txt)"
 ```

## Performance Issues

### Agent Takes Too Long

**Problem:** Agent running for minutes without completing

**Solutions:**

1. **Break down the task:**
 ```bash
 # Too big
 copilot agent run orchestrator "Build entire e-commerce platform"
   
 # Better - phased approach
 copilot agent run orchestrator "Build product catalog feature"
 # Wait for completion, then
 copilot agent run orchestrator "Build shopping cart feature"
 ```

2. **Simplify prompt:**
 ```bash
 # Too detailed
 copilot agent run backend-developer "Create service with A, B, C, D, E, F, G, H, I, J features..."
   
 # Start with core
 copilot agent run backend-developer "Create service with core features A, B, C"
 ```

3. **Check system resources:**
 - Close other heavy applications
 - Check internet speed

### Agent Repeats or Loops

**Problem:** Agent seems stuck in a loop or repeating

**Solutions:**

1. **Cancel and restart:**
 ```bash
 # Press Ctrl+C to cancel
 # Rephrase and try again
 ```

2. **More specific instructions:**
 ```bash
 # Vague
 copilot agent run debug-detective "Fix this bug"
   
 # Specific
 copilot agent run debug-detective "Analyze this stack trace and suggest fix: [paste trace]"
 ```

## Getting Help

### When Nothing Works

1. **Check Copilot status:**
 ```bash
 gh copilot status
 ```

2. **Update Copilot CLI:**
 ```bash
 gh extension upgrade gh-copilot
 ```

3. **Check GitHub Copilot status page:**
 - Visit https://www.githubstatus.com/
 - Look for Copilot service issues

4. **Try with a different agent:**
 ```bash
 # If orchestrator fails, try simpler agent
 copilot agent run python-expert "Simple task"
 ```

5. **Collect diagnostics:**
 ```bash
 gh version
 gh extension list
 ls -la ~/.github/agents/
 copilot agent list
 ```

### Reporting Issues

When reporting issues with an agent:

1. **Include:**
 - Exact command used
 - Agent name and file
 - Error message (full text)
 - Platform (CLI/VS Code, OS)
 - Copilot version

2. **Example report:**
 ```
 Platform: CLI on macOS 13.1
 Copilot version: gh-copilot 0.5.3-beta
 Agent: orchestrator.agent.md
 Command: copilot agent run orchestrator "Build API"
 Error: [full error message]
 Expected: Agent should coordinate backend developer
 Actual: Times out after 2 minutes
 ```

3. **Where to report:**
 - This repository: [GitHub Issues](../../issues)
 - Copilot CLI: `gh copilot feedback`
 - VS Code: Help  Report Issue

## Quick Reference: Common Fixes

| Problem | Quick Fix |
|---------|-----------|
| Agent not found | Check file in `~/.github/agents/` and filename ends with `.agent.md` |
| Hangs/timeout | Simplify prompt, check internet |
| Wrong context | Be explicit with file paths |
| Bad output | Provide more context and examples |
| Rate limited | Wait 5-10 minutes, retry |
| Can't see files (CLI) | Use absolute/relative paths |
| Can't see files (IDE) | Select code or use full paths |
| Inconsistent code | Set standards upfront |
| Too slow | Break into smaller tasks |

## Still Stuck?

- **[Getting Started](./getting-started.md)** - Verify basic setup
- **[Best Practices](./best-practices.md)** - Learn optimal usage
- **[Agent Guide](./agent-guide.md)** - Understand agent capabilities
- **[GitHub Discussions](../../discussions)** - Ask the community

---

**Most issues are resolved by:**
1. Being more specific in prompts
2. Providing better context
3. Breaking tasks into smaller pieces
