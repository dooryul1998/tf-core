locals {
  org       = "tf-core"
  project   = "lab01"
  namespace = "${local.org}-${local.project}"

  message = "Hello World from ${local.namespace}"
}