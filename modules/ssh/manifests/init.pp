class ssh {
  # Use the 'include' function to run on Puppet master and 
  include ssh::params, ssh::install, ssh::config, ssh::service
}
