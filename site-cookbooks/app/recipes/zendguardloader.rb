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