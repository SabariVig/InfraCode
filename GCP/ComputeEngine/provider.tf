provider "google" {
  credentials = file("credentials.json")
  project     = "qwiklabs-gcp-00-296977e78909 "
  region      = "us-central1"
}