# SES Email Identity (for email address verification)
resource "aws_ses_email_identity" "sender" {
  count = length(var.ses_verified_emails)
  email = var.ses_verified_emails[count.index]
}

# IAM Policy for SES sending permissions
resource "aws_iam_policy" "ses_send_policy" {
  name        = "${var.project_name}-ses-send-policy"
  description = "Policy for backend to send emails via SES"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ses:SendEmail",
          "ses:SendRawEmail"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach SES policy to backend user
resource "aws_iam_user_policy_attachment" "attach_ses" {
  user       = aws_iam_user.backend_user.name
  policy_arn = aws_iam_policy.ses_send_policy.arn
}