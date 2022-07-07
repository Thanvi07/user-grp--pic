resource "aws_iam_group" "cloud-watch" {
  name = "cloud_watch_logs_admin"
}

resource "aws_iam_policy_attachment" "cloudwatch-policy" {
  name       = "cloud_watch_logs_admin"
  groups     = [aws_iam_group.cloud-watch.name]
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_user_group_membership" "cloud-watch-gp1" {
  user = aws_iam_user.cloud_watch_logs_admin.name

  groups = [
    aws_iam_group.cloud-watch.name
  ]
}

resource "aws_iam_user" "cloud_watch_logs_admin" {
  name = "cloud_watch_logs_admin"
}