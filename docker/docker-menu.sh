#!/usr/bin/env bash
# Tauri Workflow Template Docker Build Menu - Bash Version
# Comprehensive build and development environment management

set -euo pipefail

# Initialize global variables
QUIET=false
AUTO_YES=false
NO_CACHE=false
CUSTOM_IMAGE=""
FORCE_ARCH=""
COMMAND=""
COMMAND_ARG=""

# Color output functions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

success() { [[ "$QUIET" != "true" ]] && echo -e "${GREEN}$*${NC}" || true; }
warning() { [[ "$QUIET" != "true" ]] && echo -e "${YELLOW}$*${NC}" || true; }
error() { echo -e "${RED}$*${NC}" >&2; }
info() { [[ "$QUIET" != "true" ]] && echo -e "${CYAN}$*${NC}" || true; }

# Configuration
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SRC_TAURI_DIR="$PROJECT_ROOT/src-tauri"
IMAGE_BASE="twt-builder"
IMAGE_TAG="ubuntu-22.04"

# Platform detection
detect_platform() {
    local arch=$(uname -m)
    case "$arch" in
        x86_64|amd64)
            ARCH="x86_64"
            PLATFORM="linux/amd64"
            ;;
        arm64|aarch64)
            ARCH="arm64"
            PLATFORM="linux/arm64"
            ;;
        *)
            error "Unsupported architecture: $arch"
            exit 1
            ;;
    esac
}

detect_platform
IMAGE_FULL="${IMAGE_BASE}:${IMAGE_TAG}-${ARCH}"
IMAGE_DEFAULT="${IMAGE_BASE}:${IMAGE_TAG}"

# Command-line flags
show_help() {
    cat << EOF
Tauri Workflow Template Docker Build System

Usage: $(basename $0) [OPTIONS] [COMMAND]

COMMANDS:
    build-image [ARCH]      Build Docker image (native|x86_64|arm64|both)
    build-tauri [ARCH]      Build Tauri app in Docker (x86_64|arm64|both)
    build-native            Build Tauri app on host machine
    build-all               Build everything (host + Docker all architectures)
    run [ARCH]              Run interactive Docker shell
    clean                   Clean build artifacts
    deep-clean              Clean artifacts + Docker images
    check                   Check Docker image status
    usage                   Show disk usage report
    menu                    Show interactive menu (default)

OPTIONS:
    -h, --help              Show this help message
    -q, --quiet             Suppress non-error output
    -y, --yes               Auto-confirm prompts
    --no-cache              Build without Docker cache
    --arch ARCH             Override architecture (x86_64|arm64)
    --image IMAGE           Use custom Docker image

EXAMPLES:
    $(basename $0) build-image          # Build native arch image
    $(basename $0) build-image both     # Build both architectures
    $(basename $0) build-tauri x86_64   # Build x86_64 Tauri app
    $(basename $0) run arm64            # Run ARM64 container
    $(basename $0) clean                # Clean build artifacts
    $(basename $0) --arch x86_64 run    # Force x86_64 container

EOF
}

# Parse command-line arguments

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -q|--quiet)
            QUIET=true
            shift
            ;;
        -y|--yes)
            AUTO_YES=true
            shift
            ;;
        --no-cache)
            NO_CACHE=true
            shift
            ;;
        --arch)
            FORCE_ARCH="$2"
            shift 2
            ;;
        --image)
            CUSTOM_IMAGE="$2"
            shift 2
            ;;
        -*)
            error "Unknown option: $1"
            show_help
            exit 1
            ;;
        *)
            if [[ -z "$COMMAND" ]]; then
                COMMAND="$1"
            else
                COMMAND_ARG="$1"
            fi
            shift
            ;;
    esac
done

