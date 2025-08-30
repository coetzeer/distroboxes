FROM docker.io/nixos/nix:latest

# Copy nix configuration files
COPY flake-full.nix /tmp/flake.nix
COPY nix/ /tmp/nix/

# Enable flakes and install packages
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf && \
    cd /tmp && nix develop --impure --command echo "Packages installed"
