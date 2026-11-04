FROM ghcr.io/coetzeer/arch-base:main

# Install goose
RUN brew install goose 2>/dev/null || true

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
