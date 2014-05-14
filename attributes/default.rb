#
# Cookbook Name:: mongoctl
# Attributes:: default
#

default[:mongoctl][:users] = []
# e.g.
# default[:mongoctl][:users] = [{
#   :username => 'vagrant',
#   :group => 'vagrant',
#   :home_dir => '/home/vagrant',
#   :config_dir => '/home/vagrant/.mongoctl'
# }]

default[:mongoctl][:config_filename] = 'mongoctl.config'
default[:mongoctl][:config_template] = 'mongoctl.config.erb'

default[:mongoctl][:servers_config_filename] = 'servers.config.json'
default[:mongoctl][:servers_config_template] = 'servers.config.json.erb'

default[:mongoctl][:clusters_config_filename] = 'clusters.config.json'
default[:mongoctl][:clusters_config_template] = 'clusters.config.json.erb'

default[:mongoctl][:install_mongodb] = false

default[:mongoctl][:dbpath] = '/var/lib/mongodb'
default[:mongoctl][:log_dir] = '/var/log/mongodb'
default[:mongoctl][:log_filename] = 'mongod.log'

default[:mongoctl][:mongodb][:install_dir] = 'mongodb'
default[:mongoctl][:mongodb][:install_version] = 'latest'
