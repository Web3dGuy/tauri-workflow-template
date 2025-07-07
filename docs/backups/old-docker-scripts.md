docker-menu.ps1:

#!/usr/bin/env pwsh
# KVMA Portal Docker Build Menu - PowerShell Version
# Comprehensive build and development environment management

[CmdletBinding()]
param(
    [Parameter(Position=0)]
    [string]$Command = "",
    
    [Parameter(Position=1)]
    [string]$CommandArg = "",
    
    [switch]$Help,
    [switch]$h,
    [switch]$Quiet,
    [switch]$q,
    [switch]$Yes,
    [switch]$y,
    [switch]$NoCache,
    [string]$Arch = "",
    [string]$Image = ""
)

$ErrorActionPreference = "Stop"

# Global variables
$Global:Quiet = $Quiet -or $q
$Global:AutoYes = $Yes -or $y
$Global:UseNoCache = $NoCache
$Global:CustomImage = $Image
$Global:ForceArch = $Arch

# Color output functions
function Write-Success { 
    if (-not $Global:Quiet) { Write-Host $args -ForegroundColor Green }
}
function Write-Warning { 
    if (-not $Global:Quiet) { Write-Host $args -ForegroundColor Yellow }
}
function Write-Error { 
    Write-Host $args -ForegroundColor Red -ErrorAction Continue
}
function Write-Info { 
    if (-not $Global:Quiet) { Write-Host $args -ForegroundColor Cyan }
}

# Configuration
$PROJECT_ROOT = Split-Path -Parent $PSScriptRoot
$DOCKER_DIR = $PSScriptRoot
$SRC_TAURI_DIR = Join-Path $PROJECT_ROOT "src-tauri"
$IMAGE_BASE = "kvma-portal-builder"
$IMAGE_TAG = "ubuntu-22.04"
$IMAGE_FULL = "${IMAGE_BASE}:${IMAGE_TAG}"

# Platform detection (Windows always uses x86_64 for Linux containers)
$ARCH = if ($Global:ForceArch) { $Global:ForceArch } else { "x86_64" }
$PLATFORM = if ($ARCH -eq "arm64") { "linux/arm64" } else { "linux/amd64" }

# Help function
function Show-Help {
    @"
KVMA Portal Docker Build System

Usage: $(Split-Path -Leaf $PSCommandPath) [OPTIONS] [COMMAND] [ARGS]

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
    -Help, -h               Show this help message
    -Quiet, -q              Suppress non-error output
    -Yes, -y                Auto-confirm prompts
    -NoCache                Build without Docker cache
    -Arch ARCH              Override architecture (x86_64|arm64)
    -Image IMAGE            Use custom Docker image

EXAMPLES:
    .\$(Split-Path -Leaf $PSCommandPath) build-image          # Build native arch image
    .\$(Split-Path -Leaf $PSCommandPath) build-image both     # Build both architectures
    .\$(Split-Path -Leaf $PSCommandPath) build-tauri x86_64   # Build x86_64 Tauri app
    .\$(Split-Path -Leaf $PSCommandPath) run arm64            # Run ARM64 container
    .\$(Split-Path -Leaf $PSCommandPath) clean                # Clean build artifacts
    .\$(Split-Path -Leaf $PSCommandPath) -Arch x86_64 run     # Force x86_64 container

"@
}

# Show help if requested
if ($Help -or $h) {
    Show-Help
    exit 0
}

# Helper Functions
function Show-Menu {
    Clear-Host
    Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║               KVMA Portal Docker Build System                  ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Current Settings:" -ForegroundColor Yellow
    Write-Host "  Architecture: $ARCH" -ForegroundColor Gray
    Write-Host "  Docker Image: $IMAGE_FULL" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Docker Image Operations:" -ForegroundColor Green
    Write-Host "  1) Build Docker image (fresh)" -ForegroundColor White
    Write-Host "  2) Build Docker image (with cache clear)" -ForegroundColor White
    Write-Host "  3) Check Docker image status" -ForegroundColor White
    Write-Host ""
    Write-Host "Tauri Build Operations:" -ForegroundColor Green
    Write-Host "  4) Build Tauri app (x86_64 in Docker)" -ForegroundColor White
    Write-Host "  5) Build Tauri app (ARM64 in Docker) [Requires ARM image]" -ForegroundColor White
    Write-Host "  6) Build Tauri app (Both architectures in Docker)" -ForegroundColor White
    Write-Host "  7) Build Tauri app (Native host machine)" -ForegroundColor White
    Write-Host "  8) Build ALL (Host + Docker all architectures)" -ForegroundColor White
    Write-Host ""
    Write-Host "Development Operations:" -ForegroundColor Green
    Write-Host "  9) Run interactive Docker shell" -ForegroundColor White
    Write-Host " 10) Run specific Docker image (custom)" -ForegroundColor White
    Write-Host ""
    Write-Host "Maintenance:" -ForegroundColor Green
    Write-Host " 11) Clean build artifacts (target & dist folders)" -ForegroundColor White
    Write-Host " 12) Deep clean (artifacts + Docker images)" -ForegroundColor White
    Write-Host ""
    Write-Host "  Q) Quit" -ForegroundColor Red
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
}

