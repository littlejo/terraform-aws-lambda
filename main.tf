locals {
  iam_role_name         = var.iam_role_name == "" ? local.name.iam : var.iam_role_name
  cloudwatch_event_name = var.cloudwatch_event_name == "" ? local.name.evtbrdg : var.cloudwatch_event_name

  name = {
    iam     = replace(var.function_name, "lamda-", "iamrol-")
    evtbrdg = replace(var.function_name, "lamda-", "evtbrdg-")
  }
}

data "archive_file" "this" {
  type                    = "zip"
  source_content          = var.source_content
  source_content_filename = var.source_content_filename
  output_path             = "${path.module}/lambda.zip"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "cloud_watch_logs" {
  statement {
    actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["*"] #tfsec:ignore:aws-iam-no-policy-wildcards
  }
}

resource "aws_iam_role" "this" {
  name               = local.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  inline_policy {
    name   = "CloudWatchLog"
    policy = data.aws_iam_policy_document.cloud_watch_logs.json
  }

  inline_policy {
    name   = var.inline_policy_name
    policy = var.policy
  }
}

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.this.output_path
  function_name    = var.function_name
  description      = var.description
  role             = aws_iam_role.this.arn
  handler          = var.handler
  source_code_hash = data.archive_file.this.output_base64sha256
  timeout          = var.timeout
  tracing_config {
    mode = "Active"
  }

  runtime = var.runtime
}

resource "aws_cloudwatch_event_rule" "this" {
  count               = var.create_cloudwatch_event ? 1 : 0
  name                = local.cloudwatch_event_name
  description         = var.cloudwatch_event_description
  schedule_expression = var.cloudwatch_event_schedule_expression
  event_pattern       = var.cloudwatch_event_event_pattern
  is_enabled          = var.cloudwatch_event_is_enabled
}

resource "aws_cloudwatch_event_target" "this" {
  count     = var.create_cloudwatch_event ? 1 : 0
  target_id = var.cloudwatch_event_target_id
  arn       = aws_lambda_function.this.arn
  rule      = aws_cloudwatch_event_rule.this[0].id
}

resource "aws_lambda_permission" "allow_cloudevent_lambda" {
  count         = var.create_cloudwatch_event ? 1 : 0
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this[0].arn
}