# Override architecture if specified
if [[ -n "$FORCE_ARCH" ]]; then
    case "$FORCE_ARCH" in
        x86_64|amd64)
            ARCH="x86_64"
            PLATFORM="linux/amd64"
            ;;
        arm64|aarch64)
            ARCH="arm64"
            PLATFORM="linux/arm64"
            ;;
        *)
            error "Invalid architecture: $FORCE_ARCH"
            exit 1
            ;;
    esac
    IMAGE_FULL="${IMAGE_BASE}:${IMAGE_TAG}-${ARCH}"
fi

# Quiet mode wrapper
run_quiet() {
    if [[ "$QUIET" == "true" ]]; then
        "$@" >/dev/null 2>&1
    else
        "$@"
    fi
}

# Helper Functions
show_menu() {
    clear
    echo -e "${CYAN}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║               Tauri Workflow Template Docker Build System                  ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}Current Settings:${NC}"
    echo -e "${GRAY}  Native Architecture: $ARCH${NC}"
    echo -e "${GRAY}  Default Docker Image: $IMAGE_FULL${NC}"
    echo ""
    echo -e "${GREEN}Docker Image Operations:${NC}"
    echo "  1) Build Docker image (native architecture)"
    echo "  2) Build Docker image (both architectures)"
    echo "  3) Build Docker image (with cache clear)"
    echo "  4) Check Docker image status"
    echo ""
    echo -e "${GREEN}Tauri Build Operations:${NC}"
    echo "  5) Build Tauri app (x86_64 in Docker)"
    echo "  6) Build Tauri app (ARM64 in Docker)"
    echo "  7) Build Tauri app (Both architectures in Docker)"
    echo "  8) Build Tauri app (Native host machine)"
    echo "  9) Build ALL (Host + Docker all architectures)"
    echo ""
    echo -e "${GREEN}Development Operations:${NC}"
    echo " 10) Run interactive Docker shell (native arch)"
    echo " 11) Run interactive Docker shell (select arch)"
    echo " 12) Run specific Docker image (custom)"
    echo ""
    echo -e "${GREEN}Maintenance:${NC}"
    echo " 13) Clean build artifacts (target & dist folders)"
    echo " 14) Deep clean (artifacts + Docker images)"
    echo " 15) Show disk usage report"
    echo ""
    echo -e "${RED}  Q) Quit${NC}"
    echo ""
    echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

build_docker_image() {
    local arch=${1:-$ARCH}
    local clean=${2:-false}
    local platform
    local image_tag
    
    case "$arch" in
        x86_64)
            platform="linux/amd64"
            image_tag="${IMAGE_TAG}-x86_64"
            ;;
        arm64)
            platform="linux/arm64"
            image_tag="${IMAGE_TAG}-arm64"
            ;;
        *)
            error "Invalid architecture: $arch"
            return 1
            ;;
    esac
    
    info "\n🐳 Building Docker image for $arch: ${IMAGE_BASE}:${image_tag}"
    
    cd "$PROJECT_ROOT"
    
    local build_args=(
        "build"
        "--platform" "$platform"
        "-t" "${IMAGE_BASE}:${image_tag}"
        "-f" "docker/Dockerfile"
        "--build-arg" "BUILDARCH=$arch"
        "--build-arg" "UID=$(id -u)"
        "--build-arg" "GID=$(id -g)"
    )
    
    if [[ "$clean" == "true" ]]; then
        build_args+=("--no-cache")
        warning "Building without cache..."
    fi
    
    # Add quiet flag if needed
    if [[ "$QUIET" == "true" ]]; then
        build_args+=("--quiet")
    fi
    
    build_args+=(".")
    
    if docker "${build_args[@]}"; then
        success "✅ Docker image built successfully for $arch!"
        
        # Tag native architecture as default
        if [[ "$arch" == "$ARCH" ]]; then
            docker tag "${IMAGE_BASE}:${image_tag}" "$IMAGE_DEFAULT"
            info "Tagged as default: $IMAGE_DEFAULT"
        fi
        
        # Verify image
        info "\nVerifying image architecture..."
        docker image inspect "${IMAGE_BASE}:${image_tag}" --format "Architecture: {{.Architecture}}, OS: {{.Os}}"
    else
        error "Docker build failed for $arch"
        return 1
    fi
}

