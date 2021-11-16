### **3. Introduction Brute-Force Attack**
---

### **What is Brute-force attack?**
```
Brute-force attack means the attacker submits a huge number of passwords or usernames to guess the username and password correctly. 
```
 Now let try to enforce the brute-force attack to the WordPress website we have just created.
<br></br>
### Step 1:
 Download the WPscan using the command:

`gem install wpscan`{{execute}}
### Step 2:
 Clone the crack.txt file which includes a list of password from Github using the command:
`git clone https://github.com/tonywong586/CrackList.git`{{execute}}
<br></br>
access the CrackList file using the following command:

`cd CrackList`{{execute}}
<br></br>

### Step 4:
 Use the following command to enforce the Brute-force attack
`
wpscan --url https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com --passwords crack.txt
`{{execute}}

 If your password is included in the list of the crack.txt, After the brute-force attack command run you will see the password and username of the user that you created like the following image:

![Image](./assets/CrackedAc.png)

If it shows your username and password correctly mean that your password is leaked by the brute-force attack
