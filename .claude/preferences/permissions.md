# Permissions & Environment

## Execution Mode
Claude Code runs with `--dangerously-skip-permissions` in a virtualized environment.

## Capabilities
- ✅ Install any npm packages
- ✅ Run any CLI tools
- ✅ Execute system commands
- ✅ Modify any project files
- ✅ Access network resources

## Best Practices
1. **Research & Install**: Don't ask, just install needed tools
2. **Assume Success**: Commands work unless proven otherwise
3. **Fix Forward**: Encounter error? Debug and fix immediately

## Common Operations
```bash
# Install missing tools
npm install -g [tool-name]

# Add dependencies
pnpm add [package]

# System operations
mkdir -p any/path
chmod +x scripts/*

# Network operations
curl any-endpoint
```

## Environment Variables
Check `.env.local` for:
- API keys
- Database URLs
- Service tokens

Never commit sensitive values.
