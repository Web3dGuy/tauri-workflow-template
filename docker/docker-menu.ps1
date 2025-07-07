#!/usr/bin/env pwsh
# Tauri Workflow Docker Build Menu - PowerShell Version
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
    [switch]$ShowOutput,
    [switch]$s,
    [switch]$Yes,
    [switch]$y,
    [switch]$NoCache,
    [string]$Arch = "",
    [string]$Image = ""
)

$ErrorActionPreference = "Stop"

# Global variables
$Global:Quiet = $Quiet -or $q
$Global:ShowOutput = $ShowOutput -or $s
$Global:AutoYes = $Yes -or $y
$Global:UseNoCache = $NoCache
$Global:CustomImage = $Image
$Global:ForceArch = $Arch

# Configuration
$PROJECT_ROOT = Split-Path -Parent $PSScriptRoot
$DOCKER_DIR = $PSScriptRoot
$SRC_TAURI_DIR = Join-Path $PROJECT_ROOT "src-tauri"
$IMAGE_BASE = "tauri-workflow-builder"
$IMAGE_TAG = "ubuntu-22.04"

# Platform detection (Windows always uses x86_64 for Linux containers)
$ARCH = if ($Global:ForceArch) { $Global:ForceArch } else { "x86_64" }
$PLATFORM = if ($ARCH -eq "arm64") { "linux/arm64" } else { "linux/amd64" }
$IMAGE_FULL = "${IMAGE_BASE}:${IMAGE_TAG}-${ARCH}"
$IMAGE_DEFAULT = "${IMAGE_BASE}:${IMAGE_TAG}"

# Logging setup
$LOGS_DIR = Join-Path $PROJECT_ROOT "logs"
$LOG_TIMESTAMP = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$Global:CurrentLogFile = ""

# Ensure logs directory exists
if (-not (Test-Path $LOGS_DIR)) {
    New-Item -ItemType Directory -Path $LOGS_DIR -Force | Out-Null
}

# Logging functions
function Start-Logging {
    param([string]$Operation)
    
    $logFileName = "${LOG_TIMESTAMP}_${Operation}.log"
    $Global:CurrentLogFile = Join-Path $LOGS_DIR $logFileName
    
    $header = @"
================================================================
Tauri Workflow Docker Build System - Log
================================================================
Operation: $Operation
Started: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Host: $env:COMPUTERNAME
User: $env:USERNAME
Working Directory: $PWD
================================================================

"@
    
    $header | Out-File -FilePath $Global:CurrentLogFile -Encoding UTF8
    Write-Info "Logging to: $logFileName"
}

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    
    if ($Global:CurrentLogFile) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logEntry = "[$timestamp] [$Level] $Message"
        $logEntry | Out-File -FilePath $Global:CurrentLogFile -Append -Encoding UTF8
    }
}

function Stop-Logging {
    param([string]$Status = "COMPLETED")
    
    if ($Global:CurrentLogFile) {
        $footer = @"

================================================================
Operation ${Status}: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
================================================================
"@
        $footer | Out-File -FilePath $Global:CurrentLogFile -Append -Encoding UTF8
        Write-Info "Log saved: $(Split-Path -Leaf $Global:CurrentLogFile)"
        $Global:CurrentLogFile = ""
    }
}

function Invoke-LoggedCommand {
    param(
        [string]$Command,
        [array]$Arguments = @(),
        [string]$Description = ""
    )
    
    $fullCommand = if ($Arguments.Count -gt 0) { "$Command $($Arguments -join ' ')" } else { $Command }
    
    Write-Log "COMMAND: $fullCommand" "CMD"
    if ($Description) {
        Write-Log "DESCRIPTION: $Description" "INFO"
    }
    
    try {
        # Try using Invoke-Expression for better console output streaming
        # This sometimes bypasses PowerShell's output buffering issues
        
        if ($Arguments.Count -gt 0) {
            $argString = $Arguments -join ' '
            $commandLine = "$Command $argString"
            Write-Log "Executing: $commandLine" "CMD"
        } else {
            $commandLine = $Command
            Write-Log "Executing: $commandLine" "CMD"
        }
        
        # Use Invoke-Expression which can provide better real-time output
        Invoke-Expression $commandLine
        $exitCode = $LASTEXITCODE
        
        Write-Log "Command finished with exit code: $exitCode" "INFO"
        
        if ($null -eq $exitCode) { $exitCode = 0 }
        
        if ($exitCode -eq 0) {
            Write-Log "Command completed successfully (Exit Code: $exitCode)" "SUCCESS"
            return $true
        } else {
            Write-Log "Command failed (Exit Code: $exitCode)" "ERROR"
            return $false
        }
    } catch {
        Write-Log "Command exception: $($_.Exception.Message)" "ERROR"
        Write-ErrorMsg "Failed to execute command: $fullCommand"
        Write-ErrorMsg "Exception: $($_.Exception.Message)"
        return $false
    }
}

