#Assume role policy
resource "aws_iam_role" "test_role" {
  name = var.iam_role

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "tag-value"
  }
}


resource "aws_iam_role_policy" "test_policy" {
  name = var.iam_role_policy
  role = "${aws_iam_role.test_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


#EC2 Instance Profile
resource "aws_iam_instance_profile" "test_profile" {
  name = var.iam_instance_profile
  role = "${aws_iam_role.test_role.id}"
}
