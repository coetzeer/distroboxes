FROM ghcr.io/coetzeer/arch-base:main

# Install Node.js and pi-gsd
USER root
RUN pacman -S --noconfirm nodejs npm && \
    npm install -g @opengsd/gsd-pi

# Switch to the default user
USER agent
WORKDIR /home/agent

# Install pi-gsd plugins
RUN gsd install npm:pi-lsp-adapter && \
    gsd install npm:pi-web-access && \
    gsd install npm:pi-mcp-adapter

# Set a default command to run when the container starts
CMD ["/bin/bash"]
