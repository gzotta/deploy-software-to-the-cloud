 # Change VM's webserver_user's configuration to use shared folder.
	 # (Look inside test-website.conf for specifics.)
	 cp /vagrant/admin.conf /etc/apache2/sites-available/
	 
	 chmod 777 /vagrant
     chmod 777 /vagrant/www/admin
     chmod 777 /vagrant/www/admin/index.php
	 chmod 777 /vagrant/www/admin/remove.php
	 chmod 777 /vagrant/www/admin/add.php
	 chmod 777 /vagrant/www/admin/config
	 chmod 777 /vagrant/www/admin/config/db_connect.php
	 chmod 777 /vagrant/www/admin/img
	 chmod 777 /vagrant/www/admin/img/pizza1.jpg
	 chmod 777 /vagrant/www/admin/templates
	 chmod 777 /vagrant/www/admin/templates/footer.php
	 chmod 777 /vagrant/www/admin/templates/header.php
	 
	 
     # activate our website configuration ...
     a2ensite admin
     # ... and disable the default website provided with Apache
     a2dissite 000-default
     # Reload the webserver configuration, to pick up our changes
     service apache2 reload