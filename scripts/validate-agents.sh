#!/bin/bash
# Agent Validation Script
# Tests that all agent files are properly formatted and loadable

set -e

AGENTS_DIR="./agents"
ERRORS=0
WARNINGS=0

echo "🧪 Copilot Agent Library - Validation Script"
echo "=============================================="
echo ""

# Colors for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if agents directory exists
if [ ! -d "$AGENTS_DIR" ]; then
    echo -e "${RED}❌ Error: agents/ directory not found${NC}"
    exit 1
fi

# Count total agents
TOTAL_AGENTS=$(find "$AGENTS_DIR" -name "*.agent.md" | wc -l)
echo "📊 Found $TOTAL_AGENTS agent files"
echo ""

echo "🔍 Validating agent files..."
echo ""

# Validate each agent file
for agent_file in $(find "$AGENTS_DIR" -name "*.agent.md" | sort); do
    AGENT_NAME=$(basename "$agent_file" .agent.md)
    
    # Check 1: File is not empty
    if [ ! -s "$agent_file" ]; then
        echo -e "${RED}❌ $AGENT_NAME: File is empty${NC}"
        ((ERRORS++))
        continue
    fi
    
    # Check 2: Has YAML frontmatter
    if ! head -n 1 "$agent_file" | grep -q "^---$"; then
        echo -e "${RED}❌ $AGENT_NAME: Missing YAML frontmatter (should start with ---)${NC}"
        ((ERRORS++))
        continue
    fi
    
    # Check 3: Has required fields (name, description)
    if ! grep -q "^name:" "$agent_file"; then
        echo -e "${RED}❌ $AGENT_NAME: Missing 'name:' field${NC}"
        ((ERRORS++))
        continue
    fi
    
    if ! grep -q "^description:" "$agent_file"; then
        echo -e "${RED}❌ $AGENT_NAME: Missing 'description:' field${NC}"
        ((ERRORS++))
        continue
    fi
    
    # Check 4: Has content after frontmatter
    CONTENT_LINES=$(tail -n +10 "$agent_file" | grep -v "^$" | wc -l)
    if [ "$CONTENT_LINES" -lt 10 ]; then
        echo -e "${YELLOW}⚠️  $AGENT_NAME: Very short content (< 10 lines)${NC}"
        ((WARNINGS++))
    fi
    
    # Check 5: File size is reasonable
    FILE_SIZE=$(stat -c%s "$agent_file" 2>/dev/null || stat -f%z "$agent_file" 2>/dev/null)
    if [ "$FILE_SIZE" -lt 1000 ]; then
        echo -e "${YELLOW}⚠️  $AGENT_NAME: Small file size (< 1KB)${NC}"
        ((WARNINGS++))
    fi
    
    # All checks passed
    echo -e "${GREEN}✅ $AGENT_NAME${NC}"
done

echo ""
echo "=============================================="
echo "📊 Validation Summary"
echo "=============================================="
echo "Total agents: $TOTAL_AGENTS"
echo -e "${GREEN}Passed: $((TOTAL_AGENTS - ERRORS))${NC}"
echo -e "${RED}Errors: $ERRORS${NC}"
echo -e "${YELLOW}Warnings: $WARNINGS${NC}"
echo ""

if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}❌ Validation failed with $ERRORS error(s)${NC}"
    exit 1
else
    echo -e "${GREEN}✅ All validations passed!${NC}"
    
    if [ $WARNINGS -gt 0 ]; then
        echo -e "${YELLOW}⚠️  $WARNINGS warning(s) - review recommended${NC}"
    fi
fi

echo ""
echo "Next steps:"
echo "1. Test agents in CLI: gh copilot agent list"
echo "2. Test agents in VS Code: Copy to .github/agents/ in workspace"
echo "3. Run test scenarios from TESTING.md"
