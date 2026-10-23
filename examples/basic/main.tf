module "boilerplate_basic" {
  source = "../.."

  namespace = var.namespace

  labels = {
    environment = "dev"
    example     = "basic"
  }
}
