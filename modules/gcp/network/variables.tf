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

variable "gcp_region" {
  type = "string"
}

variable "cidr_block" {
  type = "string"
}

variable "external_vpc_id" {
  type = "string"
}

variable "external_master_subnets" {
  type = "list"
}

variable "external_worker_subnets" {
  type = "list"
}

variable "managed_zone_name" {
  type = "string"
}

variable "cluster_name" {
  type = "string"
}

variable "base_domain" {
  type = "string"
}

variable "master_instance_group" {
  type = "list"
}
