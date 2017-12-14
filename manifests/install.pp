class fping::install inherits fping {

  if($fping::manage_package)
  {
    include ::epel

    package { $fping::params::package_name:
      ensure  => $fping::package_ensure,
      require => Class['::epel'],
    }
  }

}
