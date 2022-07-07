resource "aws_iam_group" "amplifygroup" {
  name = "amplify_access"
}

resource "aws_iam_policy_attachment" "amplify-attach1" {
  name       = "AdministratorAccess-Amplify"
  groups     = [aws_iam_group.amplifygroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-Amplify"
}

resource "aws_iam_user_group_membership" "amplify-group1" {
  user = aws_iam_user.sharad.name

  groups = [
    aws_iam_group.amplifygroup.name
  ]
}

resource "aws_iam_user_group_membership" "amplify-group2" {
  user = aws_iam_user.harminder.name

  groups = [
    aws_iam_group.amplifygroup.name,
    aws_iam_group.databasegroup.name
  ]
}

resource "aws_iam_user" "sharad" {
  name = "sharad"
}

resource "aws_iam_user_policy_attachment" "sharad-policy" {
#   name  = "AmazonPollyFullAccess"
  user = aws_iam_user.sharad.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPollyFullAccess"
}

resource "aws_iam_user" "harminder" {
  name = "harminder"
}



