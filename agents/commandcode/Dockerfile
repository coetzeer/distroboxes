FROM ghcr.io/coetzeer/arch-base:main

# Install commandcode from the coetzeestroom tap
RUN brew tap coetzeestroom/homebrew-command-code 2>/dev/null || true && \
    brew install command-code 2>/dev/null || true

# Switch to the default user
USER agent
WORKDIR /home/agent

# Set a default command to run when the container starts
CMD ["/bin/bash"]
