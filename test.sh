#! python2
#busybox echo -e "Hello-world-from-bash\n test" | busybox awk '$1=$1' FS="-" OFS=" " > /root/output.txt
#busybox echo -e "Hello-world-from\ntest" | grep test
# busybox echo "Hello-world-from-bash" > /root/output.txt
# busybox cat /root/output.txt
# busybox cat /root/output.txt > /tmp/testlog
# busybox cat /tmp/testlog
#ENV1=test1
#(
#	ENV1=test_test
#	busybox echo $ENV1
#)
#busybox echo $ENV1

TEST=$(busybox echo "what")
busybox echo $TEST
