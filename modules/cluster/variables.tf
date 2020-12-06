variable "cluster_name" {
  type = string
  default = "krisstech"
}

variable "cluster_location" {
  type = string
  default = "us-central1"
}

variable "cluster_master_user" {
  type = string
  default = ""
}

variable "cluster_master_password" {
  type = string
  default = ""
}

variable "node_pool_name" {
  type = string
  default = "krisstech-node-pool"
}

variable "node_pool_location" {
  type = string
  default = "us-central1"
}

variable "node_pool_node_count" {
  type = number
  default = 1
}

variable "node_pool_preemtible" {
  type = bool
  default = true
}

variable "node_pool_machine_type" {
  type = string
  default = "e2-medium"
}