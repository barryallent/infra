## infra

# Create Kind cluster
1. brew install kind
2. kind --version
3. kind create cluster --config=kind-config.yml

# Load image in kind nodes

kind load docker-image <image>:<tag> --name <your-cluster-name>
