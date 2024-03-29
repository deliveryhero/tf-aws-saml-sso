data "aws_iam_policy_document" "sso_assume_role_policy_allow_explicit_users" {
  statement {
    actions = ["sts:AssumeRoleWithSAML"]

    principals {
      type        = "Federated"
      identifiers = compact(concat([aws_iam_saml_provider.main.arn], var.iam_assume_role_extra_identifiers))
    }

    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }

    condition {
      test     = "StringLikeIfExists"
      variable = "sts:RoleSessionName"
      values   = var.allowed_sso_admin_assume_policy_user_emails
    }
  }
}

data "aws_iam_policy_document" "sso_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithSAML"]

    principals {
      type        = "Federated"
      identifiers = compact(concat([aws_iam_saml_provider.main.arn], var.iam_assume_role_extra_identifiers))
    }

    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}

# AdministratorAccess
resource "aws_iam_role" "administrator" {
  name                 = "${var.iam_role_prefix}administrator"
  path                 = var.iam_role_path
  assume_role_policy   = var.allow_explicit_sso_admin_users ? data.aws_iam_policy_document.sso_assume_role_policy_allow_explicit_users.json : data.aws_iam_policy_document.sso_assume_role_policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "sso_administrator" {
  role       = aws_iam_role.administrator.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "administrator_extra" {
  count      = length(var.extra_policies_administrator)
  policy_arn = element(var.extra_policies_administrator, count.index)
  role       = aws_iam_role.administrator.name
}

# ReadOnlyAccess
resource "aws_iam_role" "readonly" {
  name                 = "${var.iam_role_prefix}readonly"
  path                 = var.iam_role_path
  assume_role_policy   = data.aws_iam_policy_document.sso_assume_role_policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "sso_readonly" {
  role       = aws_iam_role.readonly.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "readonly_extra" {
  count      = length(var.extra_policies_readonly)
  policy_arn = element(var.extra_policies_readonly, count.index)
  role       = aws_iam_role.readonly.name
}

# AmazonEC2FullAccess
resource "aws_iam_role" "ec2fullaccess" {
  name                 = "${var.iam_role_prefix}ec2fullaccess"
  path                 = var.iam_role_path
  assume_role_policy   = data.aws_iam_policy_document.sso_assume_role_policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "ec2fullaccess" {
  role       = aws_iam_role.ec2fullaccess.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "ec2fullaccess_extra" {
  count      = length(var.extra_policies_ec2fullaccess)
  policy_arn = element(var.extra_policies_ec2fullaccess, count.index)
  role       = aws_iam_role.ec2fullaccess.name
}

# SystemAdministrator
resource "aws_iam_role" "sysadmin" {
  name                 = "${var.iam_role_prefix}sysadmin"
  path                 = var.iam_role_path
  assume_role_policy   = data.aws_iam_policy_document.sso_assume_role_policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "sysadmin" {
  role       = aws_iam_role.sysadmin.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
}

resource "aws_iam_role_policy_attachment" "developer_sysadmin" {
  count      = length(var.extra_policies_sysadmin)
  policy_arn = element(var.extra_policies_sysadmin, count.index)
  role       = aws_iam_role.sysadmin.name
}

# Developer
resource "aws_iam_role" "developer" {
  name                 = "${var.iam_role_prefix}developer"
  path                 = var.iam_role_path
  assume_role_policy   = data.aws_iam_policy_document.sso_assume_role_policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "developer_ec2" {
  role       = aws_iam_role.developer.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "developer_rds" {
  role       = aws_iam_role.developer.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_role_policy_attachment" "developer_elasticache" {
  role       = aws_iam_role.developer.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonElastiCacheFullAccess"
}

resource "aws_iam_role_policy_attachment" "developer_readonly" {
  role       = aws_iam_role.developer.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "developer_extra" {
  count      = length(var.extra_policies_developer)
  policy_arn = element(var.extra_policies_developer, count.index)
  role       = aws_iam_role.developer.name
}

# PowerUser
resource "aws_iam_role" "poweruser" {
  name                 = "${var.iam_role_prefix}poweruser"
  path                 = var.iam_role_path
  assume_role_policy   = data.aws_iam_policy_document.sso_assume_role_policy.json
  max_session_duration = var.role_max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "poweruser" {
  role       = aws_iam_role.poweruser.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_role_policy_attachment" "poweruser_extra" {
  count      = length(var.extra_policies_poweruser)
  policy_arn = element(var.extra_policies_poweruser, count.index)
  role       = aws_iam_role.poweruser.name
}
