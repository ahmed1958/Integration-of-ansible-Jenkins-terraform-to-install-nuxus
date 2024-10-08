# Use a lightweight base image (e.g., Alpine or Ubuntu)
FROM ubuntu:20.04

# Set environment variables to avoid interaction during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages: Terraform, Git, SSH client, curl, and other dependencies
RUN apt-get update && apt-get install -y \
    git \
    ssh \
    curl \
    unzip \
    gnupg \
    software-properties-common

# Install Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get install -y terraform

# Create a directory for the agent's data (this is where SSH keys will be stored)

# Copy SSH keys from agents_data/.ssh (assuming you'll mount this directory when running the container)
COPY agents_data/.ssh /root/.ssh
COPY agents_data/.aws /root/.aws
# Ensure proper permissions for SSH keys
RUN chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/*

# Configure Git to use SSH for GitHub
RUN git config --global user.name "Ahmed1958" && \
    git config --global user.email "ahmed195069@feng.bu.edu.eg"

# Test SSH connection (optional step to verify the setup)
# RUN ssh -T git@github.com || true

# Set the working directory (optional, adjust to your needs)
WORKDIR /workspace

# Set the entrypoint or default command (optional, adjust as needed)
# ENTRYPOINT ["/bin/bash"]
