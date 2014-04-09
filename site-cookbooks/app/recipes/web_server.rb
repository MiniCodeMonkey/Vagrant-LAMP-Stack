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

# Install Zend Guard Loader
bash "zend-guard-loader" do
	user "root"
	cwd "/tmp"
	code <<-EOH
		wget http://downloads.zend.com/guard/6.0.0/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz
		tar xzf ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz
		cp ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386/php-5.4.x/ZendGuardLoader.so /usr/lib/php5/20100525+lfs/
		 
		file=/usr/lib/php5/20100525+lfs/ZendGuardLoader.so
		echo zend_extension=$file > /etc/php5/conf.d/zend_extensions.ini
		chmod 644 $file
		chown 0:0 $file
		 
		service apache2 reload
	  	EOH
end