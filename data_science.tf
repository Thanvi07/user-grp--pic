resource "aws_iam_group" "datasciencegrp" {
  name = "data_science"
}

resource "aws_iam_policy_attachment" "datasciencegrp-policy1" {
  name       = "amazonec2-fullaccess"
  groups     = [aws_iam_group.datasciencegrp.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_policy_attachment" "datasciencegrp-policy2" {
  name       = "amazons3-fullaccess"
  groups     = [aws_iam_group.datasciencegrp.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_policy_attachment" "datasciencegrp-policy3" {
  name       = "amazonsagemaker-fullaccess"
  groups     = [aws_iam_group.datasciencegrp.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}