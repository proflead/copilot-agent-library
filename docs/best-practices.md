# Best Practices for Using Copilot Agents

Advanced tips and patterns for getting the most out of your Copilot agents.

## General Principles

### 1. Right Agent for the Job

Each agent is specialized. Choose wisely:

| Task | ❌ Wrong Agent | ✅ Right Agent |
|------|---------------|---------------|
| Design database schema | Backend Developer | Database Architect |
| Convert Figma to code | Frontend Developer | Figma to HTML |
| Review for security | Code Reviewer | Security Auditor |
| Coordinate complex project | Backend Developer | Orchestrator |

### 2. Specificity Matters

The more specific your request, the better the output.

**❌ Too vague:**
```bash
copilot agent run backend-developer "Make an API"
```

**✅ Specific:**
```bash
copilot agent run backend-developer "Create a RESTful API for a blog platform with:
- Posts: CRUD operations, pagination, filtering by author
- Comments: nested on posts, moderation status
- Authors: user profiles with bios
- Authentication: JWT with refresh tokens
- Framework: Express.js with TypeScript
- Database: PostgreSQL with Prisma ORM"
```

### 3. Provide Context

Help agents understand your environment:

```bash
copilot agent run frontend-developer "
Create a product card component for our e-commerce site.

Context:
- We use React 18 with TypeScript
- Tailwind CSS for styling
- We have a design system in src/components/ui
- Product data structure: { id, name, price, imageUrl, inStock }
- Card should match our existing component style (see src/components/ProductList)
"
```

### 4. Iterate, Don't Rewrite

Build on previous work rather than starting over:

```bash
# First iteration
copilot agent run backend-developer "Create user authentication API"

# Refine
copilot agent run backend-developer "Add rate limiting to the authentication endpoints"

# Enhance
copilot agent run security-auditor "Review the authentication implementation"

# Fix identified issues
copilot agent run backend-developer "Fix the security issues identified: [list them]"
```

## Agent-Specific Tips

### Orchestrator

**Do:**
- Describe the complete goal
- Mention all components needed
- Specify technology preferences
- Define success criteria

**Don't:**
- Micromanage which agents to use
- Specify exact sequencing (let it decide)
- Use for simple single-domain tasks

**Example:**
```bash
# Good - describe outcome
copilot agent run orchestrator "Build a real-time chat application with React frontend, Node.js backend, WebSocket communication, MongoDB storage, and user authentication"

# Bad - micromanaging
copilot agent run orchestrator "First use backend-developer to create API, then frontend-developer for UI, then..."
```

### Code Reviewer

**Do:**
- Specify what to focus on (performance, security, maintainability)
- Provide context about the project standards
- Ask for specific feedback types

**Don't:**
- Expect perfection - use judgment on suggestions
- Apply all suggestions blindly

**Example:**
```bash
# Good - focused review
copilot agent run code-reviewer "Review this authentication service focusing on:
- Security vulnerabilities
- Error handling
- Input validation
We follow Airbnb style guide and require 80% test coverage"

# Bad - no focus
copilot agent run code-reviewer "Review this code"
```

### Security Auditor

**Do:**
- Share authentication/authorization code
- Mention compliance requirements (GDPR, HIPAA, etc.)
- Provide full context (tech stack, data sensitivity)
- Ask for specific vulnerability types if you know them

**Don't:**
- Skip the audit before deploying sensitive features
- Ignore high-priority findings

**Example:**
```bash
copilot agent run security-auditor "Audit this payment processing module:
- Stack: Node.js, Express, Stripe API
- Compliance: PCI DSS requirements
- Focus areas: Payment data handling, API security, credential storage
- No credit card data should touch our servers"
```

### Test Generator

**Do:**
- Show the code to test
- Specify testing framework
- Mention coverage requirements
- Include edge cases to test

**Don't:**
- Skip tests for critical paths
- Accept tests without assertions

