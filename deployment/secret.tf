locals {
  secrets_prefix = (var.environment == "dev" ?
    format("${var.project}/${var.environment}/%s", terraform.workspace) :
    "${var.project}/${var.environment}"
  )
}

# Create Secrets in SecretManager
resource "aws_secretsmanager_secret" "secret" {
  name                    = "${local.secrets_prefix}/secrets"
  description             = "D3B Data Transfer Pipeline Secrets"
  recovery_window_in_days = var.environment == "dev" ? 0 : 30 # Force delete for dev
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode(
    {
      "slack_webhook" : "",
      "db_password" : "",
      "dewrangle_token" : "",
    }
  )
}
