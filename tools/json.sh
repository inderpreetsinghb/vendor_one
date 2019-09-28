#!/bin/bash
echo "{ \"response\": [ { \"datetime\": $(grep ro\.build\.date\.utc $OUT/system/build.prop | cut -d= -f2), \"filename\": \"$(basename $(ls $OUT/OneOS*.zip))\", \"id\": \"$((md5sum $OUT/OneOS*.zip) | cut -d ' ' -f1)\", \"size\": $(stat -c%s $OUT/OneOS*.zip), \"version\": \"9.0-STABLE\"  }]}" | tee $OUT/update
