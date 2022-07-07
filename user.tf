resource "aws_iam_user" "s3user" {
  name = "s3user"
}

resource "aws_iam_user_policy_attachment" "s3user-policy1" {
#   name  = "TranslateFullAccess"
  user = aws_iam_user.s3user.name
  policy_arn = "arn:aws:iam::aws:policy/TranslateFullAccess"
}

resource "aws_iam_user_policy_attachment" "s3userpolicy2" {
#   name       = "AmazonS3FullAccess"
  user = aws_iam_user.s3user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_user_policy_attachment" "s3userpolicy3" {
#   name       = "ComprehendFullAccess"
  user = aws_iam_user.s3user.name
  policy_arn = "arn:aws:iam::aws:policy/ComprehendFullAccess"
}

resource "aws_iam_user_policy_attachment" "s3userpolicy4" {
#   name       = "AmazonPollyFullAccess"
  user = aws_iam_user.s3user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPollyFullAccess"
}

# --------------------------------------nikhil----------------------------------------------------------------

resource "aws_iam_user" "nikhil-user" {
  name = "nikhil"
}

resource "aws_iam_user_policy_attachment" "nikhil-userpolicy1" {
#   name  = "ReadOnlyAccess"
  user = aws_iam_user.nikhil-user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "nikhil-userpolicy2" {
#   name  = "Iamuserchangepassword"
  user = aws_iam_user.nikhil-user.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

# inline policy
resource "aws_iam_user_policy" "userpolicy3" {
  name = "APIGatewayWritePolicy"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "apigateway:*",
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy" "userpolicy4" {
  name = "CloudFrontAdminPolicy"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "cloudfront:*",
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy" "userpolicy5" {
  name = "DynamoDbPermissionPolicy"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
   "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb:BatchGetItem",
                "dynamodb:BatchWriteItem",
                "dynamodb:PutItem",
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:UpdateItem"
            ],
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy" "userpolicy6" {
  name = "DynamoDbWritePolicy"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
   "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "dynamodb:*",
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy" "userpolicy7" {
  name = "IAMWritePolicy"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
   "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:PassRole",
                "iam:CreateAccessKey"
            ],
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy" "userpolicy8" {
  name = "LambdaWritePolicy"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
   "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "lambda:*",
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy" "userpolicy9" {
  name = "OpenSearchWritePermission"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
   "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "es:*",
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy" "userpolicy10" {
  name = "S3WritePolicy"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
   "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy" "userpolicy11" {
  name = "UpdateAmplifyPolicy"
  user = aws_iam_user.nikhil-user.name

  policy = jsonencode({
    
   "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "amplify:CreateDeployment",
                "amplify:UpdateWebHook",
                "amplify:UpdateDomainAssociation",
                "amplify:CreateBranch",
                "amplify:UpdateBranch",
                "amplify:CreateWebHook",
                "amplify:StartJob",
                "amplify:CreateDomainAssociation",
                "amplify:CreateBackendEnvironment",
                "amplify:GenerateAccessLogs",
                "amplify:StartDeployment",
                "amplify:CreateApp",
                "amplify:StopJob",
                "amplify:UpdateApp"
            ],
            "Resource": "*"
        },
      ]
  } )
}

resource "aws_iam_user_policy_attachment" "nikhil-userpolicy12" {
#   name  = "Iamuserchangepassword"
  user = aws_iam_user.sharad.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "nikhil-userpolicy13" {
#   name  = "Iamuserchangepassword"
  user = aws_iam_user.harminder.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user_policy_attachment" "nikhil-userpolicy14" {
#   name  = "Iamuserchangepassword"
  user = aws_iam_user.chetan.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

