#!/bin/bash

# Ubuntu-Gnome-Desktop (https://ishwarjagdale.github.io/wslWithGUI/)
${APT_INSTALL} xrdp
${APT_INSTALL} ubuntu-gnome-desktop


# Take a backup of the xrdp first
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak

# Change the default rdp port to 3390 (optional)
# sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini

# The rdp connection will be local so why not better image quality
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
 
# Edit the xrdp window manager
#sudo nano 

filename="/etc/xrdp/startwm.sh"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Get the total number of lines in the file
total_lines=$(wc -l < "$filename")

# Calculate the range of lines to comment out (last two lines)
start_line=$((total_lines - 1))
end_line=$total_lines

# Comment out the lines using sed
sed -i "${start_line},${end_line}s/^/#/" "$filename"

# Now, configure XRDP for a 'gnome-session'
echo "gnome-session" >> $filenameif [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Get the total number of lines in the file
total_lines=$(wc -l < "$filename")

# Calculate the range of lines to comment out (last two lines)
start_line=$((total_lines - 1))
end_line=$total_lines

# Comment out the lines using sed
sed -i "${start_line},${end_line}s/^/#/" "$filename"

echo "Last two lines of '$filename' commented out successfully."

# exec /bin/sh /etc/X11/Xsession
gnome-session

echo
echo "!!!!! restart WSL"
echo "!!!!! then, run 'sudo /etc/init.d/xrdp start'"
echo "!!!!! then, connect from Windows RDP using 'localhost:3389'"
echo

