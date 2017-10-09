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

## A single GCP network
resource "google_compute_network" "tectonic-network" {
  name                    = "tectonic-network"
  auto_create_subnetworks = "false"
}

## Two subnetworks (masters, workers)
resource "google_compute_subnetwork" "tectonic-master-subnet" {
  name                     = "tectonic-master-subnet"
  ip_cidr_range            = "${var.master_ip_cidr_range}"
  network                  = "${google_compute_network.tectonic-network.self_link}"
  region                   = "${var.gcp_region}"
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "tectonic-worker-subnet" {
  name                     = "tectonic-worker-subnet"
  ip_cidr_range            = "${var.worker_ip_cidr_range}"
  network                  = "${google_compute_network.tectonic-network.self_link}"
  region                   = "${var.gcp_region}"
  private_ip_google_access = true
}
