#
# Cookbook Name:: mongoctl
# Recipe:: default
#
# - Installs mongoctl via pip
# - For each specified user, installs the specified version of mongodb
#

include_recipe 'user::default'
include_recipe 'mongoctl::install'

# Deploying the mongoctl.config template
directory node[:mongoctl][:config_dir] do
  owner node[:user]
  group node[:group]
  action :create
end

template node[:mongoctl][:servers_config_filepath] do
  source node[:mongoctl][:servers_config_template]
  mode 0600
  owner node[:user]
  group node[:group]
  variables({
    # none yet
  })
end

template node[:mongoctl][:clusters_config_filepath] do
  source node[:mongoctl][:clusters_config_template]
  mode 0600
  owner node[:user]
  group node[:group]
  variables({
    # none yet
  })
end

template node[:mongoctl][:config_filepath] do
  source node[:mongoctl][:config_template]
  mode 0600
  owner node[:user]
  group node[:group]
  variables(
    :install_dir => node[:mongoctl][:mongodb][:install_dir],
    :servers_config_filename => node[:mongoctl][:servers_config_filename],
    :clusters_config_filename => node[:mongoctl][:clusters_config_filename]
  )
end

if node[:mongoctl][:install_mongodb]
  bash 'install mongodb' do
    owner node[:user]
    group node[:group]
    cwd node[:user][:home]
    environment 'HOME' => node[:user][:home]
    code "mongoctl install-mongodb #{node[:mongoctl][:mongodb][:install_version]}"
  end
end
