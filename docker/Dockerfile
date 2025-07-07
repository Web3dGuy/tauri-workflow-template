# Ubuntu 22.04 Docker image for Tauri app building
# Matches GitHub Actions workflow for Linux builds

# Use different base image for ARM64 to avoid libc-bin issues
ARG TARGETARCH
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set up working directory
WORKDIR /app

# ARM64-specific workaround for Windows Docker Desktop emulation issues
RUN if [ "$TARGETARCH" = "arm64" ]; then \
        # For ARM64, use a more conservative approach to avoid libc-bin crashes
        apt-get update -y && \
        apt-get install -y --no-install-recommends \
            curl wget ca-certificates gnupg lsb-release && \
        apt-get install -y --no-install-recommends \
            build-essential git pkg-config && \
        apt-get install -y --no-install-recommends \
            libwebkit2gtk-4.1-dev \
            file \
            libxdo-dev \
            libssl-dev \
            libayatana-appindicator3-dev \
            librsvg2-dev \
            patchelf \
            sudo && \
        rm -rf /var/lib/apt/lists/* && \
        dpkg --configure -a; \
    else \
        # For x86_64, use the standard approach
        apt-get update -y && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
            build-essential curl wget git pkg-config \
            libwebkit2gtk-4.1-dev \
            file \
            libxdo-dev \
            libssl-dev \
            libayatana-appindicator3-dev \
            librsvg2-dev \
            patchelf \
            ca-certificates gnupg lsb-release sudo && \
        rm -rf /var/lib/apt/lists/*; \
    fi

# Install Node.js 20 (matching GitHub workflow)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Create non-root user for building with dynamic UID/GID
ARG USER_ID=1000
ARG GROUP_ID=1000
RUN EXISTING_GROUP=$(getent group ${GROUP_ID} | cut -d: -f1) \
    && if [ -n "$EXISTING_GROUP" ]; then \
        echo "Using existing group: $EXISTING_GROUP (GID: ${GROUP_ID})"; \
        useradd -m -s /bin/bash -u ${USER_ID} -g ${GROUP_ID} builder; \
    else \
        groupadd -g ${GROUP_ID} builder; \
        useradd -m -s /bin/bash -u ${USER_ID} -g ${GROUP_ID} builder; \
    fi \
    && usermod -aG sudo builder \
    && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy package files for dependency installation
COPY package*.json ./

# Install npm dependencies (matching GitHub workflow)
RUN npm ci --ignore-scripts

# Set up working directory with proper permissions
RUN mkdir -p /home/builder/app && chown -R ${USER_ID}:${GROUP_ID} /home/builder/app

# Switch to builder user for Rust installation
USER builder
WORKDIR /home/builder

# Install Rust as builder user (matching GitHub workflow - stable toolchain)
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && . $HOME/.cargo/env \
    && rustc --version

# Add Rust to PATH for builder user
ENV PATH="/home/builder/.cargo/bin:${PATH}"

# Set working directory
WORKDIR /home/builder/app

# Default command
CMD ["bash"]