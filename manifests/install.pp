class fping::install inherits fping {

  if($fping::manage_package)
  {
    if($fping::params::include_epel)
    {
      include ::epel

      Package[$fping::params::package_name] {
        require => Class['::epel'],
      }
    }

    package { $fping::params::package_name:
      ensure  => $fping::package_ensure,
    }
  }

}
