# -*- mode: ruby -*-
# vi: set ft=ruby :

# General project settings
#################################

  # IP Address for the host only network, change it to anything you like
  # but please keep it within the IPv4 private network range
  ip_address = "172.22.22.22"

  # The project name is base for directories, hostname and alike
  project_name = "projectname"

  # MySQL and PostgreSQL password - feel free to change it to something
  # more secure (Note: Changing this will require you to update the index.php example file)
  database_password = "root"



# Vagrant configuration
#################################

  Vagrant.configure("2") do |config|
    # Enable Berkshelf support
    config.berkshelf.enabled = true

    # Define VM box to use
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    # Set share folder
    config.vm.synced_folder "./" , "/var/www/" + project_name + "/", :mount_options => ["dmode=777", "fmode=666"]


    # Use hostonly network with a static IP Address and enable
    # hostmanager so we can have a custom domain for the server
    # by modifying the host machines hosts file
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.vm.define project_name do |node|
      node.vm.hostname = project_name + ".local"
      node.vm.network :private_network, ip: ip_address
      node.hostmanager.aliases = [ "www." + project_name + ".local" ]
    end
    config.vm.provision :hostmanager

    # Make sure that the newest version of Chef have been installed
    config.vm.provision :shell, :inline => "apt-get update -qq && apt-get install make ruby1.9.1-dev --no-upgrade --yes"
    config.vm.provision :shell, :inline => "gem install chef --version 11.6.0 --no-rdoc --no-ri --conservative"

    # Enable and configure chef solo
    config.vm.provision :chef_solo do |chef|
      chef.add_recipe "app::packages"
      chef.add_recipe "app::web_server"
      chef.add_recipe "app::vhost"
      chef.add_recipe "memcached"
      chef.add_recipe "app::db"
      chef.json = {
        :app => {
          # Project name
          :name           => project_name,

          # Name of MySQL database that should be created
          :db_name        => "dbname",

          # Server name and alias(es) for Apache vhost
          :server_name    => project_name + ".local",
          :server_aliases =>  [ "www." + project_name + ".local" ],

          # Document root for Apache vhost
          :docroot        => "/var/www/" + project_name + "/public",

          # General packages
          :packages   => %w{ vim git screen curl },
          
          # PHP packages
          :php_packages   => %w{ php5-mysqlnd php5-curl php5-mcrypt php5-memcached php5-gd }
        },
        :mysql => {
          :server_root_password   => database_password,
          :server_repl_password   => database_password,
          :server_debian_password => database_password,
          :bind_address           => ip_address,
          :allow_remote_root      => true
        }
      }
    end
  end