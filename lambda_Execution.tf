#IAM_GROUP
resource "aws_iam_group" "lambdaexecutiongroup" {
  name = "lambda_Execution"
}

resource "aws_iam_policy_attachment" "lambdaexecutionopolicy-1" {
  name       = "AmazonDynamoDBFullAccess"
  groups     = [aws_iam_group.lambdaexecutiongroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_policy_attachment" "lambdaexecutionpolicy-2" {
  name       = "AWSLambdaExecute"
  groups     = [aws_iam_group.lambdaexecutiongroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}

resource "aws_iam_policy_attachment" "lambdaexecutionpolicy-3" {
  name       = "AWSLambdaBasicExecutionRole"
  groups     = [aws_iam_group.lambdaexecutiongroup.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy_attachment" "lambdaexecutionpolicy-4" {
  name       = "customermanaged-policy"
  groups     = [aws_iam_group.lambdaexecutiongroup.name]
  policy_arn = aws_iam_policy.customermanagedpolicy-lambda.arn

}

resource "aws_iam_policy" "customermanagedpolicy-lambda" {
  name = "LambdaSyncAsyncInvoke"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeAsync",
                "lambda:InvokeFunction"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

#Creating users
resource "aws_iam_user" "lambdauser" {
  name = "lambda_user"
}

#Adding user to the group
resource "aws_iam_user_group_membership" "lambdaadduser" {
  user = aws_iam_user.lambdauser.name

  groups = [
    aws_iam_group.lambdaexecutiongroup.name

  ]
}
