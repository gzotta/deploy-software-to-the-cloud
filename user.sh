# Change VM's webserver_user's configuration to use shared folder.
	 # (Look inside test-website.conf for specifics.)
	 cp /vagrant/user.conf /etc/apache2/sites-available/
	 
	 chmod 777 /vagrant
     chmod 777 /vagrant/www/user
     chmod 777 /vagrant/www/user/index.php
	 chmod 777 /vagrant/www/user/details.php
	 chmod 777 /vagrant/www/user/add.php
	 chmod 777 /vagrant/www/user/config
	 chmod 777 /vagrant/www/user/config/db_connect.php
	 chmod 777 /vagrant/www/user/img
	 chmod 777 /vagrant/www/user/img/pizza1.jpg
	 chmod 777 /vagrant/www/user/templates
	 chmod 777 /vagrant/www/user/templates/footer.php
	 chmod 777 /vagrant/www/user/templates/header.php
	 
	 
     # activate our website configuration ...
     a2ensite user
     # ... and disable the default website provided with Apache
     a2dissite 000-default
     # Reload the webserver configuration, to pick up our changes
     service apache2 reload