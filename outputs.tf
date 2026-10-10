output "globalaccelerator_listeners_id" {
  description = "Map of id values across all globalaccelerator_listeners, keyed the same as var.globalaccelerator_listeners"
  value       = { for k, v in aws_globalaccelerator_listener.globalaccelerator_listeners : k => v.id if v.id != null && length(v.id) > 0 }
}
output "globalaccelerator_listeners_accelerator_arn" {
  description = "Map of accelerator_arn values across all globalaccelerator_listeners, keyed the same as var.globalaccelerator_listeners"
  value       = { for k, v in aws_globalaccelerator_listener.globalaccelerator_listeners : k => v.accelerator_arn if v.accelerator_arn != null && length(v.accelerator_arn) > 0 }
}
output "globalaccelerator_listeners_arn" {
  description = "Map of arn values across all globalaccelerator_listeners, keyed the same as var.globalaccelerator_listeners"
  value       = { for k, v in aws_globalaccelerator_listener.globalaccelerator_listeners : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "globalaccelerator_listeners_client_affinity" {
  description = "Map of client_affinity values across all globalaccelerator_listeners, keyed the same as var.globalaccelerator_listeners"
  value       = { for k, v in aws_globalaccelerator_listener.globalaccelerator_listeners : k => v.client_affinity if v.client_affinity != null && length(v.client_affinity) > 0 }
}
output "globalaccelerator_listeners_port_range" {
  description = "Map of port_range values across all globalaccelerator_listeners, keyed the same as var.globalaccelerator_listeners"
  value       = { for k, v in aws_globalaccelerator_listener.globalaccelerator_listeners : k => v.port_range if v.port_range != null && length(v.port_range) > 0 }
}
output "globalaccelerator_listeners_protocol" {
  description = "Map of protocol values across all globalaccelerator_listeners, keyed the same as var.globalaccelerator_listeners"
  value       = { for k, v in aws_globalaccelerator_listener.globalaccelerator_listeners : k => v.protocol if v.protocol != null && length(v.protocol) > 0 }
}

