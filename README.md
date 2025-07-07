# Tauri Workflow Template

A production-ready template for building cross-platform desktop applications using Tauri 2.0, React 18.3, TypeScript 5.6, and Blueprint.js 6.0. This template provides everything you need to start building modern desktop apps with comprehensive tooling, CI/CD pipelines, and a professional development workflow.

## 🚀 Quick Start

### Prerequisites

- **Node.js** 20+ and npm
- **Rust** (latest stable)
- **Platform-specific dependencies:**
  - **Windows**: Microsoft C++ Build Tools
  - **macOS**: Xcode Command Line Tools
  - **Linux**: `webkit2gtk-4.1`, `libappindicator3-dev`, `librsvg2-dev`

### Initial Setup

1. **Clone the template:**
   ```bash
   git clone https://github.com/yourusername/tauri-workflow-template.git my-app
   cd my-app
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Configure your app:**
   - Update `package.json` with your app details
   - Modify `src-tauri/tauri.conf.json`:
     - Change `productName` and `identifier`
     - Update bundle metadata
   - Replace icons in `src-tauri/icons/`

4. **Start development:**
   ```bash
   npm run tauri dev
   ```

## 📖 Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Development Workflow](#development-workflow)
- [Blueprint.js Integration](#blueprintjs-integration)
- [SCSS Style System](#scss-style-system)
- [Branch Setup & Git Workflow](#branch-setup--git-workflow)
- [GitHub Actions Workflows](#github-actions-workflows)
- [Docker Build System](#docker-build-system)
- [Tauri Plugins & Permissions](#tauri-plugins--permissions)
- [Cross-Platform Building](#cross-platform-building)
- [Linting & Code Quality](#linting--code-quality)
- [API Documentation](#api-documentation)
- [Deployment](#deployment)
- [Troubleshooting](#troubleshooting)

## ✨ Features

- **🖥️ Cross-Platform**: Build for Windows, macOS, and Linux from a single codebase
- **⚛️ Modern Stack**: React 18.3 + TypeScript 5.6 + Vite 6.0
- **🎨 Blueprint.js UI**: Professional UI components with dark/light theme support
- **🎯 SCSS Design System**: Comprehensive styling with design tokens
- **🐳 Docker Builds**: Cross-compile for all platforms with Docker
- **🚀 GitHub Actions**: Automated CI/CD pipelines
- **📦 Multiple Formats**: DMG, MSI, NSIS, DEB, RPM packages
- **🔒 Security First**: Tauri's capability-based permissions
- **🛠️ Developer Experience**: Hot reload, TypeScript strict mode, Git hooks

## 📁 Project Structure

```
tauri-workflow-template/
├── src/                    # Frontend React application
│   ├── components/         # React components
│   │   ├── chat/          # Example chat application
│   │   └── common/        # Shared components
│   ├── hooks/             # Custom React hooks
│   ├── styles/            # SCSS design system
│   │   ├── abstracts/     # Variables, mixins, functions
│   │   ├── base/          # Reset, typography
│   │   ├── components/    # Component styles
│   │   ├── layout/        # Layout styles
│   │   ├── themes/        # Theme definitions
│   │   ├── utilities/     # Utility classes
│   │   └── vendors/       # Third-party overrides
│   ├── assets/            # Static assets
│   ├── App.tsx            # Main application
│   └── main.tsx           # Entry point
├── src-tauri/             # Backend Rust application
│   ├── src/               # Rust source code
│   │   ├── lib.rs         # Library entry
│   │   └── main.rs        # Application entry
│   ├── capabilities/      # Permission configs
│   ├── icons/            # Application icons
│   └── tauri.conf.json   # Tauri configuration
├── docs/                  # Documentation
│   ├── TODO-INDEX.md     # Task tracking
│   ├── DEVELOPMENT_PLAN.md # Roadmap
│   └── third-party-api-docs/ # Offline API docs
├── .github/workflows/     # GitHub Actions
├── docker/               # Docker build system
└── scripts/              # Utility scripts
```

## 💻 Development Workflow

### Available Scripts

| Command | Description |
|---------|-------------|
| `npm run tauri dev` | Start development mode (React + Tauri) |
| `npm run dev` | Start Vite dev server only |
| `npm run build` | Build frontend for production |
| `npm run tauri build` | Build complete desktop application |
| `npm run lint:css` | Lint and fix SCSS files |
| `npm run lint:css:production` | Production SCSS linting |
| `npm run docker:menu` | Open Docker build menu |
| `npm test` | Run tests (configure your framework) |

### Development Flow

1. **Start a session**: Review `/docs/TODO-INDEX.md`
2. **Run development**: `npm run tauri dev`
3. **Make changes**: Follow the established patterns
4. **Test locally**: Verify functionality
5. **Lint code**: `npm run lint:css`
6. **Commit changes**: Follow conventional commits
7. **Update docs**: Keep documentation current

## 🎨 Blueprint.js Integration

This template deeply integrates Blueprint.js for a professional UI experience.

### What's Included

- **Core Components**: Buttons, inputs, menus, dialogs, and more
- **Icons Library**: Complete icon set from Blueprint
- **Select Components**: Advanced dropdown functionality
- **Dark Theme**: Full dark mode support
- **Custom Overrides**: Tailored styling while maintaining Blueprint's design language

### Usage Example

```tsx
import { Button, InputGroup, Icon, Classes } from "@blueprintjs/core";
import { IconNames } from "@blueprintjs/icons";

