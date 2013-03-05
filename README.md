# Vagrant LAMP stack
This is a work in progress, but a basic setup is ready now.

## Requirements:
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [vagrant-hostmaster](https://github.com/mosaicxm/vagrant-hostmaster)

## Installation
Clone this repository

    $ git clone git@github.com:MiniCodeMonkey/Vagrant-LAMP-Stack.git
    $ cd Vagrant-LAMP-Stack
    $ git submodule update --init

Place your website in the *public_html* folder

## Usage
Start the VM
	$ vagrant up

You can now access your project at [http://server.dev](http://server.dev)

## Installed software:
* Apache
* MySQL
* php
* memcached
* vim, git

## Default credentials
### MySQL
* Username: root
* Password: root
* Host: localhost
* Port: 3306

### Memcached
* Port: 11211
