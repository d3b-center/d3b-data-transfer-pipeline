module "etl_status_notifications" {
  source        = "git@github.com:d3b-infra/aws-slack-notify"
  environment   = var.environment
  project       = "${var.project}-${var.environment}${local.workspace_suffix}-etl-status"
  commit_id     = local.commit_id
  subdirectory  = "sfn-status-notification"
  timeout       = 180
  delete_secret = true
}
