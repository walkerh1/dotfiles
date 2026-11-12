# Get volume and format it for the volume block.
wpctl get-volume @DEFAULT_SINK@ |  awk '{if ($3 == "[MUTED]") print "Vol: muted"; else printf "Vol: %d%%\n", 100 * $2 }' -
