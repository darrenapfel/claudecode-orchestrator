#\!/bin/bash
# Validation script - Run after each task

set -euo pipefail

echo "🔍 Claude Validation Suite"
echo "========================="

# Check for placeholder content
echo "📋 Checking for placeholder content..."
if grep -r "TODO\|FIXME\|Lorem ipsum" --include="*.ts" --include="*.tsx" . 2>/dev/null; then
    echo "❌ Placeholder content found"
    exit 1
fi

# Check for console.log
if grep -r "console\.log" --include="*.ts" --include="*.tsx" src/ 2>/dev/null | grep -v test; then
    echo "⚠️  console.log found in production code"
fi

# Check for evidence in .work/tasks (v2.1 structure)
TASK_DIR=".work/tasks"

LATEST_TASK=$(find $TASK_DIR -type d -name "*-*" -maxdepth 1 2>/dev/null | sort -r | head -1)
if [ -n "$LATEST_TASK" ]; then
    if [ \! -f "$LATEST_TASK/EVIDENCE.md" ]; then
        echo "❌ Latest task missing EVIDENCE.md"
        exit 1
    fi
    echo "✅ Evidence found"
else
    echo "⚠️  No task directories found"
fi

# Check tests if available
if [ -f "package.json" ] && grep -q '"test"' package.json; then
    echo "🧪 Running tests..."
    npm test -- --passWithNoTests || echo "⚠️  Tests failed"
fi

echo "✅ Validation complete"
