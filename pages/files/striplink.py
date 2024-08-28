#!/usr/bin/python3

try:
    # open the raw link file
    with open('rawlink.txt', 'r') as f:
        link = f.read().strip()
        
    # strip and write to new file
    with open('link.txt', 'w') as f:
        f.write(link)

# return 1 is any issues occur
except:
    exit(1)

# exit success
exit(0)