function Build-DockerImage {
    param([bool]$Clean = $false)
    
    Write-Info "`n🐳 Building Docker image: $IMAGE_FULL"
    
    Push-Location $PROJECT_ROOT
    try {
        $buildArgs = @(
            "build",
            "--platform", $PLATFORM,
            "-t", $IMAGE_FULL,
            "-f", "docker/Dockerfile",
            "--build-arg", "BUILDARCH=$ARCH",
            "--build-arg", "UID=1000",
            "--build-arg", "GID=1000"
        )
        
        if ($Clean -or $Global:UseNoCache) {
            $buildArgs += "--no-cache"
            Write-Warning "Building without cache..."
        }
        
        if ($Global:Quiet) {
            $buildArgs += "--quiet"
        }
        
        $buildArgs += "."
        
        & docker $buildArgs
        if ($LASTEXITCODE -ne 0) { throw "Docker build failed" }
        
        Write-Success "✅ Docker image built successfully!"
        
        # Verify image
        Write-Info "`nVerifying image architecture..."
        & docker image inspect $IMAGE_FULL --format "Architecture: {{.Architecture}}, OS: {{.Os}}"
        
    } finally {
        Pop-Location
    }
}

function Check-DockerImage {
    Write-Info "`n🔍 Checking Docker images..."
    
    $images = docker images --filter "reference=$IMAGE_BASE*" --format "table {{.Repository}}:{{.Tag}}`t{{.Size}}`t{{.CreatedAt}}"
    if ($images) {
        Write-Host "`nAvailable images:" -ForegroundColor Yellow
        Write-Host $images
    } else {
        Write-Warning "No KVMA Portal Docker images found"
    }
    
    # Check if default image exists
    $exists = docker image inspect $IMAGE_FULL 2>$null
    if ($?) {
        Write-Success "`n✅ Default image $IMAGE_FULL is available"
    } else {
        Write-Warning "`n⚠️  Default image $IMAGE_FULL not found. Please build it first."
    }
}

function Build-TauriDocker {
    param([string]$Architecture = "x86_64")
    
    $dockerImage = if ($Architecture -eq "arm64") { 
        "${IMAGE_BASE}:ubuntu-22.04-arm64" 
    } else { 
        $IMAGE_FULL 
    }
    
    # Check if image exists
    $imageExists = docker image inspect $dockerImage 2>$null
    if (-not $?) {
        Write-Error "Docker image $dockerImage not found. Please build it first."
        return
    }
    
    Write-Info "`n🔨 Building Tauri app for $Architecture in Docker..."
    
    # Create command for Docker
    $dockerCmd = @(
        "run", "--rm",
        "-v", "${PROJECT_ROOT}:/workspace",
        "-v", "${SRC_TAURI_DIR}/target:/workspace/src-tauri/target",
        "-v", "${PROJECT_ROOT}/node_modules:/workspace/node_modules",
        "-w", "/workspace",
        $dockerImage,
        "bash", "-c"
    )
    
    $buildScript = @"
set -e
echo '📦 Installing dependencies...'
npm ci
echo '🚀 Building Tauri application...'
npm run tauri build
echo '✅ Build completed successfully!'
ls -la src-tauri/target/release/bundle/
"@
    
    $dockerCmd += $buildScript
    
    & docker $dockerCmd
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Build failed for $Architecture"
        return
    }
    
    Write-Success "✅ Build completed for $Architecture"
}

function Build-TauriBoth {
    Write-Info "`n🔨 Building Tauri app for both architectures..."
    
    # Build x86_64
    Build-TauriDocker -Architecture "x86_64"
    
    # Build ARM64 (if image exists)
    $armImage = "${IMAGE_BASE}:ubuntu-22.04-arm64"
    $armExists = docker image inspect $armImage 2>$null
    if ($?) {
        Build-TauriDocker -Architecture "arm64"
    } else {
        Write-Warning "ARM64 image not found. Skipping ARM64 build."
        Write-Info "To build for ARM64, first create the ARM64 Docker image."
    }
}

