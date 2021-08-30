resource "github_repository" "repo" {
  name        = var.name
  description = var.description

  visibility             = var.privacy
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  auto_init              = true
  gitignore_template     = var.gitignore_template
  license_template       = "mit"
}

resource "github_branch" "staging" {
  repository = github_repository.repo.name
  branch     = var.staging_branch
}

resource "github_branch_default" "default" {
  repository = github_repository.repo.name
  branch     = var.default_branch
}
