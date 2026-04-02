# Testing Guide for Copilot Agents

Comprehensive testing scenarios and validation checklist for all 35 agents.

## Testing Overview

This document provides:
- Validation criteria for each agent
- Test scenarios (CLI and IDE)
- Quality benchmarks
- Known issues and limitations

## Test Environment Setup

### CLI Testing Prerequisites

```bash
# Verify Copilot CLI installation
gh extension list | grep copilot
gh copilot --version

# Create test agents directory
mkdir -p ~/.github/agents

# Copy agents for testing
cp agents/**/*.agent.md ~/.github/agents/

# Verify agents loaded
gh copilot agent list
```

### IDE Testing Prerequisites

**VS Code:**
1. Install GitHub Copilot extension (latest)
2. Reload VS Code window
3. Create test workspace
4. Copy agents to `.github/agents/` in workspace
5. Reload window again

**Verification:**
- Open Copilot Chat (`Ctrl/Cmd + I`)
- Type `@` and verify agents appear

---

## Testing Matrix

| Category | Agents | CLI Priority | IDE Priority | Complexity |
|----------|--------|--------------|--------------|------------|
| Orchestration | 3 | High | High | Complex |
| Full-Stack | 6 | High | High | Complex |
| Language Experts | 6 | Medium | High | Simple |
| Testing & Quality | 5 | High | Medium | Medium |
| Design & UI/UX | 4 | Low | High | Medium |
| Productivity | 4 | High | Medium | Simple |
| DevOps | 4 | High | Low | Medium |
| Debugging | 3 | Medium | High | Medium |

---

## Validation Criteria

### Universal Criteria (All Agents)

- [ ] Agent file loads without errors
- [ ] Agent appears in agent list
- [ ] Agent responds to simple prompts
- [ ] Agent output is coherent and relevant
- [ ] Agent follows specified format
- [ ] Agent respects tool restrictions
- [ ] Agent handles edge cases gracefully
- [ ] Agent provides actionable output

### Quality Benchmarks

**Response Time:**
- Simple queries: < 30 seconds
- Complex queries: < 2 minutes
- Multi-step workflows: < 5 minutes

**Output Quality:**
- Accuracy: 90%+ relevance to prompt
- Completeness: Addresses all requirements
- Format: Consistent with examples
- Code quality: Follows best practices

---

## Test Scenarios by Category

## 1. Orchestration Agents

### Orchestrator

**Test Scenario 1: Full-Stack Feature**
```bash
# CLI
gh copilot agent run orchestrator "Build a todo list feature with:
- React frontend with add, delete, mark complete
- Express REST API
- PostgreSQL database
- Jest tests"

# Expected:
# - Delegates to Frontend, Backend, Database Architect, Test Generator
# - Provides integrated solution
# - All components work together
```

**Test Scenario 2: Complex Coordination**
```bash
# CLI
gh copilot agent run orchestrator "Build authentication system with OAuth, JWT, email verification, and rate limiting"

# Expected:
# - Multi-phase plan
# - Security considerations
# - Integration points documented
```

**Validation:**
- [ ] Successfully delegates to multiple agents
- [ ] Coordinates integration between agents
- [ ] Provides cohesive solution
- [ ] Handles dependencies correctly

---

### Workflow Manager

**Test Scenario: CI/CD Pipeline**
```bash
# CLI
gh copilot agent run workflow-manager "Create GitHub Actions workflow:
1. Run tests
2. Build Docker image (parallel with tests)
3. Push to registry (depends on both)
4. Deploy to staging
5. Run smoke tests
6. Deploy to production (manual approval)"

# Expected:
# - Identifies parallel opportunities
# - Sets up dependencies correctly
# - Includes error handling
```

**Validation:**
- [ ] Identifies task dependencies
- [ ] Optimizes for parallel execution
- [ ] Includes error handling
- [ ] Provides rollback strategy

---

### Project Manager

