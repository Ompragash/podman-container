# Use Red Hat Universal Base Image 8 (UBI)
FROM registry.access.redhat.com/ubi8/ubi

# Install necessary dependencies and Podman
RUN yum -y update && \
    yum -y install podman fuse-overlayfs shadow-utils && \
    yum clean all

# Add a non-root user for rootless Podman
RUN useradd -m podmanuser

# Switch to the new user to run Podman in rootless mode
USER podmanuser

# Set up the entrypoint (optional) or leave it blank for later usage
ENTRYPOINT ["/bin/bash"]
