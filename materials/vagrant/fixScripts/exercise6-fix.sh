#!/bin/bash
#add fix to exercise6-fix here
duplicate(){
	if [ $HOSTNAME == "server1" ]; then
		scp $1 $2 vagrant@server2:$3
	else;then
		scp $1 $2 vagrant@server1:$3
	fi
}
duplicate
echo $(( $(wc -c < $1) + $(wc -c < $2)))
