variable "codecommit_repositories" {
  description = "Map of repository names to their email addresses"
  type        = map(list(string))
}

variable "repository_approval_pools" {
  description = "Map of repository names to their approval pool members"
  type        = map(list(string))
}