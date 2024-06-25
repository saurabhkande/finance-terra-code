output "codecommit_repository_urls" {
  value = { for repo in aws_codecommit_repository.repositories : repo.repository_name => repo.clone_url_http }
}

output "repository_arns" {
  value = { for repo in aws_codecommit_repository.repositories : repo.repository_name => repo.arn }
}