# GitHub Actions Trigger Guide

This document explains the language patterns you can use to trigger different GitHub Actions workflows, and how Claude will intelligently respond to optimize build resources and development velocity.

## Overview

Our CI/CD system uses a **two-tier approach** with smart triggering based on the language you use when requesting code changes or commits. Claude analyzes your request to determine the optimal workflow strategy.

## Workflow Summary

| Trigger Method | CI Time | Release | Use Case |
|---------------|---------|---------|----------|
| **Direct Push to Dev** | 8-10 min | ❌ | Quick fixes, docs |
| **PR to Dev** | 2-3 min | ❌ | Major features |
| **PR to Main** | 2-3 min | ❌ | Release prep |
| **Direct Push to Main** | 15-20 min | ✅ | Releases, hotfixes |
| **Manual Trigger** | 15-20 min | ✅ | Scheduled releases |

## Language Patterns for Different Workflows

### 🚀 Quick Development (Direct Push to Dev)

**When to Use**: Small changes, documentation, minor fixes that you want tested with full Tauri build.

**Language Patterns**:
- "commit and push this change"
- "just commit this directly"
- "push this fix to dev"
- "commit this small change"
- "quick commit for this docs update"

**Examples**:
```
User: "Fix the typo in the README and commit it"
Claude: → Direct push to dev (8-10 min build)

User: "Update the color scheme and push the changes"  
Claude: → Direct push to dev (8-10 min build)

User: "Just commit this documentation update"
Claude: → Direct push to dev (8-10 min build)
```

### 🔄 Feature Development (PR to Dev)

**When to Use**: Major features, backend changes, anything that needs review or you want to avoid expensive Tauri builds.

**Language Patterns**:
- "create a PR for this feature"
- "make a pull request"
- "this needs review, create a PR"
- "open a PR for this change"
- "let's make this a pull request"
- "implement X feature" (without explicit commit instruction)

**Examples**:
```
User: "Implement the new input capture system and create a PR"
Claude: → PR to dev (2-3 min build)

User: "Add authentication to the backend"
Claude: → PR to dev (2-3 min build, major feature)

User: "Build the settings page component"
Claude: → PR to dev (2-3 min build, significant work)
```

### 📦 Release Preparation (PR to Main)

**When to Use**: Preparing releases, final testing before deployment.

**Language Patterns**:
- "prepare this for release"
- "create a PR to main"
- "ready for main branch"
- "prep for release"
- "merge this to main"

**Examples**:
```
User: "This feature is ready, create a PR to main"
Claude: → PR to main (2-3 min build)

User: "Prepare v0.2.0 for release"
Claude: → PR to main (2-3 min build)
```

### 🚨 Release Deployment (Direct Push to Main)

**When to Use**: Immediate releases, urgent hotfixes, final deployment.

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
Claude: → Direct push to main (15-20 min, full release)

User: "Deploy version 0.2.0 now"
Claude: → Direct push to main (15-20 min, full release)

User: "Create a release with these changes"
Claude: → Direct push to main (15-20 min, full release)
```

### 🎯 Manual Release Trigger

**When to Use**: Scheduled releases without new commits, version bumps.

**Language Patterns**:
- "trigger a manual release"
- "run the release workflow manually"
- "create a release without new commits"
- "manual deployment"

**Examples**:
```
User: "The main branch is ready, trigger a manual release"
Claude: → Manual workflow trigger (15-20 min, full release)

User: "Run a release build manually"
Claude: → Manual workflow trigger (15-20 min, full release)
```

## Claude's Decision Matrix

### Automatic Strategy Selection

Claude analyzes your request using these factors:

1. **Change Scope**:
   - Minor (docs, styles, small fixes) → Direct push to dev
   - Major (features, backend, architecture) → PR to dev

2. **Urgency Indicators**:
   - "quick", "small", "just" → Direct push to dev
   - "implement", "add", "build" → PR to dev
   - "release", "deploy", "hotfix" → Push to main

3. **Review Requirements**:
   - Explicit PR request → PR workflow
   - No mention of review → Direct push (if appropriate)

4. **Release Intent**:
   - "release", "deploy", "publish" → Main branch workflow
   - Development work → Dev branch workflow

### Override Patterns

You can explicitly override Claude's decision:

```
User: "This is a major feature, but just commit it directly to dev"
Claude: → Direct push to dev (respects explicit instruction)

