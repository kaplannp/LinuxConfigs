#!/usr/bin/python3

'''
The free spirit and cooperation that was once the soul of git was recently bought out by Microsoft.
This marks a new age of oppression and coporate control of the opensource community. The first
demonstration of this is in Mircosofts insistence that everyone use a git PAT instead of the 
traditional username and password, yet they have neglected to provide a suitable way to cache
such credentials for linux!
This script is a remedy to this problem. It is used in conjunction with passwords and keys to 
securely cache a PAT and autofill git credentials. May it serve you well

If called with no arguments, as it should be from the git credential.helper, it will print
your PAT and username.
If called with -p [PAT], (pass) a new entry will be created in your default 
libsecret collection with 
the name 'gitPAT' for use by this program. If there was a previous entry with 'gitPAT', it will 
delete that entry
If called with -u [username] (user) a new username will be stored (in plain text) in this directory
If called without any arguments, the known user and password will be returned
@author Noah Kaplan
'''

import sys
import os
import secretstorage
import getopt

def main():
    metadata_filepath = os.path.join(os.path.dirname(\
           os.path.realpath(__file__)),'.meta.txt')
    try:
        opts, args = getopt.getopt(sys.argv[1:], 'p:u:')
    except getopt.GetoptError as err:
        print(err)
        sys.exit(2)
    opts = {key:val for key,val in opts}
    if '-p' in opts:
        PAT = opts['-p']
        connection = secretstorage.dbus_init()
        collection = secretstorage.get_default_collection(connection)
        old_PAT = [item for item in collection.get_all_items() if item.get_label() == 'gitPAT']
        if old_PAT:
            response = input("There already exists an entry with the name 'gitPAT'. This operation will overwrite that entry. Enter 'n' to abort or 'y' to proceed ")
            if response == 'y':
               old_PAT = old_PAT[0]
               old_PAT.delete()
            else:
                print('aborting password store')
                return
        collection.create_item('gitPAT', {'description':'used to store git PAT'}, PAT)
        connection.close()
    if '-u' in opts:
        with open(metadata_filepath, 'w') as metadata:
            metadata.write(opts['-u'])
    if not opts:
        try:
            connection = secretstorage.dbus_init()
            collection = secretstorage.get_default_collection(connection)
            item = [item for item in collection.get_all_items() if item.get_label() == 'gitPAT'][0]
            PAT = item.get_secret().decode('utf8')
        except:
            raise Exception('Couldn\'t find a stored PAT. Try running this script with -p [PAT]')
        try:
            with open(metadata_filepath, 'r') as metadata:
                user = metadata.readline()
        except FileNotFoundError:
            raise Exception('Could not locate user name. Try running this script with -u [username]')
        connection.close()
        print('username={}'.format(user))
        print('password={}'.format(PAT))

if __name__ == '__main__':
    main()
