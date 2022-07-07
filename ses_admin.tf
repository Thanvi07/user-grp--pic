resource "aws_iam_group" "emailservice" {
  name = "ses_user"
}

resource "aws_iam_policy_attachment" "emailservice-policy" {
  name       = "amazonses-fullacces"
  groups     = [aws_iam_group.emailservice.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}

resource "aws_iam_user_group_membership" "emailservice-gp1" {
  user = aws_iam_user.ses_user.name

  groups = [
    aws_iam_group.emailservice.name
  ]
}

resource "aws_iam_user" "ses_user" {
  name = "ses_user"
}