# Vagrant LAMP stack for Laravel 4
This is a work in progress.

## Requirements:
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [vagrant-hostmaster](https://github.com/mosaicxm/vagrant-hostmaster)
* [Composer](http://getcomposer.org) (Required to install Laravel)

    $ gem install vagrant
    $ vagrant gem install vagrant-hostmaster

## Installation
Clone this repository

    $ git clone git@github.com:MiniCodeMonkey/Vagrant-LAMP-Laravel4.git Laravel4
    $ cd Laravel4

Download Laravel 4 Beta 3

    $ wget https://github.com/laravel/laravel/archive/v4.0.0-BETA3.zip
    $ unzip v4.0.0-BETA3.zip && rm v4.0.0-BETA3.zip
    $ mv laravel-4.0.0-BETA3 laravel

Configure Laravel 4

	$ cd laravel
	$ composer install
	$ php artisan key:generate

Start VM

    $ vagrant up

## Usage
[http://laravel.dev](http://laravel.dev)

## Installed software:
* Apache
* MySQL
* php

## TODO
* Include Laravel?
