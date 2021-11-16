### Create user

Let's create few users here:

Admin: Can access anything in databases
<br />
Sales: Can access to customers info and products info
<br />
HR: Can only access to staffs info
<br />

#### Create admin account:<br />
Run `create user 'admin'@'localhost' identified by 'admin';`{{execute}}

#### Create sales account:<br />

Run `create user 'sales'@localhost' identified by 'sales';`{{execute}}

#### Create hr account:<br />
Run `create user 'hr'@'localhost' identified by 'hr';`{{execute}}


 ### Grant privileges

Grant all privileges to admin:
Run `grant all privileges on company.* TO 'admin'@'localhost';`{{execute}}

Sales need to check and modify by insert company's product and customer, so give access of customer and product tables to sales account:

Run `grant insert, update, select on company.customer TO 'sales'@'localhost';`{{execute}}
Run `grant insert, update, select on company.product TO 'sales'@'localhost';`{{execute}}

HR only need to modify the staff table. Therefore grant access for hr to staff:

Run `grant insert, update, select on company.staff TO 'hr'@'localhost';`{{execute}}

Finally use flush command to complete the privilege granting session:
Run `FLUSH PRIVILEGES;`{{execute}}