User: "Small docs fix, but create a PR"
Claude: → PR to dev (respects explicit instruction)
```

## Best Practices

### For Development Work
- **Use natural language**: "Add X feature" or "Fix Y bug"
- **Specify PR when needed**: "Create a PR for this backend change"
- **Let Claude decide**: For most cases, Claude will choose optimally

### For Releases
- **Be explicit**: "Deploy this" or "Create a release"
- **Use urgency indicators**: "hotfix", "emergency", "immediately"
- **Mention version numbers**: "Release v0.2.0"

### For Code Reviews
- **Request PR explicitly**: "Make this a pull request"
- **Mention review needs**: "This needs review"
- **Use collaborative language**: "Let's create a PR"

## Common Scenarios

### Scenario 1: Documentation Update
```
User: "Fix the installation instructions in the README"
Claude Decision: Direct push to dev
Reasoning: Documentation change, quick fix
Result: 8-10 min build with Tauri test
```

### Scenario 2: New Component
```
User: "Build a user settings panel component"
Claude Decision: PR to dev  
Reasoning: Major feature, benefits from review
Result: 2-3 min build, avoids expensive Tauri build
```

### Scenario 3: Bug Fix
```
User: "There's a memory leak in the input handler, fix it"
Claude Decision: PR to dev
Reasoning: Backend change, complex fix
Result: 2-3 min build for quick feedback
```

### Scenario 4: Security Hotfix
```
User: "Critical security vulnerability found, fix and deploy immediately"
Claude Decision: Direct push to main
Reasoning: Urgency indicators, deployment request
Result: 15-20 min full cross-platform release
```

### Scenario 5: Feature Complete
```
User: "The authentication system is done, prepare it for release"
Claude Decision: PR to main
Reasoning: Release preparation, controlled process
Result: 2-3 min build, ready for merge to main
```

## Advanced Workflows

### 🎯 Manual Release Triggers

**When to Use Manual Triggers:**
- Scheduled releases without new commits
- Version bumps from package.json changes
- Re-running failed releases
- Demo or showcase deployments

**Language Patterns:**
```
"Trigger a manual release of the current main branch"
"Run the release workflow manually for v0.3.0"
"Create a release build without new commits"
"Deploy the current state of main"
```

**Process:**
1. Go to GitHub Actions tab
2. Select "Release" workflow
3. Click "Run workflow"
4. Choose branch (usually main)
5. Optionally specify version or notes

### 📋 Version Bumping Strategies

**Semantic Versioning Approach:**
```
User: "Bump version to 0.3.0 and create a release"
Claude: → Update package.json → Commit → Push to main → Release

User: "Patch release for the bug fixes"
Claude: → Bump patch version → Release workflow

User: "Major version release with breaking changes"
Claude: → Update to 1.0.0 → Full release cycle
```

**Version Update Process:**
1. Update `package.json` version
2. Update `src-tauri/tauri.conf.json` version
3. Commit version changes
4. Create git tag
5. Push to main (triggers release)

### 🚨 Hotfix Deployment Procedures

**Critical Bug Hotfix:**
```
User: "Emergency: Users can't login, fix and deploy ASAP"
Claude Strategy:
1. Create hotfix branch from main
2. Apply minimal fix
3. Test locally if possible
4. Direct push to main (bypass normal process)
5. Monitor release deployment
6. Backport fix to dev if needed
```

**Security Vulnerability Hotfix:**
```
User: "Security patch needed for production immediately"
Claude Strategy:
1. Apply security fix
2. Minimal testing (security over features)
3. Direct push to main
4. Force immediate release
5. Coordinate with team on disclosure
```

**Hotfix Language Patterns:**
- "Emergency deployment needed"
- "Critical security fix, deploy immediately"
- "Production is down, hotfix required"
- "Bypass normal process, this is urgent"

### 🔄 Multi-Environment Workflows

**Development → Staging → Production:**
```
1. Feature work: PR to dev
2. Integration testing: Merge to dev
3. Release candidate: PR dev → main
4. Production release: Merge to main
```

**Environment-Specific Language:**
```
"Deploy to staging for testing" → Merge to dev branch
"Release to production" → Merge to main branch
"Create release candidate" → PR from dev to main
```

### 📊 Release Planning Workflows

**Planned Release Cycle:**
```
Week 1-2: Development (multiple PRs to dev)
Week 3: Integration testing (merge PRs to dev)
Week 4: Release prep (PR dev → main, final testing)
Week 5: Production deployment (merge to main)
```

**Language for Release Planning:**
```
"Prepare release candidate for next week's deployment"
→ Claude: Creates PR dev → main with release notes

"Schedule release for Friday at 2 PM"
→ Claude: Prepares everything, waits for manual trigger

"Bundle all recent features into release v0.4.0"
→ Claude: Reviews recent changes, prepares comprehensive release
```

### 🎛️ Workflow Customization

**Custom Build Targets:**
```
"Build only for macOS this time"
"Create Windows-only release for testing"
"Full cross-platform release with all architectures"
```

**Draft vs Published Releases:**
```
"Create draft release for review" → All releases are drafts by default
"Publish the draft release now" → Manual publish action
"Skip draft, publish immediately" → Custom workflow needed
```

**Build Optimization:**
```
"Fast build for testing" → PR workflow (2-3 min)
"Full validation build" → Push to dev (8-10 min)
"Production build with signing" → Release workflow (15-20 min)
```

### 🚀 Advanced Language Patterns

**Complex Scenarios:**
```
"Fix the authentication bug, create a PR, but also prepare a hotfix branch in case we need emergency deployment"

"Implement feature X, but if it works well, fast-track it to production"

"Update dependencies and test thoroughly before any release consideration"

"Create experimental build for the new input system - don't merge yet"
```

**Claude's Advanced Responses:**
- Recognizes multi-step requirements
- Creates appropriate branching strategies
- Balances speed vs safety based on context
- Suggests alternative approaches when appropriate

## Troubleshooting

### If Claude Chooses Wrong Strategy
Simply clarify your intent:
```
User: "Actually, make that a PR instead"
User: "Just commit it directly"
User: "This should trigger a release"
```

### If Build Takes Too Long
- Use PR workflows for development (2-3 min vs 8-10 min)
- Save direct pushes to dev for small changes
- Batch multiple changes into single commits

### If You Need Different Behavior
You can always specify explicitly:
```
User: "Implement X, Y, and Z features, but create separate PRs for each"
User: "Make these changes and commit directly, even though it's a big change"
```

## Summary

The key is to **use natural language** that reflects your intent. Claude will analyze:
- **What** you're changing (scope)
- **How** you want it committed (process)
- **When** you need it deployed (urgency)

This system optimizes for **development velocity** while maintaining **release quality** and **resource efficiency**.