#
# Batch IAM resources
#
data "aws_iam_policy_document" "batch_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["batch.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "batch_service_role" {
  name               = "${var.project}-${var.environment}${local.workspace_suffix}-batch-service-role"
  assume_role_policy = data.aws_iam_policy_document.batch_assume_role.json

}

resource "aws_iam_role_policy_attachment" "batch_service_role_policy" {
  role       = aws_iam_role.batch_service_role.name
  policy_arn = var.aws_batch_service_role_policy_arn
}

#
# Spot Fleet IAM resources
#
data "aws_iam_policy_document" "spot_fleet_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["spotfleet.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "spot_fleet_service_role" {
  name               = "${var.project}-${var.environment}${local.workspace_suffix}-fleet-service-role"
  assume_role_policy = data.aws_iam_policy_document.spot_fleet_assume_role.json

}

resource "aws_iam_role_policy_attachment" "spot_fleet_service_role_policy" {
  role       = aws_iam_role.spot_fleet_service_role.name
  policy_arn = var.aws_spot_fleet_service_role_policy_arn
}

#
# EC2 IAM resources
#
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com", "ecs-tasks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

#
# ECS IAM Resources
#

data "aws_iam_policy_document" "role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_instance_role" {
  name               = "${var.project}-${var.environment}${local.workspace_suffix}-instance-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

}

resource "aws_iam_instance_profile" "ecs_instance_role" {
  name = aws_iam_role.ecs_instance_role.name
  role = aws_iam_role.ecs_instance_role.name

}

#Attaching policy to view secrets for ecs task

data "aws_iam_policy_document" "secrets_service_role_policy" {
  statement {
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      aws_secretsmanager_secret.secret.id,
    ]
  }
}

resource "aws_iam_role_policy" "secrets_ecs_service_role_policy" {
  name   = "${var.project}-${var.environment}${local.workspace_suffix}-secrets-policy"
  role   = aws_iam_role.ecs_instance_role.name
  policy = data.aws_iam_policy_document.secrets_service_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ec2_service_role_policy" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = var.aws_ec2_service_role_policy_arn
}
