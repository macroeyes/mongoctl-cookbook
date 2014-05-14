#
# Cookbook Name:: mongoctl
# Recipe:: install
#

include_recipe 'python::pip'

python_pip 'mongoctl' do
  action :install
end