# Color output functions
function Write-Success { 
    if (-not $Global:Quiet) { Write-Host $args -ForegroundColor Green }
}
function Write-Warning { 
    if (-not $Global:Quiet) { Write-Host $args -ForegroundColor Yellow }
}
function Write-ErrorMsg { 
    Write-Host $args -ForegroundColor Red
}
function Write-Info { 
    if (-not $Global:Quiet) { Write-Host $args -ForegroundColor Cyan }
}

# Platform detection helpers
$IsWindows = $PSVersionTable.PSPlatform -eq 'Win32NT' -or $env:OS -eq 'Windows_NT'
$IsMacOS = $PSVersionTable.Platform -eq 'Unix' -and (uname) -eq 'Darwin'
$IsLinux = $PSVersionTable.Platform -eq 'Unix' -and (uname) -ne 'Darwin'

function Check-Docker {
    if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
        Write-ErrorMsg "Docker is not installed or not in PATH. Please install Docker first."
        return $false
    }
    
    # Check if Docker is running
    try {
        $null = docker version 2>$null
        if ($LASTEXITCODE -ne 0) {
            Write-Warning "Docker is not running. Please start Docker and try again."
            return $false
        }
    } catch {
        Write-ErrorMsg "Docker is not responding. Please check if Docker is running."
        return $false
    }
    
    return $true
}

function Build-DockerImage {
    param(
        [string]$Architecture = $ARCH,
        [bool]$Clean = $false
    )
    
    Start-Logging "build-image-$Architecture"
    Write-Log "Starting Docker image build for architecture: $Architecture" "INFO"
    Write-Log "Clean build: $Clean" "INFO"
    
    $platform = if ($Architecture -eq "arm64") { "linux/arm64" } else { "linux/amd64" }
    $imageTag = "${IMAGE_TAG}-${Architecture}"
    $dockerImage = "${IMAGE_BASE}:${imageTag}"
    
    Write-Info "Building Docker image for ${Architecture}: $dockerImage"
    Write-Log "Target image: $dockerImage" "INFO"
    Write-Log "Platform: $platform" "INFO"
    
    Push-Location $PROJECT_ROOT
    try {
        # Use ARM64-specific Dockerfile for ARM64 builds
        $dockerFile = if ($Architecture -eq "arm64") { "docker/Dockerfile.arm64" } else { "docker/Dockerfile" }
        
        $buildArgs = @(
            "build",
            "--progress=plain",
            "--platform", $platform,
            "-t", $dockerImage,
            "-f", $dockerFile,
            "--build-arg", "BUILDARCH=$Architecture",
            "--build-arg", "UID=1000",
            "--build-arg", "GID=1000"
        )
        
        # Add architecture-specific build arguments for better compatibility
        if ($Architecture -eq "arm64") {
            $buildArgs += "--build-arg", "TARGETARCH=arm64"
            $buildArgs += "--build-arg", "TARGETOS=linux"
        } else {
            $buildArgs += "--build-arg", "TARGETARCH=amd64"
            $buildArgs += "--build-arg", "TARGETOS=linux"
        }
        
        if ($Clean -or $Global:UseNoCache) {
            $buildArgs += "--no-cache"
            Write-Warning "Building without cache..."
            Write-Log "Using --no-cache flag" "INFO"
        }
        
        if ($Global:Quiet) {
            $buildArgs += "--quiet"
            Write-Log "Using --quiet flag" "INFO"
        }
        
        $buildArgs += "."
        
        Write-Log "Build arguments: $($buildArgs -join ' ')" "INFO"
        
        # Ensure QEMU binfmt handlers are installed for cross-architecture builds on Windows
        if ($Architecture -eq "arm64" -and $IsWindows) {
            Write-Info "Ensuring QEMU binfmt handlers are installed (once-off)…"
            if (-not (Invoke-LoggedCommand -Command "docker" -Arguments @("run","--privileged","--rm","tonistiigi/binfmt","--install","all") -Description "Register binfmt handlers")) {
                Write-Warning "Failed to install QEMU binfmt handlers. ARM64 build may fail."
            }
            
            # Wait a moment for the handlers to be ready
            Start-Sleep -Seconds 2
        }
        
        if (Invoke-LoggedCommand -Command "docker" -Arguments $buildArgs -Description "Building Docker image") {
            Write-Success "Docker image built successfully for $Architecture!"
            Write-Log "Docker build completed successfully" "SUCCESS"
            
            # Tag native architecture as default
            if ($Architecture -eq $ARCH) {
                if (Invoke-LoggedCommand -Command "docker" -Arguments @("tag", $dockerImage, $IMAGE_DEFAULT) -Description "Tagging as default image") {
                    Write-Info "Tagged as default: $IMAGE_DEFAULT"
                    Write-Log "Tagged as default image: $IMAGE_DEFAULT" "SUCCESS"
                }
            }
            
            Stop-Logging "COMPLETED"
        } else {
            Write-ErrorMsg "Docker build failed for $Architecture"
            Write-Log "Docker build failed" "ERROR"
            Stop-Logging "FAILED"
            throw "Docker build failed"
        }
        
    } catch {
        Write-Log "Exception in Build-DockerImage: $($_.Exception.Message)" "ERROR"
        Stop-Logging "FAILED"
        throw
    } finally {
        Pop-Location
    }
}

