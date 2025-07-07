# GitHub Actions Trigger Guide

This document explains the language patterns you can use to trigger different GitHub Actions workflows, and how Claude will intelligently respond to optimize build resources and development velocity.

## Overview

Our CI/CD system uses a **streamlined approach** with smart triggering based on the language you use when requesting code changes or commits. Claude analyzes your request to determine the optimal workflow strategy.

## Workflow Summary

| Trigger Method | CI Time | Tauri Build | Release | Use Case |
|---------------|---------|-------------|---------|----------|
| **Direct Push to Dev** | 2-3 min | ❌ | ❌ | Quick fixes, docs, frontend work |
| **PR to Dev** | 2-3 min | ❌ | ❌ | Feature development, review |
| **PR to Main** | 2-3 min + 8-10 min | ✅ (validation) | ❌ | Release prep, validation |
| **Direct Push to Main** | 15-20 min | ✅ (full) | ✅ | Releases, hotfixes |
| **Manual Trigger** | 15-20 min | ✅ (full) | ✅ | Scheduled releases |

## Docker Build Alternative

For local development and testing, use the **Docker build system**:

| Docker Command | Build Time | Architectures | Use Case |
|---------------|------------|---------------|----------|
| `npm run docker:build-tauri` | 5-15 min | x86_64, ARM64 | Local testing |
| `npm run docker:build-all` | 10-20 min | Host + Docker | Complete validation |
| `npm run docker` | Interactive | Any | Development shell |

## Language Patterns for Different Workflows

### 🚀 Quick Development (Direct Push to Dev)

**When to Use**: Frontend changes, documentation, styles, small fixes that don't need Tauri validation.

**What Happens**: 
- Frontend build (`npm run build`)
- CSS linting
- **No Tauri build** (fast feedback)

**Language Patterns**:
- "commit and push this change"
- "just commit this directly"
- "push this fix to dev"
- "commit this small change"
- "quick commit for this frontend update"

**Examples**:
```
User: "Fix the typo in the README and commit it"
Claude: → Direct push to dev (2-3 min, frontend only)

User: "Update the color scheme and push the changes"  
Claude: → Direct push to dev (2-3 min, frontend only)

User: "Just commit this component styling fix"
Claude: → Direct push to dev (2-3 min, frontend only)
```

### 🔄 Feature Development (PR to Dev)

**When to Use**: New features, component development, collaborative work that needs review.

**What Happens**:
- Frontend build (`npm run build`)
- CSS linting
- **No Tauri build** (fast iteration)

**Language Patterns**:
- "create a PR for this feature"
- "make a pull request"
- "this needs review, create a PR"
- "open a PR for this change"
- "let's make this a pull request"
- "implement X feature" (without explicit commit instruction)

**Examples**:
```
User: "Implement the new settings panel and create a PR"
Claude: → PR to dev (2-3 min, frontend only)

User: "Add the network topology component"
Claude: → PR to dev (2-3 min, frontend only)

User: "Build the console interface"
Claude: → PR to dev (2-3 min, frontend only)
```

### 📦 Release Preparation (PR to Main)

**When to Use**: Preparing releases, final validation before deployment.

**What Happens**:
- Frontend build (`npm run build`)
- CSS linting
- **Tauri validation build** (Linux only, 8-10 min)

**Language Patterns**:
- "prepare this for release"
- "create a PR to main"
- "ready for main branch"
- "prep for release"
- "validate with Tauri build"

**Examples**:
```
User: "This feature is ready, create a PR to main"
Claude: → PR to main (2-3 min + 8-10 min Tauri validation)

User: "Prepare v0.2.0 for release validation"
Claude: → PR to main (2-3 min + 8-10 min Tauri validation)
```

### 🚨 Release Deployment (Direct Push to Main)

**When to Use**: Immediate releases, urgent hotfixes, final deployment.

**What Happens**:
- Full cross-platform Tauri build
- macOS (ARM64 + x86_64)
- Linux (x86_64)
- Windows (x86_64)
- **GitHub release creation**

**Language Patterns**:
- "deploy this now"
- "release this immediately"
- "push to main and release"
- "hotfix deployment"
- "emergency release"
- "create a release"

**Examples**:
```
User: "This security fix needs to be released immediately"
Claude: → Direct push to main (15-20 min, full cross-platform release)

User: "Deploy version 0.2.0 now"
Claude: → Direct push to main (15-20 min, full cross-platform release)

User: "Create a release with these changes"
Claude: → Direct push to main (15-20 min, full cross-platform release)
```

