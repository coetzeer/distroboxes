# Start with a base Arch Linux image.
FROM ghcr.io/coetzeer/arch-base:main

# Now, install any other packages you want using yay.
# This assumes the user `archuser` is configured to use yay.
# The `sudo` is required because `yay` often needs elevated privileges for `pacman` operations.
# You can use `yay --noconfirm -S` for automated installations.
RUN yay -S --noconfirm \
    openoffice-bin apr-util java-environment gstreamer0.10-base mesa mime-types nss

# Clean up package cache to keep the image small.
# This needs to be run with root privileges.
USER root
RUN pacman -Scc --noconfirm
RUN rm -fr /home/archuser/.cache

# Set a default command to run when the container starts
CMD ["/bin/bash"]
