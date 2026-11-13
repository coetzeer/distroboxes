FROM ghcr.io/coetzeer/arch-base:main

# Install Node.js and pi-gsd
USER root
RUN pacman -Syu --noconfirm nodejs npm && \
    npm install -g @opengsd/gsd-pi

# Install pi-gsd plugins into the agent home. This runs as root so gsd can
# repair its internal package links under the root-owned global npm prefix,
# then ownership of the agent home is handed back to the agent user.
RUN HOME=/home/agent gsd install npm:pi-lsp-adapter && \
    HOME=/home/agent gsd install npm:pi-web-access && \
    HOME=/home/agent gsd install npm:pi-mcp-adapter && \
    chown -R agent:agent /home/agent

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
