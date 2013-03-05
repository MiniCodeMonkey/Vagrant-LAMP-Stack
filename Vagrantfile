# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Define VM to use
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Define hostname to be used with Hostmaster
  config.vm.host_name = "server.dev"
  config.hosts.name = "server.dev"

  # Use hostonly network with static IP Address
  config.vm.network :hostonly, "172.90.90.90"

  # Enable and configure chef solo
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "openssl"
    chef.add_recipe "apache2"
    chef.add_recipe "memcached"
    chef.add_recipe "mysql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "php"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "misc"
    chef.json = {
      :mysql => {
        :server_root_password => 'root',
        :server_repl_password => 'root',
        :server_debian_password => 'root'
      }
    }
  end
end