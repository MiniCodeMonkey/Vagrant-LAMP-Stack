# -*- mode: ruby -*-
# vi: set ft=ruby :

# Environment variables
#################################

MEMORY = ENV['VM_MEMORY'] || '512'
CORES = ENV['VM_CORES'] || '1'
ARCH = ENV['VM_ARCH'] || '32'

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

  # Use the omnibus installer for the latest Chef installation
  config.omnibus.chef_version = :latest

  # Define VM box to use
  config.vm.box = "precise#{ARCH}"
  config.vm.box_url = "http://files.vagrantup.com/precise#{ARCH}.box"

  # Set share folder
  config.vm.synced_folder "./" , "/var/www/" + project_name + "/", :mount_options => ["dmode=777", "fmode=666"]

  # Provider-specific configuration so you can fine-tune VirtualBox for Vagrant.
  # These expose provider-specific options.
  config.vm.provider :virtualbox do |vm|
    # Use VBoxManage to customize the VM. For example to change memory:
    vm.customize ["modifyvm", :id, "--memory", MEMORY.to_i]
    vm.customize ["modifyvm", :id, "--cpus", CORES.to_i]

    if CORES.to_i > 1
      vm.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

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