function Build-TauriDocker {
    param([string]$Architecture = "x86_64")
    
    Start-Logging "build-tauri-$Architecture"
    Write-Log "Starting Tauri build for architecture: $Architecture" "INFO"
    
    $dockerImage = "${IMAGE_BASE}:${IMAGE_TAG}-${Architecture}"
    Write-Log "Using Docker image: $dockerImage" "INFO"
    
    # Check if image exists
    Write-Info "Checking if Docker image exists..."
    if (-not (Invoke-LoggedCommand -Command "docker" -Arguments @("image", "inspect", $dockerImage) -Description "Checking if Docker image exists")) {
        Write-ErrorMsg "Docker image $dockerImage not found. Please build it first."
        Write-Log "Docker image not found: $dockerImage" "ERROR"
        Stop-Logging "FAILED"
        return
    }
    
    Write-Info "Building Tauri app for $Architecture in Docker..."
    Write-Log "Starting Tauri application build" "INFO"
    
    # Create command for Docker with TTY for better output streaming
    $dockerCmd = @(
        "run", "--rm", "-t",
        "-v", "${PROJECT_ROOT}:/workspace",
        "-v", "${SRC_TAURI_DIR}/target:/workspace/src-tauri/target",
        "-v", "${PROJECT_ROOT}/node_modules:/workspace/node_modules",
        "-w", "/workspace",
        $dockerImage,
        "bash", "-c",
        "set -e; echo 'Installing dependencies...'; npm ci; echo 'Building Tauri application...'; npm run tauri build; echo 'Build completed successfully!'"
    )
    
    Write-Log "Docker command: $($dockerCmd -join ' ')" "INFO"
    
    if (Invoke-LoggedCommand -Command "docker" -Arguments $dockerCmd -Description "Building Tauri application in Docker") {
        Write-Success "Build completed for $Architecture"
        Write-Log "Tauri build completed successfully" "SUCCESS"
        Stop-Logging "COMPLETED"
    } else {
        Write-ErrorMsg "Build failed for $Architecture"
        Write-Log "Tauri build failed" "ERROR"
        Stop-Logging "FAILED"
        return
    }
}

