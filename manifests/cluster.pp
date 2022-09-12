
class node_with_roles($roles = hiera("bigtop::roles")) {
  
  define deploy_module($roles) {
    class { "${name}::deploy":
    roles => $roles,
    }
  }

  $modules = [
    "azkaban",
    "mysql_deploy",
  ]

  node_with_roles::deploy_module { $modules:
    roles => $roles,
  }
}
