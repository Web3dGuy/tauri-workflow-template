#!/usr/bin/env bash
# Tauri Workflow Docker Build Menu - Bash Version
# Comprehensive build and development environment management

set -eu

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
IMAGE_BASE="tauri-workflow-builder"
IMAGE_TAG="ubuntu-22.04"

# Logging setup
LOGS_DIR="$PROJECT_ROOT/logs"
LOG_TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
CURRENT_LOG_FILE=""

# Ensure logs directory exists
mkdir -p "$LOGS_DIR"

# Logging functions
start_logging() {
    local operation="$1"
    local log_filename="${LOG_TIMESTAMP}_${operation}.log"
    CURRENT_LOG_FILE="$LOGS_DIR/$log_filename"
    
    cat > "$CURRENT_LOG_FILE" << EOF
================================================================
Tauri Workflow Docker Build System - Log
================================================================
Operation: $operation
Started: $(date '+%Y-%m-%d %H:%M:%S')
Host: $(hostname)
User: $(whoami)
Working Directory: $(pwd)
================================================================

EOF
    
    info "📝 Logging to: $log_filename"
}

write_log() {
    local message="$1"
    local level="${2:-INFO}"
    
    if [[ -n "$CURRENT_LOG_FILE" ]]; then
        local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        echo "[$timestamp] [$level] $message" >> "$CURRENT_LOG_FILE"
    fi
}

stop_logging() {
    local status="${1:-COMPLETED}"
    
    if [[ -n "$CURRENT_LOG_FILE" ]]; then
        cat >> "$CURRENT_LOG_FILE" << EOF

================================================================
Operation $status: $(date '+%Y-%m-%d %H:%M:%S')
================================================================
EOF
        info "📝 Log saved: $(basename "$CURRENT_LOG_FILE")"
        CURRENT_LOG_FILE=""
    fi
}

run_logged_command() {
    local description="$1"
    shift
    local full_command="$*"
    
    write_log "COMMAND: $full_command" "CMD"
    if [[ -n "$description" ]]; then
        write_log "DESCRIPTION: $description" "INFO"
    fi
    
    # Capture both stdout and stderr
    local output_file=$(mktemp)
    local exit_code=0
    
    if "$@" > "$output_file" 2>&1; then
        exit_code=0
    else
        exit_code=$?
    fi
    
    # Log all output
    while IFS= read -r line; do
        write_log "$line" "OUTPUT"
    done < "$output_file"
    
    rm -f "$output_file"
    
    if [[ $exit_code -eq 0 ]]; then
        write_log "Command completed successfully (Exit Code: $exit_code)" "SUCCESS"
        return 0
    else
        write_log "Command failed (Exit Code: $exit_code)" "ERROR"
        return $exit_code
    fi
}

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
Tauri Workflow Docker Build System

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
    show-logs               Show recent log files
    menu                    Show interactive menu (default)

OPTIONS:
    -h, --help              Show this help message
    -q, --quiet             Suppress non-error output
    -y, --yes               Auto-confirm prompts
    --no-cache              Build without Docker cache
    --arch ARCH             Override architecture (x86_64|arm64)
    --image IMAGE           Use custom Docker image

LOGGING:
    All operations are automatically logged to timestamped files in the logs/ directory.
    Use 'show-logs' command to view recent log files.

EXAMPLES:
    $(basename $0) build-image          # Build native arch image
    $(basename $0) build-image both     # Build both architectures
    $(basename $0) build-tauri x86_64   # Build x86_64 Tauri app
    $(basename $0) run arm64            # Run ARM64 container
    $(basename $0) clean                # Clean build artifacts
    $(basename $0) show-logs            # Show recent logs
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

# Docker install function
install_docker() {
    info "Attempting to install Docker..."
    unameOut="$(uname -s)"
    case "$unameOut" in
        Linux*)
            if command -v apt &>/dev/null; then
                sudo apt update && sudo apt install -y docker.io
            elif command -v dnf &>/dev/null; then
                sudo dnf install -y docker
            elif command -v yum &>/dev/null; then
                sudo yum install -y docker
            else
                error "No supported package manager found. Please install Docker manually: https://docs.docker.com/engine/install/"
            fi
            ;;
        Darwin*)
            if command -v brew &>/dev/null; then
                brew install --cask docker
                info "Please open Docker Desktop from Applications and finish setup."
            else
                error "Homebrew not found. Please install Homebrew or download Docker Desktop manually."
                open "https://www.docker.com/products/docker-desktop/"
            fi
            ;;
        MINGW*|MSYS*|CYGWIN*)
            info "Opening Docker Desktop installer download page..."
            start "" "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
            info "Please run the installer and follow the instructions."
            ;;
        *)
            error "Unsupported OS for automatic Docker installation."
            ;;
    esac
    info "Docker installation attempted. Please restart your terminal if you just installed Docker."
}

