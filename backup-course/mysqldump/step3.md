## **Encrypt the backup file by using OpenSSL**
---
## 1. Encrypt the WordPress backup file
In this part, we would like to use OpenSSL for doing file encryption. The high secure cryptographic keys of 256bit would be chosen for doing the encryption.

Using the following command for encrypting the `wordpress_backup.sql` file.
<br>
`openssl enc -aes-256-cbc -in wordpress_backup.sql -out wordpress_backup.enc`{{execute}}

The password of aes-256-cbc encryption is:
<br>
`d2Oqadruj9*`{{execute}}

The password of Verifying - enter aes-256-cbc encryption is:
<br>
`d2Oqadruj9*`{{execute}}

As for the command:
<ul>
</ul>