**Test Scenario: Sprint Planning**
```bash
# CLI
gh copilot agent run project-manager "Plan 2-week sprint for user profile feature:
- Profile editing
- Avatar upload
- Privacy settings
- Activity feed
Team: 2 frontend, 2 backend devs"

# Expected:
# - Story breakdown
# - Effort estimates
# - Sprint capacity analysis
# - Risk assessment
```

**Validation:**
- [ ] Breaks down into user stories
- [ ] Provides realistic estimates
- [ ] Identifies risks
- [ ] Suggests priorities

---

## 2. Full-Stack Development

### Frontend Developer

**Test Scenario 1: React Component**
```bash
# CLI
gh copilot agent run frontend-developer "Create React TypeScript component for user profile card with:
- Avatar, name, bio
- Follow/Unfollow button
- Follower/following counts
- Tailwind CSS styling"

# Expected:
# - TypeScript interfaces
# - Functional component with hooks
# - Proper styling
# - Accessibility attributes
```

**Test Scenario 2: State Management**
```bash
# IDE
@frontend-developer Create Zustand store for shopping cart with add, remove, update quantity, clear cart, and persist to localStorage

# Expected:
# - Type-safe store
# - Actions and selectors
# - Persistence logic
```

**Validation:**
- [ ] Uses modern React patterns (hooks, not classes)
- [ ] TypeScript types included
- [ ] Follows accessibility best practices
- [ ] Includes usage examples
- [ ] Handles edge cases (loading, errors)

---

### Backend Developer

**Test Scenario 1: REST API**
```bash
# CLI
gh copilot agent run backend-developer "Create Express.js API for blog posts:
- CRUD operations
- Pagination and filtering
- Input validation with Zod
- JWT authentication
- Rate limiting
- PostgreSQL with Prisma"

# Expected:
# - All CRUD endpoints
# - Validation middleware
# - Auth middleware
# - Error handling
```

**Test Scenario 2: Complex Business Logic**
```bash
# IDE
@backend-developer Create service for order processing:
- Validate stock availability
- Calculate total with discounts and tax
- Reserve inventory
- Process payment (Stripe)
- Send confirmation email
- Handle rollback on failure

# Expected:
# - Transaction handling
# - Error recovery
# - External service integration
```

**Validation:**
- [ ] All endpoints implemented
- [ ] Input validation present
- [ ] Authentication/authorization handled
- [ ] Error handling comprehensive
- [ ] Database queries optimized
- [ ] API documented

---

### Full-Stack Expert

**Test Scenario: Complete Feature**
```bash
# CLI
gh copilot agent run fullstack-expert "Build real-time notifications:
- WebSocket server (Socket.io)
- React notification bell with dropdown
- Mark as read functionality
- Persistence to database
- Push notifications when tab inactive"

# Expected:
# - Frontend and backend code
# - WebSocket integration
# - State management
# - Persistence layer
```

**Validation:**
- [ ] Frontend and backend integrated
- [ ] Real-time functionality works
- [ ] Proper error handling
- [ ] Scalability considered

---

### Mobile Developer

**Test Scenario: Mobile App Feature**
```bash
# CLI
gh copilot agent run mobile-developer "Create React Native camera feature:
- Take photo or select from gallery
- Crop and rotate
- Apply filters
- Upload to server
- iOS and Android support"

# Expected:
# - Platform-specific code
# - Permission handling
# - Image processing
# - Upload with progress
```

**Validation:**
- [ ] Cross-platform considerations
- [ ] Native features properly used
- [ ] Permission requests handled
- [ ] Performance optimized

---

### API Designer

**Test Scenario: OpenAPI Spec**
```bash
# CLI
gh copilot agent run api-designer "Design REST API for e-commerce:
- Products (CRUD, search, categories)
- Shopping cart
- Orders
- User accounts
- Reviews
Include OpenAPI 3.0 spec"

# Expected:
# - Complete OpenAPI YAML
# - All endpoints documented
# - Request/response schemas
# - Authentication scheme
```

**Validation:**
- [ ] Valid OpenAPI 3.0 format
- [ ] All CRUD operations covered
- [ ] Proper HTTP methods used
- [ ] Authentication defined
- [ ] Error responses documented
- [ ] Examples included

---

### Database Architect

