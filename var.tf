variable "region" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "https_port" {
  type = number
}

variable "eks_cluster_name" {
  type = string
}

variable "node_group_name" {
  type = string
}

variable "master_eks_role" {
  type = string
}

variable "worker_eks_role" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "desire_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "ami_type" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "service_port" {
  type = number
}

variable "service_type" {
  type = string
}

variable "force_update_version" {
  type = bool
}

variable "capacity_type" {
  type = string
}

variable "endpoint_private_access" {
  type = bool
}

variable "endpoint_public_access" {
  type = bool
}