function MyComponent() {
  return (
    <div className={Classes.DARK}>
      <InputGroup
        leftIcon={IconNames.SEARCH}
        placeholder="Search..."
        rightElement={
          <Button icon={IconNames.ARROW_RIGHT} minimal />
        }
      />
    </div>
  );
}
```

### Theme Integration

The template includes comprehensive Blueprint.js overrides in `/src/styles/vendors/_blueprint-overrides.scss`:

- Custom color schemes for dark/light themes
- Consistent spacing and shadows
- Enhanced focus states
- Smooth transitions
- Perfect scrollbar integration

## 🎨 SCSS Style System

The template includes a professional SCSS architecture following the 7-1 pattern.

### Architecture Overview

```
src/styles/
├── abstracts/        # Design tokens & tools
│   ├── _variables.scss    # Colors, spacing, typography
│   ├── _functions.scss    # Utility functions
│   ├── _mixins.scss       # Reusable patterns
│   └── _breakpoints.scss  # Responsive breakpoints
├── base/             # Foundation styles
├── components/       # Component-specific styles
├── layout/           # Major layout components
├── themes/           # Theme definitions
├── utilities/        # Utility classes
└── vendors/          # Third-party overrides
```

### Design Tokens

The system provides comprehensive design tokens:

```scss
// Colors
$color-primary: #2563eb;
$color-success: #10b981;
$color-warning: #f59e0b;
$color-danger: #ef4444;

// Spacing (0.25rem to 5rem)
$spacing-1: 0.25rem;
$spacing-4: 1rem;
$spacing-8: 2rem;

// Typography
$font-size-sm: 0.875rem;
$font-size-base: 1rem;
$font-size-lg: 1.125rem;

// Shadows
$shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
$shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
```

### Using the System

```scss
// Component example
.my-component {
  // Use design tokens
  background: $color-gray-100;
  padding: $spacing-4 $spacing-6;
  border-radius: $border-radius-lg;
  box-shadow: $shadow-md;
  
  // Use mixins
  @include button-variant($color-primary);
  
  // Responsive design
  @include media(lg) {
    padding: $spacing-6 $spacing-8;
  }
  
  // Theme-aware
  @include dark-theme {
    background: $color-gray-800;
  }
}
```

### Customization

1. **Modify tokens**: Edit files in `/src/styles/abstracts/`
2. **Add components**: Create new files in `/src/styles/components/`
3. **Extend utilities**: Add to `/src/styles/utilities/`
4. **Override vendors**: Update `/src/styles/vendors/`

## 🌳 Branch Setup & Git Workflow

### Initial Branch Setup

```bash
# Create main branch (production)
git checkout -b main
git push -u origin main

