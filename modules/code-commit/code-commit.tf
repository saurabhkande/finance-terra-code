resource "aws_codecommit_repository" "repositories" {
  for_each       = var.codecommit_repositories
  repository_name = "${each.key}"
  description     = "CodeCommit repository for ${each.key}"
}