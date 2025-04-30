resource "aws_iam_role" "lambda_role" {
  name = "${var.prefix}-agent-tool-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  count = var.attach_ec2_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  count = var.attach_s3_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "pricing_policy_attachment" {
  count = var.attach_pricing_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSPriceListServiceFullAccess"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_policy_attachment" {
  count = var.attach_cloudwatch_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

resource "aws_iam_role_policy_attachment" "iam_policy_attachment" {
  count = var.attach_iam_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_role_policy_attachment" "cloudfront_policy_attachment" {
  count = var.attach_cloudfront_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
}

resource "aws_iam_role_policy_attachment" "vpc_policy_attachment" {
  count = var.attach_vpc_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_role_policy_attachment" "rds_policy_attachment" {
  count = var.attach_rds_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  count = var.attach_lambda_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
}

resource "aws_iam_role_policy_attachment" "ssm_policy_attachment" {
  count = var.attach_ssm_policy ? 1 : 0
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}



















