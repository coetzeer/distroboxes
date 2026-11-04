FROM ghcr.io/coetzeer/arch-base:main

# Install claude
RUN brew install claude 2>/dev/null || true && \
    npm install -g @agentclientprotocol/claude-agent-acp

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
