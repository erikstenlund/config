#!/bin/sh
while read line; do
	tmp=($line)
	declare ${tmp[0]}=${tmp[1]}
done < ~/.i3/i3_profile

echo $background
[ -z "$background" ] || feh --bg-scale $background
