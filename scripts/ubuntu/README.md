# Ubuntu general purpose scripts

## Add swap space

[add_swap_space.sh](add_swap_space.sh) script is designed to create and enable a swap file on a Ubuntu system. Swap files are used to supplement physical memory (RAM)# by providing additional virtual memory. The script calculates the swap size based on the system's total memory and creates a swap file of the same size. It then sets the correct permissions, marks the file as swap space, enables the swap file, and makes it permanent by adding an entry to the /etc/fstab


```
./add_swap_space.sh
```

Dependencies:

- Sufficient disk space to create the swap file.

