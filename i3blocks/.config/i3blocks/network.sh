nmcli connection show --active | awk 'NR==2{ if ($3 == "wifi") printf "W: %s\n", $1; else if ($3 == "ethernet") printf "E: %s\n", $1; else print "" }' -
