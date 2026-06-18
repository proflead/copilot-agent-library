# Comprehensive Agent Guide

Detailed documentation for all 36 agents in the library, organized by category.

## Quick Navigation

- [Orchestration](#orchestration) (3 agents)
- [Full-Stack Development](#full-stack-development) (6 agents)
- [Language Experts](#language-experts) (6 agents)
- [Testing & Quality](#testing--quality) (5 agents)
- [Design & UI/UX](#design--uiux) (4 agents)
- [Productivity](#productivity) (4 agents)
- [DevOps](#devops) (4 agents)
- [Debugging](#debugging) (3 agents)

---

## Orchestration

### Orchestrator

**Best for:** Complex projects requiring multiple specialized agents

**Key Features:**
- Coordinates multiple agents automatically
- Breaks down complex tasks
- Manages dependencies between subtasks
- Ensures integration across agents

**When to use:**
- Full-stack features (frontend + backend + database)
- Projects with multiple phases
- Tasks requiring 3+ specialized agents
- When you want automatic coordination

**Example:**
```bash
copilot agent run orchestrator "Build a user authentication system with React frontend, Node.js backend, PostgreSQL database, JWT tokens, and comprehensive tests"
```

**Delegates to:** Any specialist agent as needed

---

### Workflow Manager

**Best for:** Sequential and parallel task automation

**Key Features:**
- Manages task dependencies
- Optimizes parallel execution
- Error handling and retries
- State management between steps

**When to use:**
- CI/CD pipelines
- Data processing workflows
- Multi-step automation
- Deployment sequences

**Example:**
```bash
copilot agent run workflow-manager "Create deployment workflow: run tests, build Docker image, push to registry, deploy to staging, run smoke tests, deploy to production"
```

---

### Project Manager

**Best for:** Agile project planning and sprint management

**Key Features:**
- Sprint planning and estimation
- Backlog grooming and prioritization
- Risk identification
- Status reporting

**When to use:**
- Planning sprints
- Estimating epics and stories
- Breaking down large features
- Tracking project progress

**Example:**
```bash
copilot agent run project-manager "Plan a 2-week sprint for building user notification system with email, SMS, and in-app notifications"
```

---

## Full-Stack Development

### Frontend Developer

**Best for:** Modern UI development with React, Vue, Angular

**Key Features:**
- Component architecture
- State management (Redux, Zustand, etc.)
- React Hooks patterns
- TypeScript integration
- Accessibility compliance

**When to use:**
- Building UI components
- Implementing user interactions
- State management
- Frontend-specific challenges

**Example:**
```bash
copilot agent run frontend-developer "Create a data table component with sorting, filtering, pagination, and CSV export using React and TypeScript"
```

**Works well with:** UI/UX Designer, Figma to HTML, Test Generator

---

### Backend Developer

**Best for:** Server-side logic, APIs, authentication

**Key Features:**
- RESTful APIs and GraphQL
- Authentication and authorization
- Database integration
- Input validation and error handling

**When to use:**
- Building API endpoints
- Implementing business logic
- Database operations
- Authentication systems

**Example:**
```bash
copilot agent run backend-developer "Create Express.js API for blog platform with posts, comments, user authentication using JWT, rate limiting, and PostgreSQL"
```

**Works well with:** Database Architect, API Designer, Security Auditor

---

### Full-Stack Expert

**Best for:** Complete features spanning frontend and backend

**Key Features:**
- End-to-end implementation
- Frontend-backend integration
- Full-stack patterns
- Deployment ready code

**When to use:**
- Implementing complete features
- Need integrated solution
- Want consistency across stack
- Solo development

**Example:**
```bash
copilot agent run fullstack-expert "Build a real-time chat feature with WebSockets, message persistence, typing indicators, and read receipts"
```

---

### Mobile Developer

**Best for:** Cross-platform mobile apps

**Key Features:**
- React Native and Flutter
- Native iOS/Android
- Mobile-specific patterns
- Platform-specific features

**When to use:**
- Building mobile apps
- Cross-platform development
- Native feature integration
- Mobile UI patterns

**Example:**
```bash
copilot agent run mobile-developer "Create React Native app for fitness tracking with workout logging, progress charts, and offline support"
```

---

### API Designer

**Best for:** API architecture and documentation

**Key Features:**
- RESTful design principles
- OpenAPI specifications
- Versioning strategies
- API documentation

**When to use:**
- Designing API contracts
- Creating API specifications
- Planning API versioning
- Documenting endpoints

**Example:**
```bash
copilot agent run api-designer "Design RESTful API for task management with OpenAPI 3.0 spec including projects, tasks, assignees, and file attachments"
```

---

### Database Architect

**Best for:** Schema design and optimization

**Key Features:**
- Entity-relationship modeling
- Normalization and optimization
- Index strategies
- Migration planning

**When to use:**
- Designing database schemas
- Optimizing queries
- Planning data models
- Database migrations

**Example:**
```bash
copilot agent run database-architect "Design PostgreSQL schema for e-commerce platform with products, orders, inventory, customers, and payment processing"
```

---

## Language Experts

### Python Expert

**Best for:** Modern Python with type hints

**Key Features:**
- Type annotations
- Pytest testing
- Async/await patterns
- PEP 8 compliance

**When to use:**
- Python-specific questions
- Type hint implementation
- Python best practices
- FastAPI/Django development

**Example:**
```bash
copilot agent run python-expert "Create async FastAPI endpoint for file upload with virus scanning, size validation, and S3 storage"
```

---

### JavaScript Expert

**Best for:** Modern JavaScript and TypeScript

**Key Features:**
- ES6+ patterns
- TypeScript type safety
- React hooks
- Node.js patterns

**When to use:**
- JavaScript-specific questions
- TypeScript conversion
- Modern JS patterns
- React or Node.js development

**Example:**
```bash
copilot agent run javascript-expert "Create custom React hook for data fetching with caching, loading states, and error handling"
```

---

### Rust Expert

**Best for:** Systems programming with Rust

**Key Features:**
- Memory safety without GC
- Ownership and borrowing
- Async Rust (Tokio)
- Zero-cost abstractions

**When to use:**
- Rust-specific questions
- Performance-critical code
- Systems programming
- Concurrency patterns

**Example:**
```bash
copilot agent run rust-expert "Create thread-safe cache using Arc and RwLock with TTL expiration and LRU eviction"
```

---

### Go Expert

**Best for:** Go services and concurrency

**Key Features:**
- Goroutines and channels
- Interface design
- Error handling patterns
- Table-driven tests

**When to use:**
- Go-specific questions
- Concurrent programming
- Microservices in Go
- Go best practices

**Example:**
```bash
copilot agent run go-expert "Create worker pool pattern for processing jobs with graceful shutdown and error recovery"
```

---

### Java Expert

**Best for:** Enterprise Java development

**Key Features:**
- Spring Boot
- JUnit testing
- Design patterns
- Maven/Gradle

**When to use:**
- Java-specific questions
- Spring Boot applications
- Enterprise patterns
- Java best practices

**Example:**
```bash
copilot agent run java-expert "Create Spring Boot REST controller with validation, exception handling, and integration tests"
```

---

### SQL Expert

**Best for:** Query optimization and database design

**Key Features:**
- Query optimization
- Index strategies
- Complex queries
- Performance tuning

**When to use:**
- Slow query optimization
- Complex SQL queries
- Database performance
- Schema design

**Example:**
```bash
copilot agent run sql-expert "Optimize this query that joins 5 tables and times out with large datasets"
```

---

## Testing & Quality

### E2E Tester

**Best for:** End-to-end test automation

**Key Features:**
- Playwright, Cypress, Selenium
- Page Object Model
- Visual regression testing
- CI integration

**When to use:**
- Creating E2E tests
- UI test automation
- User flow testing
- Integration testing

**Example:**
```bash
copilot agent run e2e-tester "Create Playwright tests for checkout flow including add to cart, shipping info, payment, and order confirmation"
```

---

### A/B Test Ideas

**Best for:** Experiment design and hypothesis generation

**Key Features:**
- Hypothesis generation
- Experiment design
- Metrics definition
- Sample size calculation

**When to use:**
- Designing A/B tests
- Optimizing conversion
- Validating features
- Data-driven decisions

**Example:**
```bash
copilot agent run ab-test-ideas "Design A/B tests to improve email signup conversion rate on landing page"
```

---

### Code Reviewer

**Best for:** Automated code review

**Key Features:**
- Quality assessment
- Best practice enforcement
- Bug detection
- Architectural review

**When to use:**
- Pre-commit reviews
- PR reviews
- Code quality checks
- Learning best practices

**Example:**
```bash
copilot agent run code-reviewer "Review this authentication service for security, error handling, and code quality"
```

---

### Security Auditor

**Best for:** Security vulnerability detection

**Key Features:**
- OWASP Top 10 coverage
- Vulnerability scanning
- Security best practices
- Compliance checking

**When to use:**
- Security reviews
- Pre-deployment audits
- Compliance requirements
- Vulnerability assessment

**Example:**
```bash
copilot agent run security-auditor "Audit payment processing module for PCI DSS compliance and security vulnerabilities"
```

---

### Test Generator

**Best for:** Automated test creation

**Key Features:**
- Unit tests
- Integration tests
- Mock generation
- Coverage optimization

**When to use:**
- Creating test suites
- TDD/BDD workflows
- Improving coverage
- Regression testing

**Example:**
```bash
copilot agent run test-generator "Create Jest tests for UserService with mocks for database and email service, targeting 90% coverage"
```

---

## Design & UI/UX

### UI/UX Designer

**Best for:** User experience design

**Key Features:**
- User flow design
- Wireframing
- Information architecture
- Accessibility

**When to use:**
- Designing user flows
- Creating wireframes
- UX improvements
- Design thinking

**Example:**
```bash
copilot agent run uiux-designer "Design onboarding flow for SaaS product that reduces drop-off and explains key features"
```

---

### Figma to HTML

**Best for:** Design-to-code conversion

**Key Features:**
- Figma to code conversion
- Component generation
- Design system extraction
- Responsive implementation

**When to use:**
- Converting designs to code
- Building from mockups
- Design handoff
- Rapid prototyping

**Example:**
```bash
copilot agent run figma-to-html "Convert this landing page design to Next.js with Tailwind CSS: [Figma URL]"
```

---

### Responsive Design

**Best for:** Mobile-first responsive layouts

**Key Features:**
- Mobile-first CSS
- Breakpoint strategies
- Touch optimization
- Cross-browser support

**When to use:**
- Making designs responsive
- Mobile optimization
- Layout challenges
- Accessibility improvements

**Example:**
```bash
copilot agent run responsive-design "Make this dashboard layout responsive for mobile, tablet, and desktop with mobile-first approach"
```

---

### Design System Builder

**Best for:** Creating design systems

**Key Features:**
- Design tokens
- Component libraries
- Style guides
- Theming support

**When to use:**
- Building design systems
- Creating component libraries
- Standardizing design
- Scaling design

**Example:**
```bash
copilot agent run design-system "Create design system with tokens, component library, and documentation for our SaaS product"
```

---

## Productivity

### Enhanced Planner

**Best for:** Multi-step project planning

**Key Features:**
- Task breakdown
- Dependency mapping
- Risk assessment
- Milestone definition

**When to use:**
- Planning projects
- Breaking down epics
- Creating roadmaps
- Risk planning

**Example:**
```bash
copilot agent run enhanced-planner "Plan migration from monolith to microservices with phases, dependencies, and risks"
```

---

### Research Agent

**Best for:** Technical research and investigation

**Key Features:**
- Web research
- Documentation analysis
- Technology comparison
- Best practices research

**When to use:**
- Researching technologies
- Comparing solutions
- Finding best practices
- Competitive analysis

**Example:**
```bash
copilot agent run research-agent "Research and compare React Server Components vs traditional SSR with pros, cons, and use cases"
```

---

### Task Breakdown

**Best for:** Agile story decomposition

**Key Features:**
- Epic decomposition
- User story creation
- Acceptance criteria
- Story estimation

**When to use:**
- Breaking down epics
- Creating user stories
- Sprint planning
- Estimation sessions

**Example:**
```bash
copilot agent run task-breakdown "Break down user authentication epic into detailed user stories with acceptance criteria"
```

---

### Doc Generator

**Best for:** Documentation creation

**Key Features:**
- README generation
- API documentation
- Architecture diagrams
- User guides

**When to use:**
- Creating documentation
- Documenting APIs
- Writing guides
- Architecture docs

**Example:**
```bash
copilot agent run doc-generator "Create comprehensive README for this REST API with installation, usage, API reference, and examples"
```

---

## DevOps

### Docker Expert

**Best for:** Container optimization

**Key Features:**
- Multi-stage builds
- Security hardening
- Image optimization
- Docker Compose

**When to use:**
- Creating Dockerfiles
- Optimizing images
- Container security
- Docker troubleshooting

**Example:**
```bash
copilot agent run docker-expert "Create optimized multi-stage Dockerfile for Node.js app with security best practices"
```

---

### Kubernetes Expert

**Best for:** K8s deployments

**Key Features:**
- Manifest creation
- Helm charts
- Troubleshooting
- Security configurations

**When to use:**
- K8s deployments
- Helm chart creation
- Cluster troubleshooting
- Resource optimization

**Example:**
```bash
copilot agent run kubernetes-expert "Create K8s manifests for microservice with autoscaling, health checks, and ConfigMap"
```

---

### CI/CD Expert

**Best for:** Automated pipelines

**Key Features:**
- GitHub Actions
- GitLab CI
- Pipeline optimization
- Deployment strategies

**When to use:**
- Creating pipelines
- Automating workflows
- Deployment automation
- CI/CD optimization

**Example:**
```bash
copilot agent run cicd-expert "Create GitHub Actions workflow for Node.js app with tests, build, Docker push, and deploy to production"
```

---

### Terraform Expert

**Best for:** Infrastructure as Code

**Key Features:**
- Resource management
- Module creation
- State management
- Multi-cloud support

**When to use:**
- Infrastructure provisioning
- IaC implementation
- Cloud resource management
- Infrastructure versioning

**Example:**
```bash
copilot agent run terraform-expert "Create Terraform module for VPC with public/private subnets, NAT gateway, and security groups"
```

---

## Debugging

### Debug Detective

**Best for:** Error investigation

**Key Features:**
- Stack trace analysis
- Root cause identification
- Debugging strategies
- Error pattern recognition

**When to use:**
- Debugging errors
- Analyzing crashes
- Understanding bugs
- Finding root causes

**Example:**
```bash
copilot agent run debug-detective "Analyze this NullPointerException and help me fix it: [stack trace]"
```

---

### Performance Optimizer

**Best for:** Performance tuning

**Key Features:**
- Bottleneck identification
- Query optimization
- Algorithm improvements
- Caching strategies

**When to use:**
- Slow performance issues
- Query optimization
- Frontend performance
- Resource optimization

**Example:**
```bash
copilot agent run performance-optimizer "This API endpoint is slow (2s response time), identify bottlenecks and optimize"
```

---

### Legacy Modernizer

**Best for:** Legacy code refactoring

**Key Features:**
- Migration planning
- Incremental refactoring
- Tech debt reduction
- Risk mitigation

**When to use:**
- Modernizing legacy code
- Planning migrations
- Reducing tech debt
- Framework upgrades

**Example:**
```bash
copilot agent run legacy-modernizer "Plan and execute migration from AngularJS to React with minimal disruption"
```

---

## Choosing the Right Agent

### Decision Tree

```
Complex multi-domain task?  Orchestrator
 Yes  Use Orchestrator
 No
   What's the primary focus?
       Planning/Architecture  Enhanced Planner / API Designer / Database Architect
       Implementation  Frontend/Backend/Full-Stack Developer
       Testing  E2E Tester / Test Generator
       Quality  Code Reviewer / Security Auditor
       Documentation  Doc Generator
       Design  UI/UX Designer / Figma to HTML
       DevOps  Docker/Kubernetes/CI-CD/Terraform Expert
       Debugging  Debug Detective / Performance Optimizer
```

### Quick Reference

| Task | Primary Agent | Supporting Agents |
|------|--------------|-------------------|
| New API feature | Backend Developer | API Designer, Database Architect, Test Generator |
| UI component | Frontend Developer | UI/UX Designer, Responsive Design |
| Full feature | Orchestrator or Full-Stack Expert | Various specialists |
| Performance issue | Performance Optimizer | SQL Expert, Backend Developer |
| Bug investigation | Debug Detective | Test Generator (reproduce) |
| Security review | Security Auditor | Code Reviewer |
| Legacy migration | Legacy Modernizer | Enhanced Planner, Test Generator |
| Design implementation | Figma to HTML | Frontend Developer, Responsive Design |

---

For detailed examples and best practices, see:
- [Getting Started](./getting-started.md)
- [Orchestration Patterns](./orchestration-patterns.md)
- [Best Practices](./best-practices.md)
