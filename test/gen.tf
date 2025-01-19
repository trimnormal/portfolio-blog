# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "arn:aws:acm:us-east-1:953170553831:certificate/27a7f071-b1eb-4c79-9017-11b9f189270b"
resource "aws_acm_certificate" "cert" {
  certificate_authority_arn = null
  certificate_body          = null
  certificate_chain         = null
  domain_name               = "zacharycorbishley.com"
  early_renewal_duration    = null
  key_algorithm             = "RSA_2048"
  private_key               = null # sensitive
  subject_alternative_names = ["*.zacharycorbishley.com", "zacharycorbishley.com"]
  tags                      = {}
  tags_all                  = {}
  validation_method         = "DNS"
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}
