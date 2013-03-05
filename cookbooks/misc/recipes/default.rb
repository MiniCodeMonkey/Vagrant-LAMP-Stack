#
# Cookbook Name:: misc
# Recipe:: default
#
# Copyright 2013, Mathias Hansen
#
# All rights reserved - Do Not Redistribute
#

# Install misc packages
%w{ vim git screen curl }.each do |a_package|
  package a_package
end

# Install PHP5 packages
%w{ php5-mysql php5-curl php5-mcrypt php5-memcached php5-gd php5-imagick }.each do |a_package|
  package a_package
end

# Disable default vhost config
execute "disable-default-site" do
  command "a2dissite default"
end

# Fix deprecated comments in PHP ini files by replacing '#' with ';'
bash "fix-phpcomments" do
  code "find /etc/php5/cli/conf.d/ -name '*.ini' -exec sed -i -re 's/^(\\s*)#(.*)/\\1;\\2/g' {} \\;"
  notifies :restart, resources("service[apache2]"), :delayed
end

# Enable vhost
web_app "server" do
  server_name node['hostname']
  application_name "server-app"
  docroot "/vagrant/public_html"
  log_dir node['apache']['log_dir'] 
end

# Install Composer
bash "composer" do
  code <<-EOH
    curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
  EOH
end

# Let MySQL root user have access from any host
execute "update-root-mysql-user" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
      "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;" +
      "FLUSH PRIVILEGES;\" " +
      "mysql"
  action :run
  ignore_failure true
end