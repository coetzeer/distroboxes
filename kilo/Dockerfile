FROM ghcr.io/coetzeer/distroboxes/arch-base:main

# Install kiloCode
RUN brew install kilo 2>/dev/null || true

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
