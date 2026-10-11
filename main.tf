resource "kubernetes_cluster_role_v1" "cluster_role_v1s" {
  for_each = var.cluster_role_v1s


  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
  }

  dynamic "aggregation_rule" {
    for_each = each.value.aggregation_rule != null ? [each.value.aggregation_rule] : []
    content {
      dynamic "cluster_role_selectors" {
        for_each = aggregation_rule.value.cluster_role_selectors != null ? aggregation_rule.value.cluster_role_selectors : []
        content {
          dynamic "match_expressions" {
            for_each = cluster_role_selectors.value.match_expressions != null ? cluster_role_selectors.value.match_expressions : []
            content {
              key      = match_expressions.value.key
              operator = match_expressions.value.operator
              values   = match_expressions.value.values
            }
          }
          match_labels = cluster_role_selectors.value.match_labels
        }
      }
    }
  }

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      api_groups        = rule.value.api_groups
      non_resource_urls = rule.value.non_resource_urls
      resource_names    = rule.value.resource_names
      resources         = rule.value.resources
      verbs             = rule.value.verbs
    }
  }
}