**Test Scenario: Complex Schema**
```bash
# CLI
gh copilot agent run database-architect "Design PostgreSQL schema for project management:
- Organizations, projects, tasks
- Users with role-based access
- Comments and attachments
- Activity logs
- Time tracking
Include indexes and constraints"

# Expected:
# - Complete schema with types
# - Foreign key relationships
# - Appropriate indexes
# - Migration scripts
```

**Validation:**
- [ ] Schema properly normalized
- [ ] Indexes on query columns
- [ ] Constraints enforced
- [ ] Cascading deletes handled
- [ ] Performance considerations

---

## 3. Language Experts

### Test Scenario Template for All Language Experts

**Python Expert:**
```bash
gh copilot agent run python-expert "Create async function to scrape website with:
- aiohttp for requests
- BeautifulSoup for parsing
- Rate limiting
- Retry logic
- Type hints
- Pytest tests"
```

**JavaScript Expert:**
```bash
gh copilot agent run javascript-expert "Create custom Promise utility with:
- Promise.allSettled alternative
- Retry logic
- Timeout handling
- TypeScript types"
```

**Rust Expert:**
```bash
gh copilot agent run rust-expert "Create thread-safe LRU cache:
- Generic key/value types
- TTL support
- Arc + RwLock
- Tokio async"
```

**Go Expert:**
```bash
gh copilot agent run go-expert "Create worker pool:
- Configurable workers
- Job queue
- Graceful shutdown
- Context cancellation"
```

**Java Expert:**
```bash
gh copilot agent run java-expert "Create Spring Boot service:
- REST endpoints
- JPA entities
- Transaction management
- JUnit tests"
```

**SQL Expert:**
```bash
gh copilot agent run sql-expert "Optimize slow query:
[paste slow query joining 5 tables]
Target: < 100ms for 1M rows"
```

**Validation (All Language Experts):**
- [ ] Language-specific idioms used
- [ ] Modern patterns (not outdated)
- [ ] Type safety where applicable
- [ ] Error handling proper
- [ ] Tests included
- [ ] Performance considered

---

## 4. Testing & Quality

### E2E Tester

**Test Scenario: Full User Flow**
```bash
# CLI
gh copilot agent run e2e-tester "Create Playwright tests for checkout:
1. Search for product
2. Add to cart
3. Apply discount code
4. Enter shipping
5. Complete payment
6. Verify confirmation"

# Expected:
# - Page Object Model
# - Proper waits/assertions
# - Test data setup
# - Cleanup
```

**Validation:**
- [ ] Tests follow Page Object pattern
- [ ] Proper wait strategies (not arbitrary sleeps)
- [ ] Assertions are specific
- [ ] Tests are independent
- [ ] Cleanup handled

---

### A/B Test Ideas

**Test Scenario: Conversion Optimization**
```bash
# CLI
gh copilot agent run ab-test-ideas "Generate A/B test ideas to improve:
- Landing page signup conversion (currently 2%)
- Email click-through rate
- Free to paid conversion"

# Expected:
# - Multiple hypothesis
# - Metrics to track
# - Sample size estimates
# - Expected impact
```

**Validation:**
- [ ] Hypotheses are specific
- [ ] Metrics clearly defined
- [ ] Statistical rigor considered
- [ ] Realistic expectations

---

### Code Reviewer

**Test Scenario: Security Review**
```bash
# CLI
gh copilot agent run code-reviewer "Review this authentication code:
[paste code with SQL injection vulnerability]"

# Expected:
# - Identifies security issue
# - Explains the problem
# - Provides fix
# - Suggests improvements
```

**Validation:**
- [ ] Identifies bugs and vulnerabilities
- [ ] Explains issues clearly
- [ ] Provides actionable feedback
- [ ] Suggests improvements
- [ ] Prioritizes findings

---

### Security Auditor

**Test Scenario: OWASP Coverage**
```bash
# CLI
gh copilot agent run security-auditor "Audit this API for OWASP Top 10:
[paste API code]"

# Expected:
# - Checks all OWASP categories
# - Identifies vulnerabilities
# - Rates severity
# - Provides remediation
```

