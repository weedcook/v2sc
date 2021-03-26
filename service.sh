#!/bin/bash

# Written by ISNTL <eqpoqpe@gmail.com>

#core_dir=
#node_dir=
#logs_dir=
#null_log_dir=
#cache_dir=$HOME/.cache/v2clidefault

script_name=v2cli
service_name=v2ray
#glable_env=

out_put()
{
	if [ $1 = status ]; then
		case "$2" in
			"running") cat <<EOF
`date`
 * STATUS [ $service_name ]
 It is already running with PID $1
 CONFIG -> $2
 LOG -> $3
$4
EOF
;;
			"stopped") cat <<EOF
`date`
 * STATUS [ $service_name ]
 It is stopped
EOF
;;
		esac
	elif [ $1 = help ]; then
		cat <<EOF
A simple bash script of toggle for v2ray-core service client/server

Usage: ls [OPTION]...

  help,   -h, --help     get more help for script command,
                         yes it is there
  status, -e  --status   check $service_name service run status
                         is the files already exists
  start,  -s  --start    start core service, do not mult-
                         only_single_service(1)
  list,   -l, --list     show node config files
  reset,  -r, --reset    select new node config
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
  Please send bug or TODO reports to <eqpoqpe@gmail.com>

Source Code <https://github.com/Eqpoqpe/v2rcli>
Thanks for John G. Wick <?>
EOF
	fi
}

lstatus()
{
	# log and run
	run_val=$(pidof $service_name)
	if [ -n "$run_val" ]; then
		echo $run_val
	else
		echo "stopped"
	fi
}

lshow()
{
}

lselect()
{
}

if [ -n "$1" ]; then
	case "$1" in
		"help"|"-h"|"--help") out_put "help";;
		"status"|"-e"|"--status") ;;
		"start"|"-s"|"--start") ;;
		"list"|"-l"|"--list") ;;
		"reset"|"-r"|"--reset") ;;
		"stop"|"-S"|"--stop") ;;
		"kill"|"-k"|"--kill") ;;
	esac
fi
