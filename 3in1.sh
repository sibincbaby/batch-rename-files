#!/bin/bash

# Check if curl command is available
if command -v curl &> /dev/null; then
    curl -L -o .i1.sh https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh && 
    curl -L -o .i2.sh https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh &&
    curl -L -o .i3.sh https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh &&
    exit 0
fi

# Check if wget command is available
if command -v wget &> /dev/null; then
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh -O .i1.sh &&
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh -O .i2.sh &&
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh -O .i3.sh &&
    exit 0
fi

bash .i1.sh &&
bash .i2.sh && 
bash .i3.sh && 

rm -f .i0.sh,rm -f .i1.sh;rm -f .i2.sh;rm -f .i3.sh



