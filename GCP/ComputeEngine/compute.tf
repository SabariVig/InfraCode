resource "google_compute_instance" "instance" {
    name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk{
      initialize_params{
          image="debian-cloud/debian-9"
      }
  }
  network_interface{
      network="default"
  }
}

