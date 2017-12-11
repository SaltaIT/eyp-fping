class fping::service inherits fping {

  #
  validate_bool($fping::manage_docker_service)
  validate_bool($fping::manage_service)
  validate_bool($fping::service_enable)

  validate_re($fping::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${fping::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $fping::manage_docker_service)
  {
    if($fping::manage_service)
    {
      service { $fping::params::service_name:
        ensure => $fping::service_ensure,
        enable => $fping::service_enable,
      }
    }
  }
}
