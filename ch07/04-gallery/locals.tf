locals {
  org         = "tf-core"
  project     = "gallery"
  environment = "dev"

  namespace = "${local.org}-${local.project}-${local.environment}"

  infra = {
    lb = {
      listener_port = 80
    }

    instance = {
      service_port   = 8080
      deploy_version = "1.0.1"
    }
  }
}