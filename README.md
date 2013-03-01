# Vagrant LAMP stack for Laravel 4
This is a work in progress, but a basic setup is ready now.

## Requirements:
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [vagrant-hostmaster](https://github.com/mosaicxm/vagrant-hostmaster)
* [Composer](http://getcomposer.org) (Required to install Laravel)

## Installation
Clone this repository

    $ git clone git@github.com:MiniCodeMonkey/Vagrant-LAMP-Laravel4.git Laravel4
    $ cd Laravel4
    $ git submodule update --init

## Download and configure Laravel (optional)
> You can also import your own Laravel project instead here

Download Laravel 4 Beta 3

    $ wget https://github.com/laravel/laravel/archive/v4.0.0-BETA3.zip
    $ unzip v4.0.0-BETA3.zip && rm v4.0.0-BETA3.zip
    $ mv laravel-4.0.0-BETA3 laravel

Configure Laravel 4

	$ cd laravel
	$ composer install
	$ php artisan key:generate

## Usage
Start VM

	$ cd ..
    $ vagrant up

You can now access your project at [http://laravel.dev](http://laravel.dev)

## Installed software:
* Apache
* MySQL
* php

## TODO
* Fully configure MySQL with Laravel
* Include Laravel or Laravel install script?