check_docker() {
    if ! command -v docker &>/dev/null; then
        error "Docker is not installed or not in PATH. Please install Docker first."
        return 1
    fi
    
    # Check if Docker is running
    if ! docker version &>/dev/null; then
        error "Docker is not running. Please start Docker and try again."
        return 1
    fi
    
    return 0
}

start_docker() {
    info "Starting Docker..."
    unameOut="$(uname -s)"
    case "$unameOut" in
        Linux*)
            if command -v systemctl &>/dev/null; then
                sudo systemctl start docker
                info "Docker service started."
            else
                error "Could not start Docker service. Please start it manually."
            fi
            ;;
        Darwin*)
            open -a "Docker"
            info "Docker Desktop is starting. Please wait 30-60 seconds for it to fully start."
            ;;
        MINGW*|MSYS*|CYGWIN*)
            start "" "Docker Desktop"
            info "Docker Desktop is starting. Please wait 30-60 seconds for it to fully start."
            ;;
        *)
            error "Unsupported OS for automatic Docker startup."
            ;;
    esac
}

# Helper Functions
show_menu() {
    clear
    echo -e "${CYAN}================================================================${NC}"
    echo -e "${CYAN}               Tauri Workflow Docker Build System                  ${NC}"
    echo -e "${CYAN}================================================================${NC}"
    echo ""
    echo -e "${YELLOW}Current Settings:${NC}"
    echo -e "${GRAY}  Native Architecture: $ARCH${NC}"
    echo -e "${GRAY}  Default Docker Image: $IMAGE_FULL${NC}"
    echo -e "${GRAY}  Logs Directory: $LOGS_DIR${NC}"
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
    echo -e "${GREEN}Docker Management:${NC}"
    echo " 16) Install Docker"
    echo " 17) Start Docker"
    echo ""
    echo -e "${GREEN}Logs & Information:${NC}"
    echo " 18) Show recent log files"
    echo ""
    echo -e "${RED}  Q) Quit${NC}"
    echo ""
    echo -e "${GRAY}----------------------------------------------------------------${NC}"
    echo -e "${GRAY}📝 All operations are automatically logged to the logs/ folder${NC}"
}

