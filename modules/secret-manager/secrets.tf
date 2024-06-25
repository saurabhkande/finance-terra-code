resource "random_password" "choal_random_secrets" {
  length       = 16
  special      = false
  min_upper    = 1
}

resource "aws_secretsmanager_secret" "chola-secrets" {

  name                     = var.Secret_name
  recovery_window_in_days  = 0
}

  resource "aws_secretsmanager_secret_version" "chola_secret_version" {

  secret_id     = aws_secretsmanager_secret.chola-secrets.id
  secret_string = random_password.choal_random_secrets.result
}
