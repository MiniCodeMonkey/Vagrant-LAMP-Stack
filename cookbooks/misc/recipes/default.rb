#
# Cookbook Name:: misc
# Recipe:: default
#
# Copyright 2013, Mathias Hansen
#
# All rights reserved - Do Not Redistribute
#

# Install misc packages
%w{ vim git }.each do |a_package|
  package a_package
end

# Install PHP5 packages
%w{ php5-mysql php5-curl php5-mcrypt php5-memcached }.each do |a_package|
  package a_package
end

# Disable default vhost config
execute "disable-default-site" do
  command "a2dissite default"
end

# Enable vhost
web_app "server" do
  server_name node['hostname']
  application_name "server-app"
  docroot "/vagrant/public_html"
  log_dir node['apache']['log_dir'] 
end