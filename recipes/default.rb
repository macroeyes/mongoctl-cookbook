#
# Cookbook Name:: mongoctl
# Recipe:: default
#
# - Installs mongoctl via pip
# - For each specified user, installs the specified version of mongodb
#

include_recipe 'user::default'
include_recipe 'mongoctl::install'

node[:mongoctl][:users].each do |user|

  home_dir = user[:home_dir] || "/home/#{user[:username]}"
  config_dir = user[:config_dir] || "#{home_dir}/.mongoctl"

  directory config_dir do
    owner user[:username]
    group user[:group] || user[:username]
    action :create
  end

  template "#{config_dir}/#{node[:mongoctl][:servers_config_filename]}" do
    source node[:mongoctl][:servers_config_template]
    mode 0600
    owner user[:username]
    group user[:group] || user[:username]
    variables({
      # none yet
    })
  end

  template "#{config_dir}/#{node[:mongoctl][:clusters_config_filename]}" do
    source node[:mongoctl][:clusters_config_template]
    mode 0600
    owner user[:username]
    group user[:group]
    variables({
      # none yet
    })
  end

  template "#{config_dir}/#{node[:mongoctl][:config_filename]}" do
    source node[:mongoctl][:config_template]
    mode 0600
    owner user[:username]
    group user[:group] || user[:username]
    variables(
      :install_dir => node[:mongoctl][:mongodb][:install_dir],
      :servers_config_filename => node[:mongoctl][:servers_config_filename],
      :clusters_config_filename => node[:mongoctl][:clusters_config_filename]
    )
  end

  if node[:mongoctl][:install_mongodb]
    bash 'install mongodb' do
      owner user[:username]
      group user[:group] || user[:username]
      cwd home_dir
      code "mongoctl install-mongodb #{node[:mongoctl][:mongodb][:install_version]}"
    end
  end

end
