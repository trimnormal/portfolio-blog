resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.bucket_name}"

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

# S3 bucket for redirecting non-www to www.
resource "aws_s3_bucket" "root_bucket" {
  bucket = var.bucket_name

  website {
    redirect_all_requests_to = "https://www.${var.domain_name}"
  }
}

resource "aws_s3_bucket_public_access_block" "www_bucket" {
  bucket = aws_s3_bucket.www_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_public_access_block" "root_bucket" {
  bucket = aws_s3_bucket.root_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_s3_read_www" {
  bucket = var.bucket_name
  policy = data.aws_iam_policy_document.public_access_www.json
}

resource "aws_s3_bucket_policy" "allow_public_s3_read_root" {
  bucket = "www.${var.bucket_name}"
  policy = data.aws_iam_policy_document.public_access_root.json
}

data "aws_iam_policy_document" "public_access_www" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.bucket_name}/*",]
    principals {
      type = "AWS"
      identifiers = ["*"]
    }
  }
}

data "aws_iam_policy_document" "public_access_root" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = ["arn:aws:s3:::www.${var.bucket_name}/*",]
    principals {
      type = "AWS"
      identifiers = ["*"]
    }
  }
}