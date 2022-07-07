#IAM_GROUP
resource "aws_iam_group" "cognitopoolgroup" {
  name = "cognito_pool_admin"
}

resource "aws_iam_policy_attachment" "cognitopolicy-1" {
  name       = "AmazonCognitoDeveloperAuthenticatedIdentities"
  groups     = [aws_iam_group.cognitopoolgroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoDeveloperAuthenticatedIdentities"
}

resource "aws_iam_policy_attachment" "cognitopolicy-2" {
  name       = "AmazonCognitoReadOnly"
  groups     = [aws_iam_group.cognitopoolgroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoReadOnly"
}

resource "aws_iam_policy_attachment" "cognitopolicy-3" {
  name       = "AmazonCognitoPowerUser"
  groups     = [aws_iam_group.cognitopoolgroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}

#Creating users
resource "aws_iam_user" "user1" {
  name = "cognito_pool_admin"
}

#Adding user to the group
resource "aws_iam_user_group_membership" "useradd1" {
  user = aws_iam_user.user1.name

  groups = [
    aws_iam_group.cognitopoolgroup.name

  ]
}
