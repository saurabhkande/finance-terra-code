variable "region" {
  default = "us-west-2"
}

#----------------- code-commit----------------------#

variable "codecommit_repositories" {
  description = "Map of repositories to their email addresses"
  type        = map(list(string))
  default = {
    skpd_hcmodel = ["saurabhs.kande@minfytech.com"]
    # skpd_ews = ["saurabhs.kande@minfytech.com"]
    # skpd_clustering = ["saurabhs.kande@minfytech.com"]
    # skpd_nudges = ["saurabhs.kande@minfytech.com"]
    # skpd_dags = ["saurabhs.kande@minfytech.com"]
    # skpd_dataplatform = ["saurabhs.kande@minfytech.com"]
    # skpd_superapp = ["saurabhs.kande@minfytech.com"]
    # skpd_reporting = ["saurabhs.kande@minfytech.com"]

  }
}


#--------------------- Notification-rule--------------#

variable "event_type" {
  default = ["codecommit-repository-approvals-status-changed","codecommit-repository-pull-request-created",
  "codecommit-repository-pull-request-merged"
  ]
}

variable "repository_approval_pools" {
  description = "Map of repository names to their approval pool members"
  type        = map(list(string))
  default = {
    skpd_hcmodel = ["arn:aws:iam::787367675716:user/abhi", "arn:aws:iam::787367675716:user/rishabh"]
    # skpd_ews     = ["arn:aws:iam::787367675716:user/abhi", "arn:aws:iam::787367675716:user/rishabh"]
  }
}

# variable "repository_approval_pools" {
#   description = "Map of repository names to their approval pool members"
#   type        = map(list(string))
#   default = {
#     skpd_hcmodel = ["arn:aws:iam::524566954448:user/raja.chellappan@affine.ai", "arn:aws:iam::524566954448:user/venkateswararaor@cholams.murugappa.com"]
#     skpd_ews     = ["arn:aws:iam::787367675716:user/abhi", "arn:aws:iam::787367675716:user/rishabh"]
    # skpd_clustering = ["saurabhs.kande@minfytech.com"]
    # skpd_nudges = ["saurabhs.kande@minfytech.com"]
    # skpd_dags = ["saurabhs.kande@minfytech.com"]
    # skpd_dataplatform = ["saurabhs.kande@minfytech.com"]
    # skpd_superapp = ["saurabhs.kande@minfytech.com"]
    # skpd_reporting = ["saurabhs.kande@minfytech.com"]

#   }
# }


# arn:aws:iam::524566954448:user/balajikannan@cholams.murugappa.com
# 


#------------------- redshift----------------------------#

variable "cluster_identifier"{
  default = "chola-redshift-cluster"
}
variable "database_name" {
  default = "skpd"
}     
variable "master_username" {
  default = "skpdredshift"
}    
    
variable "node_type" {
  default = "dc2.large"
}          
variable "cluster_type" {
  default = "single-node"
}
variable "subnet_ids" {
  default = ["subnet-0225c1c66ffc078c6","subnet-04d6bdf375ec895f8"]
}

#--------------------- secret manager vars -----------------------#

variable "Secret_name" {
  default = "redshif-secret"
}