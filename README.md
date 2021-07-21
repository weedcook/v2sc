# v2ctl, a script toos for v2ray service control

A simple bash script tool for v2ray-core service on Linux

```
start     v2ctl {--start|start|-s}        start service
```
```
stop      v2ctl {--stop|stop|-S}          stop service
```
```
status    v2ctl {--status|status|-e}      service status
```
```
show      v2ctl {--show|show|-l}          show used node config file
```
```
reset     v2ctl {--reset|reset|-c}        select default node config
```
<del>
```
show all  v2ctl {--show-all}              same as 'show', but this is show alls
```
</del>
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
