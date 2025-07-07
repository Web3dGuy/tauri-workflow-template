# Ubuntu 22.04 Docker image for Tauri app building
# Matches GitHub Actions workflow for Linux builds

FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set up working directory
WORKDIR /app

# Install system dependencies (matching GitHub workflow)
RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    # Core build tools
    build-essential \
    curl \
    wget \
    git \
    pkg-config \
    # Tauri Linux dependencies (exact match from GitHub workflow)
    libwebkit2gtk-4.1-dev \
    libappindicator3-dev \
    librsvg2-dev \
    patchelf \
    # Additional system dependencies
    ca-certificates \
    gnupg \
    lsb-release \
    sudo \
    && rm -rf /var/lib/apt/lists/*

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