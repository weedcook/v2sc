# v2cli

A simple bash script tool for v2ray-core service on Linux

```
`start`     v2cli {--start|start|-s}        start service

`stop`      v2cli {--stop|stop|-S}          stop service

`status`    v2cli {--status|status|-e}      service status

`show`      v2cli {--show|show|-l}          show used node config file

`show -all` v2cli {--show -all}             same as 'show', but this is show alls
```

# Install

file `install.sh` defined default path, script bin path node path and others

file `configure.sh` you can define it by youself

Example like:
```
~$ /.configure.sh --bin_dir=.local/bin \
                  --node_dir=/home/who/.config/node \
                  --logs_dir=/home/who/config/logs \
                  --cache_dir=/home/who/.cache