**Example:**
```bash
copilot agent run test-generator "Create Jest tests for UserService:
- Test all public methods
- Mock external dependencies (database, email service)
- Include edge cases: empty inputs, null values, duplicate emails
- Target 90% coverage
- Use AAA pattern (Arrange, Act, Assert)"
```

### Figma to HTML

**Do:**
- Provide Figma link or detailed screenshots
- Specify framework (React, Vue, plain HTML)
- Mention styling approach (CSS Modules, Tailwind, styled-components)
- Include responsive requirements

**Don't:**
- Expect pixel-perfect without design files
- Forget to specify component vs. page

**Example:**
```bash
copilot agent run figma-to-html "Convert this landing page to Next.js:
- Figma link: [URL]
- Use Tailwind CSS
- Create reusable components (Hero, Features, CTA)
- Mobile-first, responsive for tablet and desktop
- Accessibility: WCAG AA compliance
- Include hover states for buttons"
```

## Workflow Patterns

### Pattern 1: TDD with Agents

```bash
# 1. Generate tests first
copilot agent run test-generator "Create tests for user registration feature with email verification"

# 2. Implement to pass tests
copilot agent run backend-developer "Implement user registration to pass these tests: [tests]"

# 3. Refactor
copilot agent run code-reviewer "Review implementation, suggest refactorings"

# 4. Security check
copilot agent run security-auditor "Review user registration for vulnerabilities"
```

### Pattern 2: Design-Driven Development

```bash
# 1. Design system
copilot agent run design-system "Create design tokens for our SaaS product"

# 2. Design components
copilot agent run uiux-designer "Design user dashboard wireframe"

# 3. Convert to code
copilot agent run figma-to-html "Convert dashboard design to React components"

# 4. Make responsive
copilot agent run responsive-design "Ensure dashboard works on mobile and tablet"

# 5. Add interactivity
copilot agent run frontend-developer "Add state management and API integration to dashboard"
```

### Pattern 3: Refactoring Legacy Code

```bash
# 1. Understand current state
copilot agent run legacy-modernizer "Analyze this legacy PHP codebase for migration to modern stack"

# 2. Plan migration
copilot agent run enhanced-planner "Create step-by-step migration plan from PHP to Node.js"

# 3. Add tests to legacy code
copilot agent run test-generator "Create characterization tests for existing behavior"

# 4. Incremental refactoring
copilot agent run backend-developer "Convert user authentication module to Node.js"

# 5. Validate
copilot agent run e2e-tester "Create E2E tests to ensure feature parity"
```

### Pattern 4: API-First Development

```bash
# 1. Design API contract
copilot agent run api-designer "Design REST API for task management system with OpenAPI spec"

# 2. Generate backend from spec
copilot agent run backend-developer "Implement API endpoints from OpenAPI spec"

# 3. Generate client code
copilot agent run frontend-developer "Create TypeScript API client from OpenAPI spec"

# 4. Test contract
copilot agent run test-generator "Create contract tests validating API matches spec"
```

## Performance Optimization

### Strategy 1: Progressive Enhancement

Start simple, then optimize:

```bash
# 1. Basic implementation
copilot agent run backend-developer "Create user search endpoint"

# 2. Add caching
copilot agent run backend-developer "Add Redis caching to search endpoint"

# 3. Optimize queries
copilot agent run sql-expert "Optimize the user search query"

# 4. Profile
copilot agent run performance-optimizer "Analyze and improve search endpoint performance"
```

### Strategy 2: Bottleneck Identification

```bash
# 1. Profile
copilot agent run performance-optimizer "This endpoint is slow, identify bottlenecks: [code/metrics]"

# 2. Fix database issues
copilot agent run sql-expert "Optimize these slow queries: [queries]"

# 3. Fix application issues
copilot agent run backend-developer "Implement suggested optimizations: [list]"

# 4. Verify improvement
copilot agent run performance-optimizer "Validate optimizations achieved target performance"
```

## Team Collaboration

### Code Review Workflow

