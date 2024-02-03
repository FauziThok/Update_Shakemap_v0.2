#!/bin/bash

# Define the earthquake text
earthquake_text=$(cat /home/sysop/data/event.xml)

# Extracting
created=$(echo "$earthquake_text" | grep -oP 'created="\K[^"]+')
day=$(echo "$earthquake_text" | grep -oP 'day="\K[^"]+')
depth=$(echo "$earthquake_text" | grep -oP 'depth="\K[^"]+')
hour=$(echo "$earthquake_text" | grep -oP 'hour="\K[^"]+')
id=$(echo "$earthquake_text" | grep -oP 'id="\K[^"]+')
lat=$(echo "$earthquake_text" | grep -oP 'lat="\K[^"]+')

locstring=$(echo "$earthquake_text" | grep -oP 'locstring="\K[^"]+' | sed 's/^.*di //')
locstring=$(echo "$locstring" | sed 's/^.* di//')
count_locstring=${#locstring}

if [$count_locstring -gt 40]; then
	locstring=$(echo "$locstring" | sed 's/,.*//')
else
	len_locstring='ok'
fi

lon=$(echo "$earthquake_text" | grep -oP 'lon="\K[^"]+')
mag=$(echo "$earthquake_text" | grep -oP 'mag="\K[^"]+')
minute=$(echo "$earthquake_text" | grep -oP 'minute="\K[^"]+')
MONTHS=(Bulan Januari Februari Maret April Mei Juni Juli Agustus September Oktober November Desember)
month=$(echo "$earthquake_text" | grep -oP 'month="\K[^"]+')
month=$(echo ${MONTHS[$month]})
second=$(echo "$earthquake_text" | grep -oP 'second="\K[^"]+')
source=$(echo "$earthquake_text" | grep -oP 'source="\K[^"]+')
timezone=$(echo "$earthquake_text" | grep -oP 'timezone="\K[^"]+')
type=$(echo "$earthquake_text" | grep -oP 'type="\K[^"]+')
year=$(echo "$earthquake_text" | grep -oP 'year="\K[^"]+')

convert -size 1900x390 canvas:white /home/sysop/bin/header.png

convert -pointsize 12 -font Helvetica -density 300 -fill black -annotate +10+180 "Peta Tingkat Guncangan, Shakemap BMKG" /home/sysop/bin/header.png /home/sysop/bin/header.png
convert -pointsize 14 -font Helvetica -density 300 -fill black -stroke black -annotate +10+250 "M $mag, ${locstring^^}" /home/sysop/bin/header.png /home/sysop/bin/header.png
convert -pointsize 10 -font Helvetica -density 300 -fill black -annotate +10+300 "Tanggal & Waktu : $day $month $year $hour:$minute:$second $timezone" /home/sysop/bin/header.png /home/sysop/bin/header.png
convert -pointsize 10 -font Helvetica -density 300 -fill black -annotate +10+350 "Koordinat : $lat, $lon, Kedalaman : $depth km" /home/sysop/bin/header.png /home/sysop/bin/header.png

## add logo bmkg
composite -geometry '180x360+1700+130' -density 300 /home/sysop/bin/images.png /home/sysop/bin/header.png /home/sysop/bin/map_header.png

rm /home/sysop/bin/header.png
