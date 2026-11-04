FROM ghcr.io/coetzeer/arch-base:main

# Install codex
RUN brew install codex 2>/dev/null || true && \
    npm install -g @agentclientprotocol/codex-acp

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
