#!/bin/bash

function SimulatorIsRunning()
{
	ps aux | grep -q '[I]nstruments\|[i]Phone Simulator'
	return $?
}

if SimulatorIsRunning;
then
	echo Attempt to stop Simulator and Instruments via AppleScript
osascript <<EOF
	  tell application "iPhone Simulator" to quit
EOF
osascript <<EOF
	  tell application "Instruments" to quit
EOF

	# give simulator a few seconds to quit
	TRIES=0
	until [ $TRIES -gt 20 ]; do
		if SimulatorIsRunning;
		then
			sleep .2
			let TRIES=TRIES+1
		else
			break
		fi
	done

	if SimulatorIsRunning;
	then
		echo Still alive, sending terminate signal
		TRIES=0
		until [ $TRIES -gt 30 ]; do
			if SimulatorIsRunning;
			then
				killall "Instruments" &> /dev/null
				killall "iPhone Simulator" &> /dev/null
				sleep .5
				let TRIES=TRIES+1
			else	
				# process is killed
				break
			fi
		done

		if SimulatorIsRunning;
		then
			echo Still alive, sending kill signal
			killall -9 "Instruments" &> /dev/null
			killall -9 "iPhone Simulator" &> /dev/null
			sleep 1
		fi

		if SimulatorIsRunning;
		then
			# still running?! bail out!
			echo "Can't kill simulator process"
			exit 1
		fi
	fi
fi
