# Tauri Desktop Application Template

A production-ready template for building modern, cross-platform desktop applications using Tauri 2.0, React 18.3, TypeScript, and Blueprint.js.

## ✨ Features

- **🚀 Modern Stack**: Tauri 2.0 + React 18.3 + TypeScript 5.6 + Vite 6.0
- **🎨 Professional UI**: Blueprint.js 6.0 with comprehensive SCSS design system
- **⚡ Performance**: Native Rust backend with optimized React frontend
- **🔒 Secure**: Tauri's capability-based security model
- **🛠️ Developer Experience**: Hot reload, linting, git hooks, and more
- **📦 Cross-Platform**: Windows, macOS, and Linux support
- **🐳 Docker Support**: Multi-architecture build environment
- **🔄 CI/CD Ready**: GitHub Actions workflows for automated builds and releases

## 🚀 Quick Start

### Prerequisites

- [Node.js](https://nodejs.org/) 18.0 or higher
- [Rust](https://rustup.rs/) (latest stable)
- Platform-specific dependencies (see [Setup Guide](./docs/setup-guide.md))

### Installation

```bash
# Clone the template
git clone [your-template-repo-url] my-app
cd my-app

# Install dependencies
npm install

# Start development
npm run tauri dev
```

## 📋 Available Scripts

### Development
```bash
npm run tauri dev      # Start Tauri + React development server
npm run dev            # Start Vite dev server only
npm run build          # Build frontend for production
npm run tauri build    # Build complete desktop application
```

### Code Quality
```bash
npm run lint:css             # Lint SCSS files (development)
npm run lint:css:production  # Lint SCSS files (CI-friendly)
npm run lint:css:ci          # Lint SCSS with compact output
```

### Docker (Cross-Platform Builds)
```bash
npm run docker:menu         # Interactive Docker build menu
npm run docker:build-all    # Build for all platforms
npm run docker:clean        # Clean build artifacts
```

## 🏗️ Project Structure

```
├── src/                     # Frontend React application
│   ├── components/          # Reusable UI components
│   ├── hooks/              # Custom React hooks
│   ├── styles/             # SCSS design system (2,800+ lines)
│   ├── assets/             # Static assets
│   └── ...
├── src-tauri/              # Backend Rust application
│   ├── src/                # Rust source code
│   ├── capabilities/       # Tauri permission configs
│   ├── icons/             # Application icons
│   └── tauri.conf.json    # Tauri configuration
├── docs/                   # Comprehensive documentation
│   ├── TODO-INDEX.md      # Task management template
│   ├── DEVELOPMENT_PLAN.md # Project roadmap
│   ├── setup-guide.md     # Environment setup
│   └── architecture.md    # Technical architecture
├── .github/workflows/      # CI/CD automation
├── docker/                 # Docker build environment
└── ...
```

## 🎨 Design System

This template includes a comprehensive SCSS design system with:

- **Design Tokens**: Colors, spacing, typography, shadows
- **Component Styles**: Production-ready components
- **Blueprint.js Integration**: Solved portal rendering challenges
- **Responsive Design**: Mobile-first approach
- **Dark Theme**: Beautiful dark mode with Blueprint.js

```scss
// Example usage
.my-component {
  background: color(slate, 800);
  padding: spacing(4);
  border-radius: radius(md);
  @include shadow(lg);
}
```

## 🔧 Configuration

### Customize Your App

1. **Update App Metadata**
   ```json
   // package.json
   {
     "name": "your-app-name",
     "description": "Your app description"
   }
   ```

2. **Configure Tauri**
   ```json
   // src-tauri/tauri.conf.json
   {
     "productName": "Your App",
     "identifier": "com.yourcompany.yourapp"
   }
   ```

3. **Replace Icons**
   - Update icons in `src-tauri/icons/`
   - Use the [Tauri Icon Generator](https://tauri.app/guides/features/icons/)

4. **Customize Styling**
   - Modify colors in `src/styles/abstracts/_colors.scss`
   - Update design tokens as needed

## 📖 Documentation

- **[Setup Guide](./docs/setup-guide.md)** - Environment setup and installation
- **[Development Plan](./docs/DEVELOPMENT_PLAN.md)** - Project roadmap and architecture
- **[TODO Index](./docs/TODO-INDEX.md)** - Task management and progress tracking
- **[Architecture Overview](./docs/architecture.md)** - Technical architecture details
- **[SCSS Documentation](./src/styles/README.md)** - Design system guide

## 🛠️ Development Workflow

1. **Plan Your Features** - Use `docs/DEVELOPMENT_PLAN.md`
2. **Track Progress** - Update `docs/TODO-INDEX.md`
3. **Follow Patterns** - Reference existing components and styles
4. **Test Early** - Build on all target platforms
5. **Document Changes** - Keep docs current with code

## 🔒 Security

- Tauri's capability-based permission system
- Content Security Policy (CSP) enforcement
- Secure IPC communication
- Input validation and sanitization
- No direct file system access from frontend

## 📦 Building & Distribution

### Single Platform
```bash
npm run tauri build
```

### Cross-Platform (Docker)
```bash
npm run docker:build-all
```

### GitHub Actions
Automated builds triggered on:
- Push to `main` or `dev` branches
- Pull requests
- Manual dispatch

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Follow existing patterns and conventions
5. Update documentation
6. Submit a pull request

## 📄 License

This template is released under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- **[Tauri](https://tauri.app/)** - Secure, fast, cross-platform apps
- **[React](https://react.dev/)** - User interface library
- **[Blueprint.js](https://blueprintjs.com/)** - React UI components
- **[Vite](https://vitejs.dev/)** - Fast build tool

## 🆘 Support

- Check the [documentation](./docs/)
- Review [common issues](./docs/setup-guide.md#troubleshooting)
- Create an issue for bugs or feature requests
- Join community discussions

---

**Happy building! 🚀**

*This template is designed to accelerate your desktop app development. Customize it to fit your needs and build something amazing!*