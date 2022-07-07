resource "aws_iam_group" "admin" {
  name = "devops-admin"
}

resource "aws_iam_policy_attachment" "admin-policy" {
  name       = "amazon_ec2container_registryfullaccess"
  groups     = [aws_iam_group.admin.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_policy_attachment" "admin-policy1" {
  name       = "cloudwatch_events_readonlyaccess"
  groups     = [aws_iam_group.admin.name]
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsReadOnlyAccess"
} 

resource "aws_iam_policy_attachment" "admin-policy2" {
  name       = "amazonEcs_fullaccess"
  groups     = [aws_iam_group.admin.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
} 

resource "aws_iam_policy_attachment" "admin-policy3" {
  name       = "aws_lambda-deploymentRole"
  groups     = [aws_iam_group.admin.name]
  policy_arn = aws_iam_policy.customer_managed_policy.arn
} 


resource "aws_iam_policy" "customer_managed_policy" {
  name  = "aws_lambda-deploymentRole"
#   group = aws_iam_group.admin.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "lambda:UpdateFunctionCode",
                "lambda:UpdateFunctionConfiguration",
                "lambda:GetFunctionConfiguration",
                "lambda:UpdateAlias"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

# Customer Policy Attachment
# resource "aws_iam_group" "inlinepolicy" {
#   name = "devops-admin"
# }
resource "aws_iam_group_policy" "inlinepolicy" {
  name  = "update_lambdapolicy"
  group = aws_iam_group.admin.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "lambda:UpdateFunctionCode",
                "lambda:UpdateFunctionConfiguration",
                "lambda:GetFunctionConfiguration",
                "lambda:UpdateAlias"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

 resource "aws_iam_user_group_membership" "admin-users" {
  user = aws_iam_user.devops_admin.name

  groups = [
    aws_iam_group.admin.name
  ]
}

resource "aws_iam_user_group_membership" "admin-users1" {
  user = aws_iam_user.devops_admin_1.name

  groups = [
    aws_iam_group.admin.name
  ]
}

resource "aws_iam_user_group_membership" "admin-users2" {
  user = aws_iam_user.devops_admin_2.name

  groups = [
    aws_iam_group.admin.name
  ]
}

resource "aws_iam_user" "devops_admin" {
  name = "devops_admin"
}

resource "aws_iam_user" "devops_admin_1" {
  name = "devops_admin_1"
}

resource "aws_iam_user" "devops_admin_2" {
  name = "devops_admin_2"
}

