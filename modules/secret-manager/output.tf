output "secret_string" {
  value = aws_secretsmanager_secret_version.chola_secret_version.secret_string
}