function Show-RecentLogs {
    param([int]$Count = 10)
    
    Write-Info "Recent log files (last $Count):"
    
    if (Test-Path $LOGS_DIR) {
        $logFiles = Get-ChildItem -Path $LOGS_DIR -Filter "*.log" | Sort-Object LastWriteTime -Descending | Select-Object -First $Count
        
        if ($logFiles.Count -eq 0) {
            Write-Warning "No log files found in $LOGS_DIR"
            return
        }
        
        $logFiles | ForEach-Object {
            $size = [math]::Round($_.Length / 1KB, 2)
            $timestamp = $_.LastWriteTime.ToString('yyyy-MM-dd HH:mm:ss')
            Write-Host "  $($_.Name) ($size KB) - $timestamp" -ForegroundColor Gray
        }
        
        Write-Host ""
        Write-Info "To view a log file: Get-Content logs\<filename>"
        Write-Info "To open logs folder: explorer logs"
    } else {
        Write-Warning "Logs directory not found: $LOGS_DIR"
    }
}

function Build-TauriNative {
    Start-Logging "build-tauri-native"
    Write-Log "Starting native Tauri build" "INFO"
    
    Write-Info "Building Tauri app on native host machine..."
    
    Push-Location $PROJECT_ROOT
    try {
        # Check if npm is available
        if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
            Write-ErrorMsg "npm not found. Please install Node.js first."
            Write-Log "npm command not found" "ERROR"
            Stop-Logging "FAILED"
            return
        }
        Write-Log "npm command found" "INFO"
        
        # Check if cargo is available
        if (-not (Get-Command cargo -ErrorAction SilentlyContinue)) {
            Write-ErrorMsg "cargo not found. Please install Rust first."
            Write-Log "cargo command not found" "ERROR"
            Stop-Logging "FAILED"
            return
        }
        Write-Log "cargo command found" "INFO"
        
        Write-Info "Installing dependencies..."
        Write-Log "Starting npm ci" "INFO"
        
        if (Invoke-LoggedCommand -Command "npm" -Arguments @("ci") -Description "Installing npm dependencies") {
            Write-Log "npm ci completed successfully" "SUCCESS"
        } else {
            Write-Log "npm ci failed" "ERROR"
            Stop-Logging "FAILED"
            throw "npm install failed"
        }
        
        Write-Info "Building Tauri application..."
        Write-Log "Starting Tauri build" "INFO"
        
        if (Invoke-LoggedCommand -Command "npm" -Arguments @("run", "tauri", "build") -Description "Building Tauri application") {
            Write-Success "Native build completed successfully!"
            Write-Log "Tauri build completed successfully" "SUCCESS"
            
            # Show build artifacts
            $bundleDir = Join-Path $SRC_TAURI_DIR "target/release/bundle"
            if (Test-Path $bundleDir) {
                Write-Info "Build artifacts:"
                Write-Log "Listing build artifacts in: $bundleDir" "INFO"
                
                $artifacts = Get-ChildItem -Path $bundleDir -Recurse -File | Select-Object -ExpandProperty FullName
                $artifacts | ForEach-Object {
                    Write-Host "  $_"
                    Write-Log "Artifact: $_" "INFO"
                }
            }
            
            Stop-Logging "COMPLETED"
        } else {
            Write-Log "Tauri build failed" "ERROR"
            Stop-Logging "FAILED"
            throw "Tauri build failed"
        }
        
    } catch {
        Write-Log "Exception in Build-TauriNative: $($_.Exception.Message)" "ERROR"
        Stop-Logging "FAILED"
        throw
    } finally {
        Pop-Location
    }
}

# ---- Parity utility functions (moved up) ----
function Build-DockerBoth {
    param([bool]$Clean = $false)
    Write-Info "Building Docker images for both architectures..."
    Build-DockerImage -Architecture "x86_64" -Clean $Clean
    Build-DockerImage -Architecture "arm64" -Clean $Clean
    Write-Success "Both Docker images built successfully!"
}

function Build-TauriBoth {
    Write-Info "Building Tauri app for both architectures..."
    Build-TauriDocker -Architecture "x86_64"
    $armImage = "${IMAGE_BASE}:${IMAGE_TAG}-arm64"
    if (docker image inspect $armImage 2>$null) {
        Build-TauriDocker -Architecture "arm64"
    } else {
        Write-Warning "ARM64 Docker image not found. Skipping ARM64 build."
    }
}

