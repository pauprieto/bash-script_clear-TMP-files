#=============================================================================#
#                         Temporary File Cleanup Tool                         #
#                         Version 1.0 by Paula Prieto                         #
#                                                                             #
#  Output to new log file:                                                    #
#  If .TMP file exists: Date & lists deleted files                            #
#  If .TMP files do not exist: Date & no tmp files deleted                    #
#=============================================================================#

# Variable with path
find_tmp=$(/usr/bin/find /tmp -name '*.TMP')

# Variable with current date
current_date=$(date '+[%a %b%e %T %Y]')

# Check find_tmp is not mpty
if [ -n "$find_tmp" ]; then
  # Print current date variable and string
  printf "$current_date %sDeleted files:" >> /var/log/tmp_cleanup.log 2>&1
  # Iterates throuh file list
  for file in $find_tmp; do
    filename=$(basename $file)
    # Prints filename to log
    printf " %s" "$filename" >> /var/log/tmp_cleanup.log 2>&1
    # Removes tmp file
    rm "$file"
  done
  printf "\n" >> /var/log/tmp_cleanup.log 2>&1
else
  # Prints current date variable and string
  echo "$current_date No temp files found" >> /var/log/tmp_cleanup.log 2>&1
fi
