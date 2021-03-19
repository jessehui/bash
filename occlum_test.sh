# Exit when error
set -e

# Test pipe
# busybox echo -e "Hello-world-from-bash\n test" | busybox awk '$1=$1' FS="-" OFS=" " > /root/output.txt
# busybox cat /root/output.txt
# rm /root/output.txt
# ll /root/output.txt

# Test command substitution
TMP=/usr/bin/test
busybox echo $TMP
TEST=$(busybox echo $(ls -l $TMP))
busybox echo $TEST

# Test return value and redirection
if /usr/bin/pgrep occlum-run > /dev/null; then
    echo "a occlum process is running"
else
    echo "no occlum process is running"
fi

# Test command subsitution and pipe
busybox echo $(busybox echo -e "Hello-world-from-bash\n test" | busybox awk '$1=$1' FS="-" OFS=" ") 

# Test subshell
# SCRIPT_ENV="this is script env"
# (
#     busybox echo "in subshell:"
#     busybox echo $SCRIPT_ENV
#     SUBSHELL_ENV="this is subshell env"
#     SCRIPT_ENV="this is script env in subshell"
#     busybox echo $SUBSHELL_ENV | busybox awk '{print $3}'
#     busybox echo $SCRIPT_ENV
# )
# busybox echo "out subshell:"
# busybox echo $SCRIPT_ENV
# busybox echo $SUBSHELL_ENV

#TEST exec in subshell
# (
# while true
# do
#     echo "1. Disk Stats "
#     echo "2. Get Time "
#     Input=2
#     case "$Input" in
#         1) exec df -kh ;;
#         2) exec /bin/date  ;;
#     esac
# done
# )

# Test process substitution and redirection
if busybox diff <(cat /root/Dev/BASH/bash-copy/occlum_test.sh) <(cat /root/Dev/BASH/bash/occlum_test.sh) > log; then
    busybox echo "nothing different"
    exit 1
else
    busybox echo "there is some difference"
fi

busybox cat log
busybox rm log

# Test multiple redirection
busybox ls . *.blah > log 2>&1
busybox echo "start log:"
busybox cat log
exec /root/demos/hello_c/hello_world
busybox rm log

echo "TESTS successful"
