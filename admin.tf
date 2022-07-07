# #IAM_GROUP
# resource "aws_iam_group" "admingroup" {
#   name = "admin"
# }

# resource "aws_iam_policy_attachment" "adminpolicy-1" {
#   name       = "AdministratorAccess"
#   groups     = [aws_iam_group.admingroup.name]
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
# }


# #Creating users
# resource "aws_iam_user" "user1" {
#   name = "vishal"
# }

# resource "aws_iam_user" "user2" {
#   name = "akshay"
# }

# resource "aws_iam_user" "user3" {
#   name = "vikram"
# }

# resource "aws_iam_user" "user4" {
#   name = "shailendra"
# }


# #Adding user to the group
# resource "aws_iam_user_group_membership" "adminadd1" {
#   user = aws_iam_user.user1.name
#   groups = [aws_iam_group.admingroup.name]
# }

# resource "aws_iam_user_group_membership" "adminadd2" {
#   user = aws_iam_user.user2.name
#   groups = [aws_iam_group.admingroup.name]
# }

# resource "aws_iam_user_group_membership" "adminadd3" {
#   user = aws_iam_user.user3.name
#   groups = [aws_iam_group.admingroup.name]
# }

# resource "aws_iam_user_group_membership" "adminadd4" {
#   user = aws_iam_user.user4.name
#   groups = [aws_iam_group.admingroup.name]
# }