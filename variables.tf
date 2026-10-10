variable "globalaccelerator_listeners" {
  description = <<EOT
Map of globalaccelerator_listeners, attributes below
Required:
    - accelerator_arn
    - protocol
    - port_range (block):
        - from_port (optional)
        - to_port (optional)
Optional:
    - client_affinity
EOT

  type = map(object({
    accelerator_arn = string
    protocol        = string
    client_affinity = optional(string)
    port_range = list(object({
      from_port = optional(number)
      to_port   = optional(number)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.globalaccelerator_listeners : (
        length(v.port_range) >= 1 && length(v.port_range) <= 10
      )
    ])
    error_message = "Each port_range list must contain between 1 and 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.globalaccelerator_listeners : (
        alltrue([for item in v.port_range : (item.from_port == null || (item.from_port >= 1 && item.from_port <= 65535))])
      )
    ])
    error_message = "must be a valid port number (1-65535)"
  }
  validation {
    condition = alltrue([
      for k, v in var.globalaccelerator_listeners : (
        alltrue([for item in v.port_range : (item.to_port == null || (item.to_port >= 1 && item.to_port <= 65535))])
      )
    ])
    error_message = "must be a valid port number (1-65535)"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

