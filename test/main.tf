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