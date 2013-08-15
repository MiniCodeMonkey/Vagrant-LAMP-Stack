# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Enable Berkshelf support
  config.berkshelf.enabled = true

  # Define VM box to use
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Set share folder
  config.vm.synced_folder "./" , "/var/www/projectname/"

  # Use hostonly network with a static IP Address
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.include_offline = true
  config.vm.define 'projectname' do |node|
    node.vm.hostname = 'projectname.local'
    node.vm.network :private_network, ip: '172.90.90.90'
    node.hostmanager.aliases = %w(www.projectname.local)
  end

  # Enable and configure chef solo
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "postfix"
    chef.add_recipe "openssl"
    chef.add_recipe "apache2"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "apache2::mod_ssl"
    chef.add_recipe "mysql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "memcached"
    chef.add_recipe "misc::packages"
    chef.add_recipe "misc::vhost"
    chef.add_recipe "misc::db"
    chef.add_recipe "dotdeb"
    chef.add_recipe "dotdeb::php54"
    chef.add_recipe "php"
    chef.json = {
      :misc => {
        # Project name
        :name           => "projectname",

        # Name of MySQL database that should be created
        :db_name        => "dbname",

        # Optional database dump to be imported when server is provisioned
        # If the file doesn't exist, it is just ignored
        :db_dump        => "/var/www/projectname/dump.sql",

        # Server name and alias(es) for Apache vhost
        :server_name    => "projectname.local",
        :server_aliases => "www.projectname.local",

        # Document root for Apache vhost
        :docroot        => "/var/www/projectname/public_html",
      },
      :mysql => {
        :server_root_password   => 'root',
        :server_repl_password   => 'root',
        :server_debian_password => 'root',
        :bind_address           => '0.0.0.0',
        :allow_remote_root      => true
      }
    }
  end
end