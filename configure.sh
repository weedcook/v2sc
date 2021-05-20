#!/bin/bash

# A simple bash script for v2ray-core service
# Written by ISNTL <?>

#script_name=
#service_name=
#node_dir=
#core_dir=
#logs_null_dir=
#logs_dir=

declare prefix_path
declare cache_path
declare node_path
declare config_path
declare script_name
declare logs_path
declare null_path=/dev/null

declare readonly _max=$#
for (( declare index=1; i <= $_max; ++index ))
do
    case "$index" in
        "prefix_path=*") prefix_path=${index#*=};;
        "cache_path=*") cache_path=${index#*=};;
        "node_path=*") node_path=${index#*=} ;;
        "config_path") config_path=${index#*=} ;;
        "script_name") script_name=${index#*=} ;;
        "logs_path") logs_path=${index#*=} ;;
        "null_path") null_path=${index#*=} ;;
    esac
done

readonly perfix_path
readonly cache_path
readonly node_path
readonly config_path
readonly script_name
readonly logs_path
readonly null_path
