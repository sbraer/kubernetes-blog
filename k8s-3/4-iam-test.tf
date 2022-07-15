data "aws_iam_policy_document" "oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = [
        "system:serviceaccount:default:aws-sa-s3",
        "system:serviceaccount:default:aws-sa-vpc"
        ]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "oidc_s3" {
  assume_role_policy = data.aws_iam_policy_document.oidc_assume_role_policy.json
  name               = "oidc_s3"
}

resource "aws_iam_policy" "policy_s3" {
  name = "policy_s3"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:ListAllMyBuckets",
              "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::*"
        }
    ]
    })
}

resource "aws_iam_role_policy_attachment" "role_attach_s3" {
  role       = aws_iam_role.oidc_s3.name
  policy_arn = aws_iam_policy.policy_s3.arn
}


resource "aws_iam_role" "oidc_vpc" {
  assume_role_policy = data.aws_iam_policy_document.oidc_assume_role_policy.json
  name               = "oidc_vpc"
}

resource "aws_iam_policy" "policy_vpc" {
  name = "policy_vpc"

  policy =  jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:DescribeVpcs",
            "Resource": "*"
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "role_attach_vpc" {
  role       = aws_iam_role.oidc_vpc.name
  policy_arn = aws_iam_policy.policy_vpc.arn
}