build_docker_both() {
    local clean=${1:-false}
    info "\n🐳 Building Docker images for both architectures..."
    
    build_docker_image "x86_64" "$clean"
    build_docker_image "arm64" "$clean"
    
    success "\n✅ Both images built successfully!"
}

check_docker_images() {
    info "\n🔍 Checking Docker images..."
    
    echo -e "\n${YELLOW}Available Tauri Workflow Template images:${NC}"
    docker images --filter "reference=$IMAGE_BASE*" --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.CreatedAt}}"
    
    # Check specific images
    for arch in x86_64 arm64; do
        local image="${IMAGE_BASE}:${IMAGE_TAG}-${arch}"
        if docker image inspect "$image" &>/dev/null; then
            success "✅ $image is available"
        else
            warning "⚠️  $image not found"
        fi
    done
    
    # Check default image
    if docker image inspect "$IMAGE_DEFAULT" &>/dev/null; then
        info "\nDefault image $IMAGE_DEFAULT is available"
    fi
}

build_tauri_docker() {
    local arch=${1:-x86_64}
    local docker_image="${IMAGE_BASE}:${IMAGE_TAG}-${arch}"
    
    # Check if image exists
    if ! docker image inspect "$docker_image" &>/dev/null; then
        error "Docker image $docker_image not found. Please build it first."
        return 1
    fi
    
    info "\n🔨 Building Tauri app for $arch in Docker..."
    
    # Prepare Docker command
    local docker_cmd=(
        "run" "--rm"
        "-v" "$PROJECT_ROOT:/workspace"
        "-v" "$SRC_TAURI_DIR/target:/workspace/src-tauri/target"
        "-v" "$PROJECT_ROOT/node_modules:/workspace/node_modules"
        "-w" "/workspace"
        "$docker_image"
        "bash" "-c"
    )
    
    local build_script='
set -e
echo "📦 Installing dependencies..."
npm ci
echo "🚀 Building Tauri application..."
npm run tauri build
echo "✅ Build completed successfully!"
echo ""
echo "Build artifacts:"
find src-tauri/target/release/bundle -type f -name "*.deb" -o -name "*.AppImage" -o -name "*.tar.gz" | sort
'
    
    if docker "${docker_cmd[@]}" "$build_script"; then
        success "✅ Build completed for $arch"
        
        # Fix permissions on Linux (files created by Docker may be owned by root)
        if [[ "$(uname)" == "Linux" ]]; then
            info "Fixing file permissions..."
            sudo chown -R "$(id -u):$(id -g)" "$SRC_TAURI_DIR/target" "$PROJECT_ROOT/node_modules" 2>/dev/null || true
        fi
    else
        error "Build failed for $arch"
        return 1
    fi
}

build_tauri_both() {
    info "\n🔨 Building Tauri app for both architectures..."
    
    # Build x86_64
    if build_tauri_docker "x86_64"; then
        success "x86_64 build completed"
    else
        error "x86_64 build failed"
    fi
    
    # Build ARM64
    if docker image inspect "${IMAGE_BASE}:${IMAGE_TAG}-arm64" &>/dev/null; then
        if build_tauri_docker "arm64"; then
            success "ARM64 build completed"
        else
            error "ARM64 build failed"
        fi
    else
        warning "ARM64 image not found. Skipping ARM64 build."
        info "To build for ARM64, first create the ARM64 Docker image (option 2)."
    fi
}