```bash
# Before creating PR
copilot agent run code-reviewer "Pre-review my changes"
copilot agent run test-generator "Ensure I have tests for new code"
copilot agent run doc-generator "Generate/update documentation"

# After PR created
# Team reviews manually + agent assistance
copilot agent run security-auditor "Security review of PR changes"
```

### Onboarding New Developers

```bash
# For new team member
copilot agent run doc-generator "Create onboarding guide for this codebase"
copilot agent run research-agent "Document our architecture and design decisions"
copilot agent run enhanced-planner "Create 30-day learning plan for new developer"
```

## Common Anti-Patterns to Avoid

### ❌ Anti-Pattern 1: Using Orchestrator for Simple Tasks

```bash
# Bad - overkill for simple task
copilot agent run orchestrator "Add a console.log statement"

# Good - use specific agent
copilot agent run javascript-expert "Add appropriate logging to this function"
```

### ❌ Anti-Pattern 2: Ignoring Agent Limitations

Every agent has limits. Don't expect:
- Security Auditor to find all vulnerabilities
- Code Reviewer to enforce team-specific conventions it doesn't know
- Test Generator to know your business logic

### ❌ Anti-Pattern 3: No Human Review

```bash
# Bad - blindly accepting all output
copilot agent run backend-developer "Build API" > api.js
git add api.js && git commit -m "Generated API"

# Good - review and test
copilot agent run backend-developer "Build API" > api.js
# Review the code, test it, refine it
copilot agent run test-generator "Create tests for the API"
# Test the tests, then commit
```

### ❌ Anti-Pattern 4: Vague Requests

```bash
# Bad
copilot agent run frontend-developer "Make it better"

# Good
copilot agent run frontend-developer "Improve accessibility: add ARIA labels, ensure keyboard navigation, increase color contrast to WCAG AA"
```

### ❌ Anti-Pattern 5: Not Providing Examples

```bash
# Bad
copilot agent run backend-developer "Follow our conventions"

# Good
copilot agent run backend-developer "Follow our conventions (see examples in src/services/user.service.ts):
- Service classes with dependency injection
- Async methods with try-catch
- Return { success, data, error } objects"
```

## Advanced Techniques

### Technique 1: Agent Chaining with Context Accumulation

```bash
# Build context across multiple agents
CONTEXT="Project: E-commerce site. Tech: React, Node.js, PostgreSQL"

copilot agent run database-architect "$CONTEXT. Design schema for products and orders"

SCHEMA_OUTPUT="[save output]"

copilot agent run backend-developer "$CONTEXT. Schema: $SCHEMA_OUTPUT. Create API endpoints"

API_OUTPUT="[save output]"

copilot agent run frontend-developer "$CONTEXT. API: $API_OUTPUT. Create product catalog UI"
```

### Technique 2: Validation Pipelines

```bash
# Pass work through multiple validators
copilot agent run backend-developer "Create auth service" | \
    copilot agent run security-auditor "Review" | \
    copilot agent run code-reviewer "Final review" | \
    copilot agent run test-generator "Create tests"
```

### Technique 3: Spec-Driven Development

```yaml
# 1. Create specification
copilot agent run api-designer "Design API spec for user management"

# 2. Generate implementation from spec
copilot agent run backend-developer "Implement from spec"
copilot agent run frontend-developer "Create client from spec"
copilot agent run test-generator "Create tests validating spec"

# 3. Keep spec as source of truth
# Update spec first, then regenerate
```

## Measuring Success

Track these metrics to improve your agent usage:

- **Time saved**: Before vs. after using agents
- **Code quality**: Bugs found in review, test coverage
- **Consistency**: Code style consistency across project
- **Security**: Vulnerabilities caught before production
- **Documentation**: Docs completeness and currency

## Next Steps

- **[Troubleshooting](./troubleshooting.md)** - Solve common issues
- **[Agent Guide](./agent-guide.md)** - Deep dive on each agent
- **[Orchestration Patterns](./orchestration-patterns.md)** - Multi-agent workflows

---

**Remember:** Agents are tools to augment your skills, not replace judgment. Review their output, test thoroughly, and iterate to perfection.