**Validation:**
- [ ] Covers OWASP Top 10
- [ ] Identifies real vulnerabilities
- [ ] Severity ratings accurate
- [ ] Remediation steps clear
- [ ] Compliance considerations

---

### Test Generator

**Test Scenario: Comprehensive Test Suite**
```bash
# CLI
gh copilot agent run test-generator "Create Jest tests for OrderService:
- calculateTotal (with discounts, tax, shipping)
- processOrder (happy path and errors)
- Mock external services (payment, email)
- Target 90% coverage"

# Expected:
# - Unit tests for all methods
# - Mocks for dependencies
# - Edge cases covered
# - Descriptive test names
```

**Validation:**
- [ ] Tests all public methods
- [ ] Mocks external dependencies
- [ ] Covers edge cases
- [ ] Test names descriptive
- [ ] Assertions specific

---

## 5. Design & UI/UX

### UI/UX Designer

**Test Scenario: User Flow Design**
```bash
# CLI
gh copilot agent run uiux-designer "Design onboarding flow for project management app:
- Explain key features
- Collect user preferences
- Create first project
- Minimize drop-off"

# Expected:
# - Step-by-step flow
# - Wireframes (text-based)
# - UX rationale
# - Accessibility notes
```

**Validation:**
- [ ] Flow is logical
- [ ] User needs considered
- [ ] Accessibility addressed
- [ ] Mobile-friendly
- [ ] Clear calls to action

---

### Figma to HTML

**Test Scenario: Design Conversion**
```bash
# CLI
gh copilot agent run figma-to-html "Convert landing page design:
[Figma URL or description]
- Hero section with CTA
- Features grid
- Testimonials
- Pricing table
Use React + Tailwind CSS"

# Expected:
# - Semantic HTML
# - Responsive design
# - Component breakdown
# - Matching design
```

**Validation:**
- [ ] Matches design visually
- [ ] Responsive on all breakpoints
- [ ] Semantic HTML used
- [ ] Accessibility attributes
- [ ] Reusable components

---

### Responsive Design

**Test Scenario: Layout Optimization**
```bash
# CLI
gh copilot agent run responsive-design "Make this dashboard responsive:
[paste desktop-only CSS]
Target: 320px (mobile) to 1920px (desktop)"

# Expected:
# - Mobile-first approach
# - Proper breakpoints
# - Touch optimization
# - Performance considered
```

**Validation:**
- [ ] Mobile-first approach
- [ ] Breakpoints logical (not arbitrary)
- [ ] Touch targets appropriate size
- [ ] No horizontal scroll
- [ ] Performance optimized

---

### Design System Builder

**Test Scenario: Component Library**
```bash
# CLI
gh copilot agent run design-system "Create design system for SaaS app:
- Design tokens (colors, spacing, typography)
- Core components (Button, Input, Card)
- Documentation
- Storybook setup"

# Expected:
# - Token definitions
# - Reusable components
# - Usage guidelines
# - Theming support
```

**Validation:**
- [ ] Tokens properly defined
- [ ] Components reusable
- [ ] Documentation clear
- [ ] Theming support included
- [ ] Accessibility built-in

---

## 6. Productivity

### Enhanced Planner

**Test Scenario: Complex Project**
```bash
# CLI
gh copilot agent run enhanced-planner "Plan migration from monolith to microservices:
- Current: Rails monolith
- Target: Node.js microservices
- 10 team members
- 6 month timeline"

# Expected:
# - Phase breakdown
# - Dependencies mapped
# - Risks identified
# - Rollback strategy
```

**Validation:**
- [ ] Plan is detailed and actionable
- [ ] Dependencies clearly shown
- [ ] Risks identified with mitigation
- [ ] Timeline realistic
- [ ] Verification steps included

---

### Research Agent

**Test Scenario: Technology Comparison**
```bash
# CLI
gh copilot agent run research-agent "Research React vs Vue vs Svelte for our next project:
- Learning curve
- Ecosystem maturity
- Performance
- Team size: 5 devs
- Project: customer portal"

# Expected:
# - Objective comparison
# - Pros/cons for each
# - Recommendation with reasoning
# - Migration considerations
```

