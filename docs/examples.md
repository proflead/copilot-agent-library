# Visual Examples & Workflows

Real-world examples demonstrating agent usage patterns and workflows.

## Table of Contents

- [Quick Start Examples](#quick-start-examples)
- [Single Agent Workflows](#single-agent-workflows)
- [Multi-Agent Orchestration](#multi-agent-orchestration)
- [Before/After Examples](#beforeafter-examples)
- [Integration Patterns](#integration-patterns)
- [Workflow Diagrams](#workflow-diagrams)

---

## Quick Start Examples

### 1. Simple Code Review

**Scenario:** Review a pull request

```bash
# Clone the PR
git fetch origin pull/123/head:pr-123
git checkout pr-123

# Run code review
copilot agent run code-reviewer "Review changes in this PR focusing on security, performance, and best practices"
```

**Expected Output:**
```
 Code Review Results:

Security:
- Input validation present
- SQL queries use string concatenation (risk of injection)
- Recommendation: Use parameterized queries

Performance:
- N+1 query pattern in getUserPosts()
- Recommendation: Use eager loading or batch queries

Best Practices:
- Error handling implemented
- Magic numbers used (e.g., setTimeout(5000))
- Recommendation: Extract to configuration constants
```

---

### 2. Create React Component

**Scenario:** Build a reusable component

```bash
copilot agent run frontend-developer "Create a DataTable component with:
- Sorting by column
- Filtering with search
- Pagination (20 per page)
- TypeScript types
- Tailwind CSS styling"
```

**Output:** Complete component with:
- `DataTable.tsx` - Main component
- `DataTable.types.ts` - TypeScript interfaces
- `DataTable.test.tsx` - Test cases
- Usage examples

---

### 3. Design REST API

**Scenario:** Create API specification

```bash
copilot agent run api-designer "Design REST API for task management with:
- Projects and tasks
- User assignments
- Due dates and priorities
- File attachments
- OpenAPI 3.0 spec"
```

**Output:** OpenAPI specification with endpoints, schemas, and examples

---

## Single Agent Workflows

### Backend API Development

```

Developer Request                      
"Create user authentication API"       

               
               

Backend Developer Agent                
                                         
1. Analyzes requirements               
2. Creates API endpoints               
3. Implements JWT authentication       
4. Adds input validation               
5. Includes error handling             

               
               

Output Delivered                       
- auth.controller.ts                   
- auth.service.ts                      
- auth.middleware.ts                   
- auth.dto.ts                          
- auth.routes.ts                       

```

**CLI Example:**
```bash
copilot agent run backend-developer "Create user authentication API with:
- Register, login, logout endpoints
- JWT token generation and validation
- Password hashing with bcrypt
- Email verification flow
- Rate limiting on login attempts
- Express.js and TypeScript"
```

---

### Database Schema Design

```
Request  Database Architect  Schema Design  Migrations  Documentation
         Analyzes requirements
         Creates ER diagram (text)
         Defines tables & relationships
         Adds indexes & constraints
         Generates migration scripts
```

**CLI Example:**
```bash
copilot agent run database-architect "Design PostgreSQL schema for social media app:
- Users with profiles
- Posts with likes and comments
- Friendships/followers
- Media attachments
- Activity feed optimization"
```

**Output:**
```sql
-- Users table
CREATE TABLE users (
id SERIAL PRIMARY KEY,
email VARCHAR(255) UNIQUE NOT NULL,
username VARCHAR(50) UNIQUE NOT NULL,
created_at TIMESTAMP DEFAULT NOW()
);

-- Posts table with indexes
CREATE TABLE posts (
id SERIAL PRIMARY KEY,
user_id INT REFERENCES users(id),
content TEXT NOT NULL,
created_at TIMESTAMP DEFAULT NOW()
);
CREATE INDEX idx_posts_user_created ON posts(user_id, created_at DESC);

-- Relationships table (self-referencing)
CREATE TABLE relationships (
follower_id INT REFERENCES users(id),
followee_id INT REFERENCES users(id),
created_at TIMESTAMP DEFAULT NOW(),
PRIMARY KEY (follower_id, followee_id)
);
...
```

---

### E2E Test Creation

```
Test Requirements  E2E Tester  Test Suite  CI Integration
                   Analyzes user flow
                   Creates page objects
                   Implements test cases
                   Adds assertions
```

**CLI Example:**
```bash
copilot agent run e2e-tester "Create Playwright tests for checkout:
1. Add product to cart
2. Apply discount code
3. Enter shipping info
4. Complete payment (test mode)
5. Verify order confirmation"
```

---

## Multi-Agent Orchestration

### Full-Stack Feature Development

```
                  
                   Orchestrator   
                  
                           
           
                                         
                                         
           
   Database      Backend      Frontend 
   Architect    Developer    Developer 
           
                                        
          Schema         API            UI
                                        
          
                           
                           
                    
                   Test Generator
                    
```

**CLI Example:**
```bash
copilot agent run orchestrator "Build user notification system:
- Database: notification table with types (email, SMS, in-app)
- Backend: API to create, fetch, mark as read
- Frontend: notification bell with dropdown
- Tests: unit and E2E tests"
```

**Orchestrator Flow:**
1. Breaks down into phases
2. Delegates to Database Architect for schema
3. Delegates to Backend Developer for API
4. Delegates to Frontend Developer for UI
5. Delegates to Test Generator for tests
6. Coordinates integration

---

### Security-First Development

```
Developer  Orchestrator  Backend Dev  Security Auditor  Code Reviewer
          (Coordinates)   (Implements)   (Audits)         (Final Review)
```

**CLI Example:**
```bash
copilot agent run orchestrator "Build payment processing API with security focus:
- Stripe integration
- PCI DSS compliance
- Rate limiting and fraud detection
- Comprehensive logging
- Security audit required"
```

**Flow:**
1. Orchestrator plans approach
2. Backend Developer creates API
3. Security Auditor reviews for vulnerabilities
4. Code Reviewer checks implementation quality
5. Orchestrator ensures all findings addressed

---

### Design-to-Production Pipeline

```
Figma Design  Figma to HTML  Frontend Dev  Responsive Design  E2E Tester
             (Converts)       (Enhances)     (Optimizes)        (Validates)
```

**IDE Workflow:**
```
1. Copy Figma design URL
2. @figma-to-html Convert this design to React with Tailwind: [URL]
3. Review generated components
4. @responsive-design Optimize for mobile (320px) to desktop (1920px)
5. @e2e-tester Create tests for key user interactions
```

---

## Before/After Examples

### Example 1: Unoptimized SQL Query

**Before:**
```sql
-- Slow query (N+1 problem)
SELECT * FROM users;
-- Then for each user in application code:
SELECT * FROM posts WHERE user_id = ?;
```

**Developer Request:**
```bash
copilot agent run sql-expert "Optimize this user + posts query that's causing N+1 problem"
```

**After:**
```sql
-- Optimized with JOIN
SELECT 
u.id, u.name, u.email,
p.id as post_id, p.title, p.content
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
WHERE u.active = true
ORDER BY u.id, p.created_at DESC;
```

---

### Example 2: Non-Responsive Layout

**Before:**
```css
/* Fixed width, breaks on mobile */
.dashboard {
width: 1200px;
display: flex;
}
.sidebar { width: 300px; }
.content { width: 900px; }
```

**Developer Request:**
```bash
copilot agent run responsive-design "Make this dashboard responsive for mobile, tablet, desktop"
```

**After:**
```css
/* Mobile-first responsive */
.dashboard {
display: flex;
flex-direction: column;
}

.sidebar { width: 100%; }
.content { width: 100%; }

/* Tablet */
@media (min-width: 768px) {
.dashboard { flex-direction: row; }
.sidebar { width: 250px; }
.content { flex: 1; }
}

/* Desktop */
@media (min-width: 1024px) {
.sidebar { width: 300px; }
}
```

---

### Example 3: Missing Tests

**Before:**
```typescript
// UserService.ts - no tests
export class UserService {
async createUser(data: CreateUserDto) {
  const user = await this.repo.create(data);
  await this.emailService.sendWelcome(user.email);
  return user;
}
}
```

**Developer Request:**
```bash
copilot agent run test-generator "Create comprehensive Jest tests for UserService with mocks"
```

**After:**
```typescript
// UserService.test.ts
describe('UserService', () => {
let service: UserService;
let mockRepo: jest.Mocked<UserRepository>;
let mockEmailService: jest.Mocked<EmailService>;

beforeEach(() => {
  mockRepo = { create: jest.fn() };
  mockEmailService = { sendWelcome: jest.fn() };
  service = new UserService(mockRepo, mockEmailService);
});

it('should create user and send welcome email', async () => {
  const input = { email: 'test@example.com', name: 'Test' };
  const expected = { id: 1, ...input };
  mockRepo.create.mockResolvedValue(expected);

  const result = await service.createUser(input);

  expect(mockRepo.create).toHaveBeenCalledWith(input);
  expect(mockEmailService.sendWelcome).toHaveBeenCalledWith(input.email);
  expect(result).toEqual(expected);
});

it('should handle repository errors', async () => {
  mockRepo.create.mockRejectedValue(new Error('DB error'));
    
  await expect(service.createUser(input))
    .rejects.toThrow('DB error');
  expect(mockEmailService.sendWelcome).not.toHaveBeenCalled();
});
});
```

---

## Integration Patterns

### Pattern 1: API Contract-First Development

```

Step 1: Design API Contract                           
copilot agent run api-designer "Design user API"      
Output: openapi.yaml                                  

                        
        
                                       
                                       
          
Step 2: Backend             Step 2: Frontend
Implementation              Client          
                                              
copilot agent               copilot agent   
run backend-                run frontend-   
developer                   developer       
"Implement API              "Create client  
from spec"                  from OpenAPI"   
          
```

---

### Pattern 2: TDD with Agent Support

```
1. Write test (describe what code should do)
 copilot agent run test-generator "Create tests for calculateDiscount function"

2. Run test (should fail - red)
 npm test

3. Implement feature
 copilot agent run backend-developer "Implement calculateDiscount to pass tests"

4. Run test (should pass - green)
 npm test

5. Refactor
 copilot agent run code-reviewer "Review calculateDiscount for improvements"
```

---

### Pattern 3: Security Review Pipeline

```
Developer writes code
        
copilot agent run code-reviewer "Review for obvious issues"
        
Fix identified issues
        
copilot agent run security-auditor "Security scan with OWASP focus"
        
Address vulnerabilities
        
copilot agent run test-generator "Create security-focused tests"
        
Ready for PR
```

---

## Workflow Diagrams

### Solo Developer Workflow

```

New Feature 
 Request    

       
       
     
Enhanced     Implementation  
Planner           (various agents)
     
                              
                              
                     
                    Test Generator  
                     
                              
                              
                     
                    Code Reviewer   
                     
                              
                              
                          
                         Merge 
                          
```

---

### Team Workflow

```
Product Manager              Developer                    QA Engineer
                                                              
                                                              
[@project-manager]                                             
Plan sprint                                                    
                                                              
    Sprint Plan                              
                                                              
                      [@orchestrator]                        
                      Build features                         
                                                              
                                                              
                      Implementation                         
                                                              
                              Feature Ready
                                                              
                                                    [@e2e-tester]
                                                    Create tests
                                                              
                              Issues Found
                                                              
                                                              
                       [@debug-detective]                    
                          Fix issues                         
                                                              
                              Tests Pass
                                                                
    Deploy
```

---

### Greenfield Project Workflow

```
Day 1: Architecture
 @database-architect "Design schema"
 @api-designer "Design REST API"
 @uiux-designer "Design user flows"

Day 2-3: Setup
 @devops (Docker, K8s configs)
 @cicd-expert (GitHub Actions)
 @terraform-expert (Infrastructure)

Week 1-2: Core Features
 @orchestrator "Build authentication"
 @orchestrator "Build user management"
 @orchestrator "Build core domain features"

Week 3: Testing & Quality
 @test-generator "Unit tests"
 @e2e-tester "E2E tests"
 @security-auditor "Security review"

Week 4: Polish & Launch
 @performance-optimizer "Optimize bottlenecks"
 @doc-generator "Create documentation"
 @code-reviewer "Final review"
```

---

## Real-World Scenarios

### Scenario: Add OAuth to Existing App

```bash
# Step 1: Plan the implementation
copilot agent run enhanced-planner "Plan adding Google OAuth to our Express.js app with existing JWT auth"

# Step 2: Implement OAuth integration
copilot agent run backend-developer "Implement Google OAuth with Passport.js, integrate with existing JWT system"

# Step 3: Update frontend
copilot agent run frontend-developer "Add 'Sign in with Google' button and OAuth flow to React login page"

# Step 4: Test
copilot agent run e2e-tester "Create Playwright tests for OAuth login flow"

# Step 5: Security review
copilot agent run security-auditor "Review OAuth implementation for security issues"
```

---

### Scenario: Performance Problem

```bash
# Step 1: Identify bottleneck
copilot agent run performance-optimizer "API /users/feed takes 3 seconds. Here's the code: [paste code]"

# Step 2: Optimize database queries
copilot agent run sql-expert "Optimize this query: [paste slow query]"

# Step 3: Add caching
copilot agent run backend-developer "Add Redis caching to user feed with 5-minute TTL"

# Step 4: Verify improvements
copilot agent run test-generator "Create load tests to verify feed performance under 100ms"
```

---

### Scenario: Legacy Migration

```bash
# Step 1: Assessment and planning
copilot agent run legacy-modernizer "Create migration plan from AngularJS to React for our admin dashboard"

# Step 2: Create migration strategy
copilot agent run enhanced-planner "Break down migration into phases with rollback plan"

# Step 3: Start with routing
copilot agent run frontend-developer "Create React routing to match existing AngularJS routes"

# Step 4: Component migration (iterative)
copilot agent run frontend-developer "Convert UserList component from AngularJS to React with TypeScript"

# Step 5: Testing parallel
copilot agent run e2e-tester "Create tests ensuring React version matches AngularJS behavior"
```

---

## Tips for Creating Good Examples

1. **Be Specific**: "Create login form"  "Create login form with email/password, validation, remember me checkbox, and password recovery link"

2. **Provide Context**: Mention tech stack, patterns to follow, existing code to reference

3. **Set Quality Bars**: Specify TypeScript, tests, error handling, accessibility requirements

4. **Show Expected Output**: Describe what success looks like

5. **Iterate**: Don't expect perfection first try; review and refine

---

For more patterns and best practices, see:
- [Orchestration Patterns](./orchestration-patterns.md)
- [Best Practices](./best-practices.md)
- [Agent Guide](./agent-guide.md)
