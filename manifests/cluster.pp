
class node_with_roles($roles = hiera("bigtop::roles")) {
  
  define deploy_module($roles) {
    $title.each |$key, $value| {
      notice($value)
    }
    notice($name)
    class { "${name}::deploy":
      roles => $roles,
    }
  }

  $modules = [
    "mysql_deploy",
    "azkaban",  
  ]

  $modules.each |$key, $value| {
    notice($value)
    class { "${value}::deploy":
      roles => $roles,
    }
  }

  # Here is very useful to change the stage puppet actually execution.
  # Todo, here's stage organization is not good, I will tune it tomorrow.
  Mysql::Db<||> -> Archive<||>
  
}
