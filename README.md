#DELETE ORPHANED INDEPENDENT DISKS


This script takes an input file (disks.txt) with a list of vCloud
Independent disk IDs and compares it to the list of Independent Disks in
a VDC. 

Any Disks NOT in the disks.txt file which DO exist in vCloud Director
will be DELETED!!

USE WITH CAUTION


##How To Use

Clone this repo:
```
git clone git@github.com:UKCloud/orphaned_disks.git
```

This script relies on a modified version of the ruby_vcloud_sdk which
you will also need to clone:

```
git clone git@github.com:UKCloud/ruby_vcloud_sdk.git
```

then checkout the correct branch:

```
cd ruby_vcloud_sdk
git checkout list_returns_disk_objects
```


Now go back to the script directory and install the Gem dependencies:

```
cd ../orphaned_disks
bundle install
```


Then edit the 'orphaned_disks.rb' file to add your credentials etc


Ensure that a file called 'disks.txt' exists in the current directory
with a single column of disk IDs as the contents

Then run the script with:

```bundle exec ruby orphaned_disks.rb```


A file called 'orphaned_disks.txt' will be created in the current
directory listing all disks that could NOT be matched with the IDs in
'disks.txt'
You will also be prompted to ask if you wish to delete the identified
orphaned disks. If you type 'yes' then the script will delete the disks
without further prompt. I'd suggest running with 'no' first and checking
the results.


