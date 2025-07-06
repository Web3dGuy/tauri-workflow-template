#!/usr/bin/env pwsh
# Tauri Workflow Template Docker Build Menu - PowerShell Version
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
$IMAGE_BASE = "twt-builder"
$IMAGE_TAG = "ubuntu-22.04"
$IMAGE_FULL = "${IMAGE_BASE}:${IMAGE_TAG}"

# Platform detection (Windows always uses x86_64 for Linux containers)
$ARCH = if ($Global:ForceArch) { $Global:ForceArch } else { "x86_64" }
$PLATFORM = if ($ARCH -eq "arm64") { "linux/arm64" } else { "linux/amd64" }

# Help function
function Show-Help {
    @"
Tauri Workflow Template Docker Build System

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
    Write-Host "║               Tauri Workflow Template Docker Build System                  ║" -ForegroundColor Cyan
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
        Write-Warning "No Tauri Workflow Template Docker images found"
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
    Write-Info "`n🚀 Building Tauri Workflow Template on all platforms..."
    
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
            Write-Warning "Removing Tauri Workflow Template Docker images..."
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