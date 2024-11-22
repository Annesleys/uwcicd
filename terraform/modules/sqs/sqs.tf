resource "aws_sqs_queue" "sqs" {
  name                      = var.queue_name
  delay_seconds             = 10  # Delay message visibility for 10 seconds
  max_message_size          = 262144  # 256 KB max message size
  message_retention_seconds = 86400  # Retain messages for 1 day
  visibility_timeout_seconds = 30  # Time to make message invisible to other consumers
  fifo_queue                = var.fifo_queue # Set to true for FIFO queue
  kms_master_key_id         = "alias/aws/sqs"  # Use AWS-managed key for encryption

}
