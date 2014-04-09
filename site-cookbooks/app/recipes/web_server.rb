#
# Cookbook Name:: app
# Recipe:: web_server
#
# Copyright 2013, Mathias Hansen
#

# Install Apache
include_recipe "openssl"
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_ssl"

# Install PHP
include_recipe "dotdeb"
include_recipe "dotdeb::php54"
include_recipe "php"

# Install PHP5 packages
node['app']['php_packages'].each do |a_package|
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