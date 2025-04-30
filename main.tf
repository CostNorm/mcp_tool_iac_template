provider "aws" {
  region = var.region
  profile = var.profile
}

data "archive_file" "zip" {
  type = "zip"
  source_dir = "${path.module}/../../../code/"
  output_path = "${path.module}/../../../code/function.zip"
}

resource "aws_lambda_function" "mcp_tool_lambda" {
  function_name = "${var.function_name}"
  role = aws_iam_role.lambda_role.arn
  handler = var.lambda_handler
  runtime = var.lambda_runtime
  timeout = var.lambda_timeout
  memory_size = var.lambda_memory
  architectures = [var.lambda_architecture]
  environment {
    variables = var.environment
  }
  source_code_hash = filebase64sha256("${path.module}/../../../code/function.zip")
  filename = "${path.module}/../../../code/function.zip"

  depends_on = [data.archive_file.zip]
}
