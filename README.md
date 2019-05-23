# docker-rclone-http

A small Docker container dedicated to serve rclone remotes via http.

## usage

Example :

```
docker run --rm -t --mount type=bind,source=/path/to/my/rclone.conf,destination=/rclone/rclone.conf,readonly -e REMOTE='myremote' -e PATH='directory' -e LOGLEVEL='INFO' -p 8080:8080 rclone-http
```

The bind mount to /rclone/rclone.conf is mandatory, and needs to target a valid rclone config.

* `REMOTE` : the rclone remote name to expose via http (mandatory)
* `PATH` : the subdirectory that will be web root (can be empty)
* `LOGLEVEL` : default is `NOTICE`
* `PORT` : the http listen port (default : 8080)
