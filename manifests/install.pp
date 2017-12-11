class fping::install inherits fping {

  if($fping::manage_package)
  {
    package { $fping::params::package_name:
      ensure => $fping::package_ensure,
    }
  }

}
