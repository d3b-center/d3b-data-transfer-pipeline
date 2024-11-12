#
# Step Functions resources
#
resource "aws_sfn_state_machine" "default" {
  name     = "DataTransferPipeline-${var.environment}${local.workspace_suffix}"
  role_arn = aws_iam_role.step_functions_service_role.arn

  definition = templatefile("step-functions/step_fn.json.tmpl", {
    environment              = var.environment
    account                  = var.account
    batch_job_definition_arn = aws_batch_job_definition.default.arn
    batch_job_queue_arn      = aws_batch_job_queue.default.arn
    schema_prefix            = local.schema_prefix
  })
}

#
# Step Functions IAM resources
#
data "aws_iam_policy_document" "step_functions_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["states.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "step_functions_service_role_policy" {
  statement {
    effect = "Allow"

    actions = [
      "lambda:InvokeFunction",
      "batch:SubmitJob",
      "batch:DescribeJobs",
      "batch:TerminateJobs",
      "states:*"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "events:PutTargets",
      "events:PutRule",
      "events:DescribeRule",
    ]

    resources = [
      "arn:aws:events:${var.region}:${data.aws_caller_identity.current.account_id}:rule/StepFunctionsGetEventsForBatchJobsRule",
    ]
  }
}

resource "aws_iam_role" "step_functions_service_role" {
  name               = "${var.project}-${var.environment}${local.workspace_suffix}-stepfn-role"
  assume_role_policy = data.aws_iam_policy_document.step_functions_assume_role.json
}

resource "aws_iam_role_policy" "step_functions_service_role_policy" {
  name   = "${var.project}-${var.environment}${local.workspace_suffix}-stepfn-policy"
  role   = aws_iam_role.step_functions_service_role.name
  policy = data.aws_iam_policy_document.step_functions_service_role_policy.json
}
