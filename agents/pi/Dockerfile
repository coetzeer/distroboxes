FROM ghcr.io/coetzeer/arch-base:main

# Install Node.js and pi
USER root
RUN pacman -Syu --noconfirm nodejs npm && \
    npm install -g @earendil-works/pi-coding-agent

# Switch to the default user
USER agent
WORKDIR /home/agent

# Install pi plugins
RUN pi install npm:pi-lsp-adapter && \
    pi install npm:pi-web-access && \
    pi install npm:pi-mcp-adapter

# Set a default command to run when the container starts
CMD ["/bin/bash"]