build_docker_image() {
    local arch=${1:-$ARCH}
    local clean=${2:-false}
    local platform
    local image_tag
    
    start_logging "build-image-$arch"
    write_log "Starting Docker image build for architecture: $arch" "INFO"
    write_log "Clean build: $clean" "INFO"
    
    case "$arch" in
        x86_64)
            platform="linux/amd64"
            image_tag="${IMAGE_TAG}-x86_64"
            ;;
        arm64)
            platform="linux/arm64"
            image_tag="${IMAGE_TAG}-arm64"
            # Ensure QEMU binfmt handlers are installed (idempotent)
            if [[ "$arch" == "arm64" && "$(uname -m)" != "aarch64" ]]; then
                info "Ensuring QEMU binfmt handlers are installed (once-off)…"
                run_logged_command "Register binfmt handlers" docker run --privileged --rm tonistiigi/binfmt --install all || true
            fi
            ;;
        *)
            error "Invalid architecture: $arch"
            write_log "Invalid architecture: $arch" "ERROR"
            stop_logging "FAILED"
            return 1
            ;;
    esac
    
    info "\n🐳 Building Docker image for $arch: ${IMAGE_BASE}:${image_tag}"
    write_log "Target image: ${IMAGE_BASE}:${image_tag}" "INFO"
    write_log "Platform: $platform" "INFO"
    
    cd "$PROJECT_ROOT"
    
    local build_args=(
        "docker" "build"
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
        write_log "Using --no-cache flag" "INFO"
    fi
    
    # Add quiet flag if needed
    if [[ "$QUIET" == "true" ]]; then
        build_args+=("--quiet")
        write_log "Using --quiet flag" "INFO"
    fi
    
    build_args+=(".")
    
    write_log "Build arguments: ${build_args[*]}" "INFO"
    
    if run_logged_command "Building Docker image" "${build_args[@]}"; then
        success "✅ Docker image built successfully for $arch!"
        write_log "Docker build completed successfully" "SUCCESS"
        
        # Tag native architecture as default
        if [[ "$arch" == "$ARCH" ]]; then
            if run_logged_command "Tagging as default image" docker tag "${IMAGE_BASE}:${image_tag}" "$IMAGE_DEFAULT"; then
                info "Tagged as default: $IMAGE_DEFAULT"
                write_log "Tagged as default image: $IMAGE_DEFAULT" "SUCCESS"
            fi
        fi
        
        # Verify image
        info "\nVerifying image architecture..."
        run_logged_command "Verifying image architecture" docker image inspect "${IMAGE_BASE}:${image_tag}" --format "Architecture: {{.Architecture}}, OS: {{.Os}}"
        
        stop_logging "COMPLETED"
    else
        error "Docker build failed for $arch"
        write_log "Docker build failed" "ERROR"
        stop_logging "FAILED"
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
    
    echo -e "\n${YELLOW}Available Tauri Workflow images:${NC}"
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
    
    start_logging "build-tauri-$arch"
    write_log "Starting Tauri build for architecture: $arch" "INFO"
    write_log "Using Docker image: $docker_image" "INFO"
    
    # Check if image exists
    info "Checking if Docker image exists..."
    if ! run_logged_command "Checking if Docker image exists" docker image inspect "$docker_image"; then
        error "Docker image $docker_image not found. Please build it first."
        write_log "Docker image not found: $docker_image" "ERROR"
        stop_logging "FAILED"
        return 1
    fi
    
    info "\n🔨 Building Tauri app for $arch in Docker..."
    write_log "Starting Tauri application build" "INFO"
    
    # Prepare Docker command
    local docker_cmd=(
        "docker" "run" "--rm"
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
    
    docker_cmd+=("$build_script")
    
    write_log "Docker command: ${docker_cmd[*]}" "INFO"
    write_log "Build script: $build_script" "INFO"
    
    if run_logged_command "Building Tauri application in Docker" "${docker_cmd[@]}"; then
        success "✅ Build completed for $arch"
        write_log "Tauri build completed successfully" "SUCCESS"
        
        # Fix permissions on Linux (files created by Docker may be owned by root)
        if [[ "$(uname)" == "Linux" ]]; then
            info "Fixing file permissions..."
            write_log "Fixing file permissions" "INFO"
            if sudo chown -R "$(id -u):$(id -g)" "$SRC_TAURI_DIR/target" "$PROJECT_ROOT/node_modules" 2>/dev/null; then
                write_log "File permissions fixed successfully" "SUCCESS"
            else
                write_log "Failed to fix file permissions (non-critical)" "WARNING"
            fi
        fi
        
        stop_logging "COMPLETED"
    else
        error "Build failed for $arch"
        write_log "Tauri build failed" "ERROR"
        stop_logging "FAILED"
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
    start_logging "build-tauri-native"
    write_log "Starting native Tauri build" "INFO"
    
    info "\n🔨 Building Tauri app on native host machine..."
    
    cd "$PROJECT_ROOT"
    
    # Check prerequisites
    if ! command -v npm &> /dev/null; then
        error "npm not found. Please install Node.js first."
        write_log "npm command not found" "ERROR"
        stop_logging "FAILED"
        return 1
    fi
    write_log "npm command found" "INFO"
    
    if ! command -v cargo &> /dev/null; then
        error "cargo not found. Please install Rust first."
        write_log "cargo command not found" "ERROR"
        stop_logging "FAILED"
        return 1
    fi
    write_log "cargo command found" "INFO"
    
    info "📦 Installing dependencies..."
    write_log "Starting npm ci" "INFO"
    
    if run_logged_command "Installing npm dependencies" npm ci; then
        write_log "npm ci completed successfully" "SUCCESS"
        
        info "🚀 Building Tauri application..."
        write_log "Starting Tauri build" "INFO"
        
        if run_logged_command "Building Tauri application" npm run tauri build; then
            success "✅ Native build completed successfully!"
            write_log "Tauri build completed successfully" "SUCCESS"
            
            # Show build artifacts
            echo -e "\n${YELLOW}Build artifacts:${NC}"
            write_log "Listing build artifacts" "INFO"
            
            local artifacts_found=false
            while IFS= read -r -d '' artifact; do
                echo "  $artifact"
                write_log "Artifact: $artifact" "INFO"
                artifacts_found=true
            done < <(find "$SRC_TAURI_DIR/target/release/bundle" -type f \( -name "*.deb" -o -name "*.AppImage" -o -name "*.dmg" -o -name "*.app" -o -name "*.exe" -o -name "*.msi" \) -print0 2>/dev/null | sort -z)
            
            if [[ "$artifacts_found" == "false" ]]; then
                write_log "No build artifacts found" "WARNING"
            fi
            
            stop_logging "COMPLETED"
        else
            error "Tauri build failed"
            write_log "Tauri build failed" "ERROR"
            stop_logging "FAILED"
            return 1
        fi
    else
        error "npm install failed"
        write_log "npm ci failed" "ERROR"
        stop_logging "FAILED"
        return 1
    fi
}

build_all() {
    start_logging "build-all"
    write_log "Starting comprehensive build (native + Docker)" "INFO"
    
    info "\n🚀 Building Tauri Workflow on all platforms..."
    
    # Build on native host
    echo -e "\n${CYAN}━━━ Native Host Build ━━━${NC}"
    write_log "Starting native host build" "INFO"
    if ! build_tauri_native; then
        write_log "Native build failed" "ERROR"
        stop_logging "FAILED"
        return 1
    fi
    
    # Build in Docker
    echo -e "\n${CYAN}━━━ Docker Builds ━━━${NC}"
    write_log "Starting Docker builds" "INFO"
    if ! build_tauri_both; then
        write_log "Docker builds failed" "ERROR"
        stop_logging "FAILED"
        return 1
    fi
    
    success "\n✅ All builds completed!"
    write_log "All builds completed successfully" "SUCCESS"
    stop_logging "COMPLETED"
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
            warning "Removing Tauri Workflow Docker images..."
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

show_recent_logs() {
    local count=${1:-10}
    
    info "\nRecent log files (last $count):"
    
    if [[ -d "$LOGS_DIR" ]]; then
        local log_files
        mapfile -t log_files < <(find "$LOGS_DIR" -name "*.log" -type f -printf '%T@ %p\n' | sort -nr | head -n "$count" | cut -d' ' -f2-)
        
        if [[ ${#log_files[@]} -eq 0 ]]; then
            warning "No log files found in $LOGS_DIR"
            return
        fi
        
        for log_file in "${log_files[@]}"; do
            local size=$(du -h "$log_file" 2>/dev/null | cut -f1)
            local timestamp=$(stat -c '%y' "$log_file" 2>/dev/null | cut -d'.' -f1)
            echo -e "  ${GRAY}$(basename "$log_file") (${size}) - $timestamp${NC}"
        done
        
        echo ""
        info "To view a log file: cat logs/<filename>"
        info "To open logs folder: cd logs && ls -la"
    else
        warning "Logs directory not found: $LOGS_DIR"
    fi
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
        show-logs)
            show_recent_logs
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
        1) check_docker && build_docker_image "$ARCH" ;;
        2) check_docker && build_docker_both "false" ;;
        3) check_docker && build_docker_image "$ARCH" "true" ;;
        4) check_docker && check_docker_images ;;
        5) check_docker && build_tauri_docker "x86_64" ;;
        6) check_docker && build_tauri_docker "arm64" ;;
        7) check_docker && build_tauri_both ;;
        8) check_docker && build_tauri_native ;;
        9) check_docker && build_all ;;
        10) check_docker && run_docker_interactive "$ARCH" ;;
        11)
            check_docker && {
                echo -e "\n${YELLOW}Select architecture:${NC}"
                echo "  1) x86_64"
                echo "  2) ARM64"
                read -p "Choice: " arch_choice
                case "$arch_choice" in
                    1) run_docker_interactive "x86_64" ;;
                    2) run_docker_interactive "arm64" ;;
                    *) warning "Invalid choice" ;;
                esac
            }
            ;;
        12)
            check_docker && {
                read -p "Enter Docker image name (or press Enter for default): " custom_image
                if [[ -z "$custom_image" ]]; then
                    custom_image="$IMAGE_FULL"
                fi
                run_docker_interactive "$ARCH" "$custom_image"
            }
            ;;
        13) check_docker && clean_build_artifacts ;;
        14) check_docker && clean_build_artifacts "true" ;;
        15) check_docker && show_disk_usage ;;
        16) install_docker ;;
        17) start_docker ;;
        18) show_recent_logs ;;
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