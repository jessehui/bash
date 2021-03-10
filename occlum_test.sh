TMP=/usr/bin/test
TEST=$(busybox echo $(ls $TMP))
busybox echo $TEST
