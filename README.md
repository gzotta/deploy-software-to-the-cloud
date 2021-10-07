# deploy-software-to-the-cloud
This project is to demonstrate the building and deployment of software onto cloud hosting enviroments (AWS). Also, to employ services (EC2, RDS) made available by AWS within software. 

# About the application functionality
The application that I used for this project is a very simple Pizza application written in PHP. It utilises two virtual machines, one that runs a web-based user interface that allows public users create pizzas by adding a title and ingredients. Pizzas created by public users will be displayed in the index page. The second virtual machine hosts a web-based admin interface, where admins can add and delete pizzas from the system. To delete a pizza, an admin user must click on the “more info” link at the bottom of the pizza description, that link will take the user to the delete interface. Data is stored in a MariaDB database.

# Deployment
The first step is to configure two virtual machines, I used Vagrant to deploy and provision two EC2 instances. You can see all the configuration and provision settings in the Vagrant file within this repository. 
The next step is to create the database. I have used the AWS RDS to create and host a MariaDB database instance. To do this, I followed the steps in the “Creating a MariaDB DB instance and connection to database on a MariaDB DB instance” section from the Amazon Relational Database Service User Guide. To create the tables and populate them, I used the HeidiSQL client.
After the database and the Vagrant file are ready, run the “vagrant up –provider=aws” command to launch the VMs.


# Design of the application

## Web servers
I used two instances of EC2, one to host the web server for the public user interface, and another to host the web server for the admin user interface. One EC2 instance (public user web server) gets inputs from users through the web interface and store it in the database. The other EC2 instance (admin user web server) gets the data sent by the first EC2 instance from the database, so admin users can manipulate it (add, or delete). Data can be deleted only from the admin EC2 instance. 

## Data storage
My application uses a relational database to store data, for that reason I used Amazon RDS to host my database in the cloud. To be more specific, after researching about Amazon RDS, I found it very convenient for hosting relational databases because it is easy to set up, operate, and scale in the cloud. When creating your database in RDS, you have several and popular options of database engines to choose from, in my case I was using MariaDB which is available in the RDS, also, documentation on how to create and run a database instance is provided by RDS and is very easy to understand and follow. After creating my database in RDS and connecting it to my application, the next thing I had to do was to use a SQL client to create tables and populate them, I used HeidiSQL.

Hosting the database in the cloud through RDS was very convenient in terms of saving time deploying the application, for example, I didn’t have to create a virtual machine in the Vagrant file to host the DB which in turn significantly reduce start up time when running  the vagrant up command. Also, it improves the testing process because I don’t need to halt and restart all of the three virtual machines every time I make a  change in the database, I can do it from the HeidiSQL client without stopping the virtual machines. RDS is in charge of administration tasks such as hardware provisioning, database setup, and patching backups. In conclusion, I found that the processes of deploying software and testing  it are improved by hosting the DB onto the cloud.


# Application Access
To reach my application, first you must start the EC2 instances to keep them running, also the RDS database must be available. 

When EC2 instances are running and database is available, to access the user web interface, a user must navigate to the public DNS of the EC2 instance that contains the public user web interface (http://ec2-52-203-217-34.compute-1.amazonaws.com), then users are prompt into the index page, where they can see all the pizzas available, if they want to add a pizza, they must click the “Add Pizza” button and fill up the title, and ingredients (comma separated) then press the “Submit” button to add the pizza to the system. After the pizza is created, it will be displayed in the index page.

To reach the admin interface, a user must navigate to the public DNS related to it (http://ec2-18-212-167-238.compute-1.amazonaws.com/), once there, admin users can add pizzas following the same steps as for public users, also, admin users can delete pizzas from the system by clicking in the “MORE INFO” link at the bottom of the pizza description, that link will take you to a page where you can see the details of the pizza and a “delete” button to remove the pizza from the system. 
