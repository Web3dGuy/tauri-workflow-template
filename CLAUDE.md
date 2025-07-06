# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Tauri Desktop Application Template** that provides a modern, cross-platform foundation for building desktop applications using web technologies. It combines the power of Rust (backend) with React + TypeScript (frontend) to create performant native applications.

### Template Features
- **Cross-platform**: Windows, macOS, and Linux support
- **Modern Stack**: Tauri 2.0 + React 18.3 + TypeScript 5.6
- **Production-ready**: Includes CI/CD, testing setup, and documentation
- **Customizable**: Modular architecture for easy adaptation

## Development Commands

### Frontend & Full Application
- `npm run tauri dev` - Start development mode (React + Tauri desktop app)
- `npm run tauri build` - Build production desktop application
- `npm run dev` - Start Vite dev server only (for frontend-only development)
- `npm run build` - Build frontend for production (TypeScript + Vite)

### Docker Build System (Cross-Platform)
- `npm run docker:menu` - Open interactive Docker build menu
- `npm run docker:build-image` - Build Docker image for native architecture
- `npm run docker:build-tauri` - Build Tauri app in Docker
- `npm run docker:build-all` - Build on host + all Docker architectures
- `npm run docker:run` - Start interactive Docker shell
- `npm run docker:clean` - Clean build artifacts
- `npm run docker:check` - Check Docker image status
- `npm run docker:help` - Show Docker script help

### Code Quality
- `npm run lint:css` - Lint and fix SCSS files (development mode, shows all warnings)
- `npm run lint:css:production` - Lint SCSS for CI/CD (clean output, no warnings)
- `npm run lint:css:ci` - Lint SCSS with compact formatter for CI

### Testing
- `npm test` - Run test suite (configure based on your testing framework)
- `npm run test:watch` - Run tests in watch mode
- `npm run test:coverage` - Generate coverage report

## Architecture Overview

This template provides a foundation for building desktop applications with a clear separation between frontend and backend concerns.

### Technology Stack
- **Frontend**: React 18.3 + TypeScript 5.6 + Blueprint.js 6.0 + SCSS
- **Backend**: Tauri 2.0 + Rust + Tokio (async runtime)
- **Build**: Vite 6.0 + Git hooks (Husky + lint-staged)
- **CI/CD**: GitHub Actions for automated builds and releases

### Project Structure

```
your-app/
├── src/                    # Frontend React application
│   ├── components/         # React components
│   ├── hooks/             # Custom React hooks
│   ├── styles/            # SCSS design system
│   ├── assets/            # Static assets
│   ├── App.tsx            # Main application component
│   └── main.tsx           # React entry point
├── src-tauri/             # Backend Rust application
│   ├── src/               # Rust source code
│   │   ├── commands/      # Tauri commands
│   │   ├── modules/       # Feature modules
│   │   ├── utils/         # Utilities
│   │   ├── lib.rs         # Library entry
│   │   └── main.rs        # Application entry
│   ├── capabilities/      # Permission configs
│   ├── icons/            # App icons
│   └── tauri.conf.json   # Tauri configuration
├── docs/                  # Documentation
│   ├── TODO-INDEX.md     # Task tracking
│   ├── DEVELOPMENT_PLAN.md # Project roadmap
│   └── README.md         # Documentation overview
├── .github/              # GitHub Actions workflows
├── scripts/              # Build and utility scripts
└── docker/               # Docker configurations
```

### Frontend-Backend Communication
- Uses Tauri's IPC system via `@tauri-apps/api/core`
- Define commands in `src-tauri/src/lib.rs`
- Call from frontend using the `invoke` function
- Async operations handled with Rust's Tokio runtime

## Development Workflow

### Starting a New Project

1. **Clone and Initialize**
   ```bash
   git clone [template-repo] my-app
   cd my-app
   npm install
   ```

2. **Customize Configuration**
   - Update `package.json` with your app details
   - Modify `src-tauri/tauri.conf.json` for app metadata
   - Replace icons in `src-tauri/icons/`

3. **Plan Your Features**
   - Review `/docs/DEVELOPMENT_PLAN.md`
   - Update with your specific requirements
   - Define your module architecture

