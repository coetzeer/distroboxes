FROM ghcr.io/coetzeer/distroboxes/arch-base:main

# Install Node.js and Freebuff
RUN brew install node && \
    npm install -g freebuff

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
