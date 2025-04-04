# Infrastructure Setup Guide

## Setting Up a Local Kubernetes Environment with Kind

This guide walks you through setting up a local Kubernetes development environment using Kind (Kubernetes in Docker).

### Prerequisites

- Docker installed and running on your machine
- Homebrew (for macOS users)

### Creating a Kind Cluster

1. Install Kind using Homebrew:
   ```bash
   brew install kind
   ```

2. Verify your Kind installation:
   ```bash
   kind --version
   ```

3. Create a cluster using a custom configuration:
   ```bash
   kind create cluster --config=kind-config.yml
   ```
   *Note: Ensure your kind-config.yml is properly configured for your requirements*

### Working with Container Images

To use local Docker images with your Kind cluster:

1. Build or pull your container image:
   ```bash
   docker build -t image:tag .
   # or
   docker pull image:tag
   ```

2. Load the image into your Kind cluster:
   ```bash
   kind load docker-image image:tag --name your-cluster-name
   ```
   *Note: Replace `image:tag` with your actual image name and tag, and `your-cluster-name` with the name of your Kind cluster*
