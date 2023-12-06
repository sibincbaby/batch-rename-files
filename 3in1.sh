#!/bin/bash
# Check if the script was accessed using curl
if [ -n "$CURL" ]; then
    curl https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh -O .i.sh &&
    curl https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh -O .i2.sh &&
    curl https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh -O .i3.sh &&
    exit 0
fi

# Check if the script was accessed using wget
if [ -n "$WGET" ]; then
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh -O .i.sh &&
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh -O .i2.sh &&
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh -O .i3.sh &&
    exit 0
fi
bash .i.sh &&
bash .i2.sh && 
bash .i3.sh && 

rm -f .i.sh;rm -f .i2.sh;rm -f .i3.sh



