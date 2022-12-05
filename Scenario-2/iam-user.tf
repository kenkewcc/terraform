resource "aws_iam_user" "alice" {
  name = "alice"
  tags = {
    "Team" = "Alpha"
    "Team2" = "Gamma"
    "Role" = "Developer"
  }
}

resource "aws_iam_user" "bob" {
  name = "bob"
  tags = {
    "Team" = "Beta"
    "Role" = "QA"
  }
}

resource "aws_iam_user" "michael" {
  name = "michael"
  tags = {
    "Team" = "Beta"
    "Role" = "Developer"
  }
}

resource "aws_iam_user" "mike" {
  name = "mike"
  tags = {
    "Team" = "Beta"
    "Team2" = "Gamma"
    "Role" = "QA"
  }
}

resource "aws_iam_user" "terry" {
  name = "terry"
  tags = {
    "Team" = "Gamma"
    "Role" = "Developer"
  }
}

resource "aws_iam_user" "john" {
  name = "john"
  tags = {
    "Team" = "Alpha"
    "Role" = "QA"
  }
}