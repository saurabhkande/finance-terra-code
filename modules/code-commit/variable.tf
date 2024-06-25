variable "codecommit_repositories" {
  description = "Map of repositories to their email addresses"
  type        = map(list(string))
  # default = {
  #   skpd_hcmodel = ["saurabhs.kande@minfytech.com"]
  #   # skpd_ews = ["saurabhs.kande@minfytech.com"]
  #   # skpd_clustering = ["saurabhs.kande@minfytech.com"]
  #   # skpd_nudges = ["saurabhs.kande@minfytech.com"]
  #   # skpd_dags = ["saurabhs.kande@minfytech.com"]
  #   # skpd_dataplatform = ["saurabhs.kande@minfytech.com"]
  #   # skpd_superapp = ["saurabhs.kande@minfytech.com"]
  #   # skpd_reporting = ["saurabhs.kande@minfytech.com"]

  # }
}

