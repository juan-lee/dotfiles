FROM ubuntu:24.04

# Install dependencies for Nix
RUN apt-get update && apt-get install -y \
    curl \
    xz-utils \
    git \
    sudo \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Set up locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Create user with sudo privileges
RUN useradd -m -s /bin/bash -G sudo jpang && \
    echo "jpang ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to user
USER jpang
WORKDIR /home/jpang

# Install Nix in single-user mode
RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon

# Source Nix environment
ENV PATH="/home/jpang/.nix-profile/bin:${PATH}"

# Copy the nix configuration
COPY --chown=jpang:jpang . /home/jpang/dotfiles/nix

# Enable flakes
RUN mkdir -p ~/.config/nix && \
    echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# Build the home-manager configuration
WORKDIR /home/jpang/dotfiles/nix
RUN . /home/jpang/.nix-profile/etc/profile.d/nix.sh && \
    nix run home-manager/master -- init && \
    nix run home-manager/master -- switch --flake .#jpang

# Set shell to zsh
CMD ["/home/jpang/.nix-profile/bin/zsh"]