function Build-All {
    Start-Logging "build-all"
    Write-Log "Starting comprehensive build (native + Docker)" "INFO"
    try {
        Build-TauriNative
        Build-TauriBoth
        Write-Success "All builds completed!"
        Write-Log "All builds completed successfully" "SUCCESS"
        Stop-Logging "COMPLETED"
    } catch {
        Write-Log "Exception in Build-All: $($_.Exception.Message)" "ERROR"
        Stop-Logging "FAILED"
        throw
    }
}

function Check-DockerImage {
    Write-Info "Checking Docker images..."
    $images = docker images --filter "reference=$IMAGE_BASE*" --format "table {{.Repository}}:{{.Tag}}`t{{.Size}}`t{{.CreatedAt}}"
    if ($images) {
        Write-Host $images
    } else {
        Write-Warning "No Tauri Workflow Docker images found"
    }
}

function Run-DockerInteractive {
    param(
        [string]$Architecture = $ARCH,
        [string]$CustomImage = ""
    )
    $dockerImage = if ($CustomImage) { $CustomImage } else { "${IMAGE_BASE}:${IMAGE_TAG}-${Architecture}" }
    if (-not (docker image inspect $dockerImage 2>$null)) {
        Write-ErrorMsg "Docker image $dockerImage not found."
        return
    }
    Write-Info "Starting interactive Docker container with image $dockerImage..."
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
    Write-Info "Cleaning build artifacts..."
    $dirs = @((Join-Path $SRC_TAURI_DIR "target"), (Join-Path $PROJECT_ROOT "dist"))
    foreach ($d in $dirs) {
        if (Test-Path $d) {
            Write-Warning "Removing $d"
            Remove-Item -Path $d -Recurse -Force
        }
    }
    if (Get-Command cargo -ErrorAction SilentlyContinue) {
        Push-Location $SRC_TAURI_DIR; cargo clean; Pop-Location
    }
    if ($Deep) {
        Write-Info "Removing Docker images..."
        $imgs = docker images --filter "reference=$IMAGE_BASE*" -q
        if ($imgs) { docker rmi $imgs -f }
        docker builder prune -f
    }
    Write-Success "Cleanup complete!"
}

function Show-DiskUsage {
    Write-Info "Disk Usage Report"
    Write-Host "Build Artifacts:" -ForegroundColor Yellow
    @("$SRC_TAURI_DIR\target", "$PROJECT_ROOT\dist", "$PROJECT_ROOT\node_modules") | ForEach-Object {
        if (Test-Path $_) {
            $size = (Get-ChildItem -Path $_ -Recurse -Force | Measure-Object -Property Length -Sum).Sum
            $sizeGB = [math]::Round($size / 1GB, 2)
            Write-Host "  $_`: ${sizeGB}GB"
        }
    }
    Write-Host "Docker Images:" -ForegroundColor Yellow
    docker images --filter "reference=$IMAGE_BASE*" --format "table {{.Repository}}:{{.Tag}}`t{{.Size}}"
    Write-Host "Docker System:" -ForegroundColor Yellow
    docker system df
}

function Install-Docker {
    Write-Info "Attempting to install Docker..."
    if ($IsWindows) {
        Start-Process "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
    } elseif ($IsMacOS) {
        if (Get-Command brew -ErrorAction SilentlyContinue) {
            & brew install --cask docker
        } else {
            Start-Process "https://www.docker.com/products/docker-desktop/"
        }
    } elseif ($IsLinux) {
        if (Get-Command apt -ErrorAction SilentlyContinue) {
            & sudo apt update; & sudo apt install -y docker.io
        } elseif (Get-Command dnf -ErrorAction SilentlyContinue) {
            & sudo dnf install -y docker
        } elseif (Get-Command yum -ErrorAction SilentlyContinue) {
            & sudo yum install -y docker
        } else {
            Start-Process "https://docs.docker.com/engine/install/"
        }
    }
    Write-Info "Docker installation initiated. Restart terminal after completion."
}

function Start-DockerDesktop {
    if ($IsWindows) {
        Start-Process "Docker Desktop" -ErrorAction SilentlyContinue
    } elseif ($IsMacOS) {
        & open -a "Docker"
    } elseif ($IsLinux) {
        & sudo systemctl start docker
    }
    Write-Info "Docker startup command issued."
}
# ---- End parity functions ----

