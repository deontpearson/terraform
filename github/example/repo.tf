resource "github_repository" "example" {
  name        = var.name
  description = var.description

  visibility             = var.privacy
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  auto_init              = true
  gitignore_template     = var.gitignore_template
  archive_on_destroy     = true
  archived               = false
  has_downloads          = false
  has_issues             = false
  has_projects           = false
  has_wiki               = false
  is_template            = false
  vulnerability_alerts   = true
  license_template       = "mit"

  template {
    owner      = "deontpearson"
    repository = "repo-template"
  }
}

resource "github_branch" "staging_branch" {
  repository = github_repository.example.name
  branch     = var.staging_branch
  depends_on = [
    github_repository.example,
  ]
}

resource "github_branch_default" "default_branch" {
  repository = github_repository.example.name
  branch     = var.default_branch
  depends_on = [
    github_repository.example,
  ]
}
