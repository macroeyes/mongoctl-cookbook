#
# Cookbook Name:: mongoctl
# Attributes:: default
#

default[:mongoctl][:config_dir] = "#{node[:user][:home]}/.mongoctl"

default[:mongoctl][:config_filename] = 'mongoctl.config.json'
default[:mongoctl][:config_filepath] = "#{node[:mongoctl][:config_dir]}/#{node[:mongoctl][:config_filename]}"
default[:mongoctl][:config_template] = 'mongoctl.config.json.erb'

default[:mongoctl][:servers_config_filename] = 'servers.config.json'
default[:mongoctl][:servers_config_filepath] = "#{node[:mongoctl][:config_dir]}/#{node[:mongoctl][:servers_config_filename]}"
default[:mongoctl][:servers_config_template] = 'servers.config.json.erb'

default[:mongoctl][:clusters_config_filename] = 'clusters.config.json'
default[:mongoctl][:clusters_config_filepath] = "#{node[:mongoctl][:config_dir]}/#{node[:mongoctl][:clusters_config_filename]}"
default[:mongoctl][:clusters_config_template] = 'clusters.config.json.erb'

default[:mongoctl][:install_mongodb] = false

default[:mongoctl][:mongodb][:install_dir] = '/opt/mongoctl/mongodb'
default[:mongoctl][:mongodb][:install_version] = 'latest'
