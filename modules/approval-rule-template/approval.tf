resource "aws_codecommit_approval_rule_template" "Dev_rule_temp" {
  for_each = var.repository_approval_pools
  name        = "${each.key}-approval-rule"
  description = "This is an approval rule template for ${each.key}"

  content = jsonencode({
    Version               = "2018-11-08"
    DestinationReferences = ["refs/heads/main"]
    Statements = [{
      Type                    = "Approvers"
      NumberOfApprovalsNeeded = 2
      ApprovalPoolMembers     = each.value        #var.PoolMembers
    }]
  })
}

resource "aws_codecommit_approval_rule_template_association" "dev_rule_temp_association" {

  for_each                     = var.codecommit_repositories
  approval_rule_template_name  = aws_codecommit_approval_rule_template.Dev_rule_temp[each.key].name
  repository_name              = each.key
}