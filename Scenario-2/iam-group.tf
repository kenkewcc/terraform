data "aws_iam_policy_document" "allow_xxx_policy" {
    statement {
        effect = "Allow"
        actions = ["s3:ListAllMyBuckets"] ## update the actions to be manage
        resources = ["arn:aws:s3:::*"] ## update the resource to be manage
        condition {
            test     = "StringEquals"
            variable = "aws:ResourceTag/Team" ## update the condition or add additional condition for diff team.

            values = ["Alpha"]
        }
    }
}

##Create group
resource "aws_iam_group" "developer" {
  name = "developer"
}

## Add users to group
resource "aws_iam_group_membership" "developer" {
  name = "developer-membership"

  users = [
    aws_iam_user.alice.name,
    aws_iam_user.michael.name,
    aws_iam_user.terry.name
  ]

  group = aws_iam_group.developer.name
}

## Attach policy to group
resource "aws_iam_group_policy_attachment" "allow-xxx-for-developer" {
  group      = aws_iam_group.developer.name
  policy_arn = data.aws_iam_policy.allow-xxx-policy.arn
}

##Create group
resource "aws_iam_group" "qa" {
  name = "qa"
}

## Add users to group
resource "aws_iam_group_membership" "qa" {
  name = "qa-membership"

  users = [
    aws_iam_user.bob.name,
    aws_iam_user.mikes.name,
    aws_iam_user.john.name
  ]

  group = aws_iam_group.qa.name
}

## Attach policy to group
resource "aws_iam_group_policy_attachment" "allow-xxx-for-qa" {
  group      = aws_iam_group.qa.name
  policy_arn = data.aws_iam_policy.allow-xxx-policy.arn
}
