class ossec::server(
                      $manage_package        = true,
                      $package_ensure        = 'installed',
                      $manage_service        = true,
                      $manage_docker_service = true,
                      $service_ensure        = 'running',
                      $service_enable        = true,
                      $syscheck_frequency    = '79200',
                    ) inherits ossec::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::ossec::server::install': }
  -> class { '::ossec::server::config': }
  ~> class { '::ossec::server::service': }
  -> Class['::ossec::server']

}