# Help function
function Show-Help {
    @"
Tauri Workflow Docker Build System

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
    show-logs               Show recent log files
    menu                    Show interactive menu (default)

OPTIONS:
    -Help, -h               Show this help message
    -Quiet, -q              Suppress terminal output (logs only)
    -ShowOutput, -s         Show live command output (default)
    -Yes, -y                Auto-confirm prompts
    -NoCache                Build without Docker cache
    -Arch ARCH              Override architecture (x86_64|arm64)
    -Image IMAGE            Use custom Docker image

NOTE:
    Live command output is shown by default. Use -q/-Quiet to suppress.

LOGGING:
    All operations are automatically logged to timestamped files in the logs/ directory.
    Use 'show-logs' command to view recent log files.

EXAMPLES:
    .\$(Split-Path -Leaf $PSCommandPath) build-image          # Build native arch image
    .\$(Split-Path -Leaf $PSCommandPath) build-tauri x86_64   # Build x86_64 Tauri app
    .\$(Split-Path -Leaf $PSCommandPath) build-native         # Build native Tauri app
    .\$(Split-Path -Leaf $PSCommandPath) show-logs            # Show recent logs

"@
}

# Show help if requested
if ($Help -or $h) {
    Show-Help
    exit 0
}

# Execute command if provided
if ($Command) {
    switch ($Command.ToLower()) {
        "build-image" {
            switch ($(if ($CommandArg) { $CommandArg } else { "native" }).ToLower()) {
                "native" { Build-DockerImage -Architecture $ARCH }
                "x86_64" { Build-DockerImage -Architecture "x86_64" }
                "arm64" { 
                    Write-Warning "ARM64 builds on Windows require Docker Desktop with proper QEMU emulation."
                    Write-Warning "If the build fails, try: docker run --privileged --rm tonistiigi/binfmt --install all"
                    Build-DockerImage -Architecture "arm64"
                }
                "both" { Build-DockerBoth }
                default { Write-ErrorMsg "Invalid architecture: $CommandArg"; exit 1 }
            }
        }
        "build-tauri" {
            switch ($(if ($CommandArg) { $CommandArg } else { "x86_64" }).ToLower()) {
                "x86_64" { Build-TauriDocker -Architecture "x86_64" }
                "arm64" { Build-TauriDocker -Architecture "arm64" }
                "both" { Build-TauriBoth }
                default { Write-ErrorMsg "Invalid architecture: $CommandArg"; exit 1 }
            }
        }
        "build-native" { Build-TauriNative }
        "build-all" { Build-All }
        "run" {
            if ($Global:CustomImage) {
                Run-DockerInteractive -CustomImage $Global:CustomImage
            } elseif ($CommandArg) {
                switch ($CommandArg.ToLower()) {
                    "x86_64" { Run-DockerInteractive -Architecture "x86_64" }
                    "arm64"  { Run-DockerInteractive -Architecture "arm64" }
                    default   { Run-DockerInteractive -CustomImage $CommandArg }
                }
            } else {
                Run-DockerInteractive -Architecture $ARCH
            }
        }
        "clean" { Clean-BuildArtifacts }
        "deep-clean" { Clean-BuildArtifacts -Deep $true }
        "check" { Check-DockerImage }
        "usage" { Show-DiskUsage }
        "show-logs" { Show-RecentLogs }
        "menu" {
            # Fall through to menu
        }
        default {
            Write-ErrorMsg "Unknown command: $Command"
            Show-Help
            exit 1
        }
    }
    
    # Exit after command execution
    if ($Command -ne "menu") {
        exit 0
    }
}