function Build-TauriNative {
    Write-Info "`n🔨 Building Tauri app on native host machine..."
    
    Push-Location $PROJECT_ROOT
    try {
        # Check if npm is available
        if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
            Write-Error "npm not found. Please install Node.js first."
            return
        }
        
        Write-Info "📦 Installing dependencies..."
        & npm ci
        if ($LASTEXITCODE -ne 0) { throw "npm install failed" }
        
        Write-Info "🚀 Building Tauri application..."
        & npm run tauri build
        if ($LASTEXITCODE -ne 0) { throw "Tauri build failed" }
        
        Write-Success "✅ Native build completed successfully!"
        
        # Show build artifacts
        $bundleDir = Join-Path $SRC_TAURI_DIR "target/release/bundle"
        if (Test-Path $bundleDir) {
            Write-Info "`nBuild artifacts:"
            Get-ChildItem -Path $bundleDir -Recurse -File | Select-Object -ExpandProperty FullName
        }
        
    } finally {
        Pop-Location
    }
}

function Build-All {
    Write-Info "`n🚀 Building KVMA Portal on all platforms..."
    
    # Build on native host
    Write-Host "`n━━━ Native Host Build ━━━" -ForegroundColor Cyan
    Build-TauriNative
    
    # Build in Docker
    Write-Host "`n━━━ Docker Builds ━━━" -ForegroundColor Cyan
    Build-TauriBoth
    
    Write-Success "`n✅ All builds completed!"
}

function Run-DockerInteractive {
    param([string]$CustomImage = "")
    
    $dockerImage = if ($CustomImage) { $CustomImage } else { $IMAGE_FULL }
    
    # Check if image exists
    $imageExists = docker image inspect $dockerImage 2>$null
    if (-not $?) {
        Write-Error "Docker image $dockerImage not found."
        return
    }
    
    Write-Info "`n🐳 Starting interactive Docker container..."
    Write-Info "Image: $dockerImage"
    Write-Info "Mounting project directory..."
    
    $dockerCmd = @(
        "run", "--rm", "-it",
        "-v", "${PROJECT_ROOT}:/workspace",
        "-v", "${SRC_TAURI_DIR}/target:/workspace/src-tauri/target",
        "-v", "${PROJECT_ROOT}/node_modules:/workspace/node_modules",
        "-w", "/workspace",
        $dockerImage,
        "bash"
    )
    
    & docker $dockerCmd
}

function Clean-BuildArtifacts {
    param([bool]$Deep = $false)
    
    Write-Info "`n🧹 Cleaning build artifacts..."
    
    # Clean target directories
    $targetDirs = @(
        (Join-Path $SRC_TAURI_DIR "target"),
        (Join-Path $SRC_TAURI_DIR "target"),
        (Join-Path $PROJECT_ROOT "dist"),
        (Join-Path $SRC_TAURI_DIR "target-x86_64"),
        (Join-Path $SRC_TAURI_DIR "target-arm64")
    )
    
    foreach ($dir in $targetDirs) {
        if (Test-Path $dir) {
            Write-Warning "Removing: $dir"
            Remove-Item -Path $dir -Recurse -Force
        }
    }
    
    # Run cargo clean
    if (Get-Command cargo -ErrorAction SilentlyContinue) {
        Push-Location $SRC_TAURI_DIR
        Write-Info "Running cargo clean..."
        & cargo clean
        Pop-Location
    }
    
    if ($Deep) {
        Write-Info "`n🐳 Cleaning Docker images..."
        $images = docker images --filter "reference=$IMAGE_BASE*" -q
        if ($images) {
            Write-Warning "Removing KVMA Portal Docker images..."
            docker rmi $images -f
        }
        
        Write-Info "Pruning Docker build cache..."
        docker builder prune -f
    }
    
    Write-Success "✅ Cleanup completed!"
}