**Validation:**
- [ ] Research is thorough
- [ ] Information is current (2024+)
- [ ] Comparison is objective
- [ ] Recommendation justified
- [ ] Sources cited or verifiable

---

### Task Breakdown

**Test Scenario: Epic Decomposition**
```bash
# CLI
gh copilot agent run task-breakdown "Break down epic: User Authentication
Include: registration, login, password reset, 2FA, OAuth"

# Expected:
# - Multiple user stories
# - Acceptance criteria
# - Story point estimates
# - Dependencies
```

**Validation:**
- [ ] Stories are independent
- [ ] Acceptance criteria testable
- [ ] Estimates reasonable
- [ ] Dependencies identified
- [ ] Stories deliverable in sprint

---

### Doc Generator

**Test Scenario: API Documentation**
```bash
# CLI
gh copilot agent run doc-generator "Create README for REST API:
[provide API code or OpenAPI spec]
Include: setup, authentication, endpoints, examples"

# Expected:
# - Clear installation steps
# - API reference
# - Code examples
# - Troubleshooting
```

**Validation:**
- [ ] Documentation is complete
- [ ] Examples are working
- [ ] Clear and well-structured
- [ ] Includes troubleshooting
- [ ] Proper formatting

---

## 7. DevOps

### Docker Expert

**Test Scenario: Optimized Dockerfile**
```bash
# CLI
gh copilot agent run docker-expert "Create Dockerfile for Node.js app:
- Multi-stage build
- Security hardening
- Minimize image size
- Non-root user
- Production best practices"

# Expected:
# - Multi-stage build
# - Minimal base image
# - Security considerations
# - Build caching optimized
```

**Validation:**
- [ ] Multi-stage build used
- [ ] Image size minimized
- [ ] Security best practices followed
- [ ] Non-root user
- [ ] .dockerignore included

---

### Kubernetes Expert

**Test Scenario: Application Deployment**
```bash
# CLI
gh copilot agent run kubernetes-expert "Create K8s manifests for web app:
- 3 replicas with autoscaling
- Health checks
- ConfigMap for environment
- Secret for database credentials
- Service with LoadBalancer"

# Expected:
# - Deployment manifest
# - Service manifest
# - ConfigMap and Secret
# - HPA (autoscaling)
```

**Validation:**
- [ ] All resources defined
- [ ] Health checks configured
- [ ] Resource limits set
- [ ] Labels consistent
- [ ] Security best practices

---

### CI/CD Expert

**Test Scenario: Complete Pipeline**
```bash
# CLI
gh copilot agent run cicd-expert "Create GitHub Actions workflow:
- Run tests on PR
- Build Docker on merge to main
- Deploy to staging automatically
- Deploy to production on release tag"

# Expected:
# - Workflow YAML
# - Job dependencies correct
# - Secrets handling
# - Caching for speed
```

**Validation:**
- [ ] Workflow syntax valid
- [ ] Jobs properly sequenced
- [ ] Secrets properly used
- [ ] Caching implemented
- [ ] Error handling included

---

### Terraform Expert

**Test Scenario: Infrastructure Provisioning**
```bash
# CLI
gh copilot agent run terraform-expert "Create Terraform for AWS:
- VPC with public/private subnets
- RDS PostgreSQL
- ECS cluster for containers
- Application Load Balancer
- Security groups"

# Expected:
# - Modular structure
# - Variables and outputs
# - State management
# - Resource dependencies
```

**Validation:**
- [ ] Terraform syntax valid
- [ ] Resources properly configured
- [ ] Variables used effectively
- [ ] Outputs defined
- [ ] Security groups restrictive

---

## 8. Debugging

### Debug Detective

**Test Scenario: Error Investigation**
```bash
# CLI
gh copilot agent run debug-detective "Analyze error:
NullPointerException in UserService.getProfile()
Stack trace: [paste stack trace]
Occurs randomly, ~10% of requests"

# Expected:
# - Root cause identified
# - Explanation clear
# - Fix suggested
# - Prevention advice
```

