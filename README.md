#DELETE ORPHANED INDEPENDENT DISKS


This script takes an input file (disks.txt) with a list of vCloud
Independent disk IDs and compares it to the list of Independent Disks in
a VDC. 

Any Disks NOT in the disks.txt file which DO exist in vCloud Director
will be DELETED!!

USE WITH CAUTION
