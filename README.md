# Copilot Agent Library

A comprehensive collection of **37 production-ready custom GitHub Copilot agents** for developers, teams, and organizations. Download, customize, and deploy powerful AI agents to supercharge your development workflow.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Agents](https://img.shields.io/badge/Agents-37-green.svg)](#agent-categories)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## Quick Start

### For CLI Users

1. **Choose an agent** from the [Agent Categories](#agent-categories) below
2. **Download the agent file** (`.agent.md`) to your local machine
3. **Copy to your agents directory**:
 ```bash
 cp path/to/agent.agent.md ~/.github/agents/
 ```
4. **Use the agent**:
 ```bash
 copilot agent run agent-name "Your task here"
 ```

### For IDE Users (VS Code)

1. **Choose an agent** from the [Agent Categories](#agent-categories) below
2. **Download the agent file** (`.agent.md`)
3. **Add to your workspace**: `.github/agents/`
4. **Invoke in chat**: `@agent-name your task here`

---

## Agent Categories

### Orchestration (3 agents)

Coordinate multiple agents and manage complex workflows.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**Orchestrator**](agents/orchestration/orchestrator.agent.md) | Multi-agent coordinator and task delegator | Complex projects requiring multiple specialized agents |
| [**Workflow Manager**](agents/orchestration/workflow-manager.agent.md) | Sequential and parallel task execution | CI/CD pipelines, automated workflows |
| [**Project Manager**](agents/orchestration/project-manager.agent.md) | Sprint planning and stakeholder coordination | Agile project management, roadmap planning |

### Full-Stack Development (6 agents)

End-to-end development from frontend to backend to mobile.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**Frontend Developer**](agents/fullstack/frontend-developer.agent.md) | React/Vue/Angular expert, component architecture | Building modern web UIs, state management |
| [**Backend Developer**](agents/fullstack/backend-developer.agent.md) | API design, authentication, database integration | RESTful APIs, GraphQL, server-side logic |
| [**Full-Stack Expert**](agents/fullstack/fullstack-expert.agent.md) | End-to-end feature implementation | Full-stack features, monorepo projects |
| [**Mobile Developer**](agents/fullstack/mobile-developer.agent.md) | React Native, Flutter, native iOS/Android | Cross-platform mobile apps |
| [**API Designer**](agents/fullstack/api-designer.agent.md) | RESTful principles, OpenAPI specs, versioning | API architecture, documentation |
| [**Database Architect**](agents/fullstack/database-architect.agent.md) | Schema design, normalization, query optimization | Database modeling, performance tuning |

### Language Experts (6 agents)

Language-specific coding assistants with deep expertise.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**Python Expert**](agents/coding/python-expert.agent.md) | Type hints, pytest, best practices | Data science, backend services, automation |
| [**JavaScript Expert**](agents/coding/javascript-expert.agent.md) | Modern ES6+, React, Node.js | Web development, frontend/backend JS |
| [**Rust Expert**](agents/coding/rust-expert.agent.md) | Memory safety, borrowing, async/await | Systems programming, performance-critical code |
| [**Go Expert**](agents/coding/go-expert.agent.md) | Concurrency patterns, error handling | Microservices, cloud infrastructure |
| [**Java Expert**](agents/coding/java-expert.agent.md) | Spring Boot, Maven/Gradle, JUnit | Enterprise applications, Android apps |
| [**SQL Expert**](agents/coding/sql-expert.agent.md) | Query optimization, database design, migrations | Database development, data analysis |

### Testing & Quality (5 agents)

Ensure code quality, security, and comprehensive test coverage.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**E2E Tester**](agents/testing/e2e-tester.agent.md) | Playwright, Cypress, Selenium automation | End-to-end test automation, UI testing |
| [**A/B Test Ideas**](agents/testing/ab-test-ideas.agent.md) | Hypothesis generation, experiment design | Product experiments, feature testing |
| [**Code Reviewer**](agents/testing/code-reviewer.agent.md) | Pull request reviews, best practices | Code review automation, quality gates |
| [**Security Auditor**](agents/testing/security-auditor.agent.md) | Vulnerability scanning, OWASP compliance | Security audits, penetration testing |
| [**Test Generator**](agents/testing/test-generator.agent.md) | Unit tests, integration tests, coverage | Test creation, TDD/BDD workflows |

### Design & UI/UX (4 agents)

