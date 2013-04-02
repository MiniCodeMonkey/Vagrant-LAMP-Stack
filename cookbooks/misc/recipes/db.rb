#
# Cookbook Name:: misc
# Recipe:: db
#
# Credits: David Stanley (https://github.com/davidstanley01/vagrant-chef/)
#

# Create database if it doesn't exist
ruby_block "create_#{node['misc']['name']}_db" do
    block do
        %x[mysql -uroot -p#{node['mysql']['server_root_password']} -e "CREATE DATABASE #{node['misc']['db_name']};"]
    end 
    not_if "mysql -uroot -p#{node['mysql']['server_root_password']} -e \"SHOW DATABASES LIKE '#{node['misc']['db_name']}'\" | grep #{node['misc']['db_name']}";
    action :create
end