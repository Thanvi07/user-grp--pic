resource "aws_iam_group" "developergroup" {
  name = "developer"
}

resource "aws_iam_policy_attachment" "developergroup-policy1" {
  name       = "amazonec2-containerregistry-fullaccess"
  groups     = [aws_iam_group.developergroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_policy_attachment" "developergroup-policy2" {
  name       = "amazondynamodb-fullaccess"
  groups     = [aws_iam_group.developergroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_policy_attachment" "developergroup-policy3" {
  name       = "amazonapigateway-administrator"
  groups     = [aws_iam_group.developergroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_policy_attachment" "developergroup-policy4" {
  name       = "amazonecs_fullaccess"
  groups     = [aws_iam_group.developergroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_policy_attachment" "developergroup-policy5" {
  name       = "AWSLambda_FullAccess"
  groups     = [aws_iam_group.developergroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}

resource "aws_iam_group_policy" "developer-inlinepolicy" {
  name  = "EcsContainerRegistryReadOnlyPolicy"
  group = aws_iam_group.developergroup.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr-public:GetAuthorizationToken",
                "sts:GetServiceBearerToken",
                "ecr-public:BatchCheckLayerAvailability",
                "ecr-public:GetRepositoryPolicy",
                "ecr-public:DescribeRepositories",
                "ecr-public:DescribeRegistries",
                "ecr-public:DescribeImages",
                "ecr-public:DescribeImageTags",
                "ecr-public:GetRepositoryCatalogData",
                "ecr-public:GetRegistryCatalogData"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_user_group_membership" "developergroup-gp1" {
  user = aws_iam_user.chetan.name

  groups = [
    aws_iam_group.developergroup.name
  ]
}

resource "aws_iam_user" "chetan" {
  name = "chetan"
}