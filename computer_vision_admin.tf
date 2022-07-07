#IAM_GROUP
resource "aws_iam_group" "computervisiongroup" {
  name = "computer_vision_admin"
}

resource "aws_iam_policy_attachment" "computervisionpolicy-1" {
  name       = "AmazonRekognitionReadOnlyAccess"
  groups     = [aws_iam_group.computervisiongroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRekognitionReadOnlyAccess"
}

resource "aws_iam_policy_attachment" "computervisionpolicy-2" {
  name       = "AmazonRekognitionFullAccess"
  groups     = [aws_iam_group.computervisiongroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRekognitionFullAccess"
}

resource "aws_iam_policy_attachment" "computervisionpolicy-3" {
  name       = "AmazonRekognitionServiceRole"
  groups     = [aws_iam_group.computervisiongroup.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRekognitionServiceRole"
}

resource "aws_iam_policy_attachment" "computervisionpolicy-4" {
  name       = "AmazonRekognitionCustomLabelsFullAccess"
  groups     = [aws_iam_group.computervisiongroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRekognitionCustomLabelsFullAccess"
}

#Creating users
resource "aws_iam_user" "computervisionuser" {
  name = "computer_vision_admin"
}

#Adding user to the group
resource "aws_iam_user_group_membership" "computervisionuseradd" {
  user = aws_iam_user.computervisionuser.name

  groups = [
    aws_iam_group.computervisiongroup.name

  ]
}