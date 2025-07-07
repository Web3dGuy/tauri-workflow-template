# Tauri Workflow Template Docker Build System

A unified Docker-based build environment for cross-platform Tauri application development. Build Tauri Workflow Template for Linux (x86_64 and ARM64) from any host OS using a single menu-driven interface.

## Overview

This system provides:
- 🎯 **Unified Menu Interface**: Single script for all Docker operations
- 🤖 **CLI Mode**: Full command-line interface for automation and AI agents
- 🏗️ **Multi-Architecture**: Build for x86_64 and ARM64 Linux targets
- 🔄 **Cross-Platform**: Works on macOS, Linux, and Windows
- ⚡ **Fast Iteration**: Cached dependencies and build artifacts
- 🎮 **Interactive Development**: Shell access to build environment

## Quick Start

### Interactive Menu Mode

**Linux/macOS:**
```bash
./docker-menu.sh
```

**Windows PowerShell:**
```powershell
.\docker-menu.ps1
```

### Command-Line Mode (AI-Friendly)

**Build Examples:**
```bash
# Build Docker image for native architecture
./docker-menu.sh build-image

# Build Tauri app for specific architecture
./docker-menu.sh build-tauri x86_64
./docker-menu.sh build-tauri arm64

# Build everything (host + all Docker targets)
./docker-menu.sh build-all

# Quick cleanup
./docker-menu.sh clean
```

**PowerShell Examples:**
```powershell
# Build Docker image
.\docker-menu.ps1 build-image

# Build Tauri app
.\docker-menu.ps1 build-tauri x86_64

# Run interactive shell
.\docker-menu.ps1 run
```

## Command Reference

### Commands

| Command | Arguments | Description |
|---------|-----------|-------------|
| `build-image` | `[native\|x86_64\|arm64\|both]` | Build Docker image(s) |
| `build-tauri` | `[x86_64\|arm64\|both]` | Build Tauri app in Docker |
| `build-native` | - | Build Tauri app on host machine |
| `build-all` | - | Build on host + all Docker architectures |
| `run` | `[x86_64\|arm64]` | Start interactive Docker shell |
| `clean` | - | Remove build artifacts |
| `deep-clean` | - | Remove artifacts + Docker images |
| `check` | - | Show Docker image status |
| `usage` | - | Display disk usage report |
| `menu` | - | Show interactive menu (default) |

### Options

| Option | Description |
|--------|-------------|
| `-h, --help` | Show help message |
| `-q, --quiet` | Suppress non-error output |
| `-y, --yes` | Auto-confirm prompts |
| `--no-cache` | Build without Docker cache |
| `--arch ARCH` | Override architecture |
| `--image IMAGE` | Use custom Docker image |

### Examples

```bash
# Build both architectures with fresh cache
./docker-menu.sh --no-cache build-image both

# Force x86_64 build on ARM Mac
./docker-menu.sh --arch x86_64 build-tauri

# Automated cleanup with auto-confirm
./docker-menu.sh -y deep-clean

# Quiet mode for scripts
./docker-menu.sh -q build-tauri x86_64

# Use custom image
./docker-menu.sh --image ubuntu:24.04 run
```

## Interactive Menu Features

The menu provides organized sections:

### Docker Image Operations
1. Build native architecture image
2. Build both architectures (Linux/macOS only)
3. Build with cache clear
4. Check image status

### Tauri Build Operations
5. Build for x86_64 in Docker
6. Build for ARM64 in Docker
7. Build both architectures
8. Build on native host
9. Build ALL (comprehensive)

### Development Operations
10. Interactive shell (native arch)
11. Interactive shell (select arch)
12. Custom Docker image shell

### Maintenance
13. Clean build artifacts
14. Deep clean (artifacts + images)
15. Disk usage report

## Architecture Support

### Platform Detection
- Automatically detects host architecture
- macOS ARM64 (M1/M2/M3) → Defaults to ARM64
- macOS/Linux x86_64 → Defaults to x86_64
- Windows → Always uses x86_64 for Linux containers

