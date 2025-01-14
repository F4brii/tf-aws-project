module "vpc" {
  source = "git::https://github.com/F4brii/terraform-templates.git//vpc?ref=main"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "vpc-example"
  public_subnets = ["10.0.0.0/17", "10.0.128.0/17"]
  private_subnets = []
  tags = var.tags
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "iam_role" {
  source = "git::https://github.com/F4brii/terraform-templates.git//iam_role?ref=main"
  role_name = "iam-role-example"
  Version = "2012-10-17"
  Statement = [
    {
      Action = ["sts:AssumeRole"],
      Effect = "Allow",
      Principal = {
        Service = ["lambda.amazonaws.com"],
        AWS     = []
      }
    }
  ]
  policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
  tags = var.tags
}