# Create dev branch (development)
git checkout -b dev
git push -u origin dev

# Set dev as default branch on GitHub
# Go to Settings → Branches → Change default branch
```

### Branch Strategy

- **`main`**: Production-ready code, triggers releases
- **`dev`**: Development branch, integration point
- **`feature/*`**: New features
- **`fix/*`**: Bug fixes
- **`docs/*`**: Documentation updates

### Workflow Example

```bash
# Start new feature
git checkout dev
git pull origin dev
git checkout -b feature/my-feature

# Work on feature
# ... make changes ...
git add .
git commit -m "feat: add my feature"
git push origin feature/my-feature

# Create PR to dev branch
# After review, merge to dev
# When ready for release, PR from dev to main
```

## 🚀 GitHub Actions Workflows

The template includes two powerful GitHub Actions workflows for automation.

### CI Workflow (`.github/workflows/ci.yml`)

**Triggers**: Push or PR to `main` or `dev` branches

**Jobs**:
1. **Lint and Test** (Ubuntu, Node 20)
   - Installs dependencies
   - Runs Stylelint (`npm run lint:css:ci`)
   - Builds frontend (`npm run build`)
   
2. **Tauri Validation** (PRs to main only)
   - Validates Rust code
   - Ensures Tauri builds successfully
   - Checks all platform requirements

**Purpose**: Ensures code quality and prevents broken builds from reaching main branches.

### Release Workflow (`.github/workflows/release.yml`)

**Triggers**: 
- Push to `main` branch
- Manual workflow dispatch

**Strategy**: Matrix build for all platforms
- macOS (x86_64 and ARM64)
- Ubuntu 22.04
- Windows

**Process**:
1. Sets up Node.js 20 and Rust toolchain
2. Installs platform-specific dependencies
3. Builds application for each platform
4. Creates draft GitHub release
5. Uploads all artifacts

**Configuration**:
```yaml
tagName: 'v__VERSION__'  # Auto-versioned
releaseName: 'Tauri Workflow Template v__VERSION__'
releaseDraft: true       # Manual publish required
```

### Customizing Workflows

1. **Add secrets**: Go to Settings → Secrets → Actions
2. **Modify triggers**: Edit `on:` section in workflow files
3. **Add steps**: Insert new steps in the `steps:` array
4. **Change platforms**: Modify the `matrix:` configuration

## 🐳 Docker Build System

The template includes a sophisticated Docker build system for cross-platform compilation.

### Features

- **Interactive Menu**: User-friendly CLI interface
- **Multi-Architecture**: Build for x86_64 and ARM64
- **Cached Dependencies**: Fast rebuilds
- **Volume Mounts**: Direct access to build artifacts
- **Cross-Compilation**: Build for all platforms from any host

### Quick Start

```bash
# Open interactive menu
npm run docker:menu

# Or use direct commands
npm run docker:build-image    # Build Docker image
npm run docker:build-tauri    # Build app in Docker
npm run docker:run           # Interactive shell
```

### Docker Menu Options

1. **Build Docker Image**: Creates the build environment
2. **Build Tauri App**: Compiles for current architecture
3. **Build All Architectures**: Cross-compiles for all platforms
4. **Run Interactive Shell**: Debug and explore
5. **Clean Build Artifacts**: Remove generated files
6. **Build on Host + Docker**: Complete build pipeline
7. **Check Image Status**: Verify Docker setup

### Tutorial: Using Docker Menu

1. **First time setup**:
   ```bash
   npm run docker:menu
   # Select: 1) Build Docker Image
   # Select: 6) Build on Host + All Docker Architectures
   ```

2. **Regular builds**:
   ```bash
   npm run docker:menu
   # Select: 2) Build Tauri Application
   ```

3. **Cross-platform build**:
   ```bash
   npm run docker:menu
   # Select: 3) Build for All Architectures
   ```

### CLI Mode

For automation, use CLI arguments:

```bash
# Build image
./docker/docker-menu.sh build-image

# Build for specific architecture
./docker/docker-menu.sh build --arch amd64

# Clean artifacts
./docker/docker-menu.sh clean
```

### Build Outputs

All builds are placed in `src-tauri/target/release/bundle/`:
- **Windows**: `.msi`, `.exe` (NSIS)
- **macOS**: `.dmg`
- **Linux**: `.deb`, `.rpm`

## 🔐 Tauri Plugins & Permissions

### Security Model

Tauri uses a capability-based permission system. All permissions are explicitly declared in `/src-tauri/capabilities/`.

### Default Permissions

The template includes these capabilities in `default.json`:

```json
{
  "permissions": [
    "core:default",           // Core Tauri APIs
    "core:app:default",       // App lifecycle
    "core:event:default",     // Event system
    "core:window:default",    // Window management
    "core:webview:default",   // Webview control
    "core:menu:default",      // Native menus
    "core:path:default",      // Path resolution
    "core:resources:default", // Resource access
    "core:tray:default",      // System tray
    "opener:default",         // Open external links
    "shell:allow-execute"     // Execute commands
  ]
}
```

### Additional Capabilities

The template provides pre-configured capability files:

- **`clipboard.json`**: Clipboard read/write access
- **`dialog.json`**: Native file/folder dialogs
- **`filesystem.json`**: File system operations
- **`network.json`**: Network requests
- **`system.json`**: System information

### Enabling Plugins

1. **Add to Cargo.toml**:
   ```toml
   [dependencies]
   tauri-plugin-clipboard = "2.0.0"
   ```

2. **Register in lib.rs**:
   ```rust
   tauri::Builder::default()
       .plugin(tauri_plugin_clipboard::init())
       .run(tauri::generate_context!())
   ```

3. **Add capability to window**:
   ```json
   {
     "windows": ["main"],
     "permissions": ["clipboard:default"]
   }
   ```

## 🌍 Cross-Platform Building

This template supports building for all major platforms in a single workflow.

### Supported Platforms

| Platform | Architectures | Package Formats |
|----------|--------------|-----------------|
| Windows | x64 | MSI, NSIS (.exe) |
| macOS | x64, ARM64 | DMG |
| Linux | x64 | DEB, RPM |

### Local Building

```bash
# Build for current platform
npm run tauri build

# Build with specific target
npm run tauri build -- --target x86_64-pc-windows-msvc
```

### Cross-Compilation

The Docker system enables cross-compilation:

```bash
# Build for all platforms
npm run docker:build-all

# This creates:
# - Windows installers (MSI, NSIS)
# - macOS packages (Intel + Apple Silicon)
# - Linux packages (DEB, RPM)
```

### Platform-Specific Notes

**Windows**:
- Requires Microsoft C++ Build Tools
- Produces signed installers (configure in `tauri.conf.json`)

**macOS**:
- Supports both Intel and Apple Silicon
- Code signing requires Apple Developer account
- Notarization for distribution outside App Store

**Linux**:
- Builds universal packages
- AppImage support can be added
- Snap/Flatpak possible with additional config

## 🧹 Linting & Code Quality

### SCSS Linting

The template uses Stylelint for SCSS code quality:

```bash
# Development mode (shows all warnings)
npm run lint:css

# Production mode (clean output)
npm run lint:css:production

# CI mode (compact formatter)
npm run lint:css:ci
```

### Configuration

Stylelint is configured in `.stylelintrc.json`:
- Extends recommended SCSS rules
- Custom rules for the design system
- Ignores vendor files
- Blueprint.js compatibility

### Git Hooks

Pre-commit hooks via Husky + lint-staged:
- Automatically fixes SCSS on commit
- Ensures code quality
- Prevents committing errors

### Adding More Linters

1. **ESLint for TypeScript**:
   ```bash
   npm install -D eslint @typescript-eslint/parser
   # Add .eslintrc.json
   # Update package.json scripts
   ```

2. **Rust formatting**:
   ```bash
   # In src-tauri/
   cargo fmt
   cargo clippy
   ```

## 📚 API Documentation

### Tauri APIs

Full Tauri API documentation is available:

- **Frontend API**: [JavaScript/TypeScript APIs](https://tauri.app/api/js/)
  - Window management
  - File system
  - Process
  - HTTP client
  - Notifications
  - And more...

- **Backend API**: [Rust APIs](https://docs.rs/tauri/latest/tauri/)
  - Command system
  - State management
  - Window creation
  - Menu building
  - Plugin development

### Blueprint.js Documentation

Complete Blueprint.js docs are included offline in `/docs/third-party-api-docs/`:

- Component library
- Design guidelines
- Accessibility features
- Migration guides
- Code examples

Access locally: Open `/docs/third-party-api-docs/blueprint/index.html`

### Template-Specific APIs

Example Tauri command:

```rust
// Backend (lib.rs)
#[tauri::command]
async fn greet(name: &str) -> Result<String, String> {
    Ok(format!("Hello, {}!", name))
}

// Frontend usage
import { invoke } from '@tauri-apps/api/core';

const message = await invoke<string>('greet', { name: 'World' });
```

## 🚀 Deployment

### Building for Distribution

1. **Update version** in `package.json` and `tauri.conf.json`

2. **Configure signing** (optional but recommended):
   - Windows: Add certificate info to `tauri.conf.json`
   - macOS: Set up signing identity
   - Linux: GPG signing for repositories

3. **Build release**:
   ```bash
   npm run tauri build
   ```

4. **Or use GitHub Actions**:
   - Push to `main` branch
   - GitHub creates draft release
   - Review and publish

### Distribution Channels

- **Direct download**: Host installers on your website
- **GitHub Releases**: Automatic with Actions
- **Auto-updater**: Configure Tauri's updater
- **App stores**: Additional configuration required

### Update System

Enable auto-updates:

1. Add to `tauri.conf.json`:
   ```json
   {
     "updater": {
       "active": true,
       "endpoints": ["https://your-api.com/updates"],
       "dialog": true
     }
   }
   ```

2. Set up update server
3. Sign updates for security

## 🔧 Troubleshooting

### Common Issues

**Build fails on Windows**
- Install Visual Studio Build Tools
- Ensure WebView2 is installed
- Check Rust toolchain: `rustup update`

**Docker build errors**
- Verify Docker daemon is running
- Check disk space
- Run `npm run docker:clean`

**SCSS linting warnings**
- Blueprint.js overrides need `!important`
- Some warnings are expected
- Run `npm run lint:css` to auto-fix

**Tauri command not found**
- Ensure all dependencies installed: `npm install`
- Check Rust installation: `cargo --version`
- Verify in correct directory

**macOS code signing**
- Requires Apple Developer account
- Configure in `tauri.conf.json`
- See [Tauri docs](https://tauri.app/distribute/sign-macos/)

### Getting Help

1. Check `/docs/` for additional documentation
2. Review [Tauri Documentation](https://tauri.app/)
3. See [Blueprint.js Documentation](https://blueprintjs.com/)
4. Open an issue on GitHub

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Follow the code style
4. Add tests if applicable
5. Update documentation
6. Submit a pull request to `dev`

## 📄 License

This template is available under the MIT License. See LICENSE file for details.

---

Built with ❤️ using Tauri, React, and Blueprint.js. Happy coding! 🚀