### Cross-Architecture Builds
- **Native performance**: Build for your host architecture
- **Cross-compilation**: Build x86_64 on ARM64 (slower due to emulation)
- **Multi-arch**: Build both architectures sequentially

## Docker Environment

### Base Images
- **x86_64**: Ubuntu 22.04 LTS + `libwebkit2gtk-4.1-dev` (matches GitHub Actions)
- **ARM64**: Ubuntu 20.04 LTS + `libwebkit2gtk-4.0-dev` (optimized for Windows Docker Desktop emulation)

### Pre-installed Tools
- Node.js 20.x LTS
- Rust stable toolchain
- Tauri Linux dependencies
- Build essentials

### Volume Mounts
- `/workspace` - Project root
- `/workspace/target` - Rust build cache
- `/workspace/node_modules` - NPM cache

## Build Artifacts

Builds output to standard Tauri locations:
```
src-tauri/target/release/bundle/
├── deb/        # Debian packages
├── rpm/        # RPM packages  
└── appimage/   # AppImage (if supported)
```

## Performance Optimization

### Build Caching
- Docker layer caching for base image
- Persistent Cargo target directory
- Cached node_modules across builds

### Architecture Considerations
- Native builds: Maximum performance
- Cross-arch builds: 2-10x slower (QEMU emulation)
- Recommendation: Use native arch for development

## Troubleshooting

### Common Issues

**Docker not running:**
```
Error: Docker is not running
Solution: Start Docker Desktop
```

**Permission denied (Linux/macOS):**
```bash
chmod +x docker-menu.sh
```

**Build failures:**
- Check native build first: `npm run tauri build`
- Verify dependencies: `npm ci`
- Check Rust: `cargo check`

### Platform-Specific Notes

**macOS:**
- Docker Desktop required
- Rosetta 2 improves x86_64 emulation on Apple Silicon

**Windows:**
- PowerShell 5.1+ or PowerShell Core
- Docker Desktop with WSL2 backend recommended
- ARM64 builds supported but require ARM64 image

**Linux:**
- Native Docker installation
- May need to fix permissions: `sudo chown -R $(id -u):$(id -g) target/`

## Advanced Usage

### Environment Variables
```bash
# Override image name
IMAGE_BASE=custom-builder ./docker-menu.sh build-image

# Custom Docker arguments  
DOCKER_BUILD_ARGS="--network=host" ./docker-menu.sh build-image
```

### CI/CD Integration
```yaml
# GitHub Actions example
- name: Build Tauri Linux
  run: |
    ./docker-menu.sh -q -y build-image
    ./docker-menu.sh -q build-tauri both
```

### Parallel Builds
```bash
# Build multiple architectures in parallel (manual)
./docker-menu.sh build-tauri x86_64 &
./docker-menu.sh build-tauri arm64 &
wait
```

## File Structure

```
docker/
├── docker-menu.sh      # Linux/macOS unified script
├── docker-menu.ps1     # Windows PowerShell script
├── Dockerfile          # x86_64 Ubuntu 22.04 image
├── Dockerfile.arm64    # ARM64 Ubuntu 20.04 image (emulation-optimized)
└── README.md          # This documentation
```

## Contributing

When modifying the Docker build system:

1. **Maintain parity**: Keep both scripts (sh/ps1) in sync
2. **Test all modes**: Interactive menu and CLI commands
3. **Document changes**: Update help text and README
4. **Consider automation**: Ensure CLI mode works for CI/CD

## Security

- Non-root container user (`builder`)
- Minimal required permissions
- No network access during builds
- Temporary containers (auto-cleanup)

## Support

For issues or questions:

1. Check help: `./docker-menu.sh --help`
2. Verify Docker: `docker --version`
3. Test native build: `npm run tauri build`
4. Review logs: Add `-q` flag for cleaner output

---

Built with ❤️ for cross-platform Tauri development