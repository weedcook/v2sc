#!/bin/bash

# A simple bash script of toggle for v2ray-core service
# Written by ISNTL <?>

declare readonly script_name=v2sc

tip_help()
{
	cat <<EOF
A simple bash script of toggle for v2ray-core service client/server

Usage: ls [OPTION]...

  help,   -h, --help     get more help for script command,
                         yes it is this
  status, -e  --status   check $service_name service run status
  start,  -s  --start    start core service, do not mult-
                         only_single_service(1)
  list,   -l, --list     show node config files,
                         use [--..] --all to show alls
  stop,   -S  --stop     kill started service
  kill,   -k, --kill     same as '--stop', more read 'man kill'

Example:

  $script_name --help
  $script_name --kill
  $script_name --start

only_single_service(1):
  mult-service define by user-self

IDK(2):
  "I Do Not Know"
  Some error, define by user-self

REPORTING BUGS:
  Please send bug or TODO reports to <l_.ll@hotmail.com>

Source Code <https://github.com/Eqpoqpe/v2ctl>
Thanks for John G. Wick <?>
EOF
}

declare core_dir=$HOME/.config/sstp/protocol/v2ray-core/v2ray
declare select_node_dir=$HOME/.config/sstp/node/0/config1.json
declare log_null_dir=/dev/null

declare exists=1
declare nexists=1

if [ ! -e $core_dir ]; then
	echo "$script_name: cannot access important files: No such file"
	echo "-> $core_dir"
	exists=0
fi

if [ ! -n "$select_node_dir" ]; then
	echo "Warning: single_node_dir undefine"
	echo "Exit.. protect task"
	nexists=0
fi

if [ -n "$select_node_dir" ] && [ ! -e $select_node_dir ]; then
	echo "$script_name: cannot access important files: No such file"
	echo "-> $select_node_dir"
	nexists=0
fi

if [ -n "$service_name" ]; then
	service_name=$service_name
else
	service_name=v2ray
fi

logger()
{
	if [ -n "$log_dir" ] && [ -e ${log_dir%/*} ]; then
		echo $log_dir/log
	else
		echo $log_null_dir
	fi
}

check_proc()
{
	if [ -n "`pidof $service_name`" ]; then
		echo 0
	elif [ ! -n "`pidof $service_name`" ]; then
		echo 1
	fi
}

declare readonly inter_log_dir=$(logger)
declare readonly ini_pid=$(check_proc)

lstop()
{
	if [ $1 -eq 0 ]; then
		kill $2 `pidof $service_name` && notify-send \
			-i important \
			-t 3000 \
			"v2ctl" \
			"Services Stopped"
	elif [ $1 -eq 1 ]; then
		# TODO del
		#echo "It's already stopped";
		notify-send \
			-i important \
			-t 3000 \
			"v2ctl" \
			"It's already stopped"
	else
		echo "IDK"
	fi
}

list()
{
	exit
}

if [ -n "$1" ]; then
	case "$1" in
		"--help"|"-h"|"help") tip_help ;;
		"--status"|"-e"|"status") 
			if [ $ini_pid -eq 0 ]; then
				notify-send \
					-i important \
					-t 3000 \
					"v2ctl" \
					"Service $service_name is running"
			elif [ $ini_pid -eq 1 ]; then
				notify-send \
					-i important \
					-t 3000 \
					"v2ctl" \
					"Service is stopped"
			fi
				;;
		"--start"|"-s"|"start")
			if [ $ini_pid -eq 0 ]; then
				notify-send \
					-i important \
					-t 3000 \
					"v2ctl" \
					"It's already running"
			elif [ $ini_pid -eq 1 ] && [ $nexists -eq 1 ]; then
				`${core_dir} -c ${select_node_dir} > \
					$inter_log_dir 2>&1 &` && \
					notify-send \
					-i important \
					-t 3000 \
					"v2ctl" \
					"Start Services Sucessfull"
			fi
			;;
		#"--add"|"-a"|"add") ;;
		"--stop"|"-S"|"stop") lstop `check_proc` ;;
		"--kill"|"-k"|"kill") lstop `check_proc` -9 ;;
		*) tip_help ;;
	esac
else
	if [ $ini_pid -eq 1 ] && [ $exists -eq 1 ] && [ $nexists -eq 1 ]; then
		`${core_dir} -c ${select_node_dir} > $inter_log_dir 2>&1 &`
		sleep 0.5
		notify-send \
			-i important \
			-t 3000 \
			"v2ctl" \
			"No options, defaults start services LOG: \
			$inter_log_dir"
	elif [ $ini_pid -eq 0 ]; then
		notify-send \
			-i important \
			-t 3000 \
			"v2ctl" \
			"It's already start"
	fi
fi
