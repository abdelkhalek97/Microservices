resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
  role       = var.node_role_name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "helm_release" "cloudwatch" {
  name             = "cloudwatch"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "aws-cloudwatch-metrics"
  namespace        = "amazon-cloudwatch"
  create_namespace = true

  values = [
    <<EOF
clusterName: ${var.cluster_name}
region: ${var.region}
autoDiscovery:
  enabled: true
EOF
  ]
}