# Enhanced Menu
function Show-Menu {
    Clear-Host
    Write-Host "================================================================" -ForegroundColor Cyan
    Write-Host "               Tauri Workflow Docker Build System              " -ForegroundColor Cyan
    Write-Host "================================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Current Settings:" -ForegroundColor Yellow
    Write-Host "  Native Architecture: $ARCH" -ForegroundColor Gray
    Write-Host "  Default Docker Image: $IMAGE_FULL" -ForegroundColor Gray
    Write-Host "  Logs Directory: $LOGS_DIR" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Docker Image Operations:" -ForegroundColor Green
    Write-Host "  1) Build Docker image (native architecture)" -ForegroundColor White
    Write-Host "  2) Build Docker image (both architectures)" -ForegroundColor White
    Write-Host "  3) Build Docker image (with cache clear)" -ForegroundColor White
    Write-Host "  4) Check Docker image status" -ForegroundColor White
    Write-Host ""
    Write-Host "Tauri Build Operations:" -ForegroundColor Green
    Write-Host "  5) Build Tauri app (x86_64 in Docker)" -ForegroundColor White
    Write-Host "  6) Build Tauri app (ARM64 in Docker)" -ForegroundColor White
    Write-Host "  7) Build Tauri app (both architectures in Docker)" -ForegroundColor White
    Write-Host "  8) Build Tauri app (Native host machine)" -ForegroundColor White
    Write-Host "  9) Build ALL (Host + Docker all architectures)" -ForegroundColor White
    Write-Host ""
    Write-Host "Development Operations:" -ForegroundColor Green
    Write-Host " 10) Run interactive Docker shell (native arch)" -ForegroundColor White
    Write-Host " 11) Run interactive Docker shell (select arch)" -ForegroundColor White
    Write-Host " 12) Run specific Docker image (custom)" -ForegroundColor White
    Write-Host ""
    Write-Host "Maintenance:" -ForegroundColor Green
    Write-Host " 13) Clean build artifacts (target & dist folders)" -ForegroundColor White
    Write-Host " 14) Deep clean (artifacts + Docker images)" -ForegroundColor White
    Write-Host " 15) Show disk usage report" -ForegroundColor White
    Write-Host ""
    Write-Host "Docker Management:" -ForegroundColor Green
    Write-Host " 16) Install Docker" -ForegroundColor White
    Write-Host " 17) Start Docker" -ForegroundColor White
    Write-Host ""
    Write-Host "Logs & Information:" -ForegroundColor Green
    Write-Host " 18) Show recent log files" -ForegroundColor White
    Write-Host ""
    Write-Host "  Q) Quit" -ForegroundColor Red
    Write-Host ""
    Write-Host "----------------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "All operations are automatically logged to the logs/ folder" -ForegroundColor DarkGray
}

# Main Menu Loop
while ($true) {
    Show-Menu
    $choice = Read-Host "Select an option"
    switch ($choice.ToUpper()) {
        "1"  { if (Check-Docker) { Build-DockerImage -Architecture $ARCH } }
        "2"  { if (Check-Docker) { Build-DockerBoth } }
        "3"  { if (Check-Docker) { Build-DockerImage -Architecture $ARCH -Clean $true } }
        "4"  { if (Check-Docker) { Check-DockerImage } }
        "5"  { if (Check-Docker) { Build-TauriDocker -Architecture "x86_64" } }
        "6"  { if (Check-Docker) { Build-TauriDocker -Architecture "arm64" } }
        "7"  { if (Check-Docker) { Build-TauriBoth } }
        "8"  { Build-TauriNative }
        "9"  { if (Check-Docker) { Build-All } }
        "10" { if (Check-Docker) { Run-DockerInteractive -Architecture $ARCH } }
        "11" {
            if (Check-Docker) {
                $archChoice = Read-Host "Select architecture (x86_64/arm64):"
                switch ($archChoice.ToLower()) {
                    "x86_64" { Run-DockerInteractive -Architecture "x86_64" }
                    "arm64" { Run-DockerInteractive -Architecture "arm64" }
                    default { Write-Warning "Invalid choice." }
                }
            }
        }
        "12" {
            if (Check-Docker) {
                $custom = Read-Host "Enter Docker image name (or press Enter for default)"
                if (-not $custom) { $custom = $IMAGE_FULL }
                Run-DockerInteractive -CustomImage $custom
            }
        }
        "13" { Clean-BuildArtifacts }
        "14" { Clean-BuildArtifacts -Deep $true }
        "15" { Show-DiskUsage }
        "16" { Install-Docker }
        "17" { Start-DockerDesktop }
        "18" { Show-RecentLogs }
        "Q"  { Write-Success "Goodbye!"; exit 0 }
        default { Write-Warning "Invalid option. Please try again." }
    }
    Write-Host "Press any key to continue..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} 