From design to code, build beautiful user interfaces.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**UI/UX Designer**](agents/design/uiux-designer.agent.md) | User flows, wireframing, design systems | Product design, user research |
| [**Figma to HTML**](agents/design/figma-to-html.agent.md) | Convert Figma designs to HTML/CSS/React | Design-to-code workflows |
| [**Responsive Design**](agents/design/responsive-design.agent.md) | Mobile-first, accessibility, cross-browser | Responsive web development |
| [**Design System Builder**](agents/design/design-system.agent.md) | Component libraries, design tokens | Building/maintaining design systems |

### Productivity (5 agents)

Plan, research, and document your projects effectively.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**Enhanced Planner**](agents/productivity/enhanced-planner.agent.md) | Multi-step planning with dependency tracking | Project planning, task breakdown |
| [**Research Agent**](agents/productivity/research-agent.agent.md) | Web research, documentation synthesis | Technical research, competitive analysis |
| [**Task Breakdown**](agents/productivity/task-breakdown.agent.md) | Epic decomposition, story estimation | Agile planning, sprint preparation |
| [**Doc Generator**](agents/productivity/doc-generator.agent.md) | README, API docs, architecture diagrams | Documentation automation |
| [**Bright Data Rapid Agent**](agents/productivity/brightdata-rapid-agent.agent.md) | Real-time web research via Bright Data MCP — search, discover, and scrape | Live fact-checking, URL scraping, batch search across topics |

### DevOps (4 agents)

Infrastructure, containers, and CI/CD automation.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**Docker Expert**](agents/devops/docker-expert.agent.md) | Dockerfile optimization, multi-stage builds | Container development, optimization |
| [**Kubernetes Expert**](agents/devops/kubernetes-expert.agent.md) | Manifests, Helm charts, troubleshooting | K8s deployment, cluster management |
| [**CI/CD Expert**](agents/devops/cicd-expert.agent.md) | GitHub Actions, GitLab CI, Azure DevOps | Pipeline automation, deployment |
| [**Terraform Expert**](agents/devops/terraform-expert.agent.md) | Infrastructure as code, state management | Cloud infrastructure, IaC |

### Debugging (3 agents)

Debug issues, optimize performance, and modernize legacy code.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**Debug Detective**](agents/debugging/debug-detective.agent.md) | Error analysis, stack trace interpretation | Debugging, root cause analysis |
| [**Performance Optimizer**](agents/debugging/performance-optimizer.agent.md) | Profiling, bottleneck identification | Performance tuning, optimization |
| [**Legacy Modernizer**](agents/debugging/legacy-modernizer.agent.md) | Migration strategies, tech debt reduction | Legacy code refactoring, upgrades |

### Integrations (1 agent)

Connect and automate third-party APIs and services.

| Agent | Description | Use Cases |
|-------|-------------|-----------|
| [**Buffer API Expert**](agents/integrations/buffer-api.agent.md) | Social media scheduling and analytics via Buffer GraphQL API | Schedule posts, manage channels, retrieve metrics, build content automations |

---

## Usage Examples

### Single Agent Workflow

```bash
# Use the Python Expert to refactor a function
copilot agent run python-expert "Refactor this function to use type hints and improve error handling"
```

### Multi-Agent Orchestration

```bash
# Use the Orchestrator to coordinate multiple agents
copilot agent run orchestrator "Build a new user authentication feature with frontend, backend, and tests"
```

The Orchestrator will delegate tasks to:
1. **Backend Developer**  API endpoints and authentication logic
2. **Frontend Developer**  Login/signup UI components
3. **Security Auditor**  Security review
4. **Test Generator**  Unit and integration tests

### Design-to-Code Workflow

```bash
# Convert Figma design to React components
copilot agent run figma-to-html "Convert this Figma design to React with TypeScript"
```

---

## Documentation

- **[Getting Started Guide](docs/getting-started.md)** - Installation and first agent usage
- **[Agent Guide](docs/agent-guide.md)** - Detailed usage for each agent
- **[CLI vs IDE](docs/cli-vs-ide.md)** - Platform-specific best practices
- **[Orchestration Patterns](docs/orchestration-patterns.md)** - Multi-agent coordination
- **[Best Practices](docs/best-practices.md)** - Advanced usage patterns
- **[Troubleshooting](docs/troubleshooting.md)** - Common issues and solutions

---

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- How to create a new agent
- Submission guidelines
- Quality standards
- PR review process

---

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

## Showcase

**Built something awesome with these agents?** Share your story!
- Open a [GitHub Discussion](../../discussions)
- Tweet with `#CopilotAgents`
- Submit a PR to add your project to our showcase

---

## Acknowledgments

Inspired by [github/awesome-copilot](https://github.com/github/awesome-copilot) and the amazing Copilot community.

---

<p align="center">Made with  by developers, for developers</p>
