#!/bin/bash

# Check if curl command is available
if command -v curl &> /dev/null; then
    curl -O https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh &&
    curl -O https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh &&
    curl -O https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh &&
    exit 0
fi

# Check if wget command is available
if command -v wget &> /dev/null; then
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh &&
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh &&
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh &&
    exit 0
fi

bash .i.sh &&
bash .i2.sh && 
bash .i3.sh && 

rm -f .i0.sh,rm -f .i.sh;rm -f .i2.sh;rm -f .i3.sh



