#!/bin/bash

#check if mouseclick is running, in that case kill it and stop process
if [ $(pgrep mouseclick|wc -l) -gt 2 ]; then
echo "o"$(pgrep mouseclick)
echo $(pgrep mouseclick|wc -l)
	kill $(pgrep mouseclick)
	exit 0
fi


dir_users="/var/cache/"
file_stop_programa="${dir_users}stop"
times="3" #integer - seconds to check mouse position and create the click (2==1second  4==2second)
lastClicked=false #bolean true if last time was clicked
lastMouseDown=false
sleepTime=0.13
exists_xdotool=`which xdotool |wc -l`
if [ "$exists_xdotool" != "1" ]; then
	sudo apt-get -y install xdotool
fi

while [ ! -f "$file_stop_programa" ]; do
	count=0
	while [ "$count" != "$times" ]; do
		pos[$count]=$(xdotool getmouselocation 2>&1 | sed -rn '${s/x:([0-9]+) y:([0-9]+) .*/\1 \2/p}')
		count=$((count+1))
		#check pos
		len=${#pos[*]}  # it returns the array length

		stop=true
		old=${pos[0]}
		for (( i=0; i<len; i++ ));do
			if [ "$old" != "${pos[$i]}" ]; then
				stop=false
				lastClicked=false	
			fi
			old=${pos[$i]}
		done
		caplock=$(xset q | grep "Caps Lock:" | awk '{print $4}' | grep -c on) #detect cap lock (Mouse down)
		
		if [ "$caplock" -eq "1" ]; then
			if [ "$lastMouseDown" != "true" ]; then
				xdotool mousedown 1
				echo "mousedown"
				lastMouseDown=true
			fi
		fi
		if [ "$stop" == "true" ]; then
			if [ "$lastClicked" == "false" ]; then
				#mouse click
				if [ "$caplock" != "1" ]; then
					if [ "$lastMouseDown" != "true" ]; then
						xdotool click 1
						echo "mouse click"
					fi
				fi
			fi
			lastClicked=true
		fi
		if [ "$lastMouseDown" == "true" -a "$caplock" != "1" ]; then
			xdotool mouseup 1
			echo "mouseup"
			lastMouseDown=false
		fi
		
		sleep $sleepTime 
	done
done
