# https://registry.terraform.io/providers/integrations/github/latest/docs
provider "github" {
  token = var.github_token
  owner = "deontpearson"
}

module "example" {
  source      = "./example"
  name        = "example"
  description = "An example repo"
}
