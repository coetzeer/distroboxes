FROM ghcr.io/coetzeer/arch-base:main

# Install Node.js and Freebuff
USER root
RUN pacman -Syu --noconfirm nodejs npm && \
    npm install -g freebuff

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
