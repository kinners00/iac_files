terraform {
  cloud {
    organization = "kinners00"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}