# Execute command if provided
if ($Command) {
    switch ($Command.ToLower()) {
        "build-image" {
            switch ($(if ($CommandArg) { $CommandArg } else { "native" }).ToLower()) {
                "native" { Build-DockerImage }
                "x86_64" { Build-DockerImage }
                "arm64" { 
                    Write-Warning "ARM64 builds not supported on Windows. Building x86_64 instead."
                    Build-DockerImage
                }
                "both" {
                    Write-Warning "Multi-arch builds not supported on Windows. Building x86_64 only."
                    Build-DockerImage
                }
                default { Write-Error "Invalid architecture: $CommandArg"; exit 1 }
            }
        }
        "build-tauri" {
            switch ($(if ($CommandArg) { $CommandArg } else { "x86_64" }).ToLower()) {
                "native" { Build-TauriDocker -Architecture "x86_64" }
                "x86_64" { Build-TauriDocker -Architecture "x86_64" }
                "arm64" { Build-TauriDocker -Architecture "arm64" }
                "both" { Build-TauriBoth }
                default { Write-Error "Invalid architecture: $CommandArg"; exit 1 }
            }
        }
        "build-native" { Build-TauriNative }
        "build-all" { Build-All }
        "run" {
            if ($Global:CustomImage) {
                Run-DockerInteractive -CustomImage $Global:CustomImage
            } elseif ($CommandArg) {
                switch ($CommandArg.ToLower()) {
                    "x86_64" { Run-DockerInteractive }
                    "arm64" {
                        Write-Warning "ARM64 containers not supported on Windows. Using x86_64."
                        Run-DockerInteractive
                    }
                    default { Run-DockerInteractive -CustomImage $CommandArg }
                }
            } else {
                Run-DockerInteractive
            }
        }
        "clean" { Clean-BuildArtifacts }
        "deep-clean" {
            if (-not $Global:AutoYes) {
                $response = Read-Host "This will remove all Docker images. Continue? (y/N)"
                if ($response -notmatch '^[Yy]$') {
                    Write-Warning "Cancelled"
                    exit 0
                }
            }
            Clean-BuildArtifacts -Deep $true
        }
        "check" { Check-DockerImage }
        "usage" {
            Write-Info "`n📊 Disk Usage Report"
            
            Write-Host "`nBuild Artifacts:" -ForegroundColor Yellow
            @("$SRC_TAURI_DIR\target", "$PROJECT_ROOT\dist", "$PROJECT_ROOT\node_modules") | ForEach-Object {
                if (Test-Path $_) {
                    $size = (Get-ChildItem -Path $_ -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
                    $sizeGB = [math]::Round($size / 1GB, 2)
                    Write-Host "  $_`: ${sizeGB}GB"
                }
            }
            
            Write-Host "`nDocker Images:" -ForegroundColor Yellow
            docker images --filter "reference=$IMAGE_BASE*" --format "table {{.Repository}}:{{.Tag}}`t{{.Size}}"
            
            Write-Host "`nDocker System:" -ForegroundColor Yellow
            docker system df
        }
        "menu" {
            # Fall through to menu
        }
        default {
            Write-Error "Unknown command: $Command"
            Show-Help
            exit 1
        }
    }
    
    # Exit after command execution
    if ($Command -ne "menu") {
        exit 0
    }
}

# Main Menu Loop
while ($true) {
    Show-Menu
    $choice = Read-Host "Select an option"
    
    switch ($choice.ToUpper()) {
        "1" { Build-DockerImage }
        "2" { Build-DockerImage -Clean $true }
        "3" { Check-DockerImage }
        "4" { Build-TauriDocker -Architecture "x86_64" }
        "5" { Build-TauriDocker -Architecture "arm64" }
        "6" { Build-TauriBoth }
        "7" { Build-TauriNative }
        "8" { Build-All }
        "9" { Run-DockerInteractive }
        "10" {
            $customImage = Read-Host "`nEnter Docker image name (or press Enter for default)"
            if (-not $customImage) { $customImage = $IMAGE_FULL }
            Run-DockerInteractive -CustomImage $customImage
        }
        "11" { Clean-BuildArtifacts }
        "12" { Clean-BuildArtifacts -Deep $true }
        "Q" { 
            Write-Success "`nGoodbye!"
            exit 0
        }
        default { Write-Warning "`nInvalid option. Please try again." }
    }
    
    Write-Host "`nPress any key to continue..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

docker-menu.sh:

#!/usr/bin/env bash
# KVMA Portal Docker Build Menu - Bash Version
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
IMAGE_BASE="kvma-portal-builder"
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
KVMA Portal Docker Build System

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
    echo -e "${CYAN}║               KVMA Portal Docker Build System                  ║${NC}"
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
    
    echo -e "\n${YELLOW}Available KVMA Portal images:${NC}"
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
    info "\n🚀 Building KVMA Portal on all platforms..."
    
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
            warning "Removing KVMA Portal Docker images..."
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