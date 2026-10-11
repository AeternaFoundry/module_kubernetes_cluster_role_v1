variable "cluster_role_v1s" {
  description = <<EOT
Map of cluster_role_v1s, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
Optional:
    - aggregation_rule (block):
        - cluster_role_selectors (optional, block):
            - match_expressions (optional, block):
                - key (optional)
                - operator (optional)
                - values (optional)
            - match_labels (optional)
    - rule (block):
        - api_groups (optional)
        - non_resource_urls (optional)
        - resource_names (optional)
        - resources (optional)
        - verbs (required)
EOT

  type = map(object({
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
    })
    aggregation_rule = optional(object({
      cluster_role_selectors = optional(list(object({
        match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })))
        match_labels = optional(map(string))
      })))
    }))
    rule = optional(list(object({
      api_groups        = optional(list(string))
      non_resource_urls = optional(list(string))
      resource_names    = optional(list(string))
      resources         = optional(list(string))
      verbs             = list(string)
    })))
  }))
}

