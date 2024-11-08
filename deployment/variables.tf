locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "-${terraform.workspace}"
}

variable "project" {
  type        = string
  description = "A project namespace for the infrastructure."
  default     = "d3b-data-transfer-pipeline"
}

variable "environment" {
  type        = string
  description = "An environment namespace for the infrastructure."
}

variable "account" {
  type = string
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "A valid AWS region to configure the underlying AWS SDK."
}

variable "image_version" {
  type        = string
  description = "GitHub Commit"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "batch_root_block_device_size" {
  type    = number
  default = 32
}

variable "batch_root_block_device_type" {
  type    = string
  default = "gp3"
}

variable "batch_spot_fleet_allocation_strategy" {
  type    = string
  default = "SPOT_CAPACITY_OPTIMIZED"
}

variable "batch_spot_fleet_bid_percentage" {
  type    = number
  default = 64
}

variable "batch_min_vcpus" {
  type    = number
  default = 0
}

variable "batch_max_vcpus" {
  type    = number
  default = 256
}

variable "etl_vcpus" {
  type    = number
  default = 1
}

variable "etl_memory" {
  type    = number
  default = 4096
}

variable "batch_instance_types" {
  type    = list(string)
  default = ["c5d", "m5d", "z1d"]
}

variable "image_name" {
  type    = string
  default = "684194535433.dkr.ecr.us-east-1.amazonaws.com/d3b-dff-data-transfer-pipeline"
}

variable "aws_batch_service_role_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

variable "aws_spot_fleet_service_role_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole"
}

variable "aws_ec2_service_role_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

variable "aws_administrator_access_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "vpc_public_subnet_ids" {
  type = list(string)
}

variable "vpc_private_subnet_ids" {
  type = list(string)
}

variable "bastion_public_key" {
  type      = string
  sensitive = true
}

variable "slack_notify_arn" {
  type        = string
  description = "ARN for INFRA to Send Slack Updates"
}
