resource "aws_iam_group" "databasegroup" {
  name = "dynamodb_user"
}

resource "aws_iam_policy_attachment" "databasegroup-policy" {
  name       = "DynamoDB_FullAccesswith_DataPipeline"
  groups     = [aws_iam_group.databasegroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccesswithDataPipeline"
}

resource "aws_iam_user_group_membership" "databasegroup1" {
  user = aws_iam_user.dynamodb_user.name

  groups = [
    aws_iam_group.databasegroup.name
  ]
}

resource "aws_iam_user" "dynamodb_user" {
  name = "dynamodb_user"
}

