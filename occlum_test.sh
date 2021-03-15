
TMP=/usr/bin/test
busybox echo $TMP
TEST=$(busybox echo $(ls -l $TMP))
busybox echo $TEST

if /usr/bin/pgrep --full /root/Dev/BASH/playground/test/build/bin/occlum-run > /dev/null; then
    echo "unable to catch return value"
else
    echo "successfully catch return value"
fi
