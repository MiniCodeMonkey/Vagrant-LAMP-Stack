#
# Cookbook Name:: misc
# Recipe:: vhost
#
# Copyright 2013, Mathias Hansen
#

# Define app name
app_name = "#{node['misc']['name']}"

# Enable vhost
web_app app_name do
  server_name node['misc']['server_name']
  server_aliases node['misc']['server_aliases']
  docroot node['misc']['docroot']
  log_dir node['apache']['log_dir'] 
end

# Disable default vhost config
apache_site "000-default" do
  enable false
end