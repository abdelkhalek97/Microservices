# AWS EKS Flask Microservice with Argo CD & GitHub Actions

## 📌 Prerequisites

Before you start, make sure you have:

-   **Terraform ≥ 1.5**
-   **AWS CLI** configured with valid credentials
-   **kubectl ≥ 1.27**
-   **Helm ≥ 3.x**
-   **Docker** for building images
-   **GitHub repository** with Actions enabled
-   **AWS account** with permissions for EKS, IAM, and CloudWatch

## ⚙️ Setup & Deployment

### 1. Provision Infrastructure

```bash 
terraform init
terraform apply
```

This creates:

-   VPC, subnets, and security groups
-   EKS cluster (\`eks-pwc-python\`)
-   IAM roles for cluster and nodes
-   CloudWatch Observability add-on

### 2. Configure Local kubectl

```bash 
aws eks update-kubeconfig --region us-west-2 --name eks-pwc-python 
```

### 3. Install Argo CD

```bash 
cd ../../
./argo_install.sh
```

### 4. Deploy Flask App via Helm

```bash 
kubectl apply -f helm/applications/flask-app.yaml -n argocd
```

## 🔄 CI/CD Workflow

GitHub Actions pipeline performs:

-   Builds and pushes Docker images to AWS ECR
-   Updates Helm release
-   Triggers Argo CD sync into EKS

Triggers on changes to:

-   \`flask-app/\*\*\`
-   \`Dockerfile\`
-   Workflow YAML files

## 📊 Monitoring & Observability

Using **AWS CloudWatch Observability Add-on**, you get:

-   Cluster metrics (CPU, memory, disk, network)
-   Node metrics
-   Pod-level metrics
-   Namespace/workload metrics
-   Optional OpenTelemetry metrics

Dashboards: - CloudWatch → Container Insights

Logs: - CloudWatch Logs → `/aws/containerinsights/eks-pwc-python/`
