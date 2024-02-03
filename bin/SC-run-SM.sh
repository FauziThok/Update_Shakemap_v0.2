#! /bin/bash

# # convert time UTC to WIB
python /home/sysop/bin/extract_id.py

# # runing shakemap
python rename_folder.py
cd ~/shakemap/bin
./shake -event $(ls -t /home/sysop/seiscomp/shakemaps/data  | head -1)

# back up real event to output
cp /home/sysop/data/event2.xml /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/input/event.xml

# create header
bash /home/sysop/bin/create_header.sh

#############################################################
#####    adding new header on normal map  ###################
#############################################################
composite -geometry '2000x+280+390' -density 300 /home/sysop/bin/map_header.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/intensity.ps /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/download/intensity_logo.jpg
composite -geometry '2250x+150+2850' -density 300 /home/sysop/bin/lib/imgs/shakemap-legend-new-03.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/download/intensity_logo.jpg /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/download/intensity_logo.jpg
convert /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/download/intensity_logo.jpg -crop +100+400 -crop -30-40 /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/download/intensity_logo.jpg

# adding north_arrow
composite -geometry '67x+467+2030' -density 300 /home/sysop/bin/lib/imgs/north_sign.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/download/intensity_logo.jpg /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/download/intensity_logo.jpg

# # zoom in map
cp -r /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data  | head -1) /home/sysop/seiscomp/shakemaps/temp/.
/home/sysop/shakemap/bin/../bin/grind -event $(ls -t /home/sysop/seiscomp/shakemaps/data  | head -1) -qtm -xml -gmpesc -psa -lonspan 2.0 -psa
./shake -event $(ls -t /home/sysop/seiscomp/shakemaps/data  | head -1)

#############################################################
#####    adding new header on zoomin map  ###################
#############################################################
composite -geometry '2000x+280+390' -density 300 /home/sysop/bin/map_header.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/intensity.ps /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomin.jpg"
composite -geometry '2250x+150+2850' -density 300 /home/sysop/bin/lib/imgs/shakemap-legend-new-03.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomin.jpg" /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomin.jpg"
convert /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomin.jpg" -crop +100+400 -crop -30-40 /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomin.jpg"

# adding north_arrow
composite -geometry '67x+467+2030' -density 300 /home/sysop/bin/lib/imgs/north_sign.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomin.jpg" /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomin.jpg"

cp /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomin.jpg" /home/sysop/seiscomp/shakemaps/temp/$(ls -t /home/sysop/seiscomp/shakemaps/temp | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/temp | head -1)/download/.

/home/sysop/shakemap/bin/../bin/grind -event $(ls -t /home/sysop/seiscomp/shakemaps/data  | head -1) -qtm -xml -gmpesc -psa -lonspan 10.0 -psa
./shake -event $(ls -t /home/sysop/seiscomp/shakemaps/data  | head -1)

#############################################################
#####    adding new header on zoomout map  ##################
#############################################################
composite -geometry '2000x+280+390' -density 300 /home/sysop/bin/map_header.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/intensity.ps /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomout.jpg"
composite -geometry '2250x+150+2850' -density 300 /home/sysop/bin/lib/imgs/shakemap-legend-new-03.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomout.jpg" /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomout.jpg"
convert /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomout.jpg" -crop +100+400 -crop -30-40 /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomout.jpg"

# adding north_arrow
composite -geometry '67x+467+2030' -density 300 /home/sysop/bin/lib/imgs/north_sign.png /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomout.jpg" /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomout.jpg"

cp /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1)/mapping/"intensity_logo_zoomout.jpg" /home/sysop/seiscomp/shakemaps/temp/$(ls -t /home/sysop/seiscomp/shakemaps/temp | head -1)/genex/web/shake/$(ls -t /home/sysop/seiscomp/shakemaps/temp | head -1)/download/.

rm -r /home/sysop/bin/map_header.png

rm -r /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/temp | head -1)
mv /home/sysop/seiscomp/shakemaps/temp/$(ls -t /home/sysop/seiscomp/shakemaps/temp | head -1) /home/sysop/seiscomp/shakemaps/data/.
python /home/sysop/bin/SM_python/zoom_broadcast.py

# archiving shakemap
cp -r /home/sysop/seiscomp/shakemaps/data/$(ls -t /home/sysop/seiscomp/shakemaps/data | head -1) /home/sysop/seiscomp/shakemaps/shakemap_archive/

# runing report script
python /home/sysop/bin/SM_python/main.py




