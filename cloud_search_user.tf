resource "aws_iam_group" "cloud-search" {
  name = "cloud_search_user"
}

resource "aws_iam_policy_attachment" "cloudsearch-policy" {
  name       = "cloudsearch_fullaccess"
  groups     = [aws_iam_group.cloud-search.name]
  policy_arn = "arn:aws:iam::aws:policy/CloudSearchFullAccess"
}

resource "aws_iam_user_group_membership" "cloud-search-gp1" {
  user = aws_iam_user.cloud_search_user.name

  groups = [
    aws_iam_group.cloud-search.name
  ]
}

resource "aws_iam_user" "cloud_search_user" {
  name = "cloud_search_user"
}