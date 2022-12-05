resource "aws_s3_bucket" "alpha" {
  bucket = "s3_proj_alpha"
  
  versioning {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      bucket_key_enabled = true
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
  }}}
}

resource "aws_s3_bucket_public_access_block" "alpha-s3" {
   bucket= aws_s3_bucket.alpha.id

   block_public_acls       = true
   block_public_policy     = true
   ignore_public_acls      = true
   restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "alpha" {

  bucket = aws_s3_bucket.alpha.id
  policy = data.aws_iam_policy_document.deny_insecure_transport_alpha.json
}

resource "aws_s3_bucket" "beta" {
  bucket = "s3_proj_beta"
  
  versioning {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      bucket_key_enabled = true
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
  }}}
}

resource "aws_s3_bucket_public_access_block" "beta-s3" {
   bucket= aws_s3_bucket.alpha.id

   block_public_acls       = true
   block_public_policy     = true
   ignore_public_acls      = true
   restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "beta" {

  bucket = aws_s3_bucket.beta.id
  policy = data.aws_iam_policy_document.deny_insecure_transport_beta.json
}
