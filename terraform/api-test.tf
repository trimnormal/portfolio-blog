import {
  to = aws_lambda_function.test_lambda
  id = "hello-world"
}

import {
  to = aws_iam_role.hello_world
  id = "hello-world-role-8jne9vej"
}

import {
  to = aws_apigatewayv2_api.example
  id = "6bteve33xi"
}

import {
  to = aws_apigatewayv2_api_mapping.example
  id = "t2c3j0/api.zacharycorbishley.com"
}

import {
  to = aws_apigatewayv2_deployment.example
  id = "6bteve33xi/0hucor"
}
#lot of these from auto ^

import {
  to = aws_apigatewayv2_domain_name.example
  id = "api.zacharycorbishley.com"
}

import {
  to = aws_apigatewayv2_integration.example
  id = "6bteve33xi/bls65ba"
}

import {
  to = aws_apigatewayv2_route.example
  id = "6bteve33xi/shlj9s6"
}

import {
  to = aws_apigatewayv2_stage.example
  id = "6bteve33xi/$default"
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "6bteve33xi/0hucor"
resource "aws_apigatewayv2_deployment" "example" {
  api_id      = "6bteve33xi"
  description = "Automatic deployment triggered by changes to the Api configuration"
  triggers    = null
}

# __generated__ by Terraform from "t2c3j0/api.zacharycorbishley.com"
resource "aws_apigatewayv2_api_mapping" "example" {
  api_id          = "6bteve33xi"
  api_mapping_key = null
  domain_name     = "api.zacharycorbishley.com"
  stage           = "$default"
}

# __generated__ by Terraform from "6bteve33xi"
resource "aws_apigatewayv2_api" "example" {
  api_key_selection_expression = "$request.header.x-api-key"
  body                         = null
  credentials_arn              = null
  description                  = null
  disable_execute_api_endpoint = false
  fail_on_warnings             = null
  name                         = "api.zacharycorbishley.com"
  protocol_type                = "HTTP"
  route_key                    = null
  route_selection_expression   = "$request.method $request.path"
  tags                         = {}
  tags_all                     = {}
  target                       = null
  version                      = null
  cors_configuration {
    allow_credentials = false
    allow_headers     = ["*"]
    allow_methods     = ["*"]
    allow_origins     = ["*"]
    expose_headers    = ["*"]
    max_age           = 0
  }
}

# __generated__ by Terraform from "api.zacharycorbishley.com"
resource "aws_apigatewayv2_domain_name" "example" {
  domain_name = "api.zacharycorbishley.com"
  tags        = {}
  tags_all    = {}
  domain_name_configuration {
    certificate_arn                        = "arn:aws:acm:us-east-1:953170553831:certificate/cc4e6330-397f-4c77-a556-ab3fec6d5ae4"
    endpoint_type                          = "REGIONAL"
    ownership_verification_certificate_arn = null
    security_policy                        = "TLS_1_2"
  }
}

# __generated__ by Terraform
resource "aws_apigatewayv2_integration" "example" {
  api_id                        = "6bteve33xi"
  connection_id                 = null
  connection_type               = "INTERNET"
  content_handling_strategy     = null
  credentials_arn               = null
  description                   = null
  integration_method            = "POST"
  integration_subtype           = null
  integration_type              = "AWS_PROXY"
  integration_uri               = "arn:aws:lambda:us-east-1:953170553831:function:hello-world"
  passthrough_behavior          = null
  payload_format_version        = "2.0"
  request_parameters            = {}
  request_templates             = {}
  template_selection_expression = null
  timeout_milliseconds          = 30000
}

# __generated__ by Terraform from "6bteve33xi/shlj9s6"
resource "aws_apigatewayv2_route" "example" {
  api_id                              = "6bteve33xi"
  api_key_required                    = false
  authorization_scopes                = []
  authorization_type                  = "NONE"
  authorizer_id                       = null
  model_selection_expression          = null
  operation_name                      = null
  request_models                      = {}
  route_key                           = "ANY /hello-world"
  route_response_selection_expression = null
  target                              = "integrations/bls65ba"
}

# __generated__ by Terraform from "hello-world-role-8jne9vej"
resource "aws_iam_role" "hello_world" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "hello-world-role-8jne9vej"
  name_prefix           = null
  path                  = "/service-role/"
  permissions_boundary  = null
  tags                  = {}
  tags_all              = {}
}

# __generated__ by Terraform
resource "aws_lambda_function" "test_lambda" {
  architectures                      = ["x86_64"]
  code_signing_config_arn            = null
  description                        = null
  filename                           = "./hello-world/lambda.zip"
  function_name                      = "hello-world"
  handler                            = "hello-world.lambda_handler"
  image_uri                          = null
  kms_key_arn                        = null
  layers                             = []
  memory_size                        = 128
  package_type                       = "Zip"
  publish                            = null
  replace_security_groups_on_destroy = null
  replacement_security_group_ids     = null
  reserved_concurrent_executions     = -1
  role                               = "arn:aws:iam::953170553831:role/service-role/hello-world-role-8jne9vej"
  runtime                            = "python3.13"
  s3_bucket                          = null
  s3_key                             = null
  s3_object_version                  = null
  skip_destroy                       = false
  source_code_hash                   = null
  tags                               = {}
  tags_all                           = {}
  timeout                            = 3
  ephemeral_storage {
    size = 512
  }
  logging_config {
    application_log_level = null
    log_format            = "Text"
    log_group             = "/aws/lambda/hello-world"
    system_log_level      = null
  }
  tracing_config {
    mode = "PassThrough"
  }
}

# __generated__ by Terraform from "6bteve33xi/$default"
resource "aws_apigatewayv2_stage" "example" {
  api_id                = "6bteve33xi"
  auto_deploy           = true
  client_certificate_id = null
  deployment_id         = "0hucor"
  description           = null
  name                  = "$default"
  stage_variables       = {}
  tags                  = {}
  tags_all              = {}
  default_route_settings {
    data_trace_enabled       = false
    detailed_metrics_enabled = false
    logging_level            = null
    throttling_burst_limit   = 0
    throttling_rate_limit    = 0
  }
}
