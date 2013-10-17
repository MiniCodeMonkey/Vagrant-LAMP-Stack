# Vagrant LAMP stack
A dead-simple LAMP stack without any bells and whistles for your basic Linux/Apache/MySQL/PHP install, using Chef Solo for provisioning.

The idea is for developers to fork this and add additional software and configuration that suits the needs of their project.

## Requirements
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [Berkshelf](http://berkshelf.com)
	* `gem install berkshelf`
* [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf)
	* `vagrant plugin install vagrant-berkshelf`
* [vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager)
	* `vagrant plugin install vagrant-hostmanager`

**Note:** Vagrant 1.0.x compatible stack [is also available](https://github.com/MiniCodeMonkey/Vagrant-LAMP-Stack/tree/Vagrant-1.0.x).

## Installation
Clone this repository

    $ git clone git@github.com:MiniCodeMonkey/Vagrant-LAMP-Stack.git

Place your website in the `public_html` folder

## Usage
Start the VM

	$ cd Vagrant-LAMP-Stack
	$ vagrant up

You can now access your project at [http://projectname.local](http://projectname.local)

![Screenshot of up-and-running server](http://i.imgur.com/TP1i9Zd.png)

### Database dump import
Chef will automatically try to import the database dump specified by the filename set in the `:db_dump` option of your Vagrantfile.

If you are using the default configuration, just create a `dump.sql` file in the root directory with your table structure and/or content and it will be imported automatically when you run `vagrant up`.

## Installed software
* Apache 2
* MySQL
* PHP 5.4 (with mysql, curl, mcrypt, memcached, gd)
* memcached
* postfix
* vim, git, screen, curl, composer

## Default credentials
### MySQL
* Username: root
* Password: root
* Host: localhost
* Port: 3306

**Note:** Remote MySQL access is enabled by default, so you can access the MySQL database using your favorite MySQL client with the above credentials (and using e.g. *projectname.local* as hostname).

### Memcached
* Port: 11211


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/MiniCodeMonkey/vagrant-lamp-stack/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

