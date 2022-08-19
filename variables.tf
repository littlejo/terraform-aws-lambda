variable "source_content" {
  description = "Content file of the lambda"
  type        = string
}

variable "source_content_filename" {
  description = "filename of source content"
  type        = string
}

variable "iam_role_name" {
  description = "Iam role name"
  default     = ""
  type        = string
}

variable "inline_policy_name" {
  description = "Inline Policy Name"
  default     = "lambda_policy"
  type        = string
}

variable "policy" {
  description = "Policy of the lambda"
  type        = string
}

variable "function_name" {
  description = "Function name of the lambda"
  type        = string
}

variable "description" {
  description = "description of the lambda"
  type        = string
  default     = null
}

variable "handler" {
  description = "Function entrypoint in your code"
  type        = string
}

variable "timeout" {
  description = "timeout of lambda function"
  type        = number
  default     = 3
}

variable "runtime" {
  description = "Runtime of lambda function, eg: python3.8"
  type        = string
}

variable "create_cloudwatch_event" {
  description = "If you want to create a cloud watch event"
  type        = bool
  default     = true
}

variable "cloudwatch_event_name" {
  description = "Name of cloud watch event_name"
  type        = string
  default     = ""
}

variable "cloudwatch_event_description" {
  description = "Name of cloud watch event_name"
  type        = string
  default     = "Launch a lambda"
}

variable "cloudwatch_event_schedule_expression" {
  description = "Cron expression of schedule"
  type        = string
  default     = null
}

variable "cloudwatch_event_event_pattern" {
  description = "Event pattern for schedule (json)"
  type        = string
  default     = null
}

variable "cloudwatch_event_is_enabled" {
  description = "If you want to disable your cloudwatch event"
  type        = bool
  default     = true
}

variable "cloudwatch_event_target_id" {
  description = "Target id of cloudwatch event"
  type        = string
  default     = null
}
