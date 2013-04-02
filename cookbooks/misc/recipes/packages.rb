#
# Cookbook Name:: misc
# Recipe:: packages
#
# Copyright 2013, Mathias Hansen
#

# Install misc packages
%w{ vim git screen curl }.each do |a_package|
  package a_package
end

# Install PHP5 packages
%w{ php5-mysqlnd php5-curl php5-mcrypt php5-memcached php5-gd }.each do |a_package|
  package a_package
end

# Fix deprecated comments in PHP ini files by replacing '#' with ';'
bash "fix-phpcomments" do
  code "find /etc/php5/cli/conf.d/ -name '*.ini' -exec sed -i -re 's/^(\\s*)#(.*)/\\1;\\2/g' {} \\;"
  notifies :restart, resources("service[apache2]"), :delayed
end

# Install Composer
bash "composer" do
  code <<-EOH
    curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
  EOH
end