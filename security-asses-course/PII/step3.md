</br>

## Step 3:

</br>

#### 1. Select your preferred WordPress language (English)

![Image](./step3photo/pII2.png)


#### 2. Enter the information needed by the WordPress (Site title, username, password and email)

Username and password can use the following:

Username: polyu_admin

(Use your own username during your OWN setup)

Password: $YOnq0I0krJ912Pntj

(Use the generated password during your OWN set up, it creates strong and unpredictable passwords for your admin account)

![Image](./step3photo/pII3.png)

</br>

#### 3. Click "Install WordPress" to continue

![Image](./step3photo/pII4.png)

</br>

#### 4. Click "Login" to continue

![Image](./step3photo/pII5.png)

</br>

#### 5. Fill in the login credentials that we set up in step 2 and login into the dashboard

Username: polyu_admin

Password: $YOnq0I0krJ912Pntj

![Image](./step3photo/pII6.png)

</br>

#### 6.Setup WooCommerce

![Image](./step3photo/pII7.png)

</br>

#### 7. Search Personal Personally identifiable information (PII) 

On the WooCommerce order page, it is available to search order information from the customer.The order information: address,email,name,phone number.

![Image](./step3photo/pII8.png)

</br>

#### 8. Search PII in MySQL

</br>

##### Login to MySQL

`docker exec -it mysql -u root -p`{{execute}}

</br>
##### Select customer data

`use wordpress SELECT * FROM wp_wc_customer_lookup;`{{execute}}

</br>
##### Check the result

![Image](./step3photo/pII9.png)


