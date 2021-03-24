# v2cli

A simple bash script tool for v2ray-core service on Linux
start stop status..

# Install

file `install.sh` defined default path, script bin path node path and others

file `configure.sh` you can define it by youself

Example like:
```
~$ /.configure.sh --bin_dir=.local/bin \
                  --node_dir=/home/who/.config/node \
                  --logs_dir=/home/who/config/logs \
                  --cache_dir=/home/who/.cache