### 🐳 Docker Development (Local Testing)

**When to Use**: Local Tauri testing, cross-platform validation, development without CI/CD.

**What Happens**:
- Local Docker build
- Linux x86_64 and/or ARM64
- No GitHub release
- Faster iteration than full CI

**Language Patterns**:
- "test this with Docker"
- "build locally with Docker"
- "validate with Docker build"
- "test Linux build"
- "build for both architectures"

**Examples**:
```
User: "Test this backend change with Docker"
Claude: → npm run docker:build-tauri (5-15 min, Linux)

User: "Build for both architectures to test"
Claude: → npm run docker:build-all (10-20 min, all targets)

User: "I need to debug the Linux build"
Claude: → npm run docker (interactive development shell)
```

## Docker Build System

### Available Commands

**Via npm scripts:**
```bash
npm run docker              # Interactive menu
npm run docker:build-image  # Build Docker image
npm run docker:build-tauri  # Build Tauri app in Docker
npm run docker:build-all    # Build everything locally
npm run docker:run          # Interactive Docker shell
npm run docker:clean        # Clean build artifacts
npm run docker:check        # Check Docker status
npm run docker:help         # Show help
```

**Direct script access:**
```bash
# Linux/macOS
./docker/docker-menu.sh [command]

# Windows
.\docker\docker-menu.ps1 [command]
```

### Architecture Support

- **Native builds**: Maximum performance
- **Cross-architecture**: ARM64 ↔ x86_64 (slower due to emulation)
- **Multi-platform**: Build both architectures sequentially

### When to Use Docker vs CI/CD

| Scenario | Recommendation |
|----------|---------------|
| Frontend-only changes | Direct push to dev (2-3 min) |
| Backend changes needing validation | Docker build (5-15 min) |
| Cross-platform testing | Docker build all (10-20 min) |
| Release preparation | PR to main (validation) |
| Production deployment | Push to main (full release) |

## Claude's Decision Matrix

### Automatic Strategy Selection

Claude analyzes your request using these factors:

1. **Change Scope**:
   - Frontend only (styles, components, docs) → Direct push to dev
   - Backend/Tauri changes → PR to dev or Docker build
   - Cross-platform needs → Docker build

2. **Urgency Indicators**:
   - "quick", "small", "just" → Direct push to dev
   - "test", "validate", "build" → Docker build
   - "release", "deploy", "hotfix" → Push to main

3. **Tauri Build Requirements**:
   - Frontend changes → No Tauri build needed
   - Backend changes → Docker build for testing
   - Release prep → PR to main for validation
   - Production → Push to main for full release

4. **Development vs Production**:
   - Development work → Dev branch workflow
   - Testing/validation → Docker build
   - Release intent → Main branch workflow

### Override Patterns

You can explicitly override Claude's decision:

```
User: "This is a backend change, but just commit it directly to dev"
Claude: → Direct push to dev (respects instruction, frontend-only CI)

User: "Frontend change, but test with Docker first"
Claude: → Docker build (respects explicit instruction)

User: "Small docs fix, but create a PR"
Claude: → PR to dev (respects explicit instruction)
```

## Best Practices

### For Frontend Development
- **Use direct commits**: "Update the sidebar styling"
- **Fast iteration**: Direct push to dev (2-3 min)
- **No Tauri overhead**: Frontend changes don't need Tauri validation

### For Backend Development
- **Test locally first**: "Build this with Docker"
- **Validate before PR**: Use Docker builds for testing
- **PR for review**: "Create a PR for this backend change"

### For Release Management
- **Validate with PR to main**: Gets Tauri validation build
- **Deploy with push to main**: Full cross-platform release
- **Use Docker for testing**: Local validation before release

### For Cross-Platform Development
- **Use Docker builds**: "Build for both architectures"
- **Test locally**: Docker builds are faster than CI for testing
- **Validate before release**: Docker → PR to main → Push to main

## Common Scenarios

### Scenario 1: Frontend Component Update
```
User: "Update the network topology component styling"
Claude Decision: Direct push to dev
Reasoning: Frontend change, no Tauri build needed
Result: 2-3 min build (frontend only)
```

