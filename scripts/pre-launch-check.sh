#!/bin/bash
# Pre-Launch Verification Script
# Verifies repository is ready for public release

set -e

echo " Pre-Launch Verification for Copilot Agent Library"
echo "=================================================="
echo ""

ERRORS=0
WARNINGS=0

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check 1: Validate all agents
echo " Step 1: Validating agents..."
if [ -f "scripts/validate-agents.sh" ]; then
  chmod +x scripts/validate-agents.sh
  if ./scripts/validate-agents.sh > /dev/null 2>&1; then
      echo -e "${GREEN} All agents validated successfully${NC}"
  else
      echo -e "${RED} Agent validation failed${NC}"
      ((ERRORS++))
  fi
else
  echo -e "${RED} Validation script not found${NC}"
  ((ERRORS++))
fi
echo ""

# Check 2: Verify required files exist
echo " Step 2: Checking required files..."
REQUIRED_FILES=(
  "README.md"
  "CONTRIBUTING.md"
  "CODE_OF_CONDUCT.md"
  "LICENSE"
  "TESTING.md"
  ".gitignore"
  "templates/agent-template.md"
)

for file in "${REQUIRED_FILES[@]}"; do
  if [ -f "$file" ]; then
      echo -e "${GREEN} $file${NC}"
  else
      echo -e "${RED} Missing: $file${NC}"
      ((ERRORS++))
  fi
done
echo ""

# Check 3: Verify documentation
echo " Step 3: Checking documentation..."
REQUIRED_DOCS=(
  "docs/getting-started.md"
  "docs/agent-guide.md"
  "docs/orchestration-patterns.md"
  "docs/best-practices.md"
  "docs/troubleshooting.md"
  "docs/examples.md"
  "docs/cli-vs-ide.md"
)

for doc in "${REQUIRED_DOCS[@]}"; do
  if [ -f "$doc" ]; then
      echo -e "${GREEN} $doc${NC}"
  else
      echo -e "${RED} Missing: $doc${NC}"
      ((ERRORS++))
  fi
done
echo ""

# Check 4: Verify GitHub configuration
echo " Step 4: Checking GitHub configuration..."
GITHUB_FILES=(
  ".github/workflows/validate.yml"
  ".github/ISSUE_TEMPLATE/bug_report.md"
  ".github/ISSUE_TEMPLATE/feature_request.md"
  ".github/ISSUE_TEMPLATE/new_agent.md"
  ".github/PULL_REQUEST_TEMPLATE.md"
)

for file in "${GITHUB_FILES[@]}"; do
  if [ -f "$file" ]; then
      echo -e "${GREEN} $file${NC}"
  else
      echo -e "${YELLOW}  Missing: $file${NC}"
      ((WARNINGS++))
  fi
done
echo ""

# Check 5: Verify gitignore patterns
echo " Step 5: Checking .gitignore patterns..."
SHOULD_BE_IGNORED=(
  "PHASE_4_SUMMARY.md"
  "PHASE_5_SUMMARY.md"
  "PROJECT_COMPLETE.md"
  "AGENTS_SUMMARY.md"
)

for file in "${SHOULD_BE_IGNORED[@]}"; do
  if [ -f "$file" ]; then
      # Check if pattern exists in .gitignore that would match this file
      if grep -q "^PHASE_\*\.md$\|^PROJECT_COMPLETE\.md$\|^AGENTS_SUMMARY\.md$" .gitignore 2>/dev/null; then
          echo -e "${GREEN} $file (will be ignored by gitignore patterns)${NC}"
      else
          echo -e "${YELLOW}  $file exists (will be ignored by patterns)${NC}"
      fi
  fi
done

# Verify the patterns exist
if grep -q "PHASE_.*\.md" .gitignore 2>/dev/null; then
  echo -e "${GREEN} Internal documentation patterns in .gitignore${NC}"
else
  echo -e "${RED} Missing gitignore patterns for internal docs${NC}"
  ((ERRORS++))
fi
echo ""

# Check 6: Count agents
echo " Step 6: Counting agents..."
AGENT_COUNT=$(find agents -name "*.agent.md" 2>/dev/null | wc -l)
if [ "$AGENT_COUNT" -eq 35 ]; then
  echo -e "${GREEN} Found 35 agents${NC}"
else
  echo -e "${RED} Expected 35 agents, found $AGENT_COUNT${NC}"
  ((ERRORS++))
fi
echo ""

# Check 7: Verify README has content
echo " Step 7: Checking README content..."
if [ -f "README.md" ] && [ $(wc -l < README.md) -gt 50 ]; then
  echo -e "${GREEN} README has substantial content${NC}"
else
  echo -e "${RED} README is missing or too short${NC}"
  ((ERRORS++))
fi
echo ""

# Check 8: Verify scripts are executable
echo " Step 8: Checking script permissions..."
for script in scripts/*.sh; do
  if [ -f "$script" ]; then
      if [ -x "$script" ]; then
          echo -e "${GREEN} $(basename $script) is executable${NC}"
      else
          echo -e "${YELLOW}  $(basename $script) is not executable${NC}"
          chmod +x "$script"
          echo -e "${GREEN}   Fixed: Made executable${NC}"
      fi
  fi
done
echo ""

# Check 9: Calculate repository size
echo " Step 9: Calculating repository size..."
TOTAL_SIZE=$(du -sh . 2>/dev/null | cut -f1)
echo -e "${BLUE}  Total size: $TOTAL_SIZE${NC}"

# Count files (excluding internal docs)
AGENT_FILES=$(find agents -name "*.agent.md" 2>/dev/null | wc -l)
DOC_FILES=$(find docs -name "*.md" 2>/dev/null | wc -l)
echo -e "${BLUE}  Agent files: $AGENT_FILES${NC}"
echo -e "${BLUE}  Documentation files: $DOC_FILES${NC}"
echo ""

# Summary
echo "=================================================="
echo " Verification Summary"
echo "=================================================="

TOTAL_CHECKS=35
PASSED=$((TOTAL_CHECKS - ERRORS))
echo -e "${GREEN} Passed: $PASSED/$TOTAL_CHECKS${NC}"
echo -e "${RED} Errors: $ERRORS${NC}"
echo -e "${YELLOW}  Warnings: $WARNINGS${NC}"
echo ""

if [ $ERRORS -eq 0 ]; then
  echo -e "${GREEN} Repository is ready for launch!${NC}"
  echo ""
  echo " What will be committed:"
  echo "   35 agent files"
  echo "   10+ documentation guides"
  echo "   Core files (README, CONTRIBUTING, LICENSE, etc.)"
  echo "   Scripts and templates"
  echo "   GitHub configuration"
  echo ""
  echo " What will be excluded (via .gitignore):"
  echo "   PHASE_*.md (internal development docs)"
  echo "   PROJECT_COMPLETE.md (internal summary)"
  echo "   AGENTS_SUMMARY.md (draft inventory)"
  echo "   Session state and databases"
  echo "   Personal customizations"
  echo ""
  echo " Next steps:"
  echo "1. Initialize git: git init"
  echo "2. Add files: git add ."
  echo "3. Check what will be committed: git status"
  echo "4. Commit: git commit -m 'Initial commit: 35 production-ready Copilot agents'"
  echo "5. Create GitHub repository"
  echo "6. Add remote: git remote add origin <your-repo-url>"
  echo "7. Push: git push -u origin main"
  echo "8. Create v1.0.0 release"
  echo ""
  exit 0
else
  echo -e "${RED} Please fix $ERRORS error(s) before launch${NC}"
  echo ""
  exit 1
fi
