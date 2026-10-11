output "cluster_role_v1s_id" {
  description = "Map of id values across all cluster_role_v1s, keyed the same as var.cluster_role_v1s except keys with no id are omitted"
  value       = { for k, v in kubernetes_cluster_role_v1.cluster_role_v1s : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cluster_role_v1s_aggregation_rule" {
  description = "Map of aggregation_rule values across all cluster_role_v1s, keyed the same as var.cluster_role_v1s except keys with no aggregation_rule are omitted"
  value       = { for k, v in kubernetes_cluster_role_v1.cluster_role_v1s : k => one(v.aggregation_rule) if v.aggregation_rule != null && length(v.aggregation_rule) > 0 }
}
output "cluster_role_v1s_metadata" {
  description = "Map of metadata values across all cluster_role_v1s, keyed the same as var.cluster_role_v1s except keys with no metadata are omitted"
  value       = { for k, v in kubernetes_cluster_role_v1.cluster_role_v1s : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "cluster_role_v1s_rule" {
  description = "Map of rule values across all cluster_role_v1s, keyed the same as var.cluster_role_v1s except keys with no rule are omitted"
  value       = { for k, v in kubernetes_cluster_role_v1.cluster_role_v1s : k => v.rule if v.rule != null && length(v.rule) > 0 }
}

