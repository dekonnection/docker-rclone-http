#! /bin/sh
rclone_conf_file=/rclone/rclone.conf

if [ -f "$rclone_conf_file" ]
then
    echo "OK : starting rclone."
    /usr/bin/rclone --config $rclone_conf_file serve http ${REMOTE}:${PATH} --addr :${PORT} --log-level ${LOGLEVEL}
else
    echo -e "ERROR : you need to mount a bind volume to expose \
$rclone_conf_file to the container.\nWe will now exit."
    exit 1
fi
