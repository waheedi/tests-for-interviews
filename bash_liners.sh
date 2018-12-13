cat access.log | awk '{print $1 " " $6}' |  awk '{ gsub(/\"/,"")}1' | sort | uniq -c | sort -r -k 1 -n | head -10 | sed -e 's/^[ \t]*//'
