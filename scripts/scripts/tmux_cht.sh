# !/usr/bin/env bash

# Use fzf to get the language
languages=`echo "python scala go cpp nodejs javascript rust" | tr ' ' '\n'`
core_utils=`echo "bash git xargs find sed awk grep" | tr ' ' '\n'`
selected=`printf "$core_utils\n$languages" | fzf`

if [ -z $selected ] 
then
    echo $selected
    exit 0
fi

echo $selected

# Use read to get the input query
read -p "query: " query 
query=`echo $query | tr ' ' '+'`

# Format the chtsht url
# Wait until we quit and the tmux window will close automatically
if echo $core_utils | grep -qs $selected; then
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done" 
fi

