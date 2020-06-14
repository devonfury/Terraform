provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "chapter3_state" {
    bucket = "chapter3-state"
    lifecycle {
        prevent_destroy = true
    }
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-up-and-running-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
}

terraform {
    backend "s3" {
        bucket = "chapter3-state"
        key = "global/s3/terraform.tfstate"
        region = "us-east-2"
        dynamodb_table = "terraform-up-and-running-locks"
        encrypt = true
    }
}