build_tauri_native() {
    info "\n🔨 Building Tauri app on native host machine..."
    
    cd "$PROJECT_ROOT"
    
    # Check prerequisites
    if ! command -v npm &> /dev/null; then
        error "npm not found. Please install Node.js first."
        return 1
    fi
    
    if ! command -v cargo &> /dev/null; then
        error "cargo not found. Please install Rust first."
        return 1
    fi
    
    info "📦 Installing dependencies..."
    if npm ci; then
        info "🚀 Building Tauri application..."
        if npm run tauri build; then
            success "✅ Native build completed successfully!"
            
            # Show build artifacts
            echo -e "\n${YELLOW}Build artifacts:${NC}"
            find "$SRC_TAURI_DIR/target/release/bundle" -type f \( -name "*.deb" -o -name "*.AppImage" -o -name "*.dmg" -o -name "*.app" -o -name "*.exe" -o -name "*.msi" \) 2>/dev/null | sort
        else
            error "Tauri build failed"
            return 1
        fi
    else
        error "npm install failed"
        return 1
    fi
}

build_all() {
    info "\n🚀 Building Tauri Workflow Template on all platforms..."
    
    # Build on native host
    echo -e "\n${CYAN}━━━ Native Host Build ━━━${NC}"
    build_tauri_native
    
    # Build in Docker
    echo -e "\n${CYAN}━━━ Docker Builds ━━━${NC}"
    build_tauri_both
    
    success "\n✅ All builds completed!"
}

run_docker_interactive() {
    local arch=${1:-$ARCH}
    local custom_image=${2:-""}
    local docker_image
    
    if [[ -n "$custom_image" ]]; then
        docker_image="$custom_image"
    else
        docker_image="${IMAGE_BASE}:${IMAGE_TAG}-${arch}"
    fi
    
    # Check if image exists
    if ! docker image inspect "$docker_image" &>/dev/null; then
        error "Docker image $docker_image not found."
        return 1
    fi
    
    info "\n🐳 Starting interactive Docker container..."
    info "Image: $docker_image"
    info "Mounting project directory..."
    
    local docker_cmd=(
        "run" "--rm" "-it"
        "-v" "$PROJECT_ROOT:/workspace"
        "-v" "$SRC_TAURI_DIR/target:/workspace/src-tauri/target"
        "-v" "$PROJECT_ROOT/node_modules:/workspace/node_modules"
        "-w" "/workspace"
        "$docker_image"
        "bash"
    )
    
    docker "${docker_cmd[@]}"
    
    # Fix permissions on Linux
    if [[ "$(uname)" == "Linux" ]]; then
        info "Fixing file permissions..."
        sudo chown -R "$(id -u):$(id -g)" "$SRC_TAURI_DIR/target" "$PROJECT_ROOT/node_modules" 2>/dev/null || true
    fi
}

clean_build_artifacts() {
    local deep=${1:-false}
    
    info "\n🧹 Cleaning build artifacts..."
    
    # Clean target directories
    local dirs=(
        "$SRC_TAURI_DIR/target"
        "$SRC_TAURI_DIR/target"
        "$PROJECT_ROOT/dist"
        "$SRC_TAURI_DIR/target-x86_64"
        "$SRC_TAURI_DIR/target-arm64"
    )
    
    for dir in "${dirs[@]}"; do
        if [[ -d "$dir" ]]; then
            warning "Removing: $dir"
            rm -rf "$dir"
        fi
    done
    
    # Run cargo clean
    if command -v cargo &> /dev/null; then
        cd "$SRC_TAURI_DIR"
        info "Running cargo clean..."
        cargo clean
    fi
    
    if [[ "$deep" == "true" ]]; then
        info "\n🐳 Cleaning Docker images..."
        local images=$(docker images --filter "reference=$IMAGE_BASE*" -q)
        if [[ -n "$images" ]]; then
            warning "Removing Tauri Workflow Template Docker images..."
            docker rmi $images -f
        fi
        
        info "Pruning Docker build cache..."
        docker builder prune -f
    fi
    
    success "✅ Cleanup completed!"
}

show_disk_usage() {
    info "\n📊 Disk Usage Report"
    
    echo -e "\n${YELLOW}Build Artifacts:${NC}"
    for dir in "$SRC_TAURI_DIR/target" "$PROJECT_ROOT/dist" "$PROJECT_ROOT/node_modules"; do
        if [[ -d "$dir" ]]; then
            local size=$(du -sh "$dir" 2>/dev/null | cut -f1)
            echo "  $dir: $size"
        fi
    done
    
    echo -e "\n${YELLOW}Docker Images:${NC}"
    docker images --filter "reference=$IMAGE_BASE*" --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}"
    
    echo -e "\n${YELLOW}Docker System:${NC}"
    docker system df
}

