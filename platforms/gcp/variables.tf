/*
Copyright 2017 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

variable "tectonic_gcp_config_version" {
  description = <<EOF
This declares the version of the GCP configuration variables.
It has no impact on generated assets but declares the version contract of the configuration.
EOF

  default = "1.0"
}

variable "tectonic_gcp_ext_google_managedzone_name" {
  # not to be confused with tectonic_base_domain (the DNS compliant domain name)
  type        = "string"
  description = "GCP resource name of Cloud DNS ManagedZone - created outside of Tectonic"
}

variable "tectonic_gcp_region" {
  type        = "string"
  description = "The GCP region to use. Some regions only have 2 zones."
}

variable "tectonic_gcp_zones" {
  type        = "list"
  description = "List of two or more zones to use from specified GCP region."
}

variable "tectonic_gcp_vpc_cidr_block" {
  type    = "string"
  default = "10.0.0.0/16"

  description = <<EOF
Block of IP addresses used by the VPC.
This should not overlap with any other networks, such as a private datacenter connected via Cloud Interconnect.
EOF
}

variable "tectonic_gcp_external_vpc_id" {
  type = "string"

  description = <<EOF
(optional) ID of an existing VPC to launch nodes into.
If unset a new VPC is created.

Example: `vpc-123456`
EOF

  default = ""
}

variable "tectonic_gcp_private_access" {
  default = true

  description = <<EOF
(optional) If set to true, VMs on a subnetwork to reach Google APIs and services using an internal IP address rather than an external IP address.
If set to false, only virtual machine (VM) instances with external IP addresses can access Google APIs.
EOF
}

variable "tectonic_gcp_external_master_subnet_ids" {
  type = "list"

  description = <<EOF
(optional) List of subnet IDs within an existing VPC to deploy master nodes into.
Required to use an existing VPC and the list must match the AZ count.

Example: `["subnet-111111", "subnet-222222", "subnet-333333"]`
EOF

  default = []
}

variable "tectonic_gcp_external_worker_subnet_ids" {
  type = "list"

  description = <<EOF
(optional) List of subnet IDs within an existing VPC to deploy worker nodes into.
Required to use an existing VPC and the list must match the AZ count.

Example: `["subnet-111111", "subnet-222222", "subnet-333333"]`
EOF

  default = []
}

variable "tectonic_gcp_master_gce_type" {
  type        = "string"
  description = "Instance size for the master node(s). Example: `n1-standard-2`."
  default     = "n1-standard-2"
}

variable "tectonic_gcp_master_disktype" {
  type        = "string"
  default     = "pd-standard"
  description = "The type of disk (pd-standard or pd-ssd) for the master nodes."
}

variable "tectonic_gcp_master_disk_size" {
  type        = "string"
  default     = "30"
  description = "The size of the disk in gigabytes for the root block device of master nodes."
}

variable "tectonic_gcp_worker_gce_type" {
  type        = "string"
  description = "Instance size for the worker node(s). Example: `n1-standard-2`."
  default     = "n1-standard-2"
}

variable "tectonic_gcp_worker_disktype" {
  type        = "string"
  default     = "pd-standard"
  description = "The type of disk (pd-standard or pd-ssd) for the worker nodes."
}

variable "tectonic_gcp_worker_disk_size" {
  type        = "string"
  default     = "30"
  description = "The size of the disk in gigabytes for the root block device of worker nodes."
}

variable "tectonic_gcp_etcd_gce_type" {
  type        = "string"
  description = "Instance size for the etcd node(s). Example: `n1-standard-2`."
  default     = "n1-standard-2"
}

variable "tectonic_gcp_etcd_disktype" {
  type        = "string"
  default     = "pd-standard"
  description = "The type of disk (pd-standard or pd-ssd) for the etcd nodes."
}

variable "tectonic_gcp_etcd_disk_size" {
  type        = "string"
  default     = "30"
  description = "The size of the disk in gigabytes for the root block device of etcd nodes."
}
