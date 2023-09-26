# Git Authenticator For Ubuntu  
The script in this repository can be used on Ubuntu 20.04 to store encrypted passwords using libsecret in your Passwords and keys. Right now multiple PAT's for the same computer user are not supported  
### Instalation Procedure  
1. Download or clone this repository to your machine
2. Make the script executable and replace the shebang with the path to your python
3. Add your git PAT to libsecret by running the script with -n [your PAT]. Read the header comment of the script for details 
4. Add your git username (saved in plaintext) by running the script with -n [your username]
5. Add this script as your credential helper with the command 'git config credential.helper /The/Path/To/Your/File/ubuntu-git-authenticator/git-credential-authenticator.py'
6. That's it! You never need to enter your password again!