**Validation:**
- [ ] Identifies root cause
- [ ] Explanation is clear
- [ ] Fix is correct
- [ ] Considers edge cases
- [ ] Suggests prevention

---

### Performance Optimizer

**Test Scenario: Slow Endpoint**
```bash
# CLI
gh copilot agent run performance-optimizer "Optimize slow API:
Endpoint: GET /users/{id}/feed
Current: 3.5s average
Target: <100ms
Code: [paste code with N+1 queries]"

# Expected:
# - Bottleneck identified
# - Optimization strategy
# - Code improvements
# - Expected improvement
```

**Validation:**
- [ ] Identifies bottlenecks
- [ ] Solutions are practical
- [ ] Performance impact quantified
- [ ] No correctness regression
- [ ] Monitoring suggested

---

### Legacy Modernizer

**Test Scenario: Framework Migration**
```bash
# CLI
gh copilot agent run legacy-modernizer "Plan migration:
From: AngularJS 1.5
To: React 18
App size: ~50 components
Timeline: 3 months
Team: 4 developers"

# Expected:
# - Migration strategy
# - Phased approach
# - Coexistence plan
# - Risk mitigation
```

**Validation:**
- [ ] Strategy is realistic
- [ ] Phases well-defined
- [ ] Risks identified
- [ ] Rollback plan included
- [ ] Testing strategy

---

## Known Issues & Limitations

### General Limitations

1. **Context Length**: Very large codebases may exceed context limits
 - Workaround: Provide specific files/sections

2. **External Dependencies**: Agents can't install packages or make HTTP requests
 - Workaround: Provide API responses or mock data

3. **File Access**: Agents don't automatically see all project files
 - Workaround: Explicitly reference or paste relevant code

4. **Determinism**: Responses may vary between runs
 - Expected: Some variation is normal

### Agent-Specific Issues

**Orchestrator:**
- May over-delegate for simple tasks
- Can be verbose in explanations

**Language Experts:**
- May default to older patterns if not explicitly told to use modern versions
- Workaround: Specify versions (e.g., "React 18 with hooks")

**Design Agents:**
- Cannot see actual Figma designs without URL or detailed description
- Text-based wireframes have limitations

**DevOps Agents:**
- Cannot test actual deployments
- Infrastructure costs not calculated

---

## Test Execution Checklist

### Before Testing
- [ ] Copilot CLI/extension updated
- [ ] Agents copied to correct directory
- [ ] Test workspace/projects prepared
- [ ] Sample code/data available

### During Testing
- [ ] Record agent invocation command
- [ ] Note response time
- [ ] Evaluate output quality
- [ ] Test edge cases
- [ ] Document issues

### After Testing
- [ ] Compile results
- [ ] Identify patterns in issues
- [ ] Update agent files if needed
- [ ] Document workarounds

---

## Success Metrics

### Quantitative
- **Response Rate**: 95%+ agents respond successfully
- **Accuracy**: 90%+ outputs are usable with minor edits
- **Speed**: 90%+ responses within target time

### Qualitative
- **Usefulness**: Agents provide value over manual work
- **Consistency**: Similar prompts yield similar quality
- **Integration**: Multi-agent workflows function smoothly

---

## Reporting Issues

When reporting test failures:

1. **Agent name**: Which agent failed
2. **Platform**: CLI or IDE (VS Code, etc.)
3. **Prompt**: Exact prompt used
4. **Expected**: What should have happened
5. **Actual**: What actually happened
6. **Logs**: Error messages or output

**Template:**
```
Agent: backend-developer
Platform: CLI (gh copilot 0.5.3)
Prompt: "Create Express API with..."
Expected: REST endpoints with validation
Actual: Generated outdated Express 3.x syntax
Severity: Medium
Workaround: Specify "Express 5.x"
```

---

## Next Steps After Testing

1. Fix identified issues in agent files
2. Update documentation with workarounds
3. Add examples based on test scenarios
4. Create video demos of successful tests
5. Prepare for community feedback

For questions or issues: [GitHub Issues](../../issues)