### Scenario 2: Backend Input System Change
```
User: "Fix the input capture system"
Claude Decision: Docker build first, then PR
Reasoning: Backend change, needs Tauri validation
Result: 5-15 min Docker build, then PR to dev
```

### Scenario 3: Cross-Platform Feature
```
User: "Implement clipboard integration for all platforms"
Claude Decision: Docker build for testing
Reasoning: Cross-platform feature, needs validation
Result: 10-20 min Docker build with both architectures
```

### Scenario 4: Release Preparation
```
User: "The authentication feature is complete, prepare for release"
Claude Decision: PR to main
Reasoning: Release prep, needs validation build
Result: 2-3 min + 8-10 min Tauri validation
```

### Scenario 5: Security Hotfix
```
User: "Critical security vulnerability, fix and deploy immediately"
Claude Decision: Direct push to main
Reasoning: Emergency, bypass normal validation
Result: 15-20 min full cross-platform release
```

## Advanced Docker Workflows

### Interactive Development
```bash
# Start development environment
npm run docker

# In Docker container:
# - Full Linux environment
# - Pre-installed dependencies
# - Mounted project files
# - Direct access to Tauri build tools
```

### Architecture-Specific Builds
```bash
# Build for specific architecture
npm run docker -- build-tauri x86_64
npm run docker -- build-tauri arm64

# Build for both architectures
npm run docker -- build-tauri both
```

### Development Shell Access
```bash
# Interactive shell in Docker
npm run docker -- run

# Architecture-specific shell
npm run docker -- run x86_64
npm run docker -- run arm64
```

### Build Optimization
```bash
# Clean build (remove cache)
npm run docker -- --no-cache build-image

# Quiet mode for scripts
npm run docker -- -q build-tauri

# Force specific architecture
npm run docker -- --arch x86_64 build-tauri
```

## Integration Examples

### Development Workflow
```
1. Make frontend changes → Direct push to dev (2-3 min)
2. Make backend changes → Docker build test (5-15 min)
3. Feature complete → PR to dev (2-3 min)
4. Ready for release → PR to main (validation)
5. Deploy to production → Push to main (full release)
```

### Testing Workflow
```
1. Local development → Docker interactive shell
2. Feature testing → Docker build specific architecture
3. Cross-platform validation → Docker build all
4. Release validation → PR to main
5. Production deployment → Push to main
```

### Hotfix Workflow
```
1. Identify issue → Docker build for testing
2. Develop fix → Docker validation
3. Emergency deployment → Direct push to main
4. Post-deployment → Backport to dev if needed
```

## Troubleshooting

### If Claude Chooses Wrong Strategy
Simply clarify your intent:
```
User: "Actually, test this with Docker first"
User: "Just commit it directly"
User: "This should trigger a release"
User: "Build locally with Docker"
```

### If Build Takes Too Long
- Use **dev pushes** for frontend work (2-3 min)
- Use **Docker builds** for backend testing (5-15 min)
- Use **PR to main** only when ready for release validation
- Save **main pushes** for actual releases

### If You Need Local Testing
- Use **Docker builds** for local validation
- Use **interactive Docker shell** for development
- Use **architecture-specific builds** for targeted testing

## Performance Comparison

| Build Type | Time | Tauri Build | Architectures | Use Case |
|------------|------|-------------|---------------|----------|
| Dev Push | 2-3 min | ❌ | N/A | Frontend development |
| PR to Dev | 2-3 min | ❌ | N/A | Code review |
| PR to Main | 2-3 min + 8-10 min | ✅ (Linux) | Linux x86_64 | Release validation |
| Main Push | 15-20 min | ✅ (Full) | All platforms | Production release |
| Docker Build | 5-15 min | ✅ (Linux) | x86_64, ARM64 | Local testing |
| Docker All | 10-20 min | ✅ (All) | Host + Docker | Complete validation |

## Summary

The system now optimizes for **maximum development velocity** with these key principles:

1. **Frontend changes** → Fast CI (2-3 min, no Tauri)
2. **Backend changes** → Docker testing (5-15 min, local validation)
3. **Release prep** → PR to main (includes Tauri validation)
4. **Production** → Push to main (full cross-platform release)

**Key advantages:**
- ⚡ **Fast feedback** for frontend development
- 🐳 **Local testing** with Docker for backend changes
- 🔍 **Validation builds** only when needed (PR to main)
- 🚀 **Full releases** only for production deployments

This approach **maximizes development velocity** while maintaining **release quality** and **resource efficiency**.