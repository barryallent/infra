# Infra Setup

This guide helps you set up a local Kubernetes cluster using [Kind](https://kind.sigs.k8s.io/) (Kubernetes IN Docker) and load local Docker images into the cluster.

---

## 📦 Prerequisites

- Docker must be installed and running.
- Homebrew (for macOS users) to install `kind`.

---

## 🚀 Create a Kind Cluster

1. **Install Kind**
   ```bash
   brew install kind
Verify the installation

bash
Copy
Edit
kind --version
Create a Kind cluster using a config file

bash
Copy
Edit
kind create cluster --config=kind-config.yml
📁 Make sure you have a valid kind-config.yml in the same directory.

🐳 Load Docker Image into Kind Cluster
If you've built a local Docker image and want to use it inside your Kind cluster:

bash
Copy
Edit
kind load docker-image <image>:<tag> --name <your-cluster-name>
Example:
bash
Copy
Edit
kind load docker-image my-app:latest --name kind
💡 Replace my-app:latest and kind with your actual image name and the name of your Kind cluster (default is kind).

✅ Verify Everything is Working
List all nodes:

bash
Copy
Edit
kubectl get nodes
List all pods:

bash
Copy
Edit
kubectl get pods -A
🧹 Delete the Cluster (Optional)
To delete the cluster when you're done:

bash
Copy
Edit
kind delete cluster --name <your-cluster-name>
