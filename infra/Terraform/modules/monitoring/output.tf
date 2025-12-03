output "cloudwatch_agent_release" {
  value = helm_release.cloudwatch.name
}
