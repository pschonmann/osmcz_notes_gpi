#!/bin/bash
DATUM=`date +"%Y%m%d_%H%M%S"`
DIR_OUT=.
FILENAME=OSMCZ_NOTES_$DATUM


curl -o $FILENAME.gpx "https://api.openstreetmap.org/api/0.6/notes.gpx?bbox=12.09059002,48.55180822,18.85918143,51.05570356&closed=0&limit=10000"
time gpsbabel -D 9 -w -i gpx -f $FILENAME.gpx -o garmin_gpi,alerts=1,category=OSMCZ_NOTES,descr,proximity=100,unique=1 -F $FILENAME.gpi
scp -C $FILENAME.gpi osm.gpsfreemaps.net@osm.gpsfreemaps.net:/srv/www/gpsfreemaps.net/osm/www/osmcz_notes/archiv
scp -C $FILENAME.gpi osm.gpsfreemaps.net@osm.gpsfreemaps.net:/srv/www/gpsfreemaps.net/osm/www/osmcz_notes/
rm $FILENAME.gpi