4. **Track Development**
   - Use `/docs/TODO-INDEX.md` for task management
   - Update session progress regularly
   - Keep documentation current

### Daily Development

1. **Start Session**: Check `/docs/TODO-INDEX.md`
2. **Run Development**: `npm run tauri dev`
3. **Make Changes**: Follow the architecture patterns
4. **Test**: Run tests before committing
5. **Update Progress**: Mark tasks complete

### Git Workflow

```bash
# Feature development
git checkout -b feature/your-feature
git add .
git commit -m "feat: add your feature"
git push origin feature/your-feature

# Create pull request for review
```

## Key Documentation Files

### `/docs/TODO-INDEX.md` - Task Management
- Central hub for tracking development tasks
- Session progress tracking
- Priority-based task organization
- Quick reference commands

### `/docs/DEVELOPMENT_PLAN.md` - Project Roadmap
- Development phases and timelines
- Module architecture design
- Technology decisions
- Performance requirements

### `/docs/README.md` - Documentation Hub
- Overview of all documentation
- Quick start guides
- Documentation guidelines
- External resources

## Common Tasks

### Adding a New Feature Module

1. **Plan the Module**
   - Define in `/docs/DEVELOPMENT_PLAN.md`
   - Create module structure in `src-tauri/src/modules/`
   - Design frontend components

2. **Implement Backend**
   ```rust
   // src-tauri/src/modules/your_module/mod.rs
   pub mod commands;
   pub mod state;
   pub mod utils;
   ```

3. **Create Tauri Commands**
   ```rust
   #[tauri::command]
   pub async fn your_command() -> Result<String, String> {
       Ok("Response".to_string())
   }
   ```

4. **Build Frontend**
   - Create components in `src/components/`
   - Add styles in `src/styles/components/`
   - Wire up IPC calls

### Styling Components

The template includes a comprehensive SCSS design system:

```scss
// Use design tokens
.your-component {
  background: color(slate, 800);
  padding: spacing(4);
  border-radius: radius(md);
  @include shadow(lg);
}
```

### Building for Production

```bash
# Build for current platform
npm run tauri build

# Cross-platform builds via Docker
npm run docker:menu
```

## Performance Guidelines

- **Startup Time**: Target < 2 seconds
- **Memory Usage**: Keep under 100MB baseline
- **Bundle Size**: Optimize for < 10MB installer
- **Response Time**: UI interactions < 100ms

## Security Best Practices

- Use Tauri's capability system for permissions
- Validate all IPC inputs
- Implement CSP headers
- Keep dependencies updated
- Follow Rust safety guidelines

## Customization Guide

### Branding
1. Replace icons in `src-tauri/icons/`
2. Update colors in `src/styles/abstracts/_colors.scss`
3. Modify app metadata in `tauri.conf.json`

### Features
1. Add modules to `src-tauri/src/modules/`
2. Create corresponding frontend components
3. Define new IPC commands
4. Update documentation

### Deployment
1. Configure GitHub Actions workflows
2. Set up code signing certificates
3. Define update server endpoints
4. Create distribution strategy

## Best Practices

### Code Organization
- Keep modules focused and single-purpose
- Use TypeScript strictly (no `any` types)
- Follow Rust idioms and patterns
- Maintain clear separation of concerns

### Documentation
- Update docs with code changes
- Use meaningful commit messages
- Comment complex logic
- Keep README files current

### Testing
- Write tests for critical paths
- Mock external dependencies
- Test on all target platforms
- Maintain good coverage

### Performance
- Profile before optimizing
- Use React.memo wisely
- Implement virtual scrolling for lists
- Lazy load heavy components

## Getting Help

### Resources
- [Tauri Documentation](https://tauri.app/)
- [React Documentation](https://react.dev/)
- [Blueprint.js Components](https://blueprintjs.com/)
- Template issues on GitHub

### Common Issues
- **Platform-specific bugs**: Check Tauri GitHub issues
- **Build failures**: Verify Rust toolchain installation
- **Performance issues**: Use browser DevTools profiler
- **Styling conflicts**: Check Blueprint.js specificity

---

*This template is designed to accelerate your desktop app development. Customize it to fit your needs and build something amazing!*