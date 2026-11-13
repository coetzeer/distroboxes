FROM ghcr.io/coetzeer/arch-base:main

# Install claude
RUN brew install claude 2>/dev/null || true

# Install Node.js and claude ACP adapter
USER root
RUN pacman -Syu --noconfirm nodejs npm && \
    npm install -g @agentclientprotocol/claude-agent-acp

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
