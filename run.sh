#!/bin/bash
### Update shakemap design

### Setting GMT ###
gmt set FONT_ANNOT_PRIMARY 14p,Helvetica,black
gmt set FONT_ANNOT_SECONDARY 14p,Helvetica,black
gmt set FONT_LABEL 16p,Helvetica,black
gmt set FONT_LOGO 8p,Helvetica,black
gmt set FONT_TITLE 24p,Helvetica,black
gmt set MAP_ANNOT_OFFSET_PRIMARY 5p
gmt set MAP_ANNOT_OFFSET_SECONDARY 5p
gmt set MAP_LABEL_OFFSET 8p
gmt set MAP_TITLE_OFFSET 14p
gmt set MAP_FRAME_WIDTH 5p
gmt set MAP_FRAME_PEN thicker,black


# GitHub repository URL
repo_url="https://github.com/FauziThok/Update_Shakemap_v0.2.git"

# Specify the target directory
target_directory="/home/sysop"

# Navigate to the target directory
cd "$target_directory" || exit

# Clone the GitHub repository
git clone "$repo_url" .

# Print a message indicating successful download
printf "Repository downloaded and placed in $target_directory \n"

## Create backup files
mv /home/sysop/bin/SC-run-SM.sh /home/sysop/bin/SC-run-SM.sh.old
mv /home/sysop/shakemap/bin/mapping /home/sysop/shakemap/bin/mapping.old
mv /home/sysop/shakemap/config/mapping.conf /home/sysop/shakemap/config/mapping.conf.old
mv /home/sysop/shakemap/config/genex.conf /home/sysop/shakemap/config/genex.conf.old

printf "Backup files created for \n"
printf "/home/sysop/bin/SC-run-SM.sh >> /home/sysop/bin/SC-run-SM.sh.old\n"
printf "/home/sysop/shakemap/bin/mapping >> /home/sysop/shakemap/bin/mapping.old\n"
printf "/home/sysop/shakemap/config/mapping.conf >> /home/sysop/shakemap/config/mapping.conf.old\n"
printf "/home/sysop/shakemap/config/genex.conf >> /home/sysop/shakemap/config/genex.conf.old\n"

chmod -R 777 Update_Shakemap_v0.2

## Updating shakemap
# Source directory
source_bin="/home/sysop/Update_Shakemap_v0.2/bin"
source_shakemap="/home/sysop/Update_Shakemap_v0.2/shakemap"

# Destination directory
destination_bin="/home/sysop/bin"
destination_shakemap="/home/sysop/shakemap"

# Use rsync to copy files
rsync -a "$source_bin/" "$destination_bin"
rsync -a "$source_shakemap/" "$destination_shakemap"

# Print a message indicating successful copy
printf "Files copied from $source_bin to $destination_bin \n"
printf "Files copied from $source_shakemap to $destination_shakemap \n"