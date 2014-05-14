#
# Cookbook Name:: mongoctl
# Recipe:: default
#
# - Installs mongoctl via pip
# - For each specified user, installs the specified version of mongodb
#

include_recipe 'bash::default'
include_recipe 'mongoctl::install'

node[:mongoctl][:users].each do |user|
  name        = user[:name]
  home        = user[:home] || "/home/#{name}"
  config_dir  = "#{home}/.mongoctl"
  config_file = "#{config_dir}/mongoctl.config"

  # Deploying the mongoctl.config template
  directory config_dir do
    owner name
    group name
    action :create
  end

  template config_file do
    source 'config.erb'
    mode 0600
    owner name
    group name
    variables :home => home
  end

  bash 'install mongodb' do
    user name
    group name
    cwd home
    environment :HOME => home
    code "mongoctl install-mongodb #{user[:version]}"
  end
end
