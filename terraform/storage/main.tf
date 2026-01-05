resource "aws_s3_bucket" "rag_knowledge_assets" {
  bucket = "rag-knowledge-assets-${var.environment}"
  force_destroy = var.environment != "production" && var.environment != "staging"

  tags = {
    Name = "rag-knowledge-assets-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.rag_knowledge_assets.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
