
variable "codecommit_repositories" {
  description = "Map of repository names to their email addresses"
  type        = map(list(string))
}

variable "event_types" {
  description = "Events for which the SNS topic shoul trigger"
  type = list(string)
}

variable "repository_arns" {
  description = "Map of repository names to their ARNs"
  type        = map(string)
}