# Execute command if provided
if [[ -n "$COMMAND" ]]; then
    case "$COMMAND" in
        build-image)
            case "${COMMAND_ARG:-native}" in
                native) build_docker_image "$ARCH" "$NO_CACHE" ;;
                x86_64) build_docker_image "x86_64" "$NO_CACHE" ;;
                arm64) build_docker_image "arm64" "$NO_CACHE" ;;
                both) build_docker_both "$NO_CACHE" ;;
                *) error "Invalid architecture: $COMMAND_ARG"; exit 1 ;;
            esac
            ;;
        build-tauri)
            case "${COMMAND_ARG:-native}" in
                native) build_tauri_docker "$ARCH" ;;
                x86_64) build_tauri_docker "x86_64" ;;
                arm64) build_tauri_docker "arm64" ;;
                both) build_tauri_both ;;
                *) error "Invalid architecture: $COMMAND_ARG"; exit 1 ;;
            esac
            ;;
        build-native)
            build_tauri_native
            ;;
        build-all)
            build_all
            ;;
        run)
            if [[ -n "$CUSTOM_IMAGE" ]]; then
                run_docker_interactive "$ARCH" "$CUSTOM_IMAGE"
            else
                run_docker_interactive "${COMMAND_ARG:-$ARCH}"
            fi
            ;;
        clean)
            clean_build_artifacts "false"
            ;;
        deep-clean)
            if [[ "$AUTO_YES" != "true" ]]; then
                read -p "This will remove all Docker images. Continue? (y/N) " -n 1 -r
                echo
                if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                    warning "Cancelled"
                    exit 0
                fi
            fi
            clean_build_artifacts "true"
            ;;
        check)
            check_docker_images
            ;;
        usage)
            show_disk_usage
            ;;
        menu)
            # Fall through to menu
            ;;
        *)
            error "Unknown command: $COMMAND"
            show_help
            exit 1
            ;;
    esac
    
    # Exit after command execution
    if [[ "$COMMAND" != "menu" ]]; then
        exit 0
    fi
fi

# Main Menu Loop
while true; do
    show_menu
    read -p "Select an option: " choice
    
    case "$choice" in
        1) build_docker_image "$ARCH" ;;
        2) build_docker_both "false" ;;
        3) build_docker_image "$ARCH" "true" ;;
        4) check_docker_images ;;
        5) build_tauri_docker "x86_64" ;;
        6) build_tauri_docker "arm64" ;;
        7) build_tauri_both ;;
        8) build_tauri_native ;;
        9) build_all ;;
        10) run_docker_interactive "$ARCH" ;;
        11)
            echo -e "\n${YELLOW}Select architecture:${NC}"
            echo "  1) x86_64"
            echo "  2) ARM64"
            read -p "Choice: " arch_choice
            case "$arch_choice" in
                1) run_docker_interactive "x86_64" ;;
                2) run_docker_interactive "arm64" ;;
                *) warning "Invalid choice" ;;
            esac
            ;;
        12)
            read -p "Enter Docker image name (or press Enter for default): " custom_image
            if [[ -z "$custom_image" ]]; then
                custom_image="$IMAGE_FULL"
            fi
            run_docker_interactive "$ARCH" "$custom_image"
            ;;
        13) clean_build_artifacts ;;
        14) clean_build_artifacts "true" ;;
        15) show_disk_usage ;;
        [Qq])
            success "\nGoodbye!"
            exit 0
            ;;
        *)
            warning "\nInvalid option. Please try again."
            ;;
    esac
    
    echo -e "\n${GRAY}Press any key to continue...${NC}"
    read -n 1 -s
done